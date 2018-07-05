var Q = require('q');
var querystring = require('querystring');
var request = require('request');

module.exports = function (url, params, hasQuestionMark) {
    var d = Q.defer();

    if (params !== undefined) {
        url += hasQuestionMark ? '&' : '?';
        url += querystring.stringify(params);
    }

    var getParams;
    if (typeof url === 'string') {
        getParams = {
            url: url,
            json: true
        }
    } else {
        getParams = url;
    }

    console.log('deferRequest', getParams, params, querystring.stringify(params));
    request(getParams, function (error, response, data) {
        if (error) {
            d.reject(error);
        } else if (!data || (data.error && data.error !== 'No movies found')) {
            var err = data ? data.error : 'No data returned';
            d.reject(err);
        } else {
            d.resolve(data || []);
        }
    });

    return d.promise;
};
