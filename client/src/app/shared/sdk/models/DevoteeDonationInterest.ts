/* tslint:disable */
import {
  Devotee,
  DonationCategoryMaster
} from '../index';

declare var Object: any;
export interface DevoteeDonationInterestInterface {
  "devoteeId": string;
  "donationCategoryMasterId": string;
  "createdOn"?: Date;
  "updatedOn"?: Date;
  "createdBy"?: string;
  "updatedBy"?: string;
  fkDevoteeDonationInterestDevotee1rel?: Devotee;
  fkDevoteeDonationInterestDonationCategoryMaster1rel?: DonationCategoryMaster;
}

export class DevoteeDonationInterest implements DevoteeDonationInterestInterface {
  "devoteeId": string;
  "donationCategoryMasterId": string;
  "createdOn": Date;
  "updatedOn": Date;
  "createdBy": string;
  "updatedBy": string;
  fkDevoteeDonationInterestDevotee1rel: Devotee;
  fkDevoteeDonationInterestDonationCategoryMaster1rel: DonationCategoryMaster;
  constructor(data?: DevoteeDonationInterestInterface) {
    Object.assign(this, data);
  }
  /**
   * The name of the model represented by this $resource,
   * i.e. `DevoteeDonationInterest`.
   */
  public static getModelName() {
    return "DevoteeDonationInterest";
  }
  /**
  * @method factory
  * @author Jonathan Casarrubias
  * @license MIT
  * This method creates an instance of DevoteeDonationInterest for dynamic purposes.
  **/
  public static factory(data: DevoteeDonationInterestInterface): DevoteeDonationInterest{
    return new DevoteeDonationInterest(data);
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
      name: 'DevoteeDonationInterest',
      plural: 'DevoteeDonationInterests',
      path: 'DevoteeDonationInterests',
      idName: 'devoteeId',
      properties: {
        "devoteeId": {
          name: 'devoteeId',
          type: 'string'
        },
        "donationCategoryMasterId": {
          name: 'donationCategoryMasterId',
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
      },
      relations: {
        fkDevoteeDonationInterestDevotee1rel: {
          name: 'fkDevoteeDonationInterestDevotee1rel',
          type: 'Devotee',
          model: 'Devotee',
          relationType: 'belongsTo',
                  keyFrom: 'devoteeId',
          keyTo: 'id'
        },
        fkDevoteeDonationInterestDonationCategoryMaster1rel: {
          name: 'fkDevoteeDonationInterestDonationCategoryMaster1rel',
          type: 'DonationCategoryMaster',
          model: 'DonationCategoryMaster',
          relationType: 'belongsTo',
                  keyFrom: 'donationCategoryMasterId',
          keyTo: 'id'
        },
      }
    }
  }
}
