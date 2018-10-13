/* tslint:disable */
import {
  Devotee,
  SevaMaster
} from '../index';

declare var Object: any;
export interface DevoteeSevaSubscriptionInterface {
  "id": string;
  "devoteeId": string;
  "sevaMasterId": string;
  "sevaReferenceNo": string;
  "createdOn"?: Date;
  "updatedOn"?: Date;
  "createdBy"?: string;
  "updatedBy"?: string;
  fkDevoteeSevaSubscriptionDevoteerel?: Devotee;
  fkDevoteeSevaSubscriptionSevarel?: SevaMaster;
}

export class DevoteeSevaSubscription implements DevoteeSevaSubscriptionInterface {
  "id": string;
  "devoteeId": string;
  "sevaMasterId": string;
  "sevaReferenceNo": string;
  "createdOn": Date;
  "updatedOn": Date;
  "createdBy": string;
  "updatedBy": string;
  fkDevoteeSevaSubscriptionDevoteerel: Devotee;
  fkDevoteeSevaSubscriptionSevarel: SevaMaster;
  constructor(data?: DevoteeSevaSubscriptionInterface) {
    Object.assign(this, data);
  }
  /**
   * The name of the model represented by this $resource,
   * i.e. `DevoteeSevaSubscription`.
   */
  public static getModelName() {
    return "DevoteeSevaSubscription";
  }
  /**
  * @method factory
  * @author Jonathan Casarrubias
  * @license MIT
  * This method creates an instance of DevoteeSevaSubscription for dynamic purposes.
  **/
  public static factory(data: DevoteeSevaSubscriptionInterface): DevoteeSevaSubscription{
    return new DevoteeSevaSubscription(data);
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
      name: 'DevoteeSevaSubscription',
      plural: 'DevoteeSevaSubscriptions',
      path: 'DevoteeSevaSubscriptions',
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
        "sevaMasterId": {
          name: 'sevaMasterId',
          type: 'string'
        },
        "sevaReferenceNo": {
          name: 'sevaReferenceNo',
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
        fkDevoteeSevaSubscriptionDevoteerel: {
          name: 'fkDevoteeSevaSubscriptionDevoteerel',
          type: 'Devotee',
          model: 'Devotee',
          relationType: 'belongsTo',
                  keyFrom: 'devoteeId',
          keyTo: 'id'
        },
        fkDevoteeSevaSubscriptionSevarel: {
          name: 'fkDevoteeSevaSubscriptionSevarel',
          type: 'SevaMaster',
          model: 'SevaMaster',
          relationType: 'belongsTo',
                  keyFrom: 'sevaMasterId',
          keyTo: 'id'
        },
      }
    }
  }
}
