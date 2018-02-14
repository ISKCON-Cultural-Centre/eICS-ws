var _ = require('underscore');
var utils = require('./utils');

	module.exports = function(Devotee) {


		Devotee.getRoles = function (options, cb) {

			cb = cb || utils.createPromiseCallback();

			Devotee.getApp(function (err, app) {
			if (err) {
				fn(err);
				return fn.promise;
			}			
		  var RoleMapping = app.models.ServiceRoleMapping;
			var Role = app.models.ServiceRole;
		  RoleMapping.find({ where : { principalId: options.userId }}, function (err, roleMappings) {
				if (err) {
					fn(err);
					return fn.promise;
				}		
			var roleIds = _.uniq(roleMappings
			  .map(function (roleMapping) {
				return roleMapping.roleId;
			  }));
			var conditions = roleIds.map(function (roleId) {
			  return { id: roleId };
			});
 			Role.find({ where: { or: conditions}}, function (err, roles) {
				if (err) {
					fn(err);
					return fn.promise;
				}	
			  var authorizedRoles = roles.map(function(role) {
				return { roleId: role.id, roleName: role.name};
			  });
				cb(null, {roles});
			});
		  });
		});
		return cb.promise;
		};
		

		Devotee.getDepartments = function (options, cb) {

			cb = cb || utils.createPromiseCallback();

			Devotee.getApp(function (err, app) {
			if (err) {
				fn(err);
				return fn.promise;
			}			
		  var DepartmentRole = app.models.DepartmentRole;
			var Department = app.models.Department;
			Devotee.getRoles(options, function(err, authorizedRoles){
				if (err) {
					fn(err);
					return fn.promise;
				}				
				var conditions = authorizedRoles.roles.map(function (roleId) {
					return { roleId: roleId.id };
				});

		  DepartmentRole.find({ where : { or: conditions }}, function (err, departmentRoles) {
				if (err) {
					fn(err);
					return fn.promise;
				}		
			
			var departmentIds = _.uniq(departmentRoles
			  .map(function (departmentRole) {
				return departmentRole.departmentId;
			  }));
			var conditions = departmentIds.map(function (departmentId) {
			  return { id: departmentId };
			});

			Department.find({ where: { or: conditions}}, function (err, departments) {
				if (err) {
					fn(err);
					return fn.promise;
				}	
			  var authorizedDepartments = departments.map(function(department) {
				return { departmentId: department.id, departmentName: department.name};
			  });
				cb(null, {departments});
			});
			});
		});
		});
		return cb.promise;
		};
		


	  Devotee.remoteMethod('getDepartments', {
			http: { path: '/getDepartments', verb: 'get' },
			returns: { arg: 'departments', type: 'Object', root: true}
			});		

	  Devotee.remoteMethod('getRoles', {
		http: { path: '/getRoles', verb: 'get' },
		returns: { arg: 'roles', type: 'String', root: true}
	  });
	}
