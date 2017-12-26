/* tslint:disable */

declare var Object: any;
export interface ElectronicAddressTypeMasterInterface {
  "id": string;
  "name"?: string;
  "createdOn"?: Date;
  "updatedOn"?: Date;
  "createdBy"?: string;
  "updatedBy"?: string;
}

export class ElectronicAddressTypeMaster implements ElectronicAddressTypeMasterInterface {
  "id": string;
  "name": string;
  "createdOn": Date;
  "updatedOn": Date;
  "createdBy": string;
  "updatedBy": string;
  constructor(data?: ElectronicAddressTypeMasterInterface) {
    Object.assign(this, data);
  }
  /**
   * The name of the model represented by this $resource,
   * i.e. `ElectronicAddressTypeMaster`.
   */
  public static getModelName() {
    return "ElectronicAddressTypeMaster";
  }
  /**
  * @method factory
  * @author Jonathan Casarrubias
  * @license MIT
  * This method creates an instance of ElectronicAddressTypeMaster for dynamic purposes.
  **/
  public static factory(data: ElectronicAddressTypeMasterInterface): ElectronicAddressTypeMaster{
    return new ElectronicAddressTypeMaster(data);
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
      name: 'ElectronicAddressTypeMaster',
      plural: 'ElectronicAddressTypeMasters',
      path: 'ElectronicAddressTypeMasters',
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
