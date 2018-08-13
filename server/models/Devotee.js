var _ = require('underscore');
var utils = require('./utils');


module.exports = function(Devotee) {

  /**
   * Get the list of Roles assigned to a Devotee.
   *
   * ```js
   * Devotee.getRoles(options, function (err, roles) {
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
	Devotee.getRoles = function (options, cb) {

		const token = options && options.accessToken;
		const userId = token.userId;

		cb = cb || utils.createPromiseCallback();

		Devotee.getApp(function (err, app) {
		if (err) {
			cb(err);
			return cb.promise;
		}			
		var RoleMapping = app.models.ServiceRoleMapping;
		var Role = app.models.ServiceRole;

		RoleMapping.find({ where : { principalId: userId }}, function (err, roleMappings) {
			if (err) {
				cb(err);
				return cb.promise;
			}		
		
		if (!roleMappings.length) { return cb(null, { "roles": [] });}
		else {
			var roleIds = _.uniq(roleMappings
				.map(function (roleMapping) {
				return roleMapping.roleId;
				}));
			var conditions = roleIds.map(function (roleId) {
				return { id: roleId };
			});
			Role.find({ where: { or: conditions}}, function (err, roles) {
				if (err) {
					cb(err);
					return cb.promise;
				}	
				cb(null, {roles});
			});
		}
		});
	});
	return cb.promise;
	};

	

  /**
   * Get the list of Deparments assigned to a Devotee.
   *
   * ```js
   * Devotee.getDepartments(options, function (err, roles) {
   *      console.log(token.id);
   *    });
   * ```
   *
   * @param {Object} options (context information to be included in all custom remote methods)
   * @callback {Function} cb Callback function
   * @param {Error} err Error object
   * @param {authorizedDepartments} list of roles successful
   * @promise
   */	
	Devotee.getDepartments = function (options, cb) {

		cb = cb || utils.createPromiseCallback();

		Devotee.getApp(function (err, app) {
		if (err) {
			cb(err);
			return cb.promise;
		}			
		var DepartmentRole = app.models.DepartmentRole;
		var Department = app.models.Department;
		var Role = app.models.ServiceRole;	


		Devotee.getRoles(options, function(err, authorizedRoles){
			if (err) {
				cb(err);
				return cb.promise;
			}

			var conditions = authorizedRoles.roles.map(function (roleId) {
				return { roleId: roleId.id };
			});

			if (!authorizedRoles.roles.length) { return cb(null, { "departments": [] }); }

		DepartmentRole.find({ where : { or: conditions }}, function (err, departmentRoles) {
			if (err) {
				cb(err);
				return cb.promise;
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
				cb(err);
				return cb.promise;
			}	
			cb(null, {departments});
		});
		});
	});
	});
	return cb.promise;
	};
	

/**
   * Get the list of Tasks assigned to a Role.
   *
   * ```js
   * Devotee.getDepartments(options, function (err, roles) {
   *      console.log(token.id);
   *    });
   * ```
   *
   * @param {Object} options (context information to be included in all custom remote methods)
   * @callback {Function} cb Callback function
   * @param {Error} err Error object
   * @param {authorizedDepartments} list of roles successful
   * @promise
   */	
  Devotee.getRoleTasks = function (options, cb) {

	cb = cb || utils.createPromiseCallback();

	Devotee.getApp(function (err, app) {
	if (err) {
		cb(err);
		return cb.promise;
	}			
	var RoleTask = app.models.RoleTaskMaster;
	var Role = app.models.ServiceRole;		
	var TaskMaster = app.models.TaskMaster;	
	
	Devotee.getRoles(options, function(err, authorizedRoles){
		if (err) {
			cb(err);
			return cb.promise;
		}

		var conditions = authorizedRoles.roles.map(function (roleId) {
			return { roleId: roleId.id };
		});

		if (!authorizedRoles.roles.length) { return cb(null, { "tasks": [] });}
		else {
			RoleTask.find({ where : { or: conditions }}, function (err, RolesTasks) {
				if (err) {
					cb(err);
					return cb.promise;
				}		
			
			var taskIds = _.uniq(RolesTasks
				.map(function (RoleTask) {
				return RoleTask.taskMasterId;
				}));
			var conditions = taskIds.map(function (taskId) {
				return { id: taskId };
			});
		
			TaskMaster.find({ where: { or: conditions}}, function (err, tasks) {
				if (err) {
					cb(err);
					return cb.promise;
				}	
				cb(null, {tasks});
			});
			});
		}


});
});
return cb.promise;
};	

	Devotee.remoteMethod(
		'getDepartments',
		{
			description: 'Get the list of Authorized Departments assigned to a Devotee',
			accepts: [
/* 				{arg: 'context', type: 'object', 'http': {source: 'context'}}, */
				{arg: 'options', type: 'object', http: 'optionsFromRequest'}
			],
			http: {verb: 'GET', path: '/getDepartments'},
			returns: { arg: 'departments', type: 'String', root: true}						
		}
	);


	Devotee.remoteMethod(
		'getRoles',
		{
			description: 'Get the list of Authorized Roles assigned to a Devotee',
			accepts: [
				{arg: 'options', type: 'object', http: 'optionsFromRequest'}
			],
			http: {verb: 'GET', path: '/getRoles'},
			returns: { arg: 'roles', type: 'String', root: true}
		}
	);	

	Devotee.remoteMethod(
		'getRoleTasks',
		{
			description: 'Get the list of Tasks assigned to a Role/Devotee',
			accepts: [
				{arg: 'options', type: 'object', http: 'optionsFromRequest'}
			],
			http: {verb: 'GET', path: '/getRoleTasks'},
			returns: { arg: 'tasks', type: 'String', root: true}						
		}
	);	

/* 	Devotee.remoteMethod('getDepartments', {
		description: 'Get the list of Authorized Departments assigned to a Devotee',
		http: { path: '/getDepartments', verb: 'get' },
		returns: { arg: 'departments', type: 'String', root: true}
		});		
 */
/* 	Devotee.remoteMethod('getRoles', {
		description: 'Get the list of Authorized Roles assigned to a Devotee',		
		http: { path: '/getRoles', verb: 'get' },
 		returns: { arg: 'roles', type: 'String', root: true}
		}); */
}
