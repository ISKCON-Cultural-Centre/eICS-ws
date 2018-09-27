    Devotee.afterRemote('addToLogin', function(context, remoteMethodOutput, next) {

        var userId = context.result && context.result.userId;        

        if (!userId) {
            // without connected user. proceed without hook
            return next();
          }


        // Will perform a query in the RoleMapping Model to findout the current role of connected user
        var RoleMapping = Devotee.app.models.ServiceRoleMapping;
        var Role = Devotee.app.models.ServiceRole;
        RoleMapping.find({ where : { principalId: userId }}, function (err, roleMappings) {
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
            //cb(null, {"roles": roleNames});
            console.log(roleNames);            
          });
        });
        console.log(context.result);
        next();
      });    



      RoleMapping.find(
				{
					scope: {
						where : { principalId: loginToken.userId }
					  },
					include: {
					  relation: 'ServiceRole', // include the owner object
					  scope: { // further filter the owner object
						fields: ['id', 'name'], // only show two fields
					  }
					}
				  },function (err, roleMappings) {
				if (err) {
					throw err;
				  }
				  console.log(roleMappings);				  
                var roleIds = _.uniq(roleMappings
                .map(function (roleMapping) {
				return roleMapping.id;
				}));
				console.log(roleIds);				
			
                this.conditions = roleIds.map(function (id) {
                    return { id: id };
                });
			});
			loginToken.roles = this.roleNames;
			fn(null, loginToken);

			console.log(loginToken);
			return fn.promise;			