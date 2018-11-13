/* tslint:disable */
import {
  Devotee,
  PrasadamCouponMaster
} from '../index';

declare var Object: any;
export interface PrasadamCouponRegisterInterface {
  "devoteeId": string;
  "prasadamCouponMasterId": string;
  "returnedOn"?: Date;
  "createdOn"?: Date;
  "updatedOn"?: Date;
  "createdBy"?: string;
  "updatedBy"?: string;
  "created-on"?: Date;
  "updated-on"?: Date;
  fkPrasadamCouponIssueRegisterDevotee1rel?: Devotee;
  fkPrasadamCouponIssueRegisterPrasadamCouponMaster1rel?: PrasadamCouponMaster;
}

export class PrasadamCouponRegister implements PrasadamCouponRegisterInterface {
  "devoteeId": string;
  "prasadamCouponMasterId": string;
  "returnedOn": Date;
  "createdOn": Date;
  "updatedOn": Date;
  "createdBy": string;
  "updatedBy": string;
  "created-on": Date;
  "updated-on": Date;
  fkPrasadamCouponIssueRegisterDevotee1rel: Devotee;
  fkPrasadamCouponIssueRegisterPrasadamCouponMaster1rel: PrasadamCouponMaster;
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
      idName: 'devoteeId',
      properties: {
        "devoteeId": {
          name: 'devoteeId',
          type: 'string'
        },
        "prasadamCouponMasterId": {
          name: 'prasadamCouponMasterId',
          type: 'string'
        },
        "returnedOn": {
          name: 'returnedOn',
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
        fkPrasadamCouponIssueRegisterDevotee1rel: {
          name: 'fkPrasadamCouponIssueRegisterDevotee1rel',
          type: 'Devotee',
          model: 'Devotee',
          relationType: 'belongsTo',
                  keyFrom: 'devoteeId',
          keyTo: 'id'
        },
        fkPrasadamCouponIssueRegisterPrasadamCouponMaster1rel: {
          name: 'fkPrasadamCouponIssueRegisterPrasadamCouponMaster1rel',
          type: 'PrasadamCouponMaster',
          model: 'PrasadamCouponMaster',
          relationType: 'belongsTo',
                  keyFrom: 'prasadamCouponMasterId',
          keyTo: 'id'
        },
      }
    }
  }
}
