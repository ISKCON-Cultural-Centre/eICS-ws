/* tslint:disable */
import {
  Circle,
  SpiritualLevelMaster
} from '../index';

declare var Object: any;
export interface DevoteeInterface {
  "id": string;
  "legalName"?: string;
  "circleId"?: string;
  "spiritualName"?: string;
  "gender"?: boolean;
  "shikshaLevel"?: string;
  "spiritualLevelMasterId"?: string;
  "creditLimit": string;
  "realm"?: string;
  "username"?: string;
  "password"?: string;
  "email"?: string;
  "emailverified"?: number;
  "verificationtoken"?: string;
  "createdOn"?: Date;
  "updatedOn"?: Date;
  "createdBy"?: string;
  "updatedBy"?: string;
  fkDevoteeCircle1rel?: Circle;
  fkDevoteeSpiritualLevelMaster1rel?: SpiritualLevelMaster;
}

export class Devotee implements DevoteeInterface {
  "id": string;
  "legalName": string;
  "circleId": string;
  "spiritualName": string;
  "gender": boolean;
  "shikshaLevel": string;
  "spiritualLevelMasterId": string;
  "creditLimit": string;
  "realm": string;
  "username": string;
  "password": string;
  "email": string;
  "emailverified": number;
  "verificationtoken": string;
  "createdOn": Date;
  "updatedOn": Date;
  "createdBy": string;
  "updatedBy": string;
  fkDevoteeCircle1rel: Circle;
  fkDevoteeSpiritualLevelMaster1rel: SpiritualLevelMaster;
  constructor(data?: DevoteeInterface) {
    Object.assign(this, data);
  }
  /**
   * The name of the model represented by this $resource,
   * i.e. `Devotee`.
   */
  public static getModelName() {
    return "Devotee";
  }
  /**
  * @method factory
  * @author Jonathan Casarrubias
  * @license MIT
  * This method creates an instance of Devotee for dynamic purposes.
  **/
  public static factory(data: DevoteeInterface): Devotee{
    return new Devotee(data);
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
      name: 'Devotee',
      plural: 'Devotees',
      path: 'Devotees',
      idName: 'id',
      properties: {
        "id": {
          name: 'id',
          type: 'string'
        },
        "legalName": {
          name: 'legalName',
          type: 'string'
        },
        "circleId": {
          name: 'circleId',
          type: 'string'
        },
        "spiritualName": {
          name: 'spiritualName',
          type: 'string'
        },
        "gender": {
          name: 'gender',
          type: 'boolean'
        },
        "shikshaLevel": {
          name: 'shikshaLevel',
          type: 'string'
        },
        "spiritualLevelMasterId": {
          name: 'spiritualLevelMasterId',
          type: 'string'
        },
        "creditLimit": {
          name: 'creditLimit',
          type: 'string'
        },
        "realm": {
          name: 'realm',
          type: 'string'
        },
        "username": {
          name: 'username',
          type: 'string'
        },
        "password": {
          name: 'password',
          type: 'string'
        },
        "email": {
          name: 'email',
          type: 'string'
        },
        "emailverified": {
          name: 'emailverified',
          type: 'number'
        },
        "verificationtoken": {
          name: 'verificationtoken',
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
        fkDevoteeCircle1rel: {
          name: 'fkDevoteeCircle1rel',
          type: 'Circle',
          model: 'Circle',
          relationType: 'belongsTo',
                  keyFrom: 'circleId',
          keyTo: 'id'
        },
        fkDevoteeSpiritualLevelMaster1rel: {
          name: 'fkDevoteeSpiritualLevelMaster1rel',
          type: 'SpiritualLevelMaster',
          model: 'SpiritualLevelMaster',
          relationType: 'belongsTo',
                  keyFrom: 'spiritualLevelMasterId',
          keyTo: 'id'
        },
      }
    }
  }
}
