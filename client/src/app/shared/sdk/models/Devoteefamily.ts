/* tslint:disable */

declare var Object: any;
export interface DevoteefamilyInterface {
  "familyName"?: string;
  "devotee"?: string;
  "relateddevotee"?: string;
  "relationName"?: string;
  "devoteeid": string;
  "relateddevoteeid": string;
  "id"?: number;
}

export class Devoteefamily implements DevoteefamilyInterface {
  "familyName": string;
  "devotee": string;
  "relateddevotee": string;
  "relationName": string;
  "devoteeid": string;
  "relateddevoteeid": string;
  "id": number;
  constructor(data?: DevoteefamilyInterface) {
    Object.assign(this, data);
  }
  /**
   * The name of the model represented by this $resource,
   * i.e. `Devoteefamily`.
   */
  public static getModelName() {
    return "Devoteefamily";
  }
  /**
  * @method factory
  * @author Jonathan Casarrubias
  * @license MIT
  * This method creates an instance of Devoteefamily for dynamic purposes.
  **/
  public static factory(data: DevoteefamilyInterface): Devoteefamily{
    return new Devoteefamily(data);
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
      name: 'Devoteefamily',
      plural: 'Devoteefamilies',
      path: 'Devoteefamilies',
      idName: 'id',
      properties: {
        "familyName": {
          name: 'familyName',
          type: 'string'
        },
        "devotee": {
          name: 'devotee',
          type: 'string'
        },
        "relateddevotee": {
          name: 'relateddevotee',
          type: 'string'
        },
        "relationName": {
          name: 'relationName',
          type: 'string'
        },
        "devoteeid": {
          name: 'devoteeid',
          type: 'string'
        },
        "relateddevoteeid": {
          name: 'relateddevoteeid',
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
