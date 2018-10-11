/* tslint:disable */

declare var Object: any;
export interface CircleStrengthInterface {
  "circle"?: string;
  "gender"?: boolean;
  "count(*)": number;
  "id"?: number;
}

export class CircleStrength implements CircleStrengthInterface {
  "circle": string;
  "gender": boolean;
  "count(*)": number;
  "id": number;
  constructor(data?: CircleStrengthInterface) {
    Object.assign(this, data);
  }
  /**
   * The name of the model represented by this $resource,
   * i.e. `CircleStrength`.
   */
  public static getModelName() {
    return "CircleStrength";
  }
  /**
  * @method factory
  * @author Jonathan Casarrubias
  * @license MIT
  * This method creates an instance of CircleStrength for dynamic purposes.
  **/
  public static factory(data: CircleStrengthInterface): CircleStrength{
    return new CircleStrength(data);
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
      name: 'CircleStrength',
      plural: 'CircleStrengths',
      path: 'CircleStrengths',
      idName: 'id',
      properties: {
        "circle": {
          name: 'circle',
          type: 'string'
        },
        "gender": {
          name: 'gender',
          type: 'boolean'
        },
        "count(*)": {
          name: 'count(*)',
          type: 'number'
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
