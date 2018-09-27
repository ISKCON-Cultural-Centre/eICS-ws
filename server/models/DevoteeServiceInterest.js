var _ = require('underscore');
var utils = require('./utils');

module.exports = function(DevoteeServiceInterest) {
    DevoteeServiceInterest.remoteMethod('destroyAll', {
        isStatic: true,
        description: 'Delete all matching records',
        accessType: 'WRITE',
        accepts: {arg: 'where', type: 'object', description: 'filter.where object'},
        http: {verb: 'del', path: '/'}
      });	



/**
   * Get the list of Services assigned to a Devotee.
   *
   * ```js
   * Devotee.getDevoteesOfServices(options, function (err, roles) {
   *      console.log(token.id);
   *    });
   * ```
   *
   * @param {Object} options (context information to be included in all custom remote methods)
   * @callback {Function} cb Callback function
   * @param {Error} err Error object
   * @param {authorizedRoles} list of roles successful
   * @promise
   */
  DevoteeServiceInterest.getDevoteesOfServices = function (homeFilter, serviceAreasFilter, options, cb) {

    const token = options && options.accessToken;
    const userId = token.userId;

    cb = cb || utils.createPromiseCallback();

    DevoteeServiceInterest.getApp(function (err, app) {
    if (err) {
        cb(err);
        return cb.promise;
    }			
    var DevoteeServiceInterest = app.models.DevoteeServiceInterest;

    DevoteeServiceInterest.find({ where : { serviceAreaId: {inq: serviceAreasFilter} }}, function (err, devotees) {
        if (err) {
            cb(err);
            return cb.promise;
        }		
    
        if (!devotees.length) { return cb(null, { "serviceAreas": [] });}
    else {
        var devoteeIds = _.uniq(devotees
            .map(function (devotee) {
            return devotee.devoteeId;
            }));

/*         var devotees = devoteeIds.map(function (devoteeId) {
            return { id: devoteeId };
        }); */
        cb(null, {devoteeIds});
    }
    });
});
return cb.promise;
};

DevoteeServiceInterest.remoteMethod(
    'getDevoteesOfServices',
    {
        description: 'Get the list of Devotees signed up for services',
        accepts: [
            {arg: 'homeFilter', type: 'array'}, 
            {arg: 'serviceAreasFilter', type: 'array'},      
            {arg: 'options', type: 'object', http: 'optionsFromRequest'}
        ],
        http: {verb: 'GET', path: '/getDevoteesOfServices'},
        returns: { arg: 'devotees', type: 'String', root: true}						
    }
);



};