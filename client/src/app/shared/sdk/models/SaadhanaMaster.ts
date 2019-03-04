/* tslint:disable */

declare var Object: any;
export interface SaadhanaMasterInterface {
  "id": string;
  "saadhanaName": string;
  "createdBy"?: string;
  "updatedBy"?: string;
  "created-on"?: Date;
  "updated-on"?: Date;
}

export class SaadhanaMaster implements SaadhanaMasterInterface {
  "id": string;
  "saadhanaName": string;
  "createdBy": string;
  "updatedBy": string;
  "created-on": Date;
  "updated-on": Date;
  constructor(data?: SaadhanaMasterInterface) {
    Object.assign(this, data);
  }
  /**
   * The name of the model represented by this $resource,
   * i.e. `SaadhanaMaster`.
   */
  public static getModelName() {
    return "SaadhanaMaster";
  }
  /**
  * @method factory
  * @author Jonathan Casarrubias
  * @license MIT
  * This method creates an instance of SaadhanaMaster for dynamic purposes.
  **/
  public static factory(data: SaadhanaMasterInterface): SaadhanaMaster{
    return new SaadhanaMaster(data);
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
      name: 'SaadhanaMaster',
      plural: 'SaadhanaMasters',
      path: 'SaadhanaMasters',
      idName: 'id',
      properties: {
        "id": {
          name: 'id',
          type: 'string'
        },
        "saadhanaName": {
          name: 'saadhanaName',
          type: 'string'
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
