/* tslint:disable */
import {
  Accesstoken,
  AsramaMaster,
  DevoteeGrouping,
  DevoteeLanguage,
  DevoteeServiceInterest,
  GothraMaster,
  Language,
  NakshatraMaster,
  PhysicalAddress,
  ProfessionMaster,
  ServiceRoleMapping,
  Organization,
  DevoteeSevaSubscription
} from '../index';

declare var Object: any;
export interface DevoteeInterface {
  "id"?: string;
  "legalName"?: string;
  "counsellorId"?: string;
  "organizationId"?: string;
  "spiritualName"?: string;
  "gender"?: string;
  "shikshaLevel"?: string;
  "creditLimit"?: number;
  "realm"?: string;
  "username"?: string;
  "email"?: string;
  "verificationtoken"?: string;
  "createdBy"?: string;
  "updatedBy"?: string;
  "accessId"?: string;
  "gothra"?: string;
  "nakshatra"?: string;
  "governmentUniqueId"?: string;
  "incomeTaxId"?: string;
  "lpmId"?: string;
  "kcAssociationDate"?: Date;
  "motherTongueLanguageId"?: string;
  "dateOfBirth"?: Date;
  "dayMonthOfBirth"?: string;
  "asramaMasterId"?: string;
  "professionId"?: string;
  "physicalAddressId"?: string;
  "mobileNo1"?: string;
  "landlineNo"?: string;
  "mobileNo2"?: string;
  "commWhatsapp"?: number;
  "commEmail"?: number;
  "commSms"?: number;
  "commCall"?: number;
  "commLetter"?: number;
  "marriedInd"?: number;
  "notes"?: string;
  "enrolNo": number;
  "emailVerified"?: boolean;
  "created-on"?: Date;
  "updated-on"?: Date;
  "password"?: string;
  accessTokens?: Accesstoken[];
  fkDevoteeAsramaMaster1rel?: AsramaMaster;
  fkDevoteeGroupings?: DevoteeGrouping[];
  fkDevoteeLanguages?: DevoteeLanguage[];
  fkDevoteeServiceInterests?: DevoteeServiceInterest[];
  fkDevoteeGothraMaster1rel?: GothraMaster;
  fkDevoteeLanguage1rel?: Language;
  fkDevoteeNakshatraMaster1rel?: NakshatraMaster;
  fkDevoteePhysicalAddress1rel?: PhysicalAddress;
  fkDevoteeProfessionMaster1rel?: ProfessionMaster;
  roleMappings?: ServiceRoleMapping[];
  fkDevoteeOrganization1rel?: Organization;
  fkDevoteeSevaSubscriptions?: DevoteeSevaSubscription[];
}

export class Devotee implements DevoteeInterface {
  "id": string;
  "legalName": string;
  "counsellorId": string;
  "organizationId": string;
  "spiritualName": string;
  "gender": string;
  "shikshaLevel": string;
  "creditLimit": number;
  "realm": string;
  "username": string;
  "email": string;
  "verificationtoken": string;
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
  "dateOfBirth": Date;
  "dayMonthOfBirth": string;
  "asramaMasterId": string;
  "professionId": string;
  "physicalAddressId": string;
  "mobileNo1": string;
  "landlineNo": string;
  "mobileNo2": string;
  "commWhatsapp": number;
  "commEmail": number;
  "commSms": number;
  "commCall": number;
  "commLetter": number;
  "marriedInd": number;
  "notes": string;
  "enrolNo": number;
  "emailVerified": boolean;
  "created-on": Date;
  "updated-on": Date;
  "password": string;
  accessTokens: Accesstoken[];
  fkDevoteeAsramaMaster1rel: AsramaMaster;
  fkDevoteeGroupings: DevoteeGrouping[];
  fkDevoteeLanguages: DevoteeLanguage[];
  fkDevoteeServiceInterests: DevoteeServiceInterest[];
  fkDevoteeGothraMaster1rel: GothraMaster;
  fkDevoteeLanguage1rel: Language;
  fkDevoteeNakshatraMaster1rel: NakshatraMaster;
  fkDevoteePhysicalAddress1rel: PhysicalAddress;
  fkDevoteeProfessionMaster1rel: ProfessionMaster;
  roleMappings: ServiceRoleMapping[];
  fkDevoteeOrganization1rel: Organization;
  fkDevoteeSevaSubscriptions: DevoteeSevaSubscription[];
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
        "counsellorId": {
          name: 'counsellorId',
          type: 'string'
        },
        "organizationId": {
          name: 'organizationId',
          type: 'string'
        },
        "spiritualName": {
          name: 'spiritualName',
          type: 'string'
        },
        "gender": {
          name: 'gender',
          type: 'string'
        },
        "shikshaLevel": {
          name: 'shikshaLevel',
          type: 'string'
        },
        "creditLimit": {
          name: 'creditLimit',
          type: 'number'
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
        "verificationtoken": {
          name: 'verificationtoken',
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
        "dateOfBirth": {
          name: 'dateOfBirth',
          type: 'Date'
        },
        "dayMonthOfBirth": {
          name: 'dayMonthOfBirth',
          type: 'string'
        },
        "asramaMasterId": {
          name: 'asramaMasterId',
          type: 'string'
        },
        "professionId": {
          name: 'professionId',
          type: 'string'
        },
        "physicalAddressId": {
          name: 'physicalAddressId',
          type: 'string'
        },
        "mobileNo1": {
          name: 'mobileNo1',
          type: 'string'
        },
        "landlineNo": {
          name: 'landlineNo',
          type: 'string'
        },
        "mobileNo2": {
          name: 'mobileNo2',
          type: 'string'
        },
        "commWhatsapp": {
          name: 'commWhatsapp',
          type: 'number'
        },
        "commEmail": {
          name: 'commEmail',
          type: 'number'
        },
        "commSms": {
          name: 'commSms',
          type: 'number'
        },
        "commCall": {
          name: 'commCall',
          type: 'number'
        },
        "commLetter": {
          name: 'commLetter',
          type: 'number'
        },
        "marriedInd": {
          name: 'marriedInd',
          type: 'number'
        },
        "notes": {
          name: 'notes',
          type: 'string'
        },
        "enrolNo": {
          name: 'enrolNo',
          type: 'number'
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
          type: 'Accesstoken[]',
          model: 'Accesstoken',
          relationType: 'hasMany',
                  keyFrom: 'id',
          keyTo: 'userId'
        },
        fkDevoteeAsramaMaster1rel: {
          name: 'fkDevoteeAsramaMaster1rel',
          type: 'AsramaMaster',
          model: 'AsramaMaster',
          relationType: 'belongsTo',
                  keyFrom: 'asramaMasterId',
          keyTo: 'id'
        },
        fkDevoteeGroupings: {
          name: 'fkDevoteeGroupings',
          type: 'DevoteeGrouping[]',
          model: 'DevoteeGrouping',
          relationType: 'hasMany',
                  keyFrom: 'id',
          keyTo: 'devoteeId'
        },
        fkDevoteeLanguages: {
          name: 'fkDevoteeLanguages',
          type: 'DevoteeLanguage[]',
          model: 'DevoteeLanguage',
          relationType: 'hasMany',
                  keyFrom: 'id',
          keyTo: 'devoteeId'
        },
        fkDevoteeServiceInterests: {
          name: 'fkDevoteeServiceInterests',
          type: 'DevoteeServiceInterest[]',
          model: 'DevoteeServiceInterest',
          relationType: 'hasMany',
                  keyFrom: 'id',
          keyTo: 'devoteeId'
        },
        fkDevoteeGothraMaster1rel: {
          name: 'fkDevoteeGothraMaster1rel',
          type: 'GothraMaster',
          model: 'GothraMaster',
          relationType: 'belongsTo',
                  keyFrom: 'gothra',
          keyTo: 'gothra'
        },
        fkDevoteeLanguage1rel: {
          name: 'fkDevoteeLanguage1rel',
          type: 'Language',
          model: 'Language',
          relationType: 'belongsTo',
                  keyFrom: 'motherTongueLanguageId',
          keyTo: 'id'
        },
        fkDevoteeNakshatraMaster1rel: {
          name: 'fkDevoteeNakshatraMaster1rel',
          type: 'NakshatraMaster',
          model: 'NakshatraMaster',
          relationType: 'belongsTo',
                  keyFrom: 'nakshatra',
          keyTo: 'nakshatra'
        },
        fkDevoteePhysicalAddress1rel: {
          name: 'fkDevoteePhysicalAddress1rel',
          type: 'PhysicalAddress',
          model: 'PhysicalAddress',
          relationType: 'belongsTo',
                  keyFrom: 'physicalAddressId',
          keyTo: 'id'
        },
        fkDevoteeProfessionMaster1rel: {
          name: 'fkDevoteeProfessionMaster1rel',
          type: 'ProfessionMaster',
          model: 'ProfessionMaster',
          relationType: 'belongsTo',
                  keyFrom: 'professionId',
          keyTo: 'professionId'
        },
        roleMappings: {
          name: 'roleMappings',
          type: 'ServiceRoleMapping[]',
          model: 'ServiceRoleMapping',
          relationType: 'hasMany',
                  keyFrom: 'id',
          keyTo: 'principalId'
        },
        fkDevoteeOrganization1rel: {
          name: 'fkDevoteeOrganization1rel',
          type: 'Organization',
          model: 'Organization',
          relationType: 'belongsTo',
                  keyFrom: 'organizationId',
          keyTo: 'id'
        },
        fkDevoteeSevaSubscriptions: {
          name: 'fkDevoteeSevaSubscriptions',
          type: 'DevoteeSevaSubscription[]',
          model: 'DevoteeSevaSubscription',
          relationType: 'hasMany',
                  keyFrom: 'id',
          keyTo: 'devoteeId'
        },
      }
    }
  }
}
