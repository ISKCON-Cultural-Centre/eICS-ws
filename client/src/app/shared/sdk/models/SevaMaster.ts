/* tslint:disable */

declare var Object: any;
export interface SevaMasterInterface {
  "id": string;
  "name": string;
  "createdOn"?: Date;
  "updatedOn"?: Date;
  "createdBy"?: string;
  "updatedBy"?: string;
}

export class SevaMaster implements SevaMasterInterface {
  "id": string;
  "name": string;
  "createdOn": Date;
  "updatedOn": Date;
  "createdBy": string;
  "updatedBy": string;
  constructor(data?: SevaMasterInterface) {
    Object.assign(this, data);
  }
  /**
   * The name of the model represented by this $resource,
   * i.e. `SevaMaster`.
   */
  public static getModelName() {
    return "SevaMaster";
  }
  /**
  * @method factory
  * @author Jonathan Casarrubias
  * @license MIT
  * This method creates an instance of SevaMaster for dynamic purposes.
  **/
  public static factory(data: SevaMasterInterface): SevaMaster{
    return new SevaMaster(data);
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
      name: 'SevaMaster',
      plural: 'SevaMasters',
      path: 'SevaMasters',
      idName: 'id',
      properties: {
        "id": {
          name: 'id',
          type: 'string'
        },
        "name": {
          name: 'name',
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
