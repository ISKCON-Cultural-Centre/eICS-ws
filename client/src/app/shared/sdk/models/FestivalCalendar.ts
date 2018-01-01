/* tslint:disable */
import {
  FestivalMaster
} from '../index';

declare var Object: any;
export interface FestivalCalendarInterface {
  "id": string;
  "festivalMasterId": string;
  "year": string;
  "date"?: string;
  fkFestivalCalendarFestivalMaster1rel?: FestivalMaster;
}

export class FestivalCalendar implements FestivalCalendarInterface {
  "id": string;
  "festivalMasterId": string;
  "year": string;
  "date": string;
  fkFestivalCalendarFestivalMaster1rel: FestivalMaster;
  constructor(data?: FestivalCalendarInterface) {
    Object.assign(this, data);
  }
  /**
   * The name of the model represented by this $resource,
   * i.e. `FestivalCalendar`.
   */
  public static getModelName() {
    return "FestivalCalendar";
  }
  /**
  * @method factory
  * @author Jonathan Casarrubias
  * @license MIT
  * This method creates an instance of FestivalCalendar for dynamic purposes.
  **/
  public static factory(data: FestivalCalendarInterface): FestivalCalendar{
    return new FestivalCalendar(data);
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
      name: 'FestivalCalendar',
      plural: 'FestivalCalendars',
      path: 'FestivalCalendars',
      idName: 'id',
      properties: {
        "id": {
          name: 'id',
          type: 'string'
        },
        "festivalMasterId": {
          name: 'festivalMasterId',
          type: 'string'
        },
        "year": {
          name: 'year',
          type: 'string'
        },
        "date": {
          name: 'date',
          type: 'string'
        },
      },
      relations: {
        fkFestivalCalendarFestivalMaster1rel: {
          name: 'fkFestivalCalendarFestivalMaster1rel',
          type: 'FestivalMaster',
          model: 'FestivalMaster',
          relationType: 'belongsTo',
                  keyFrom: 'festivalMasterId',
          keyTo: 'id'
        },
      }
    }
  }
}
