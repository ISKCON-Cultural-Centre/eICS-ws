/* tslint:disable */
import {
  DepartmentEvent
} from '../index';

declare var Object: any;
export interface PrasadamCouponMasterInterface {
  "id": string;
  "departmentEventId": string;
  "issueDateTime": Date;
  "createdOn"?: Date;
  "updatedOn"?: Date;
  "createdBy"?: string;
  "updatedBy"?: string;
  "created-on"?: Date;
  "updated-on"?: Date;
  fkPrasadamCouponMasterDepartmentEvent1rel?: DepartmentEvent;
}

export class PrasadamCouponMaster implements PrasadamCouponMasterInterface {
  "id": string;
  "departmentEventId": string;
  "issueDateTime": Date;
  "createdOn": Date;
  "updatedOn": Date;
  "createdBy": string;
  "updatedBy": string;
  "created-on": Date;
  "updated-on": Date;
  fkPrasadamCouponMasterDepartmentEvent1rel: DepartmentEvent;
  constructor(data?: PrasadamCouponMasterInterface) {
    Object.assign(this, data);
  }
  /**
   * The name of the model represented by this $resource,
   * i.e. `PrasadamCouponMaster`.
   */
  public static getModelName() {
    return "PrasadamCouponMaster";
  }
  /**
  * @method factory
  * @author Jonathan Casarrubias
  * @license MIT
  * This method creates an instance of PrasadamCouponMaster for dynamic purposes.
  **/
  public static factory(data: PrasadamCouponMasterInterface): PrasadamCouponMaster{
    return new PrasadamCouponMaster(data);
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
      name: 'PrasadamCouponMaster',
      plural: 'PrasadamCouponMasters',
      path: 'PrasadamCouponMasters',
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
        fkPrasadamCouponMasterDepartmentEvent1rel: {
          name: 'fkPrasadamCouponMasterDepartmentEvent1rel',
          type: 'DepartmentEvent',
          model: 'DepartmentEvent',
          relationType: 'belongsTo',
                  keyFrom: 'departmentEventId',
          keyTo: 'id'
        },
      }
    }
  }
}
