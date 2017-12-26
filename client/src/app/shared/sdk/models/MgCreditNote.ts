/* tslint:disable */
import {
  Payment
} from '../index';

declare var Object: any;
export interface MgCreditNoteInterface {
  "id": string;
  "orderId": string;
  "dueAmount": string;
  "paymentId"?: string;
  fkCreditNotePayment1rel?: Payment;
}

export class MgCreditNote implements MgCreditNoteInterface {
  "id": string;
  "orderId": string;
  "dueAmount": string;
  "paymentId": string;
  fkCreditNotePayment1rel: Payment;
  constructor(data?: MgCreditNoteInterface) {
    Object.assign(this, data);
  }
  /**
   * The name of the model represented by this $resource,
   * i.e. `MgCreditNote`.
   */
  public static getModelName() {
    return "MgCreditNote";
  }
  /**
  * @method factory
  * @author Jonathan Casarrubias
  * @license MIT
  * This method creates an instance of MgCreditNote for dynamic purposes.
  **/
  public static factory(data: MgCreditNoteInterface): MgCreditNote{
    return new MgCreditNote(data);
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
      name: 'MgCreditNote',
      plural: 'MgCreditNotes',
      path: 'MgCreditNotes',
      idName: 'id',
      properties: {
        "id": {
          name: 'id',
          type: 'string'
        },
        "orderId": {
          name: 'orderId',
          type: 'string'
        },
        "dueAmount": {
          name: 'dueAmount',
          type: 'string'
        },
        "paymentId": {
          name: 'paymentId',
          type: 'string'
        },
      },
      relations: {
        fkCreditNotePayment1rel: {
          name: 'fkCreditNotePayment1rel',
          type: 'Payment',
          model: 'Payment',
          relationType: 'belongsTo',
                  keyFrom: 'paymentId',
          keyTo: 'id'
        },
      }
    }
  }
}