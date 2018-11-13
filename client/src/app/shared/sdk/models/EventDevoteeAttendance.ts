/* tslint:disable */
import {
  DepartmentEvent,
  Devotee
} from '../index';

declare var Object: any;
export interface EventDevoteeAttendanceInterface {
  "departmentEventId": string;
  "devoteeId": string;
  "createdOn"?: Date;
  "updatedOn"?: Date;
  "createdBy"?: string;
  "updatedBy"?: string;
  "created-on"?: Date;
  "updated-on"?: Date;
  fkEventDevoteeConfirmationDepartmentEvent10rel?: DepartmentEvent;
  fkEventDevoteeConfirmationDevotee10rel?: Devotee;
}

export class EventDevoteeAttendance implements EventDevoteeAttendanceInterface {
  "departmentEventId": string;
  "devoteeId": string;
  "createdOn": Date;
  "updatedOn": Date;
  "createdBy": string;
  "updatedBy": string;
  "created-on": Date;
  "updated-on": Date;
  fkEventDevoteeConfirmationDepartmentEvent10rel: DepartmentEvent;
  fkEventDevoteeConfirmationDevotee10rel: Devotee;
  constructor(data?: EventDevoteeAttendanceInterface) {
    Object.assign(this, data);
  }
  /**
   * The name of the model represented by this $resource,
   * i.e. `EventDevoteeAttendance`.
   */
  public static getModelName() {
    return "EventDevoteeAttendance";
  }
  /**
  * @method factory
  * @author Jonathan Casarrubias
  * @license MIT
  * This method creates an instance of EventDevoteeAttendance for dynamic purposes.
  **/
  public static factory(data: EventDevoteeAttendanceInterface): EventDevoteeAttendance{
    return new EventDevoteeAttendance(data);
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
      name: 'EventDevoteeAttendance',
      plural: 'EventDevoteeAttendances',
      path: 'EventDevoteeAttendances',
      idName: 'departmentEventId',
      properties: {
        "departmentEventId": {
          name: 'departmentEventId',
          type: 'string'
        },
        "devoteeId": {
          name: 'devoteeId',
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
        fkEventDevoteeConfirmationDepartmentEvent10rel: {
          name: 'fkEventDevoteeConfirmationDepartmentEvent10rel',
          type: 'DepartmentEvent',
          model: 'DepartmentEvent',
          relationType: 'belongsTo',
                  keyFrom: 'departmentEventId',
          keyTo: 'id'
        },
        fkEventDevoteeConfirmationDevotee10rel: {
          name: 'fkEventDevoteeConfirmationDevotee10rel',
          type: 'Devotee',
          model: 'Devotee',
          relationType: 'belongsTo',
                  keyFrom: 'devoteeId',
          keyTo: 'id'
        },
      }
    }
  }
}
