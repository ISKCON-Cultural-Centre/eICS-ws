/* tslint:disable */

declare var Object: any;
export interface ServiceAreaInterface {
  "id": string;
  "serviceName": string;
  "description": string;
}

export class ServiceArea implements ServiceAreaInterface {
  "id": string;
  "serviceName": string;
  "description": string;
  constructor(data?: ServiceAreaInterface) {
    Object.assign(this, data);
  }
  /**
   * The name of the model represented by this $resource,
   * i.e. `ServiceArea`.
   */
  public static getModelName() {
    return "ServiceArea";
  }
  /**
  * @method factory
  * @author Jonathan Casarrubias
  * @license MIT
  * This method creates an instance of ServiceArea for dynamic purposes.
  **/
  public static factory(data: ServiceAreaInterface): ServiceArea{
    return new ServiceArea(data);
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
      name: 'ServiceArea',
      plural: 'ServiceAreas',
      path: 'ServiceAreas',
      idName: 'id',
      properties: {
        "id": {
          name: 'id',
          type: 'string'
        },
        "serviceName": {
          name: 'serviceName',
          type: 'string'
        },
        "description": {
          name: 'description',
          type: 'string'
        },
      },
      relations: {
      }
    }
  }
}
