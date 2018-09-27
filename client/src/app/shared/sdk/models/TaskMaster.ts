/* tslint:disable */
import {
  TaskGroup
} from '../index';

declare var Object: any;
export interface TaskMasterInterface {
  "id": string;
  "parentId"?: string;
  "taskGroupId"?: string;
  "title": string;
  "type": string;
  "translate"?: string;
  "icon": string;
  "hidden"?: string;
  "url"?: string;
  "classes"?: string;
  "exactmatch"?: number;
  "externalurl"?: number;
  "openinnewtab"?: number;
  "function"?: string;
  "taskName"?: string;
  "approvalRulesApplyInd": number;
  "applicationRoute"?: string;
  "taskDescription"?: string;
  "createdOn"?: Date;
  "updatedOn"?: Date;
  "createdBy"?: string;
  "updatedBy"?: string;
  "created-on"?: Date;
  "updated-on"?: Date;
  fkTaskMasterTaskMaster1rel?: TaskMaster;
  taskChildren?: TaskMaster[];
  fkTaskMasterTaskGroup1rel?: TaskGroup;
}

export class TaskMaster implements TaskMasterInterface {
  "id": string;
  "parentId": string;
  "taskGroupId": string;
  "title": string;
  "type": string;
  "translate": string;
  "icon": string;
  "hidden": string;
  "url": string;
  "classes": string;
  "exactmatch": number;
  "externalurl": number;
  "openinnewtab": number;
  "function": string;
  "taskName": string;
  "approvalRulesApplyInd": number;
  "applicationRoute": string;
  "taskDescription": string;
  "createdOn": Date;
  "updatedOn": Date;
  "createdBy": string;
  "updatedBy": string;
  "created-on": Date;
  "updated-on": Date;
  fkTaskMasterTaskMaster1rel: TaskMaster;
  taskChildren: TaskMaster[];
  fkTaskMasterTaskGroup1rel: TaskGroup;
  constructor(data?: TaskMasterInterface) {
    Object.assign(this, data);
  }
  /**
   * The name of the model represented by this $resource,
   * i.e. `TaskMaster`.
   */
  public static getModelName() {
    return "TaskMaster";
  }
  /**
  * @method factory
  * @author Jonathan Casarrubias
  * @license MIT
  * This method creates an instance of TaskMaster for dynamic purposes.
  **/
  public static factory(data: TaskMasterInterface): TaskMaster{
    return new TaskMaster(data);
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
      name: 'TaskMaster',
      plural: 'TaskMasters',
      path: 'TaskMasters',
      idName: 'id',
      properties: {
        "id": {
          name: 'id',
          type: 'string'
        },
        "parentId": {
          name: 'parentId',
          type: 'string'
        },
        "taskGroupId": {
          name: 'taskGroupId',
          type: 'string'
        },
        "title": {
          name: 'title',
          type: 'string'
        },
        "type": {
          name: 'type',
          type: 'string'
        },
        "translate": {
          name: 'translate',
          type: 'string'
        },
        "icon": {
          name: 'icon',
          type: 'string'
        },
        "hidden": {
          name: 'hidden',
          type: 'string'
        },
        "url": {
          name: 'url',
          type: 'string'
        },
        "classes": {
          name: 'classes',
          type: 'string'
        },
        "exactmatch": {
          name: 'exactmatch',
          type: 'number'
        },
        "externalurl": {
          name: 'externalurl',
          type: 'number'
        },
        "openinnewtab": {
          name: 'openinnewtab',
          type: 'number'
        },
        "function": {
          name: 'function',
          type: 'string'
        },
        "taskName": {
          name: 'taskName',
          type: 'string'
        },
        "approvalRulesApplyInd": {
          name: 'approvalRulesApplyInd',
          type: 'number'
        },
        "applicationRoute": {
          name: 'applicationRoute',
          type: 'string'
        },
        "taskDescription": {
          name: 'taskDescription',
          type: 'string'
        },
        "createdOn": {
          name: 'createdOn',
          type: 'Date'
        },
        "updatedOn": {
          name: 'updatedOn',
          type: 'Date'
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
        fkTaskMasterTaskMaster1rel: {
          name: 'fkTaskMasterTaskMaster1rel',
          type: 'TaskMaster',
          model: 'TaskMaster',
          relationType: 'belongsTo',
                  keyFrom: 'parentId',
          keyTo: 'id'
        },
        taskChildren: {
          name: 'taskChildren',
          type: 'TaskMaster[]',
          model: 'TaskMaster',
          relationType: 'hasMany',
                  keyFrom: 'id',
          keyTo: 'parentId'
        },
        fkTaskMasterTaskGroup1rel: {
          name: 'fkTaskMasterTaskGroup1rel',
          type: 'TaskGroup',
          model: 'TaskGroup',
          relationType: 'belongsTo',
                  keyFrom: 'taskGroupId',
          keyTo: 'id'
        },
      }
    }
  }
}
