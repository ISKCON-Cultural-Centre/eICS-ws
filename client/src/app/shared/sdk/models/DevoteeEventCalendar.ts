/* tslint:disable */
import {
  Devotee,
  DevoteeEventMaster
} from '../index';

declare var Object: any;
export interface DevoteeEventCalendarInterface {
  "id": string;
  "devoteeId": string;
  "eventMasterId": string;
  "eventDate": Date;
  "eventDateDayOfYear"?: number;
  "comments"?: string;
  "createdOn"?: Date;
  "updatedOn"?: Date;
  "createdBy"?: string;
  "updatedBy"?: string;
  "created-on"?: Date;
  "updated-on"?: Date;
  fkDevoteeEventCalendarDevotee2rel?: Devotee;
  fkDevoteeEventCalendarEventMaster1rel?: DevoteeEventMaster;
}

export class DevoteeEventCalendar implements DevoteeEventCalendarInterface {
  "id": string;
  "devoteeId": string;
  "eventMasterId": string;
  "eventDate": Date;
  "eventDateDayOfYear": number;
  "comments": string;
  "createdOn": Date;
  "updatedOn": Date;
  "createdBy": string;
  "updatedBy": string;
  "created-on": Date;
  "updated-on": Date;
  fkDevoteeEventCalendarDevotee2rel: Devotee;
  fkDevoteeEventCalendarEventMaster1rel: DevoteeEventMaster;
  constructor(data?: DevoteeEventCalendarInterface) {
    Object.assign(this, data);
  }
  /**
   * The name of the model represented by this $resource,
   * i.e. `DevoteeEventCalendar`.
   */
  public static getModelName() {
    return "DevoteeEventCalendar";
  }
  /**
  * @method factory
  * @author Jonathan Casarrubias
  * @license MIT
  * This method creates an instance of DevoteeEventCalendar for dynamic purposes.
  **/
  public static factory(data: DevoteeEventCalendarInterface): DevoteeEventCalendar{
    return new DevoteeEventCalendar(data);
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
      name: 'DevoteeEventCalendar',
      plural: 'DevoteeEventCalendars',
      path: 'DevoteeEventCalendars',
      idName: 'id',
      properties: {
        "id": {
          name: 'id',
          type: 'string'
        },
        "devoteeId": {
          name: 'devoteeId',
          type: 'string'
        },
        "eventMasterId": {
          name: 'eventMasterId',
          type: 'string'
        },
        "eventDate": {
          name: 'eventDate',
          type: 'Date'
        },
        "eventDateDayOfYear": {
          name: 'eventDateDayOfYear',
          type: 'number'
        },
        "comments": {
          name: 'comments',
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
        fkDevoteeEventCalendarDevotee2rel: {
          name: 'fkDevoteeEventCalendarDevotee2rel',
          type: 'Devotee',
          model: 'Devotee',
          relationType: 'belongsTo',
                  keyFrom: 'devoteeId',
          keyTo: 'id'
        },
        fkDevoteeEventCalendarEventMaster1rel: {
          name: 'fkDevoteeEventCalendarEventMaster1rel',
          type: 'DevoteeEventMaster',
          model: 'DevoteeEventMaster',
          relationType: 'belongsTo',
                  keyFrom: 'eventMasterId',
          keyTo: 'id'
        },
      }
    }
  }
}
