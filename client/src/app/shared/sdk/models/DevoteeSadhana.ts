/* tslint:disable */
import {
  Devotee,
  SaadhanaMaster
} from '../index';

declare var Object: any;
export interface DevoteeSadhanaInterface {
  "devoteeId": string;
  "saadhanaDate": Date;
  "saadhanaMasterId": string;
  "saadhana": string;
  "createdBy"?: string;
  "updatedBy"?: string;
  "created-on"?: Date;
  "updated-on"?: Date;
  fkDevoteeSadhanaDevotee1rel?: Devotee;
  fkDevoteeSadhanaSaadhanaMaster1rel?: SaadhanaMaster;
}

export class DevoteeSadhana implements DevoteeSadhanaInterface {
  "devoteeId": string;
  "saadhanaDate": Date;
  "saadhanaMasterId": string;
  "saadhana": string;
  "createdBy": string;
  "updatedBy": string;
  "created-on": Date;
  "updated-on": Date;
  fkDevoteeSadhanaDevotee1rel: Devotee;
  fkDevoteeSadhanaSaadhanaMaster1rel: SaadhanaMaster;
  constructor(data?: DevoteeSadhanaInterface) {
    Object.assign(this, data);
  }
  /**
   * The name of the model represented by this $resource,
   * i.e. `DevoteeSadhana`.
   */
  public static getModelName() {
    return "DevoteeSadhana";
  }
  /**
  * @method factory
  * @author Jonathan Casarrubias
  * @license MIT
  * This method creates an instance of DevoteeSadhana for dynamic purposes.
  **/
  public static factory(data: DevoteeSadhanaInterface): DevoteeSadhana{
    return new DevoteeSadhana(data);
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
      name: 'DevoteeSadhana',
      plural: 'DevoteeSadhanas',
      path: 'DevoteeSadhanas',
      idName: 'devoteeId',
      properties: {
        "devoteeId": {
          name: 'devoteeId',
          type: 'string'
        },
        "saadhanaDate": {
          name: 'saadhanaDate',
          type: 'Date'
        },
        "saadhanaMasterId": {
          name: 'saadhanaMasterId',
          type: 'string'
        },
        "saadhana": {
          name: 'saadhana',
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
        fkDevoteeSadhanaDevotee1rel: {
          name: 'fkDevoteeSadhanaDevotee1rel',
          type: 'Devotee',
          model: 'Devotee',
          relationType: 'belongsTo',
                  keyFrom: 'devoteeId',
          keyTo: 'id'
        },
        fkDevoteeSadhanaSaadhanaMaster1rel: {
          name: 'fkDevoteeSadhanaSaadhanaMaster1rel',
          type: 'SaadhanaMaster',
          model: 'SaadhanaMaster',
          relationType: 'belongsTo',
                  keyFrom: 'saadhanaMasterId',
          keyTo: 'id'
        },
      }
    }
  }
}
