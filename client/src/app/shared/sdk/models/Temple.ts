/* tslint:disable */
import {
  PhysicalAddress
} from '../index';

declare var Object: any;
export interface TempleInterface {
  "id": string;
  "name"?: string;
  "contactNumber"?: string;
  "contactName"?: string;
  "createdOn"?: Date;
  "updatedOn"?: Date;
  "createdBy"?: string;
  "updatedBy"?: string;
  "physicalAddressId"?: string;
  fkTemplePhysicalAddress1rel?: PhysicalAddress;
}

export class Temple implements TempleInterface {
  "id": string;
  "name": string;
  "contactNumber": string;
  "contactName": string;
  "createdOn": Date;
  "updatedOn": Date;
  "createdBy": string;
  "updatedBy": string;
  "physicalAddressId": string;
  fkTemplePhysicalAddress1rel: PhysicalAddress;
  constructor(data?: TempleInterface) {
    Object.assign(this, data);
  }
  /**
   * The name of the model represented by this $resource,
   * i.e. `Temple`.
   */
  public static getModelName() {
    return "Temple";
  }
  /**
  * @method factory
  * @author Jonathan Casarrubias
  * @license MIT
  * This method creates an instance of Temple for dynamic purposes.
  **/
  public static factory(data: TempleInterface): Temple{
    return new Temple(data);
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
      name: 'Temple',
      plural: 'Temples',
      path: 'Temples',
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
        "contactNumber": {
          name: 'contactNumber',
          type: 'string'
        },
        "contactName": {
          name: 'contactName',
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
        "physicalAddressId": {
          name: 'physicalAddressId',
          type: 'string'
        },
      },
      relations: {
        fkTemplePhysicalAddress1rel: {
          name: 'fkTemplePhysicalAddress1rel',
          type: 'PhysicalAddress',
          model: 'PhysicalAddress',
          relationType: 'belongsTo',
                  keyFrom: 'physicalAddressId',
          keyTo: 'id'
        },
      }
    }
  }
}
