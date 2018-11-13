/* tslint:disable */
import {
  Devotee,
  CardActionMaster
} from '../index';

declare var Object: any;
export interface DevoteeCardLogInterface {
  "id": string;
  "devoteeId": string;
  "cardActionMasterId": string;
  "createdOn"?: Date;
  "updatedOn"?: Date;
  "createdBy"?: string;
  "updatedBy"?: string;
  "created-on"?: Date;
  "updated-on"?: Date;
  fkDevoteeCardLogDevotee1rel?: Devotee;
  fkDevoteeCardLogCardActionMaster1rel?: CardActionMaster;
}

export class DevoteeCardLog implements DevoteeCardLogInterface {
  "id": string;
  "devoteeId": string;
  "cardActionMasterId": string;
  "createdOn": Date;
  "updatedOn": Date;
  "createdBy": string;
  "updatedBy": string;
  "created-on": Date;
  "updated-on": Date;
  fkDevoteeCardLogDevotee1rel: Devotee;
  fkDevoteeCardLogCardActionMaster1rel: CardActionMaster;
  constructor(data?: DevoteeCardLogInterface) {
    Object.assign(this, data);
  }
  /**
   * The name of the model represented by this $resource,
   * i.e. `DevoteeCardLog`.
   */
  public static getModelName() {
    return "DevoteeCardLog";
  }
  /**
  * @method factory
  * @author Jonathan Casarrubias
  * @license MIT
  * This method creates an instance of DevoteeCardLog for dynamic purposes.
  **/
  public static factory(data: DevoteeCardLogInterface): DevoteeCardLog{
    return new DevoteeCardLog(data);
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
      name: 'DevoteeCardLog',
      plural: 'DevoteeCardLogs',
      path: 'DevoteeCardLogs',
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
        "cardActionMasterId": {
          name: 'cardActionMasterId',
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
        fkDevoteeCardLogDevotee1rel: {
          name: 'fkDevoteeCardLogDevotee1rel',
          type: 'Devotee',
          model: 'Devotee',
          relationType: 'belongsTo',
                  keyFrom: 'devoteeId',
          keyTo: 'id'
        },
        fkDevoteeCardLogCardActionMaster1rel: {
          name: 'fkDevoteeCardLogCardActionMaster1rel',
          type: 'CardActionMaster',
          model: 'CardActionMaster',
          relationType: 'belongsTo',
                  keyFrom: 'cardActionMasterId',
          keyTo: 'id'
        },
      }
    }
  }
}
