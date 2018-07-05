'use strict';
var querystring = require('querystring');
var request = require('request');
var Q = require('q');
var _ = require('lodash');
var inherits = require('util').inherits;
var Generic = require('butter-provider');
var sanitize = require('butter-sanitize');

var tvApiServer;

var URL = false;
var TVApi = function (args) {
    var that = this;
    try {
        var Client = require('node-tvdb');
        var tvdb = new Client('7B95D15E1BE1D75A');
        tvdb.getLanguages()
            .then(function (langlist) {
                that.TVDBLangs = langlist
            });
    } catch (e) {
        that.TVDBLangs = false
        console.warn('Something went wrong with TVDB, overviews can\'t be translated.');
    }
    TVApi.super_.call(this);

    if (args.apiURL)
        this.apiURL = args.apiURL.split(',');

    this.quality = args.quality;
    this.translate = args.translate;
    this.language = args.language;
};

inherits(TVApi, Generic);

TVApi.prototype.config = {
    name: 'TVApi',
    uniqueId: 'tvdb_id',
    tabName: 'TVApi',
    type: 'tvshow',
    metadata: 'trakttv:show-metadata'
};

TVApi.prototype.extractIds = function (items) {
    return _.pluck(items.results, 'imdb_id');
};

TVApi.prototype.fetch = function (filters) {
    var that = this;
    var deferred = Q.defer();

    var params = {};
    params.sort = 'seeds';
    params.limit = '50';

    if (filters.keywords) {
        params.keywords = filters.keywords.replace(/\s/g, '% ');
    }

    if (filters.genre) {
        params.genre = filters.genre;
    }

    if (filters.order) {
        params.order = filters.order;
    }

    if (filters.sorter && filters.sorter !== 'popularity') {
        params.sort = filters.sorter;
    }

    function get(index) {
        var options = {
            url: that.apiURL[index] + 'shows/' + filters.page + '?' + querystring.stringify(params).replace(/%25%20/g, '%20'),
            json: true
        };

	tvApiServer = that.apiURL[index];
	//document.getElementById('TVApi').setAttribute('data-original-title', tvApiServer);

        var req = _.extend({}, that.apiURL[index], options);
        console.info('Request to TVApi', req.url);
        request(req, function (err, res, data) {
            if (err || res.statusCode >= 400) {
                console.warn('TVAPI endpoint \'%s\' failed.', that.apiURL[index]);
                if (index + 1 >= that.apiURL.length) {
                    return deferred.reject(err || 'Status Code is above 400');
                } else {
                    get(index + 1);
                }
                return;
            } else if (!data || (data.error && data.error !== 'No movies found')) {
                err = data ? data.status_message : 'No data returned';
                console.error('API error:', err);
                return deferred.reject(err);
            } else {
		//document.getElementById('TVApi').setAttribute('data-original-title', tvApiServer)
                data.forEach(function (entry) {
                    entry.type = 'show';
                });
                deferred.resolve({
                    results: sanitize(data),
                    hasMore: true
                });
            }
        });
    }
    get(0);

    return deferred.promise;
};

TVApi.prototype.detail = function (torrent_id, old_data, debug) {
    // Single element query
    var that = this;
    debug === undefined ? debug = true : '';
    return Q.Promise(function (resolve, reject) {

        function get(index) {
            var options = {
                url: that.apiURL[index] + 'show/' + torrent_id,
                json: true
            };
            //	    document.getElementById('TVApi').setAttribute('data-original-title', tvApiServer);
            var req = _.extend({}, that.apiURL[index], options);
            console.info('Request to TVApi', req.url);
            request(req, function (error, response, data) {
                if (error || response.statusCode >= 400) {
                    console.warn('TVAPI endpoint \'%s\' failed.', that.apiURL[index]);
                    if (index + 1 >= that.apiURL.length) {
                        return reject(error || 'Status Code is above 400');
                    } else {
                        get(index + 1);
                    }
                    return;
                } else if (!data || (data.error && data.error !== 'No data returned') || data.episodes.length === 0) {

                    var err = (data && data.episodes.length !== 0) ? data.error : 'No data returned';
                    debug ? console.error('API error:', err) : '';
                    reject(err);

                } else {
                    data = sanitize(data);
                    // we cache our new element or translate synopsis

                    if (that.translate && that.language !== 'en') {
                        var langAvailable;
                        for (var x = 0; x < that.TVDBLangs.length; x++) {
                            if (that.TVDBLangs[x].abbreviation.indexOf(that.language) > -1) {
                                langAvailable = true;
                                break;
                            }
                        }
                        if (!langAvailable) {
                            resolve(data);
                        } else {

                            var reqTimeout = setTimeout(function () {
                                resolve(data);
                            }, 2000);

                            var Client = require('node-tvdb');
                            var tvdb = new Client('7B95D15E1BE1D75A', that.language);
                            console.info('Request to TVDB API: \'%s\' - %s', old_data.title, that.language);
                            tvdb.getSeriesAllById(old_data.tvdb_id)
                                .then(function (localization) {
                                    clearTimeout(reqTimeout);
                                    _.extend(data, {
                                        synopsis: localization.Overview
                                    });
                                    for (var i = 0; i < localization.Episodes.length; i++) {
                                        for (var j = 0; j < data.episodes.length; j++) {
                                            if (localization.Episodes[i].id.toString() === data.episodes[j].tvdb_id.toString()) {
                                                data.episodes[j].overview = localization.Episodes[i].Overview;
                                                break;
                                            }
                                        }
                                    }
                                    resolve(sanitize(data));
                                })
                                .catch(function (error) {
                                    resolve(data);
                                });
                        }
                    } else {
                        resolve(data);
                    }
                }
            });
        }
        get(0);
    });
};

module.exports = TVApi;
