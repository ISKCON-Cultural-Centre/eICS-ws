/* tslint:disable */

declare var Object: any;
export interface EventConfirmationsDetailInterface {
  "departmentEventId": string;
  "eventName": string;
  "familyName"?: string;
  "name"?: string;
  "enrolNo"?: number;
  "spiritualName"?: string;
  "mobileNo1"?: string;
  "selfconfirm": number;
  "guestCount": number;
  "couponIssued": number;
  "id": string;
}

export class EventConfirmationsDetail implements EventConfirmationsDetailInterface {
  "departmentEventId": string;
  "eventName": string;
  "familyName": string;
  "name": string;
  "enrolNo": number;
  "spiritualName": string;
  "mobileNo1": string;
  "selfconfirm": number;
  "guestCount": number;
  "couponIssued": number;
  "id": string;
  constructor(data?: EventConfirmationsDetailInterface) {
    Object.assign(this, data);
  }
  /**
   * The name of the model represented by this $resource,
   * i.e. `EventConfirmationsDetail`.
   */
  public static getModelName() {
    return "EventConfirmationsDetail";
  }
  /**
  * @method factory
  * @author Jonathan Casarrubias
  * @license MIT
  * This method creates an instance of EventConfirmationsDetail for dynamic purposes.
  **/
  public static factory(data: EventConfirmationsDetailInterface): EventConfirmationsDetail{
    return new EventConfirmationsDetail(data);
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
      name: 'EventConfirmationsDetail',
      plural: 'EventConfirmationsDetails',
      path: 'EventConfirmationsDetails',
      idName: '',
      properties: {
        "departmentEventId": {
          name: 'departmentEventId',
          type: 'string'
        },
        "eventName": {
          name: 'eventName',
          type: 'string'
        },
        "familyName": {
          name: 'familyName',
          type: 'string'
        },
        "name": {
          name: 'name',
          type: 'string'
        },
        "enrolNo": {
          name: 'enrolNo',
          type: 'number'
        },
        "spiritualName": {
          name: 'spiritualName',
          type: 'string'
        },
        "mobileNo1": {
          name: 'mobileNo1',
          type: 'string'
        },
        "selfconfirm": {
          name: 'selfconfirm',
          type: 'number'
        },
        "guestCount": {
          name: 'guestCount',
          type: 'number'
        },
        "couponIssued": {
          name: 'couponIssued',
          type: 'number'
        },
        "id": {
          name: 'id',
          type: 'string'
        },
      },
      relations: {
      }
    }
  }
}
