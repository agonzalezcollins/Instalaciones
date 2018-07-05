var Q = require('q');
var dns = require('dns');
var debug = require('debug')('popcorn:dnstxt')

module.exports = function(addr) {
    if (typeof addr !== 'string')
        return Q(addr);
    if (! addr.match(/^dnstxt/i))
        return Q(addr);

    debug ('processing', addr);
    addr = addr.replace(/^dnstxt:\/\//, '')
    var end = addr.split('/').splice(1).join('/');
    addr = addr.replace(/\/.*/, '');

    var d = Q.defer();
    dns.resolveTxt(addr, function (err, addresses) {
        if (err) {
            debug ('rejecting error', err);
            return d.reject(err);
        }
        if (!addresses || !addresses.length
            || !addresses[0] || !addresses[0].length) {
            debug('rejecting, addresses is malformed', addresses)

            return d.reject (addresses)
        }

        var ret = addresses[0][0]
        if (end)
            ret += '/' + end;

        debug ('resolving', ret);
        return d.resolve(ret);
    });

    return d.promise;
}
