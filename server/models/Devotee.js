var _ = require('underscore');
var utils = require('./utils');


module.exports = function(Devotee) {

  /**
   * Get the list of Devotees.
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
	Devotee.getFilteredDevotees = function (whereFilter, otherFilter,  options, cb) {

		const token = options && options.accessToken;
		const userId = token.userId;
		var finalWhereFilter = '{ "and": ['; 

		cb = cb || utils.createPromiseCallback();

		Devotee.getApp(function (err, app) {
		if (err) {
			cb(err);
			return cb.promise;
		}			
		var Devotee = app.models.Devotee;
		var DevoteeServiceInterest = app.models.DevoteeServiceInterest;
		
		if (whereFilter) {
			var services =  whereFilter.services ? whereFilter.services.length : 0;
			var orgs = whereFilter.orgs ? whereFilter.orgs.length : 0;
			var spiritualLevel = whereFilter.spiritualLevel ? whereFilter.spiritualLevel.length : 0;
		}

		if (whereFilter) {
			if (whereFilter.searchText) {
				finalWhereFilter = finalWhereFilter 
				+  '{"or": [{"legalName": {"like": "%' + 
				whereFilter.searchText + '%"}}, {"spiritualName": {"like": "%' + 
				whereFilter.searchText + '%"}}, {"mobileNo1": {"like": "%' + 
				whereFilter.searchText + '%"}}, {"mobileNo2": {"like": "%' + 
				whereFilter.searchText + '%"}}, {"landlineNo": {"like": "%' +                             
				whereFilter.searchText + '%"}}, {"enrolNo": {"like": "%' + 
				whereFilter.searchText + '%"}}]}';
			};

			if (whereFilter.orgs.length > 0) {
				var orgIds = whereFilter.orgs.map(function (org) {
					return '"' + org + '"';
				});
				whereFilter.searchText ? finalWhereFilter = finalWhereFilter + ',' : undefined;
				finalWhereFilter = finalWhereFilter + ' {"organizationId": {"inq":[' + orgIds + ']}} ';				
			}
		}



	if (services > 0 || spiritualLevel > 0) {
		Promise.all([
			services > 0 ? Devotee.getServicesDevotees(whereFilter.services) : null,
			spiritualLevel > 0 ? Devotee.getShikshaDevotees(whereFilter.spiritualLevel) : null
		]).then(
			(devotees) => {
				var devoteeIds = devotees.map(function (devotee) {
 					if (devotee !== null) {
						return devotee.devoteeIds;
					} 
					return null;					
				});

				var devoteeIds = [].concat.apply([], devoteeIds);

 				console.log(devoteeIds);
/*				const names = devoteeIds;

				const count = names => 
				  names.reduce((a, b) => 
					Object.assign(a, {[b]: (a[b] || 0) + 1}), {})
				
				const duplicates = dict => 
				  Object.keys(dict).filter((a) => dict[a] > 1)
				
				console.log(count(names)) // { Mike: 1, Matt: 1, Nancy: 2, Adam: 1, Jenny: 1, Carl: 1 }
				console.log(duplicates(count(names))) // [ 'Nancy' ]

				var devoteeIds = duplicates(count(names)); */

				var devoteeIds = devoteeIds.map(function (devoteeId) {
					return '"' + devoteeId + '"';
				});	
				(whereFilter.searchText || orgs > 0 ) ? finalWhereFilter = finalWhereFilter + ',' : undefined;					
				finalWhereFilter = finalWhereFilter + '{"id": {"inq":[' + devoteeIds + ']}}';
				//console.log(finalWhereFilter);
				finalWhereFilter = finalWhereFilter + '] }';
				otherFilter.where = JSON.parse(finalWhereFilter);	
//console.log(otherFilter);								
				Devotee.find(otherFilter, function (err, devotees) {
					if (err) {
						cb(err);
						return cb.promise;
					}		
					
					if (!devotees.length) { return cb(null, { count: 0,  devoteesList: [] });}
					else 
					{
						Devotee.count(otherFilter.where, function (err, devoteeCount)	{
							cb(null, {count: devoteeCount, devoteesList: devotees});
						});				
					} 
				});					
			}
		);

	} else {
		finalWhereFilter = finalWhereFilter + '] }';	
		otherFilter.where = JSON.parse(finalWhereFilter);
//console.log(otherFilter);
		Devotee.find(otherFilter, function (err, devotees) {
			if (err) {
				cb(err);
				return cb.promise;
			}		
			
			if (!devotees.length) { return cb(null, { count: 0,  devoteesList: [] });}
			else 
			{
				Devotee.count(otherFilter.where, function (err, devoteeCount)	{
					cb(null, {count: devoteeCount, devoteesList: devotees});
				});				
			} 
		});					
	}		
	});
	return cb.promise;
	};


  /**
   * Get the list of Devotees interested in some services.
   *
   * ```js
   * Devotee.getServicesDevotees(options, function (err, devotees) {
   *      
   *    });
   * ```
   *
   * @callback {Function} cb Callback function
   * @param {Error} err Error object
   * @param {authorizedRoles} list of devotees successful
   * @promise
   */
	Devotee.getServicesDevotees = function (services, cb) {
		cb = cb || utils.createPromiseCallback();

		Devotee.getApp(function (err, app) {
			if (err) {
				cb(err);
				return cb.promise;
			}			
			var DevoteeServiceInterest = app.models.DevoteeServiceInterest;	

/* 			var serviceIds = services.map(function (service) {
				return '"' + service + '"';
			}); */
			//console.log(serviceIds);
			DevoteeServiceInterest.find({ "where" : { "serviceAreaId": {"inq": services}}}, function (err, devoteeServiceInterest) {
				if (err) {
					cb(err);
					return cb.promise;
				}		
				
				if (!devoteeServiceInterest.length) { return cb(null, { "devoteeIds": [] });}
				else {				
					var devoteeIds = devoteeServiceInterest.map(function (devotee) {
						return devotee.devoteeId;
				});
					cb(null, {devoteeIds: devoteeIds});	
				}		
			});					
		});
		return cb.promise;		
	}


 /**
   * Get the list of Devotees having certain shiksha levels.
   *
   * ```js
   * Devotee.getShikshaDevotees(options, function (err, devotees) {
   *      
   *    });
   * ```
   *
   * @callback {Function} cb Callback function
   * @param {Error} err Error object
   * @param {authorizedRoles} list of devotees successful
   * @promise
   */
  Devotee.getShikshaDevotees = function (shikshas, cb) {
	cb = cb || utils.createPromiseCallback();

	Devotee.getApp(function (err, app) {
		if (err) {
			cb(err);
			return cb.promise;
		}			
		var DevoteeSpiritualProgress = app.models.DevoteeSpiritualProgress;	

/* 		var shikshaIds = shikshas.map(function (shiksha) {
			return '"' + shiksha + '"';
		}); */
		//console.log(serviceIds);
		DevoteeSpiritualProgress.find({ "where" : { "spiritualLevelMasterId": {"inq": shikshas}}}, function (err, devoteeSpiritualProgress) {
			if (err) {
				cb(err);
				return cb.promise;
			}		
			
			if (!devoteeSpiritualProgress.length) { return cb(null, { "devoteeIds": [] });}
			else {
				var devoteeIds = devoteeSpiritualProgress.map(function (devotee) {
						return devotee.devoteeId;
				});			
				cb(null, {devoteeIds: devoteeIds});	
			}		
		});					
	});
	return cb.promise;		
}

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
				{arg: 'options', type: 'object', http: 'optionsFromRequest'}
			],
			http: {verb: 'GET', path: '/getDepartments'},
			returns: { arg: 'devotees', type: 'object', root: true}						
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

 	Devotee.remoteMethod('getFilteredDevotees', {
		description: 'Get the list of filtered Devotees',
			accepts: [
				{arg: 'whereFilter', type: 'object'},
				{arg: 'otherFilter', type: 'object'},				
				{arg: 'options', type: 'object', http: 'optionsFromRequest'}
			],		
		http: { path: '/getFilteredDevotees', verb: 'get' },
		returns: { arg: 'filter', type: 'String', root: true}
		});		
 
 	Devotee.remoteMethod('getShikshaDevotees', {
		description: 'Get the list of Devotees who have attained certain Spiritual Levels',		
		http: { path: '/getShikshaDevotees', verb: 'get' },
		accepts: [
			{arg: 'shikshas', type: 'String'},
		],			
 		returns: { arg: 'devotees', type: 'String', root: true}
		});

		Devotee.remoteMethod('getServicesDevotees', {
			description: 'Get the list of Devotees who have attained certain Spiritual Levels',		
			http: { path: '/getServicesDevotees', verb: 'get' },
			accepts: [
				{arg: 'services', type: 'String'},
			],			
			 returns: { arg: 'devotees', type: 'String', root: true}
		});		
}
