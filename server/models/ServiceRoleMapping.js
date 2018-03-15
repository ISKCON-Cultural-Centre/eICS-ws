module.exports = function(ServiceRoleMapping) {
    ServiceRoleMapping.remoteMethod('destroyAll', {
        isStatic: true,
        description: 'Delete all matching records',
        accessType: 'WRITE',
        accepts: {arg: 'where', type: 'object', description: 'filter.where object'},
        http: {verb: 'del', path: '/'}
      });	
};