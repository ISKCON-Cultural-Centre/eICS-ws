/* tslint:disable */

declare var Object: any;
export interface SpiritualLevelMasterInterface {
  "id": string;
  "level": number;
  "description": string;
  "createdOn"?: Date;
  "updatedOn"?: Date;
  "createdBy"?: string;
  "updatedBy"?: string;
  "created-on"?: Date;
  "updated-on"?: Date;
}

export class SpiritualLevelMaster implements SpiritualLevelMasterInterface {
  "id": string;
  "level": number;
  "description": string;
  "createdOn": Date;
  "updatedOn": Date;
  "createdBy": string;
  "updatedBy": string;
  "created-on": Date;
  "updated-on": Date;
  constructor(data?: SpiritualLevelMasterInterface) {
    Object.assign(this, data);
  }
  /**
   * The name of the model represented by this $resource,
   * i.e. `SpiritualLevelMaster`.
   */
  public static getModelName() {
    return "SpiritualLevelMaster";
  }
  /**
  * @method factory
  * @author Jonathan Casarrubias
  * @license MIT
  * This method creates an instance of SpiritualLevelMaster for dynamic purposes.
  **/
  public static factory(data: SpiritualLevelMasterInterface): SpiritualLevelMaster{
    return new SpiritualLevelMaster(data);
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
      name: 'SpiritualLevelMaster',
      plural: 'SpiritualLevelMasters',
      path: 'SpiritualLevelMasters',
      idName: 'id',
      properties: {
        "id": {
          name: 'id',
          type: 'string'
        },
        "level": {
          name: 'level',
          type: 'number'
        },
        "description": {
          name: 'description',
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
      }
    }
  }
}
