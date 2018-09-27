/* tslint:disable */
import {
  TaskMaster
} from '../index';

declare var Object: any;
export interface TaskGroupInterface {
  "id": string;
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
  "updatedBy"?: string;
  "createdOn"?: Date;
  "updatedOn"?: Date;
  "createdBy"?: string;
  groupTasks?: TaskMaster[];
}

export class TaskGroup implements TaskGroupInterface {
  "id": string;
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
  "updatedBy": string;
  "createdOn": Date;
  "updatedOn": Date;
  "createdBy": string;
  groupTasks: TaskMaster[];
  constructor(data?: TaskGroupInterface) {
    Object.assign(this, data);
  }
  /**
   * The name of the model represented by this $resource,
   * i.e. `TaskGroup`.
   */
  public static getModelName() {
    return "TaskGroup";
  }
  /**
  * @method factory
  * @author Jonathan Casarrubias
  * @license MIT
  * This method creates an instance of TaskGroup for dynamic purposes.
  **/
  public static factory(data: TaskGroupInterface): TaskGroup{
    return new TaskGroup(data);
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
      name: 'TaskGroup',
      plural: 'TaskGroups',
      path: 'TaskGroups',
      idName: 'id',
      properties: {
        "id": {
          name: 'id',
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
        "updatedBy": {
          name: 'updatedBy',
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
      },
      relations: {
        groupTasks: {
          name: 'groupTasks',
          type: 'TaskMaster[]',
          model: 'TaskMaster',
          relationType: 'hasMany',
                  keyFrom: 'id',
          keyTo: 'taskGroupId'
        },
      }
    }
  }
}
