/* tslint:disable */

declare var Object: any;
export interface OutreachMasterInterface {
  "id": string;
  "description"?: string;
  "createdOn"?: Date;
  "updatedOn"?: Date;
  "createdBy"?: string;
  "updatedBy"?: string;
}

export class OutreachMaster implements OutreachMasterInterface {
  "id": string;
  "description": string;
  "createdOn": Date;
  "updatedOn": Date;
  "createdBy": string;
  "updatedBy": string;
  constructor(data?: OutreachMasterInterface) {
    Object.assign(this, data);
  }
  /**
   * The name of the model represented by this $resource,
   * i.e. `OutreachMaster`.
   */
  public static getModelName() {
    return "OutreachMaster";
  }
  /**
  * @method factory
  * @author Jonathan Casarrubias
  * @license MIT
  * This method creates an instance of OutreachMaster for dynamic purposes.
  **/
  public static factory(data: OutreachMasterInterface): OutreachMaster{
    return new OutreachMaster(data);
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
      name: 'OutreachMaster',
      plural: 'OutreachMasters',
      path: 'OutreachMasters',
      idName: 'id',
      properties: {
        "id": {
          name: 'id',
          type: 'string'
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
      },
      relations: {
      }
    }
  }
}
