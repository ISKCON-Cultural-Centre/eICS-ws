/* tslint:disable */
import {
  Department
} from '../index';

declare var Object: any;
export interface ResourceInterface {
  "id": string;
  "name": string;
  "parentId"?: string;
  "label": string;
  "defaaultLocation": string;
  "ownerDepartmentId"?: string;
  "createdBy"?: string;
  "updatedBy"?: string;
  "created-on"?: Date;
  "updated-on"?: Date;
  fkResourceDepartment1rel?: Department;
  fkResourceResource1rel?: Resource;
}

export class Resource implements ResourceInterface {
  "id": string;
  "name": string;
  "parentId": string;
  "label": string;
  "defaaultLocation": string;
  "ownerDepartmentId": string;
  "createdBy": string;
  "updatedBy": string;
  "created-on": Date;
  "updated-on": Date;
  fkResourceDepartment1rel: Department;
  fkResourceResource1rel: Resource;
  constructor(data?: ResourceInterface) {
    Object.assign(this, data);
  }
  /**
   * The name of the model represented by this $resource,
   * i.e. `Resource`.
   */
  public static getModelName() {
    return "Resource";
  }
  /**
  * @method factory
  * @author Jonathan Casarrubias
  * @license MIT
  * This method creates an instance of Resource for dynamic purposes.
  **/
  public static factory(data: ResourceInterface): Resource{
    return new Resource(data);
  }
  /**
  * @method getModelDefinition
  * @author Julien Ledun
  * @license MIT
  * This method returns an object that represents some of the model
  * definitions.
  **/
  public static getModelDefinition() {
    return {
      name: 'Resource',
      plural: 'Resources',
      path: 'Resources',
      idName: 'id',
      properties: {
        "id": {
          name: 'id',
          type: 'string'
        },
        "name": {
          name: 'name',
          type: 'string'
        },
        "parentId": {
          name: 'parentId',
          type: 'string'
        },
        "label": {
          name: 'label',
          type: 'string'
        },
        "defaaultLocation": {
          name: 'defaaultLocation',
          type: 'string'
        },
        "ownerDepartmentId": {
          name: 'ownerDepartmentId',
          type: 'string'
        },
        "createdBy": {
          name: 'createdBy',
          type: 'string'
        },
        "updatedBy": {
          name: 'updatedBy',
          type: 'string'
        },
        "created-on": {
          name: 'created-on',
          type: 'Date'
        },
        "updated-on": {
          name: 'updated-on',
          type: 'Date'
        },
      },
      relations: {
        fkResourceDepartment1rel: {
          name: 'fkResourceDepartment1rel',
          type: 'Department',
          model: 'Department',
          relationType: 'belongsTo',
                  keyFrom: 'ownerDepartmentId',
          keyTo: 'id'
        },
        fkResourceResource1rel: {
          name: 'fkResourceResource1rel',
          type: 'Resource',
          model: 'Resource',
          relationType: 'belongsTo',
                  keyFrom: 'parentId',
          keyTo: 'id'
        },
      }
    }
  }
}
