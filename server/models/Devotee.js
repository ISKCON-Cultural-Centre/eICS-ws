var _ = require('underscore');
	module.exports = function(Devotee) {


		Devotee.getRoles = function (options, cb) {
			if (cb === undefined && typeof options === 'function') {
				cb = options;
				options = undefined;
			  }

			Devotee.getApp(function (err, app) {
		  if (err) throw err;
		  var RoleMapping = app.models.ServiceRoleMapping;
		  var Role = app.models.ServiceRole;
		  RoleMapping.find({ where : { principalId: options.userId }}, function (err, roleMappings) {
			var roleIds = _.uniq(roleMappings
			  .map(function (roleMapping) {
				return roleMapping.roleId;
			  }));
			var conditions = roleIds.map(function (roleId) {
			  return { id: roleId };
			});
			Role.find({ where: { or: conditions}}, function (err, roles) {
			  if (err) throw err;
			  var roleNames = roles.map(function(role) {
				return role.name;
			  });
			  cb(null, {"roles": roleNames});
			});
		  });
		});
	  };
	  Devotee.remoteMethod('getRoles', {
		http: { path: '/getRoles', verb: 'get' },
		returns: { arg: 'payload', type: 'Object' }
	  });
	}
