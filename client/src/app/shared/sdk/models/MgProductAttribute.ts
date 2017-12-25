/* tslint:disable */

declare var Object: any;
export interface MgProductAttributeInterface {
  "id": string;
  "name": string;
}

export class MgProductAttribute implements MgProductAttributeInterface {
  "id": string;
  "name": string;
  constructor(data?: MgProductAttributeInterface) {
    Object.assign(this, data);
  }
  /**
   * The name of the model represented by this $resource,
   * i.e. `MgProductAttribute`.
   */
  public static getModelName() {
    return "MgProductAttribute";
  }
  /**
  * @method factory
  * @author Jonathan Casarrubias
  * @license MIT
  * This method creates an instance of MgProductAttribute for dynamic purposes.
  **/
  public static factory(data: MgProductAttributeInterface): MgProductAttribute{
    return new MgProductAttribute(data);
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
      name: 'MgProductAttribute',
      plural: 'MgProductAttributes',
      path: 'MgProductAttributes',
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
      },
      relations: {
      }
    }
  }
}
