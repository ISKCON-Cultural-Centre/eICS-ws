/* tslint:disable */
import {
  Devotee,
  ElectronicAddress
} from '../index';

declare var Object: any;
export interface MgDevoteeElectronicAddressInterface {
  "devoteeId": string;
  "electronicAddressId": string;
  fkDevoteeElectronicAddressDevotee1rel?: Devotee;
  fkDevoteeElectronicAddressElectronicAddress1rel?: ElectronicAddress;
}

export class MgDevoteeElectronicAddress implements MgDevoteeElectronicAddressInterface {
  "devoteeId": string;
  "electronicAddressId": string;
  fkDevoteeElectronicAddressDevotee1rel: Devotee;
  fkDevoteeElectronicAddressElectronicAddress1rel: ElectronicAddress;
  constructor(data?: MgDevoteeElectronicAddressInterface) {
    Object.assign(this, data);
  }
  /**
   * The name of the model represented by this $resource,
   * i.e. `MgDevoteeElectronicAddress`.
   */
  public static getModelName() {
    return "MgDevoteeElectronicAddress";
  }
  /**
  * @method factory
  * @author Jonathan Casarrubias
  * @license MIT
  * This method creates an instance of MgDevoteeElectronicAddress for dynamic purposes.
  **/
  public static factory(data: MgDevoteeElectronicAddressInterface): MgDevoteeElectronicAddress{
    return new MgDevoteeElectronicAddress(data);
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
      name: 'MgDevoteeElectronicAddress',
      plural: 'MgDevoteeElectronicAddresses',
      path: 'MgDevoteeElectronicAddresses',
      idName: 'devoteeId',
      properties: {
        "devoteeId": {
          name: 'devoteeId',
          type: 'string'
        },
        "electronicAddressId": {
          name: 'electronicAddressId',
          type: 'string'
        },
      },
      relations: {
        fkDevoteeElectronicAddressDevotee1rel: {
          name: 'fkDevoteeElectronicAddressDevotee1rel',
          type: 'Devotee',
          model: 'Devotee',
          relationType: 'belongsTo',
                  keyFrom: 'devoteeId',
          keyTo: 'id'
        },
        fkDevoteeElectronicAddressElectronicAddress1rel: {
          name: 'fkDevoteeElectronicAddressElectronicAddress1rel',
          type: 'ElectronicAddress',
          model: 'ElectronicAddress',
          relationType: 'belongsTo',
                  keyFrom: 'electronicAddressId',
          keyTo: 'id'
        },
      }
    }
  }
}
