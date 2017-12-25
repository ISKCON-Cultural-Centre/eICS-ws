-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema icc
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema chromispos
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema mg
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema placeholder
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `mg-product-attribute`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg-product-attribute` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mg-product-attribute-instance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg-product-attribute-instance` (
  `id` VARCHAR(36) NOT NULL,
  `product-attribute-instance-value` VARCHAR(100) NOT NULL,
  `product-attribute-id` VARCHAR(36) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_product-attribute-instance_product-attribute1_idx` (`product-attribute-id` ASC),
  CONSTRAINT `fk_product-attribute-instance_product-attribute1`
    FOREIGN KEY (`product-attribute-id`)
    REFERENCES `mg-product-attribute` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mg-unit-of-measure`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg-unit-of-measure` (
  `id` VARCHAR(36) NOT NULL,
  `uom-name` VARCHAR(50) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mg-product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg-product` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(100) NULL,
  `unit-of-measure-id` VARCHAR(36) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_product_unit-of-measure1_idx` (`unit-of-measure-id` ASC),
  CONSTRAINT `fk_product_unit-of-measure1`
    FOREIGN KEY (`unit-of-measure-id`)
    REFERENCES `mg-unit-of-measure` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mg-tax-category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg-tax-category` (
  `id` VARCHAR(36) NOT NULL,
  `tax-category-name` VARCHAR(50) NOT NULL,
  `tax-percent` DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mg-hsn`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg-hsn` (
  `hsn-code` VARCHAR(50) NOT NULL,
  `tax-category-id` VARCHAR(36) NOT NULL,
  PRIMARY KEY (`hsn-code`),
  INDEX `fk_hsn-tax-category_tax-category1_idx` (`tax-category-id` ASC),
  CONSTRAINT `fk_hsn-tax-category_tax-category1`
    FOREIGN KEY (`tax-category-id`)
    REFERENCES `mg-tax-category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mg-product-sku`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg-product-sku` (
  `id` VARCHAR(36) NOT NULL,
  `bar-code` VARCHAR(255) NOT NULL,
  `bar-code-type` VARCHAR(50) NULL DEFAULT NULL,
  `title` VARCHAR(255) NOT NULL,
  `maximum-retail-price` DOUBLE NOT NULL DEFAULT '0',
  `discounted` VARCHAR(5) NULL DEFAULT 'no',
  `discount-allowed-ind` TINYINT NOT NULL DEFAULT b'1',
  `in-stock-qty` INT NOT NULL DEFAULT 0,
  `manage-stock` TINYINT NULL DEFAULT b'1',
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  `product-attribute-instance-id` VARCHAR(36) NOT NULL,
  `product-id` VARCHAR(36) NOT NULL,
  `sell-price` DOUBLE NOT NULL,
  `hsn-code` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `PRODUCTS_INX_1` (`bar-code` ASC),
  INDEX `PRODUCTS_NAME_INX` (`title` ASC),
  INDEX `fk_product-instance_product-attribute-instance1_idx` (`product-attribute-instance-id` ASC),
  INDEX `fk_product-sku_product1_idx` (`product-id` ASC),
  INDEX `fk_product-sku_hsn1_idx` (`hsn-code` ASC),
  CONSTRAINT `fk_product-instance_product-attribute-instance1`
    FOREIGN KEY (`product-attribute-instance-id`)
    REFERENCES `mg-product-attribute-instance` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product-sku_product1`
    FOREIGN KEY (`product-id`)
    REFERENCES `mg-product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product-sku_hsn1`
    FOREIGN KEY (`hsn-code`)
    REFERENCES `mg-hsn` (`hsn-code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mg-order-status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg-order-status` (
  `id` VARCHAR(16) NOT NULL,
  `order-status` VARCHAR(20) NOT NULL,
  `order-status-description` VARCHAR(50) NOT NULL,
  `crud-allowed` VARCHAR(4) NOT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mg-order-return`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg-order-return` (
  `id` VARCHAR(36) NOT NULL,
  `date` DATE NOT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  `devotee-id` VARCHAR(36) NOT NULL,
  INDEX `fk_table1_devotee1_idx` (`devotee-id` ASC),
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_table1_devotee1`
    FOREIGN KEY (`devotee-id`)
    REFERENCES `icc`.`devotee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mg-order-return-line`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg-order-return-line` (
  `order-return-id` VARCHAR(36) NOT NULL,
  `product-instance-id` VARCHAR(36) NOT NULL,
  `return-qty` INT NOT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`order-return-id`, `product-instance-id`),
  INDEX `fk_book-marathon-return-detail_book1_idx` (`product-instance-id` ASC),
  INDEX `fk_order-return-line_order-return1_idx` (`order-return-id` ASC),
  CONSTRAINT `fk_book-marathon-return-detail_book1`
    FOREIGN KEY (`product-instance-id`)
    REFERENCES `mg-product-sku` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order-return-line_order-return1`
    FOREIGN KEY (`order-return-id`)
    REFERENCES `mg-order-return` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mg-order-channel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg-order-channel` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(50) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = 'Identify the Sales Channel - Online, POS';


-- -----------------------------------------------------
-- Table `mg-order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg-order` (
  `id` VARCHAR(16) NOT NULL,
  `order-date-time` DATETIME NOT NULL,
  `request-no` INT NOT NULL,
  `order-no` INT NOT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  `order-status-id` VARCHAR(16) NOT NULL,
  `devotee-id` VARCHAR(36) NOT NULL,
  `serving-devotee-id` VARCHAR(36) NULL,
  `order-channel-id` VARCHAR(36) NOT NULL,
  INDEX `fk_table1_book-request-status1_idx` (`order-status-id` ASC),
  INDEX `fk_table1_devotee2_idx` (`devotee-id` ASC),
  PRIMARY KEY (`id`),
  INDEX `fk_order_devotee1_idx` (`serving-devotee-id` ASC),
  INDEX `fk_order_order-channel1_idx` (`order-channel-id` ASC),
  CONSTRAINT `fk_table1_book-request-status1`
    FOREIGN KEY (`order-status-id`)
    REFERENCES `mg-order-status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_table1_devotee2`
    FOREIGN KEY (`devotee-id`)
    REFERENCES `icc`.`devotee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_devotee1`
    FOREIGN KEY (`serving-devotee-id`)
    REFERENCES `icc`.`devotee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_order-channel1`
    FOREIGN KEY (`order-channel-id`)
    REFERENCES `mg-order-channel` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mg-order-line`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg-order-line` (
  `order-id` VARCHAR(16) NOT NULL,
  `product-instance-id` VARCHAR(36) NOT NULL,
  `request-qty` INT NOT NULL,
  `approved-qty` INT NULL,
  `packed-qty` INT NULL,
  `mrp` DECIMAL(10,2) NOT NULL,
  `sell-price` DECIMAL(10,2) NOT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`order-id`, `product-instance-id`),
  INDEX `fk_book-marathon-order-detail_book1_idx` (`product-instance-id` ASC),
  INDEX `fk_book-marathon-order-detail_book-marathon-order1_idx` (`order-id` ASC),
  CONSTRAINT `fk_book-marathon-order-detail_book1`
    FOREIGN KEY (`product-instance-id`)
    REFERENCES `mg-product-sku` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_book-marathon-order-detail_book-marathon-order1`
    FOREIGN KEY (`order-id`)
    REFERENCES `mg-order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mg-payment-mode-master`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg-payment-mode-master` (
  `id` VARCHAR(36) NOT NULL,
  `mode-name` VARCHAR(50) NOT NULL,
  `description` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mg-payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg-payment` (
  `id` VARCHAR(36) NOT NULL,
  `devotee-id` VARCHAR(36) NOT NULL,
  `payment-mode-master-id` VARCHAR(36) NOT NULL,
  `payment-date` DATETIME NOT NULL,
  `payment-amount` DECIMAL(10,2) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `fk_order-payment_devotee1_idx` (`devotee-id` ASC),
  INDEX `fk_devotee-payment_payment-mode-master1_idx` (`payment-mode-master-id` ASC),
  CONSTRAINT `fk_order-payment_devotee1`
    FOREIGN KEY (`devotee-id`)
    REFERENCES `icc`.`devotee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_devotee-payment_payment-mode-master1`
    FOREIGN KEY (`payment-mode-master-id`)
    REFERENCES `mg-payment-mode-master` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mg-tax-line`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg-tax-line` (
  `id` VARCHAR(36) NOT NULL,
  `invoice-invoice-number` INT NOT NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mg-delivery-note`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg-delivery-note` (
  `id` VARCHAR(36) NOT NULL,
  `delivered-date` DATETIME NOT NULL,
  `delivery-notes` VARCHAR(255) NOT NULL,
  `order-id` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_delivery-note_order1_idx` (`order-id` ASC),
  CONSTRAINT `fk_delivery-note_order1`
    FOREIGN KEY (`order-id`)
    REFERENCES `mg-order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mg-credit-note`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg-credit-note` (
  `id` VARCHAR(36) NOT NULL,
  `order-id` VARCHAR(16) NOT NULL,
  `due-amount` DECIMAL(10,2) NOT NULL,
  `payment-id` VARCHAR(36) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_credit-note_order1_idx` (`order-id` ASC),
  INDEX `fk_credit-note_payment1_idx` (`payment-id` ASC),
  CONSTRAINT `fk_credit-note_order1`
    FOREIGN KEY (`order-id`)
    REFERENCES `mg-order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_credit-note_payment1`
    FOREIGN KEY (`payment-id`)
    REFERENCES `mg-payment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mg-tax-component`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg-tax-component` (
  `id` VARCHAR(36) NOT NULL,
  `tax-component-name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mg-tax-category-component`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg-tax-category-component` (
  `tax-category-id` VARCHAR(36) NOT NULL,
  `tax-component-id` VARCHAR(36) NOT NULL,
  `tax-percent` DECIMAL(6,2) NOT NULL,
  INDEX `fk_tax-category-component_tax-category1_idx` (`tax-category-id` ASC),
  PRIMARY KEY (`tax-category-id`, `tax-component-id`),
  INDEX `fk_tax-category-component_tax-component1_idx` (`tax-component-id` ASC),
  CONSTRAINT `fk_tax-category-component_tax-category1`
    FOREIGN KEY (`tax-category-id`)
    REFERENCES `mg-tax-category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tax-category-component_tax-component1`
    FOREIGN KEY (`tax-component-id`)
    REFERENCES `mg-tax-component` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mg-invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg-invoice` (
  `invoice-number` INT NOT NULL,
  `order-id` VARCHAR(16) NOT NULL,
  `payment-id` VARCHAR(36) NULL,
  `credit-note-id` VARCHAR(36) NULL,
  `invoice-amount` DECIMAL(15,2) NOT NULL COMMENT '				',
  INDEX `fk_invoice_order1_idx` (`order-id` ASC),
  INDEX `fk_invoice_payment1_idx` (`payment-id` ASC),
  PRIMARY KEY (`invoice-number`),
  CONSTRAINT `fk_invoice_order1`
    FOREIGN KEY (`order-id`)
    REFERENCES `mg-order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoice_payment1`
    FOREIGN KEY (`payment-id`)
    REFERENCES `mg-payment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mg-devotee-physical-address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg-devotee-physical-address` (
  `devotee-id` VARCHAR(36) NOT NULL,
  `physical-address-id` VARCHAR(36) NOT NULL,
  INDEX `fk_devotee-address_devotee1_idx` (`devotee-id` ASC),
  INDEX `fk_devotee-address_physical-address1_idx` (`physical-address-id` ASC),
  PRIMARY KEY (`physical-address-id`, `devotee-id`),
  CONSTRAINT `fk_devotee-address_devotee1`
    FOREIGN KEY (`devotee-id`)
    REFERENCES `icc`.`devotee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_devotee-address_physical-address1`
    FOREIGN KEY (`physical-address-id`)
    REFERENCES `icc`.`physical-address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mg-devotee-electronic-address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg-devotee-electronic-address` (
  `devotee-id` VARCHAR(36) NOT NULL,
  `electronic-address-id` VARCHAR(36) NOT NULL,
  INDEX `fk_devotee-electronic-address_devotee1_idx` (`devotee-id` ASC),
  INDEX `fk_devotee-electronic-address_electronic-address1_idx` (`electronic-address-id` ASC),
  PRIMARY KEY (`devotee-id`, `electronic-address-id`),
  CONSTRAINT `fk_devotee-electronic-address_devotee1`
    FOREIGN KEY (`devotee-id`)
    REFERENCES `icc`.`devotee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_devotee-electronic-address_electronic-address1`
    FOREIGN KEY (`electronic-address-id`)
    REFERENCES `icc`.`electronic-address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mg-supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg-supplier` (
  `id` VARCHAR(36) NOT NULL,
  `supplier-name` VARCHAR(255) NOT NULL,
  `tax-identification-number` VARCHAR(20) NOT NULL,
  `gstn-number` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mg-supplier-physical-address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg-supplier-physical-address` (
  `physical-address-id` VARCHAR(36) NOT NULL,
  `supplier-id` VARCHAR(36) NOT NULL,
  INDEX `fk_supplier-address_physical-address1_idx` (`physical-address-id` ASC),
  PRIMARY KEY (`physical-address-id`, `supplier-id`),
  INDEX `fk_supplier-physical-address_supplier1_idx` (`supplier-id` ASC),
  CONSTRAINT `fk_supplier-address_physical-address1`
    FOREIGN KEY (`physical-address-id`)
    REFERENCES `icc`.`physical-address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_supplier-physical-address_supplier1`
    FOREIGN KEY (`supplier-id`)
    REFERENCES `mg-supplier` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mg-supplier-electronic-address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg-supplier-electronic-address` (
  `electronic-address-id` VARCHAR(36) NOT NULL,
  `supplier-id` VARCHAR(36) NOT NULL,
  INDEX `fk_supplier-electronic-address_electronic-address1_idx` (`electronic-address-id` ASC),
  INDEX `fk_supplier-electronic-address_supplier1_idx` (`supplier-id` ASC),
  PRIMARY KEY (`supplier-id`, `electronic-address-id`),
  CONSTRAINT `fk_supplier-electronic-address_electronic-address1`
    FOREIGN KEY (`electronic-address-id`)
    REFERENCES `icc`.`electronic-address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_supplier-electronic-address_supplier1`
    FOREIGN KEY (`supplier-id`)
    REFERENCES `mg-supplier` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mg-stock-inward`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg-stock-inward` (
  `id` VARCHAR(36) NOT NULL,
  `supplier-invoice-number` VARCHAR(50) NOT NULL,
  `invoice-date` DATE NOT NULL,
  `supplier-id` VARCHAR(36) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mg-stock-current`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg-stock-current` (
  `id` VARCHAR(36) NOT NULL,
  `product-sku-id` VARCHAR(36) NOT NULL,
  `quantity` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `fk_product-stock-current_product-sku1_idx` (`product-sku-id` ASC),
  CONSTRAINT `fk_product-stock-current_product-sku1`
    FOREIGN KEY (`product-sku-id`)
    REFERENCES `mg-product-sku` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mg-stock-inward-diary`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg-stock-inward-diary` (
  `stock-inward-id` VARCHAR(36) NOT NULL,
  `line-number` SMALLINT NOT NULL,
  `product-sku-id` VARCHAR(36) NOT NULL,
  `col` INT(11) NOT NULL,
  INDEX `fk_stock-inward-diary_product-sku1_idx` (`product-sku-id` ASC),
  PRIMARY KEY (`line-number`, `stock-inward-id`),
  INDEX `fk_stock-inward-diary_stock-inward1_idx` (`stock-inward-id` ASC),
  CONSTRAINT `fk_stock-inward-diary_product-sku1`
    FOREIGN KEY (`product-sku-id`)
    REFERENCES `mg-product-sku` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stock-inward-diary_stock-inward1`
    FOREIGN KEY (`stock-inward-id`)
    REFERENCES `mg-stock-inward` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
