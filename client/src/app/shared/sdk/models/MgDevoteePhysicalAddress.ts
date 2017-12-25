/* tslint:disable */
import {
  Devotee,
  PhysicalAddress
} from '../index';

declare var Object: any;
export interface MgDevoteePhysicalAddressInterface {
  "devoteeId": string;
  "physicalAddressId": string;
  fkDevoteeAddressDevotee1rel?: Devotee;
  fkDevoteeAddressPhysicalAddress1rel?: PhysicalAddress;
}

export class MgDevoteePhysicalAddress implements MgDevoteePhysicalAddressInterface {
  "devoteeId": string;
  "physicalAddressId": string;
  fkDevoteeAddressDevotee1rel: Devotee;
  fkDevoteeAddressPhysicalAddress1rel: PhysicalAddress;
  constructor(data?: MgDevoteePhysicalAddressInterface) {
    Object.assign(this, data);
  }
  /**
   * The name of the model represented by this $resource,
   * i.e. `MgDevoteePhysicalAddress`.
   */
  public static getModelName() {
    return "MgDevoteePhysicalAddress";
  }
  /**
  * @method factory
  * @author Jonathan Casarrubias
  * @license MIT
  * This method creates an instance of MgDevoteePhysicalAddress for dynamic purposes.
  **/
  public static factory(data: MgDevoteePhysicalAddressInterface): MgDevoteePhysicalAddress{
    return new MgDevoteePhysicalAddress(data);
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
      name: 'MgDevoteePhysicalAddress',
      plural: 'MgDevoteePhysicalAddresses',
      path: 'MgDevoteePhysicalAddresses',
      idName: 'physicalAddressId',
      properties: {
        "devoteeId": {
          name: 'devoteeId',
          type: 'string'
        },
        "physicalAddressId": {
          name: 'physicalAddressId',
          type: 'string'
        },
      },
      relations: {
        fkDevoteeAddressDevotee1rel: {
          name: 'fkDevoteeAddressDevotee1rel',
          type: 'Devotee',
          model: 'Devotee',
          relationType: 'belongsTo',
                  keyFrom: 'devoteeId',
          keyTo: 'id'
        },
        fkDevoteeAddressPhysicalAddress1rel: {
          name: 'fkDevoteeAddressPhysicalAddress1rel',
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
