var _ = require('underscore');
var utils = require('./utils');


module.exports = function (Devotee) {

	/**
	 * Get the list of Devotees.
	 *
	 *
	 * @param {Object} options (context information to be included in all custom remote methods)
	 * @callback {Function} cb Callback function
	 * @param {Error} err Error object
	 * @param {authorizedRoles} list of roles successful
	 * @promise
	 */
	Devotee.getFilteredDevotees = function (whereFilter, otherFilter, options, cb) {

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
				var services = whereFilter.services ? whereFilter.services.length : 0;
				var orgs = whereFilter.orgs ? whereFilter.orgs.length : 0;
				var spiritualLevel = whereFilter.spiritualLevel ? whereFilter.spiritualLevel.length : 0;
				var eventInd = whereFilter.eventDateRange.length > 1 ? 1 : 0;
			}

			if (whereFilter) {
				if (whereFilter.searchText) {
					finalWhereFilter = finalWhereFilter
						+ '{"or": [{"legalName": {"like": "%' +
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



			if (services > 0 || spiritualLevel > 0 || eventInd) {
				Promise.all([
					services > 0 ? Devotee.getServicesDevotees(whereFilter.services) : null,
					spiritualLevel > 0 ? Devotee.getShikshaDevotees(whereFilter.spiritualLevel) : null,
					eventInd > 0 ? Devotee.getEventsDevotees(whereFilter.eventDateRange) : null
				]).then(
					(devotees) => {
						var devoteeIds = devotees.map(function (devotee) {
							if (devotee !== null) {
								return devotee.devoteeIds;
							}
							return null;
						});

						var devoteeIds = [].concat.apply([], devoteeIds);

						/* for getting AND filter effect on Shiksha level and services*/
						const names = devoteeIds;
						const count = names =>
							names.reduce((a, b) =>
								Object.assign(a, { [b]: (a[b] || 0) + 1 }), {});
						const duplicates2 = dict =>
							Object.keys(dict).filter((a) => dict[a] > 1);
						const duplicates3 = dict =>
							Object.keys(dict).filter((a) => dict[a] > 2);
						if ((spiritualLevel > 0 && services > 0 && eventInd == 0) ||
							(spiritualLevel > 0 && services == 0 && eventInd > 0) ||
							(spiritualLevel == 0 && services > 0 && eventInd > 0)) {
							devoteeIds = duplicates2(count(names))
						}
						if (spiritualLevel > 0 && services > 0 && eventInd > 0) {
							devoteeIds = duplicates3(count(names))
						}

						var devoteeIds = devoteeIds.map(function (devoteeId) {
							return '"' + devoteeId + '"';
						});
						(whereFilter.searchText || orgs > 0) ? finalWhereFilter = finalWhereFilter + ',' : undefined;
						finalWhereFilter = finalWhereFilter + '{"id": {"inq":[' + devoteeIds + ']}}';
						finalWhereFilter = finalWhereFilter + '] }';
						otherFilter.where = JSON.parse(finalWhereFilter);
						//otherFilter.include = '{ relation: "fkDevoteeSevaSubscriptions"}';

						Devotee.find(otherFilter, function (err, devotees) {
							if (err) {
								cb(err);
								return cb.promise;
							}

							if (!devotees.length) { return cb(null, { count: 0, devoteesList: [] }); }
							else {
								Devotee.count(otherFilter.where, function (err, devoteeCount) {
									cb(null, { count: devoteeCount, devoteesList: devotees });
								});
							}
						});
					}
					);

			} else {
				finalWhereFilter = finalWhereFilter + '] }';
				otherFilter.where = JSON.parse(finalWhereFilter);
				Devotee.find(otherFilter, function (err, devotees) {
					if (err) {
						cb(err);
						return cb.promise;
					}

					if (!devotees.length) { return cb(null, { count: 0, devoteesList: [] }); }
					else {
						Devotee.count(otherFilter.where, function (err, devoteeCount) {
							cb(null, { count: devoteeCount, devoteesList: devotees });
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

			DevoteeServiceInterest.find({ "where": { "serviceAreaId": { "inq": services } } }, function (err, devoteeServiceInterest) {
				if (err) {
					cb(err);
					return cb.promise;
				}

				if (!devoteeServiceInterest.length) { return cb(null, { "devoteeIds": [] }); }
				else {
					var devoteeIds = devoteeServiceInterest.map(function (devotee) {
						return devotee.devoteeId;
					});
					cb(null, { devoteeIds: devoteeIds });
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

			DevoteeSpiritualProgress.find({ "where": { "spiritualLevelMasterId": { "inq": shikshas } } }, function (err, devoteeSpiritualProgress) {
				if (err) {
					cb(err);
					return cb.promise;
				}

				if (!devoteeSpiritualProgress.length) { return cb(null, { "devoteeIds": [] }); }
				else {
					var devoteeIds = devoteeSpiritualProgress.map(function (devotee) {
						return devotee.devoteeId;
					});
					cb(null, { devoteeIds: devoteeIds });
				}
			});
		});
		return cb.promise;
	}

	/**
	  * Get the list of Devotees having events between certain dates.
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
	Devotee.getEventsDevotees = function (eventDateRange, cb) {
		cb = cb || utils.createPromiseCallback();

		Devotee.getApp(function (err, app) {
			if (err) {
				cb(err);
				return cb.promise;
			}
			var DevoteeEventCalendar = app.models.DevoteeEventCalendar;

			DevoteeEventCalendar.find({ "where": { "eventDateDayOfYear": { "between": eventDateRange } } }, function (err, devoteeEvents) {
				if (err) {
					cb(err);
					return cb.promise;
				}

				if (!devoteeEvents.length) { return cb(null, { "devoteeIds": [] }); }
				else {
					var devoteeIds = devoteeEvents.map(function (devotee) {
						return devotee.devoteeId;
					});
					cb(null, { devoteeIds: devoteeIds });
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

			RoleMapping.find({ where: { principalId: userId } }, function (err, roleMappings) {
				if (err) {
					cb(err);
					return cb.promise;
				}

				if (!roleMappings.length) { return cb(null, { "roles": [] }); }
				else {
					var roleIds = _.uniq(roleMappings
						.map(function (roleMapping) {
							return roleMapping.roleId;
						}));
					var conditions = roleIds.map(function (roleId) {
						return { id: roleId };
					});
					Role.find({ where: { or: conditions } }, function (err, roles) {
						if (err) {
							cb(err);
							return cb.promise;
						}
						cb(null, { roles });
					});
				}
			});
		});
		return cb.promise;
	};


	/**
	  * Get the Devotee event confirmations.
	  *
	  * ```js
	  * Devotee.getDevoteeConfirmationStatus(options, function (err, roles) {
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
	Devotee.getDevoteeConfirmationStatus = function (devoteeIds, departmentEventId, options, cb) {

		cb = cb || utils.createPromiseCallback();

		Devotee.getApp(function (err, app) {
			if (err) {
				cb(err);
				return cb.promise;
			}

			var Devotee = app.models.Devotee;
			var devoteeFamilyConfirmations = [];

			Devotee.find(
				{
					where: {
						and: [
							{ id: { inq: devoteeIds } },
						]
					},
					include: {
						relation: "fkDevoteeEventConfirmations",
						scope: {
							where: { departmentEventId: departmentEventId } // only select order with id 5
						}
					}
				}, function (err, devoteeconfirmations) {

					if (err) {
						cb(err);
						return cb.promise;
					}

					devoteeFamilyConfirmations = devoteeconfirmations.map(
						function (devoteeconfirmation) {
						var conf = devoteeconfirmation.toJSON();
						if (!conf.fkDevoteeEventConfirmations.length) {						
						return { devotee: conf, confirmed: false, guests: 0};
						} else {
							return { devotee: conf, confirmed: true, guests: conf.fkDevoteeEventConfirmations.guestConfirm};							
						}

					});
					cb(null, devoteeFamilyConfirmations);									
				});
		});
		return cb.promise;
	}


	/**
		  * Get the Devotee event confirmations.
		  *
		  * ```js
		  * Devotee.getDevoteeConfirmations(options, function (err, roles) {
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
	Devotee.getDevoteeConfirmations = function (devotee, family, departmentEventId, options, cb) {

		cb = cb || utils.createPromiseCallback();

		Devotee.getApp(function (err, app) {
			if (err) {
				cb(err);
				return cb.promise;
			}

			var EventDevoteeConfirmation = app.models.EventDevoteeConfirmation;
			var Devotee = app.models.Devotee;
			var DevoteeList = [];
			DevoteeList.push(devotee);
			if (!family) {

				Devotee.getDevoteeConfirmationStatus(DevoteeList, departmentEventId, options, function (err, devoteeConf) {
					if (err) {
						cb(err);
						return cb.promise;
					}
					cb(null, devoteeConf);
				});
			} else {
				Devotee.getFamily(devotee, options, function (err, devoteeFamily) {

					if (err) {
						cb(err);
						return cb.promise;
					}
					if (!devoteeFamily.length) {

						Devotee.getDevoteeConfirmationStatus(DevoteeList, departmentEventId, options, function (err, devoteeConf) {
							if (err) {
								cb(err);
								return cb.promise;
							}
							cb(null, devoteeConf);
						});
					}
					else {
						DevoteeList = devoteeFamily.map(function (member) {
							return member.id;
						});

						Devotee.getDevoteeConfirmationStatus(DevoteeList, departmentEventId, options, function (err, devoteeConf) {
							if (err) {
								cb(err);
								return cb.promise;
							}

							cb(null, devoteeConf);

						});
					};
				});
			}

		});
		return cb.promise;
	};

	/**
	 * Get the list of Family Memebers of a Devotee.
	 *
	 * ```js
	 * Devotee.getFamily(options, function (err, roles) {
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
	Devotee.getFamily = function (devoteeId, options, cb) {


		cb = cb || utils.createPromiseCallback();

		Devotee.getApp(function (err, app) {
			if (err) {
				cb(err);
				return cb.promise;
			}
			var DevoteeKarmiFamily = app.models.DevoteeKarmiFamily;
			var Devotee = app.models.Devotee;

			DevoteeKarmiFamily.find({ where: { relatedDevoteeId: devoteeId } }, function (err, familyRecord) {
				if (err) {
					cb(err);
					return cb.promise;
				}

				if (!familyRecord.length) { return cb(null, []); }
				else {
					var familyHead = familyRecord.map(function (member) {
						return member.devoteeId;
					});

					DevoteeKarmiFamily.find({ where: { devoteeId: familyHead }, include: { relation: "fkDevoteeKarmiFamilyDevotee1rel" } }, function (err, family) {
						if (err) {
							cb(err);
							return cb.promise;
						}
						//console.log(family);


						family.forEach(function (member) {
							// post.owner points to the relation method instead of the owner instance
							var p = member.toJSON();
						});

						var familyMembers = family.map(function (member) {
							return member.toJSON().fkDevoteeKarmiFamilyDevotee1rel;
						});

						cb(null, familyMembers);
					});
				}
			});
		});
		return cb.promise;
	};


	/**
		  * Issue Coupons.
		  *
		  * ```js
		  * Devotee.getDevoteeConfirmations(options, function (err, roles) {
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
		 Devotee.issueCoupons = function (devotee, departmentEventId, eventName, self, family, guest, options, cb) {

			cb = cb || utils.createPromiseCallback();
	
			Devotee.getApp(function (err, app) {
				if (err) {
					cb(err);
					return cb.promise;
				}
	
				var EventDevoteeConfirmation = app.models.EventDevoteeConfirmation;
				var PrasadamCouponRegister = app.models.PrasadamCouponRegister;
				var Devotee = app.models.Devotee;
				var Devotee = app.models.Devotee;
				var CouponList = [];
				var DevoteeList = [];

				if (!family) {
	
					if (self) {
						DevoteeList.push(devotee);
						Devotee.getDevoteeConfirmationStatus(DevoteeList, departmentEventId, options, function (err, devoteeConf) {
							if (err) {
								cb(err);
								return cb.promise;
							}		
							DevoteeList = devoteeConf.map(function (conf) {
								if (conf.devotee.fkDevoteeEventConfirmations.length > 0) {
								if (conf.devotee.fkDevoteeEventConfirmations[0].selfconfirm) {
									return {devoteeId: conf.devotee.id, departmentEventId: departmentEventId, issueDateTime: new Date(), 
										issuedToName: conf.devotee.spiritualName ? conf.devotee.spiritualName : conf.devotee.legalName, eventName: eventName}
									}
										for (i = 1; i <= conf.devotee.fkDevoteeEventConfirmations[0].guestConfirm; i++) { 
								return {devoteeId: conf.devotee.id, departmentEventId: departmentEventId, issueDateTime: new Date(), 
									issuedToName: conf.devotee.spiritualName ? conf.devotee.spiritualName : conf.devotee.legalName + "'s guest", eventName: eventName}									
								  }	
								}							
							});					
						PrasadamCouponRegister.create(DevoteeList, function (err, coupon) {
							if (err) {
								cb(err);
								return cb.promise;
							}
							EventDevoteeConfirmation.updateAll({id: conf.devotee.fkDevoteeEventConfirmations[0].id}, {couponIssued: 1}, function(err, info) {
								if (err) {
									cb(err);
									return cb.promise;
								}	
								CouponList.push(coupon);	
								cb(null, CouponList);	
							});				
							}
						);
					});
				} else {
					cb(null, CouponList);					
				}
			
				} else {
					Devotee.getFamily(devotee, options, function (err, devoteeFamily) {
	
						if (err) {
							cb(err);
							return cb.promise;
						}
						if (!devoteeFamily.length) {
							DevoteeList.push(devotee);
							Devotee.getDevoteeConfirmationStatus(DevoteeList, departmentEventId, options, function (err, devoteeConf) {
								if (err) {
									cb(err);
									return cb.promise;
								}		
								DevoteeList = devoteeConf.map(function (conf) {
									if (conf.devotee.fkDevoteeEventConfirmations.length > 0) {
									if (conf.devotee.fkDevoteeEventConfirmations[0].selfconfirm) {
										return {devoteeId: conf.devotee.id, departmentEventId: departmentEventId, issueDateTime: new Date(), 
											issuedToName: conf.devotee.spiritualName ? conf.devotee.spiritualName : conf.devotee.legalName, eventName: eventName}
										}
											for (i = 1; i <= conf.devotee.fkDevoteeEventConfirmations[0].guestConfirm; i++) { 
									return {devoteeId: conf.devotee.id, departmentEventId: departmentEventId, issueDateTime: new Date(), 
										issuedToName: conf.devotee.spiritualName ? conf.devotee.spiritualName : conf.devotee.legalName + "'s guest", eventName: eventName}									
									  }	
									}							
								});					
							PrasadamCouponRegister.create(DevoteeList, function (err, coupon) {
								if (err) {
									cb(err);
									return cb.promise;
								}
								EventDevoteeConfirmation.updateAll({id: conf.devotee.fkDevoteeEventConfirmations[0].id}, {couponIssued: 1}, function(err, info) {
									if (err) {
										cb(err);
										return cb.promise;
									}	
									CouponList.push(coupon);	
									cb(null, CouponList);	
								});				
								}
							);
						});
						}
						else {
							DevoteeList = devoteeFamily.map(function (member) {
								return member.id;
							});
	
							Devotee.getDevoteeConfirmationStatus(DevoteeList, departmentEventId, options, function (err, devoteeConf) {
								if (err) {
									cb(err);
									return cb.promise;
								}
		var confIdList = [];
								DevoteeList = devoteeConf.map(function (conf) {
									if (conf.devotee.fkDevoteeEventConfirmations.length > 0) {
										confIdList.push(conf.devotee.fkDevoteeEventConfirmations[0].id);
									if (conf.devotee.fkDevoteeEventConfirmations[0].selfconfirm) {
										return {devoteeId: conf.devotee.id, departmentEventId: departmentEventId, issueDateTime: new Date()}
									}
									for (i = 1; i <= conf.devotee.fkDevoteeEventConfirmations[0].guestConfirm; i++) { 
										return {devoteeId: conf.devotee.id, departmentEventId: departmentEventId, issueDateTime: new Date()}										
									  }	
									}							
								});

								PrasadamCouponRegister.create(DevoteeList, function (err, coupons) {
									if (err) {
										cb(err);
										return cb.promise;
									}
									EventDevoteeConfirmation.updateAll({id: {inq: confIdList }}, {couponIssued: 1}, function(err, info) {
										if (err) {
											cb(err);
											return cb.promise;
										}	
										CouponList.push(coupon);	
										cb(null, CouponList);	
									});	
									}
								);	

							});
						};
					});
				}
	
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


			Devotee.getRoles(options, function (err, authorizedRoles) {
				if (err) {
					cb(err);
					return cb.promise;
				}

				var conditions = authorizedRoles.roles.map(function (roleId) {
					return { roleId: roleId.id };
				});

				if (!authorizedRoles.roles.length) { return cb(null, { "departments": [] }); }

				DepartmentRole.find({ where: { or: conditions } }, function (err, departmentRoles) {
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

					Department.find({ where: { or: conditions } }, function (err, departments) {
						if (err) {
							cb(err);
							return cb.promise;
						}
						cb(null, { departments });
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

			Devotee.getRoles(options, function (err, authorizedRoles) {
				if (err) {
					cb(err);
					return cb.promise;
				}

				var conditions = authorizedRoles.roles.map(function (roleId) {
					return { roleId: roleId.id };
				});

				if (!authorizedRoles.roles.length) { return cb(null, { "tasks": [] }); }
				else {
					RoleTask.find({ where: { or: conditions } }, function (err, RolesTasks) {
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

						TaskMaster.find({ where: { or: conditions } }, function (err, tasks) {
							if (err) {
								cb(err);
								return cb.promise;
							}
							cb(null, { tasks });
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
				{ arg: 'options', type: 'object', http: 'optionsFromRequest' }
			],
			http: { verb: 'GET', path: '/getDepartments' },
			returns: { arg: 'devotees', type: 'object', root: true }
		}
	);


	Devotee.remoteMethod(
		'getRoles',
		{
			description: 'Get the list of Authorized Roles assigned to a Devotee',
			accepts: [
				{ arg: 'options', type: 'object', http: 'optionsFromRequest' }
			],
			http: { verb: 'GET', path: '/getRoles' },
			returns: { arg: 'roles', type: 'String', root: true }
		}
	);

	Devotee.remoteMethod(
		'getRoleTasks',
		{
			description: 'Get the list of Tasks assigned to a Role/Devotee',
			accepts: [
				{ arg: 'options', type: 'object', http: 'optionsFromRequest' }
			],
			http: { verb: 'GET', path: '/getRoleTasks' },
			returns: { arg: 'tasks', type: 'String', root: true }
		}
	);

	Devotee.remoteMethod('getFilteredDevotees', {
		description: 'Get the list of filtered Devotees',
		accepts: [
			{ arg: 'whereFilter', type: 'object' },
			{ arg: 'otherFilter', type: 'object' },
			{ arg: 'options', type: 'object', http: 'optionsFromRequest' }
		],
		http: { path: '/getFilteredDevotees', verb: 'get' },
		returns: { arg: 'filter', type: 'String', root: true }
	});

	Devotee.remoteMethod('getShikshaDevotees', {
		description: 'Get the list of Devotees who have attained certain Spiritual Levels',
		http: { path: '/getShikshaDevotees', verb: 'get' },
		accepts: [
			{ arg: 'shikshas', type: 'String' },
		],
		returns: { arg: 'devotees', type: 'String', root: true }
	});

	Devotee.remoteMethod('getServicesDevotees', {
		description: 'Get the list of Devotees who have attained certain Spiritual Levels',
		http: { path: '/getServicesDevotees', verb: 'get' },
		accepts: [
			{ arg: 'services', type: 'String' },
		],
		returns: { arg: 'devotees', type: 'String', root: true }
	});

	Devotee.remoteMethod('getEventsDevotees', {
		description: 'Get the list of Devotees who have attained certain Spiritual Levels',
		http: { path: '/getEventsDevotees', verb: 'get' },
		accepts: [
			{ arg: 'eventDateRange', type: 'array' },
			// {arg: 'startDate', type: 'date'},
			// {arg: 'endDate', type: 'date'},
		],
		returns: { arg: 'devotees', type: 'String', root: true }
	});

	Devotee.remoteMethod('getFamily', {
		description: 'Get the list of Family Members of a Devotee',
		http: { path: '/getFamily', verb: 'get' },
		accepts: [
			{ arg: 'devoteeId', type: 'String' },
		],
		returns: { arg: 'devotees', type: 'String', root: true }
	});

	Devotee.remoteMethod('getDevoteeConfirmations', {
		description: 'Get the event confirmation status of a set of Devotees',
		http: { path: '/getDevoteeConfirmations', verb: 'get' },
		accepts: [
			{ arg: 'devotee', type: 'String' },
			{ arg: 'family', type: 'Boolean' },
			{ arg: 'departmentEventId', type: 'String' },
		],
		returns: { arg: 'devoteesConfirmation', type: 'array', root: true }
	});

	Devotee.remoteMethod('issueCoupons', {
		description: 'Issue coupons to confirmed devotees',
		http: { path: '/issueCoupons', verb: 'get' },
		accepts: [
			{ arg: 'devotee', type: 'String' },
			{ arg: 'departmentEventId', type: 'String' },
			{ arg: 'self', type: 'Boolean' },
			{ arg: 'family', type: 'Boolean' },
			{ arg: 'guest', type: 'number' },
		],
		returns: { arg: 'coupons', type: 'array', root: true }
	});

}
