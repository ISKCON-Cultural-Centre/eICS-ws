/* tslint:disable */

declare var Object: any;
export interface DevoteeServicesInterface {
  "circle/sector": string;
  "name"?: string;
  "gender"?: boolean;
  "email"?: string;
  "mobileNo1"?: string;
  "mobileNo2"?: string;
  "landlineNo"?: string;
  "dateOfBirth"?: Date;
  "enrolNo": number;
  "serviceName": string;
  "id"?: number;
}

export class DevoteeServices implements DevoteeServicesInterface {
  "circle/sector": string;
  "name": string;
  "gender": boolean;
  "email": string;
  "mobileNo1": string;
  "mobileNo2": string;
  "landlineNo": string;
  "dateOfBirth": Date;
  "enrolNo": number;
  "serviceName": string;
  "id": number;
  constructor(data?: DevoteeServicesInterface) {
    Object.assign(this, data);
  }
  /**
   * The name of the model represented by this $resource,
   * i.e. `DevoteeServices`.
   */
  public static getModelName() {
    return "DevoteeServices";
  }
  /**
  * @method factory
  * @author Jonathan Casarrubias
  * @license MIT
  * This method creates an instance of DevoteeServices for dynamic purposes.
  **/
  public static factory(data: DevoteeServicesInterface): DevoteeServices{
    return new DevoteeServices(data);
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
      name: 'DevoteeServices',
      plural: 'DevoteeServices',
      path: 'DevoteeServices',
      idName: 'id',
      properties: {
        "circle/sector": {
          name: 'circle/sector',
          type: 'string'
        },
        "name": {
          name: 'name',
          type: 'string'
        },
        "gender": {
          name: 'gender',
          type: 'boolean'
        },
        "email": {
          name: 'email',
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
        "dateOfBirth": {
          name: 'dateOfBirth',
          type: 'Date'
        },
        "enrolNo": {
          name: 'enrolNo',
          type: 'number'
        },
        "serviceName": {
          name: 'serviceName',
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
