/* tslint:disable */
import {
  DepartmentEvent,
  Devotee
} from '../index';

declare var Object: any;
export interface PrasadamCouponRegisterInterface {
  "id": string;
  "departmentEventId": string;
  "issueDateTime": Date;
  "devoteeId": string;
  "issuedToName": string;
  "eventName": string;
  "createdBy"?: string;
  "updatedBy"?: string;
  "created-on"?: Date;
  "updated-on"?: Date;
  fkPrasadamCouponMasterDepartmentEvent1rel?: DepartmentEvent;
  fkPrasadamCouponMasterDevotee1rel?: Devotee;
}

export class PrasadamCouponRegister implements PrasadamCouponRegisterInterface {
  "id": string;
  "departmentEventId": string;
  "issueDateTime": Date;
  "devoteeId": string;
  "issuedToName": string;
  "eventName": string;
  "createdBy": string;
  "updatedBy": string;
  "created-on": Date;
  "updated-on": Date;
  fkPrasadamCouponMasterDepartmentEvent1rel: DepartmentEvent;
  fkPrasadamCouponMasterDevotee1rel: Devotee;
  constructor(data?: PrasadamCouponRegisterInterface) {
    Object.assign(this, data);
  }
  /**
   * The name of the model represented by this $resource,
   * i.e. `PrasadamCouponRegister`.
   */
  public static getModelName() {
    return "PrasadamCouponRegister";
  }
  /**
  * @method factory
  * @author Jonathan Casarrubias
  * @license MIT
  * This method creates an instance of PrasadamCouponRegister for dynamic purposes.
  **/
  public static factory(data: PrasadamCouponRegisterInterface): PrasadamCouponRegister{
    return new PrasadamCouponRegister(data);
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
      name: 'PrasadamCouponRegister',
      plural: 'PrasadamCouponRegisters',
      path: 'PrasadamCouponRegisters',
      idName: 'id',
      properties: {
        "id": {
          name: 'id',
          type: 'string'
        },
        "departmentEventId": {
          name: 'departmentEventId',
          type: 'string'
        },
        "issueDateTime": {
          name: 'issueDateTime',
          type: 'Date'
        },
        "devoteeId": {
          name: 'devoteeId',
          type: 'string'
        },
        "issuedToName": {
          name: 'issuedToName',
          type: 'string'
        },
        "eventName": {
          name: 'eventName',
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
        fkPrasadamCouponMasterDepartmentEvent1rel: {
          name: 'fkPrasadamCouponMasterDepartmentEvent1rel',
          type: 'DepartmentEvent',
          model: 'DepartmentEvent',
          relationType: 'belongsTo',
                  keyFrom: 'departmentEventId',
          keyTo: 'id'
        },
        fkPrasadamCouponMasterDevotee1rel: {
          name: 'fkPrasadamCouponMasterDevotee1rel',
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
