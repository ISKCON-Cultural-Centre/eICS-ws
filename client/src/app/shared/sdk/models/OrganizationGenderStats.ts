/* tslint:disable */

declare var Object: any;
export interface OrganizationGenderStatsInterface {
  "name": string;
  "prabhujis"?: string;
  "mathajis"?: string;
  "id": number;
}

export class OrganizationGenderStats implements OrganizationGenderStatsInterface {
  "name": string;
  "prabhujis": string;
  "mathajis": string;
  "id": number;
  constructor(data?: OrganizationGenderStatsInterface) {
    Object.assign(this, data);
  }
  /**
   * The name of the model represented by this $resource,
   * i.e. `OrganizationGenderStats`.
   */
  public static getModelName() {
    return "OrganizationGenderStats";
  }
  /**
  * @method factory
  * @author Jonathan Casarrubias
  * @license MIT
  * This method creates an instance of OrganizationGenderStats for dynamic purposes.
  **/
  public static factory(data: OrganizationGenderStatsInterface): OrganizationGenderStats{
    return new OrganizationGenderStats(data);
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
      name: 'OrganizationGenderStats',
      plural: 'OrganizationGenderStats',
      path: 'OrganizationGenderStats',
      idName: '',
      properties: {
        "name": {
          name: 'name',
          type: 'string'
        },
        "prabhujis": {
          name: 'prabhujis',
          type: 'string'
        },
        "mathajis": {
          name: 'mathajis',
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
