/* tslint:disable */
import {
  Circle,
  Language
} from '../index';

declare var Object: any;
export interface DevoteeInterface {
  "id": string;
  "legalName"?: string;
  "circleId"?: string;
  "spiritualName"?: string;
  "gender"?: boolean;
  "shikshaLevel"?: string;
  "creditLimit": string;
  "realm"?: string;
  "username"?: string;
  "email"?: string;
  "emailverified"?: number;
  "verificationtoken"?: string;
  "createdOn"?: Date;
  "updatedOn"?: Date;
  "createdBy"?: string;
  "updatedBy"?: string;
  "accessId"?: string;
  "gothra"?: string;
  "nakshatra"?: string;
  "governmentUniqueId"?: string;
  "incomeTaxId"?: string;
  "lpmId"?: string;
  "kcAssociationDate"?: Date;
  "motherTongueLanguageId": string;
  "emailVerified"?: boolean;
  "created-on"?: Date;
  "updated-on"?: Date;
  "password"?: string;
  accessTokens?: any[];
  fkDevoteeCircle1rel?: Circle;
  fkDevoteeLanguage1rel?: Language;
}

export class Devotee implements DevoteeInterface {
  "id": string;
  "legalName": string;
  "circleId": string;
  "spiritualName": string;
  "gender": boolean;
  "shikshaLevel": string;
  "creditLimit": string;
  "realm": string;
  "username": string;
  "email": string;
  "emailverified": number;
  "verificationtoken": string;
  "createdOn": Date;
  "updatedOn": Date;
  "createdBy": string;
  "updatedBy": string;
  "accessId": string;
  "gothra": string;
  "nakshatra": string;
  "governmentUniqueId": string;
  "incomeTaxId": string;
  "lpmId": string;
  "kcAssociationDate": Date;
  "motherTongueLanguageId": string;
  "emailVerified": boolean;
  "created-on": Date;
  "updated-on": Date;
  "password": string;
  accessTokens: any[];
  fkDevoteeCircle1rel: Circle;
  fkDevoteeLanguage1rel: Language;
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
        "accessId": {
          name: 'accessId',
          type: 'string'
        },
        "gothra": {
          name: 'gothra',
          type: 'string'
        },
        "nakshatra": {
          name: 'nakshatra',
          type: 'string'
        },
        "governmentUniqueId": {
          name: 'governmentUniqueId',
          type: 'string'
        },
        "incomeTaxId": {
          name: 'incomeTaxId',
          type: 'string'
        },
        "lpmId": {
          name: 'lpmId',
          type: 'string'
        },
        "kcAssociationDate": {
          name: 'kcAssociationDate',
          type: 'Date'
        },
        "motherTongueLanguageId": {
          name: 'motherTongueLanguageId',
          type: 'string'
        },
        "emailVerified": {
          name: 'emailVerified',
          type: 'boolean'
        },
        "created-on": {
          name: 'created-on',
          type: 'Date'
        },
        "updated-on": {
          name: 'updated-on',
          type: 'Date'
        },
        "password": {
          name: 'password',
          type: 'string'
        },
      },
      relations: {
        accessTokens: {
          name: 'accessTokens',
          type: 'any[]',
          model: '',
          relationType: 'hasMany',
                  keyFrom: 'id',
          keyTo: 'userId'
        },
        fkDevoteeCircle1rel: {
          name: 'fkDevoteeCircle1rel',
          type: 'Circle',
          model: 'Circle',
          relationType: 'belongsTo',
                  keyFrom: 'circleId',
          keyTo: 'id'
        },
        fkDevoteeLanguage1rel: {
          name: 'fkDevoteeLanguage1rel',
          type: 'Language',
          model: 'Language',
          relationType: 'belongsTo',
                  keyFrom: 'motherTongueLanguageId',
          keyTo: 'id'
        },
      }
    }
  }
}
