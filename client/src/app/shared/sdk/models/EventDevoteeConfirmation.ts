/* tslint:disable */
import {
  DepartmentEvent,
  Devotee
} from '../index';

declare var Object: any;
export interface EventDevoteeConfirmationInterface {
  "departmentEventId": string;
  "devoteeId": string;
  "guestCount": number;
  "createdOn"?: Date;
  "updatedOn"?: Date;
  "createdBy"?: string;
  "updatedBy"?: string;
  "created-on"?: Date;
  "updated-on"?: Date;
  fkEventDevoteeConfirmationDepartmentEvent1rel?: DepartmentEvent;
  fkEventDevoteeConfirmationDevotee1rel?: Devotee;
}

export class EventDevoteeConfirmation implements EventDevoteeConfirmationInterface {
  "departmentEventId": string;
  "devoteeId": string;
  "guestCount": number;
  "createdOn": Date;
  "updatedOn": Date;
  "createdBy": string;
  "updatedBy": string;
  "created-on": Date;
  "updated-on": Date;
  fkEventDevoteeConfirmationDepartmentEvent1rel: DepartmentEvent;
  fkEventDevoteeConfirmationDevotee1rel: Devotee;
  constructor(data?: EventDevoteeConfirmationInterface) {
    Object.assign(this, data);
  }
  /**
   * The name of the model represented by this $resource,
   * i.e. `EventDevoteeConfirmation`.
   */
  public static getModelName() {
    return "EventDevoteeConfirmation";
  }
  /**
  * @method factory
  * @author Jonathan Casarrubias
  * @license MIT
  * This method creates an instance of EventDevoteeConfirmation for dynamic purposes.
  **/
  public static factory(data: EventDevoteeConfirmationInterface): EventDevoteeConfirmation{
    return new EventDevoteeConfirmation(data);
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
      name: 'EventDevoteeConfirmation',
      plural: 'EventDevoteeConfirmations',
      path: 'EventDevoteeConfirmations',
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
        "guestCount": {
          name: 'guestCount',
          type: 'number'
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
        fkEventDevoteeConfirmationDepartmentEvent1rel: {
          name: 'fkEventDevoteeConfirmationDepartmentEvent1rel',
          type: 'DepartmentEvent',
          model: 'DepartmentEvent',
          relationType: 'belongsTo',
                  keyFrom: 'departmentEventId',
          keyTo: 'id'
        },
        fkEventDevoteeConfirmationDevotee1rel: {
          name: 'fkEventDevoteeConfirmationDevotee1rel',
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
