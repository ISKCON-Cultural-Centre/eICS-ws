/* tslint:disable */

declare var Object: any;
export interface OrgTopParentInterface {
  "name": string;
  "orgId": string;
  "ancestorName"?: string;
  "ancestorId"?: string;
  "id"?: number;
}

export class OrgTopParent implements OrgTopParentInterface {
  "name": string;
  "orgId": string;
  "ancestorName": string;
  "ancestorId": string;
  "id": number;
  constructor(data?: OrgTopParentInterface) {
    Object.assign(this, data);
  }
  /**
   * The name of the model represented by this $resource,
   * i.e. `OrgTopParent`.
   */
  public static getModelName() {
    return "OrgTopParent";
  }
  /**
  * @method factory
  * @author Jonathan Casarrubias
  * @license MIT
  * This method creates an instance of OrgTopParent for dynamic purposes.
  **/
  public static factory(data: OrgTopParentInterface): OrgTopParent{
    return new OrgTopParent(data);
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
      name: 'OrgTopParent',
      plural: 'OrgTopParents',
      path: 'OrgTopParents',
      idName: 'id',
      properties: {
        "name": {
          name: 'name',
          type: 'string'
        },
        "orgId": {
          name: 'orgId',
          type: 'string'
        },
        "ancestorName": {
          name: 'ancestorName',
          type: 'string'
        },
        "ancestorId": {
          name: 'ancestorId',
          type: 'string'
        },
        "id": {
          name: 'id',
          type: 'number'
        },
      },
      relations: {
      }
    }
  }
}
