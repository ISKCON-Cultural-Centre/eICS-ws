/* tslint:disable */
import { Injectable } from '@angular/core';
import { Service } from '../../models/Service';
import { ServiceMapping } from '../../models/ServiceMapping';
import { Circle } from '../../models/Circle';
import { DeekshaGuru } from '../../models/DeekshaGuru';
import { Devotee } from '../../models/Devotee';
import { DevoteeEventCalendar } from '../../models/DevoteeEventCalendar';
import { DevoteeKarmiFamily } from '../../models/DevoteeKarmiFamily';
import { DevoteeSpiritualFamily } from '../../models/DevoteeSpiritualFamily';
import { DonationTypeMaster } from '../../models/DonationTypeMaster';
import { EventMaster } from '../../models/EventMaster';
import { NewContact } from '../../models/NewContact';
import { OutreachMaster } from '../../models/OutreachMaster';
import { Payment } from '../../models/Payment';
import { PaymentModeMaster } from '../../models/PaymentModeMaster';
import { Pledge } from '../../models/Pledge';
import { PledgePayment } from '../../models/PledgePayment';
import { RelationshipMaster } from '../../models/RelationshipMaster';
import { SpiritualLevelMaster } from '../../models/SpiritualLevelMaster';
import { Temple } from '../../models/Temple';
import { TempleBranch } from '../../models/TempleBranch';
import { ElectronicAddress } from '../../models/ElectronicAddress';
import { ElectronicAddressTypeMaster } from '../../models/ElectronicAddressTypeMaster';
import { PhysicalAddress } from '../../models/PhysicalAddress';
import { PhysicalAddressTypeMaster } from '../../models/PhysicalAddressTypeMaster';
import { ApprovalArtefact } from '../../models/ApprovalArtefact';
import { ApprovalQue } from '../../models/ApprovalQue';
import { ApprovalRule } from '../../models/ApprovalRule';
import { Department } from '../../models/Department';
import { DepartmentService } from '../../models/DepartmentService';
import { ServiceTaskMaster } from '../../models/ServiceTaskMaster';
import { TaskMaster } from '../../models/TaskMaster';
import { MgCreditNote } from '../../models/MgCreditNote';
import { MgDeliveryNote } from '../../models/MgDeliveryNote';
import { DevoteeElectronicAddress } from '../../models/DevoteeElectronicAddress';
import { DevoteePhysicalAddress } from '../../models/DevoteePhysicalAddress';
import { MgInvoice } from '../../models/MgInvoice';
import { MgOrderChannel } from '../../models/MgOrderChannel';
import { MgOrderLine } from '../../models/MgOrderLine';
import { MgOrderReturn } from '../../models/MgOrderReturn';
import { MgOrderReturnLine } from '../../models/MgOrderReturnLine';
import { MgOrderStatus } from '../../models/MgOrderStatus';
import { MgProduct } from '../../models/MgProduct';
import { MgProductAttribute } from '../../models/MgProductAttribute';
import { MgProductAttributeInstance } from '../../models/MgProductAttributeInstance';
import { MgProductSku } from '../../models/MgProductSku';
import { MgStockCurrent } from '../../models/MgStockCurrent';
import { MgStockInward } from '../../models/MgStockInward';
import { MgStockInwardDiary } from '../../models/MgStockInwardDiary';
import { MgSupplier } from '../../models/MgSupplier';
import { MgSupplierElectronicAddress } from '../../models/MgSupplierElectronicAddress';
import { MgSupplierPhysicalAddress } from '../../models/MgSupplierPhysicalAddress';
import { MgTaxCategory } from '../../models/MgTaxCategory';
import { MgTaxCategoryComponent } from '../../models/MgTaxCategoryComponent';
import { MgTaxComponent } from '../../models/MgTaxComponent';
import { MgTaxLine } from '../../models/MgTaxLine';
import { MgUnitOfMeasure } from '../../models/MgUnitOfMeasure';

export interface Models { [name: string]: any }

@Injectable()
export class SDKModels {

  private models: Models = {
    Service: Service,
    ServiceMapping: ServiceMapping,
    Circle: Circle,
    DeekshaGuru: DeekshaGuru,
    Devotee: Devotee,
    DevoteeEventCalendar: DevoteeEventCalendar,
    DevoteeKarmiFamily: DevoteeKarmiFamily,
    DevoteeSpiritualFamily: DevoteeSpiritualFamily,
    DonationTypeMaster: DonationTypeMaster,
    EventMaster: EventMaster,
    NewContact: NewContact,
    OutreachMaster: OutreachMaster,
    Payment: Payment,
    PaymentModeMaster: PaymentModeMaster,
    Pledge: Pledge,
    PledgePayment: PledgePayment,
    RelationshipMaster: RelationshipMaster,
    SpiritualLevelMaster: SpiritualLevelMaster,
    Temple: Temple,
    TempleBranch: TempleBranch,
    ElectronicAddress: ElectronicAddress,
    ElectronicAddressTypeMaster: ElectronicAddressTypeMaster,
    PhysicalAddress: PhysicalAddress,
    PhysicalAddressTypeMaster: PhysicalAddressTypeMaster,
    ApprovalArtefact: ApprovalArtefact,
    ApprovalQue: ApprovalQue,
    ApprovalRule: ApprovalRule,
    Department: Department,
    DepartmentService: DepartmentService,
    ServiceTaskMaster: ServiceTaskMaster,
    TaskMaster: TaskMaster,
    MgCreditNote: MgCreditNote,
    MgDeliveryNote: MgDeliveryNote,
    DevoteeElectronicAddress: DevoteeElectronicAddress,
    DevoteePhysicalAddress: DevoteePhysicalAddress,
    MgInvoice: MgInvoice,
    MgOrderChannel: MgOrderChannel,
    MgOrderLine: MgOrderLine,
    MgOrderReturn: MgOrderReturn,
    MgOrderReturnLine: MgOrderReturnLine,
    MgOrderStatus: MgOrderStatus,
    MgProduct: MgProduct,
    MgProductAttribute: MgProductAttribute,
    MgProductAttributeInstance: MgProductAttributeInstance,
    MgProductSku: MgProductSku,
    MgStockCurrent: MgStockCurrent,
    MgStockInward: MgStockInward,
    MgStockInwardDiary: MgStockInwardDiary,
    MgSupplier: MgSupplier,
    MgSupplierElectronicAddress: MgSupplierElectronicAddress,
    MgSupplierPhysicalAddress: MgSupplierPhysicalAddress,
    MgTaxCategory: MgTaxCategory,
    MgTaxCategoryComponent: MgTaxCategoryComponent,
    MgTaxComponent: MgTaxComponent,
    MgTaxLine: MgTaxLine,
    MgUnitOfMeasure: MgUnitOfMeasure,
    
  };

  public get(modelName: string): any {
    return this.models[modelName];
  }

  public getAll(): Models {
    return this.models;
  }

  public getModelNames(): string[] {
    return Object.keys(this.models);
  }
}
