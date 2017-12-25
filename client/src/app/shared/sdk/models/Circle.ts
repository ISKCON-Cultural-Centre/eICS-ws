/* tslint:disable */
import {
  Devotee
} from '../index';

declare var Object: any;
export interface CircleInterface {
  "id": string;
  "name"?: string;
  "leaderDevoteeId"?: string;
  "createdOn"?: Date;
  "updatedOn"?: Date;
  "createdBy"?: string;
  "updatedBy"?: string;
  fkCircleDevotee1rel?: Devotee;
}

export class Circle implements CircleInterface {
  "id": string;
  "name": string;
  "leaderDevoteeId": string;
  "createdOn": Date;
  "updatedOn": Date;
  "createdBy": string;
  "updatedBy": string;
  fkCircleDevotee1rel: Devotee;
  constructor(data?: CircleInterface) {
    Object.assign(this, data);
  }
  /**
   * The name of the model represented by this $resource,
   * i.e. `Circle`.
   */
  public static getModelName() {
    return "Circle";
  }
  /**
  * @method factory
  * @author Jonathan Casarrubias
  * @license MIT
  * This method creates an instance of Circle for dynamic purposes.
  **/
  public static factory(data: CircleInterface): Circle{
    return new Circle(data);
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
      name: 'Circle',
      plural: 'Circles',
      path: 'Circles',
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
        "leaderDevoteeId": {
          name: 'leaderDevoteeId',
          type: 'string'
        },
        "createdOn": {
          name: 'createdOn',
          type: 'Date'
        },
        "updatedOn": {
          name: 'updatedOn',
          type: 'Date'
        },
        "createdBy": {
          name: 'createdBy',
          type: 'string'
        },
        "updatedBy": {
          name: 'updatedBy',
          type: 'string'
        },
      },
      relations: {
        fkCircleDevotee1rel: {
          name: 'fkCircleDevotee1rel',
          type: 'Devotee',
          model: 'Devotee',
          relationType: 'belongsTo',
                  keyFrom: 'leaderDevoteeId',
          keyTo: 'id'
        },
      }
    }
  }
}
