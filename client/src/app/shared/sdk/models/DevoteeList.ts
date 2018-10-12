/* tslint:disable */

declare var Object: any;
export interface DevoteeListInterface {
  "id": string;
  "enrolNo": number;
  "name"?: string;
  "circle/sector"?: string;
  "mobileNo1"?: string;
  "mobileNo2"?: string;
  "landlineNo"?: string;
}

export class DevoteeList implements DevoteeListInterface {
  "id": string;
  "enrolNo": number;
  "name": string;
  "circle/sector": string;
  "mobileNo1": string;
  "mobileNo2": string;
  "landlineNo": string;
  constructor(data?: DevoteeListInterface) {
    Object.assign(this, data);
  }
  /**
   * The name of the model represented by this $resource,
   * i.e. `DevoteeList`.
   */
  public static getModelName() {
    return "DevoteeList";
  }
  /**
  * @method factory
  * @author Jonathan Casarrubias
  * @license MIT
  * This method creates an instance of DevoteeList for dynamic purposes.
  **/
  public static factory(data: DevoteeListInterface): DevoteeList{
    return new DevoteeList(data);
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
      name: 'DevoteeList',
      plural: 'DevoteeLists',
      path: 'DevoteeLists',
      idName: '',
      properties: {
        "id": {
          name: 'id',
          type: 'string'
        },
        "enrolNo": {
          name: 'enrolNo',
          type: 'number'
        },
        "name": {
          name: 'name',
          type: 'string'
        },
        "circle/sector": {
          name: 'circle/sector',
          type: 'string'
        },
        "mobileNo1": {
          name: 'mobileNo1',
          type: 'string'
        },
        "mobileNo2": {
          name: 'mobileNo2',
          type: 'string'
        },
        "landlineNo": {
          name: 'landlineNo',
          type: 'string'
        },
      },
      relations: {
      }
    }
  }
}
