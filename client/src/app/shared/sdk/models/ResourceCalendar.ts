/* tslint:disable */
import {
  DepartmentEvent,
  Resource
} from '../index';

declare var Object: any;
export interface ResourceCalendarInterface {
  "resourceId": string;
  "departmentEventId": string;
  "start=time"?: Date;
  "endTime"?: Date;
  "createdBy"?: string;
  "updatedBy"?: string;
  "created-on"?: Date;
  "updated-on"?: Date;
  fkResourceCalendarDepartmentEvent1rel?: DepartmentEvent;
  fkResourceCalendarResource1rel?: Resource;
}

export class ResourceCalendar implements ResourceCalendarInterface {
  "resourceId": string;
  "departmentEventId": string;
  "start=time": Date;
  "endTime": Date;
  "createdBy": string;
  "updatedBy": string;
  "created-on": Date;
  "updated-on": Date;
  fkResourceCalendarDepartmentEvent1rel: DepartmentEvent;
  fkResourceCalendarResource1rel: Resource;
  constructor(data?: ResourceCalendarInterface) {
    Object.assign(this, data);
  }
  /**
   * The name of the model represented by this $resource,
   * i.e. `ResourceCalendar`.
   */
  public static getModelName() {
    return "ResourceCalendar";
  }
  /**
  * @method factory
  * @author Jonathan Casarrubias
  * @license MIT
  * This method creates an instance of ResourceCalendar for dynamic purposes.
  **/
  public static factory(data: ResourceCalendarInterface): ResourceCalendar{
    return new ResourceCalendar(data);
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
      name: 'ResourceCalendar',
      plural: 'ResourceCalendars',
      path: 'ResourceCalendars',
      idName: 'resourceId',
      properties: {
        "resourceId": {
          name: 'resourceId',
          type: 'string'
        },
        "departmentEventId": {
          name: 'departmentEventId',
          type: 'string'
        },
        "start=time": {
          name: 'start=time',
          type: 'Date'
        },
        "endTime": {
          name: 'endTime',
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
        fkResourceCalendarDepartmentEvent1rel: {
          name: 'fkResourceCalendarDepartmentEvent1rel',
          type: 'DepartmentEvent',
          model: 'DepartmentEvent',
          relationType: 'belongsTo',
                  keyFrom: 'departmentEventId',
          keyTo: 'id'
        },
        fkResourceCalendarResource1rel: {
          name: 'fkResourceCalendarResource1rel',
          type: 'Resource',
          model: 'Resource',
          relationType: 'belongsTo',
                  keyFrom: 'resourceId',
          keyTo: 'id'
        },
      }
    }
  }
}
