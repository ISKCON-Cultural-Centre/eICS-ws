-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema icc
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `deeksha-guru`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `deeksha-guru` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(100) NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `spiritual-level-master`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spiritual-level-master` (
  `id` VARCHAR(36) NOT NULL,
  `level` VARCHAR(30) NULL,
  `description` VARCHAR(50) NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `circle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `circle` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(100) NULL,
  `leader-devotee-id` VARCHAR(36) NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `idx_circle` (`id` ASC),
  INDEX `fk_circle_devotee1_idx` (`leader-devotee-id` ASC),
  CONSTRAINT `fk_circle_devotee1`
    FOREIGN KEY (`leader-devotee-id`)
    REFERENCES `devotee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `devotee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devotee` (
  `id` VARCHAR(36) NOT NULL,
  `legal-name` VARCHAR(100) NULL,
  `circle-id` VARCHAR(36) NULL,
  `spiritual-name` VARCHAR(100) NULL DEFAULT NULL,
  `gender` CHAR(1) NULL DEFAULT NULL,
  `shiksha-level` VARCHAR(100) NULL DEFAULT NULL,
  `spiritual-level-master-id` VARCHAR(36) NULL,
  `credit-limit` DECIMAL(10,2) NOT NULL DEFAULT 0,
  `realm` VARCHAR(512) NULL DEFAULT NULL,
  `username` VARCHAR(512) NULL DEFAULT NULL,
  `password` VARCHAR(512) NULL,
  `email` VARCHAR(512) NULL,
  `emailVerified` TINYINT(1) NULL DEFAULT NULL,
  `verificationToken` VARCHAR(512) NULL DEFAULT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_devotee_id_idx` (`id` ASC),
  INDEX `fk_devotee_spiritual-level-master1_idx` (`spiritual-level-master-id` ASC),
  INDEX `fk_devotee_circle1_idx` (`circle-id` ASC),
  UNIQUE INDEX `created-by_UNIQUE` (`created-by` ASC),
  CONSTRAINT `fk_devotee_spiritual-level-master1`
    FOREIGN KEY (`spiritual-level-master-id`)
    REFERENCES `spiritual-level-master` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_devotee_circle1`
    FOREIGN KEY (`circle-id`)
    REFERENCES `circle` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `relationship-master`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `relationship-master` (
  `id` VARCHAR(36) NOT NULL,
  `relation-name` VARCHAR(100) NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `devotee-karmi-family`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devotee-karmi-family` (
  `id` VARCHAR(36) CHARACTER SET 'utf8' NOT NULL,
  `family-name` VARCHAR(100) CHARACTER SET 'utf8' NULL,
  `relationship-id` VARCHAR(36) CHARACTER SET 'utf8' NULL,
  `devotee-id` VARCHAR(36) CHARACTER SET 'utf8' NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_devotee-karmi-family_relationship-master1_idx` (`relationship-id` ASC),
  INDEX `fk_devotee-karmi-family_devotee2_idx` (`devotee-id` ASC),
  CONSTRAINT `fk_devotee-karmi-family_devotee2`
    FOREIGN KEY (`devotee-id`)
    REFERENCES `devotee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_devotee-karmi-family_relationship-master1`
    FOREIGN KEY (`relationship-id`)
    REFERENCES `relationship-master` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `accesstoken`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `accesstoken` (
  `id` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  `ttl` INT(11) NULL DEFAULT NULL,
  `scopes` MEDIUMTEXT CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `created` DATETIME NULL DEFAULT NULL,
  `userId` VARCHAR(512) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `devotee-spiritual-family`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devotee-spiritual-family` (
  `id` VARCHAR(36) CHARACTER SET 'utf8' NOT NULL,
  `devotee-id` VARCHAR(36) CHARACTER SET 'utf8' NULL,
  `guiding-devotee-id` VARCHAR(36) CHARACTER SET 'utf8' NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_devotee-spiritual-family_devotee1_idx` (`devotee-id` ASC),
  INDEX `fk_devotee-spiritual-family_devotee2_idx` (`guiding-devotee-id` ASC),
  CONSTRAINT `fk_devotee-spiritual-family_devotee1`
    FOREIGN KEY (`devotee-id`)
    REFERENCES `devotee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_devotee-spiritual-family_devotee2`
    FOREIGN KEY (`guiding-devotee-id`)
    REFERENCES `devotee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `acl`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `acl` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `model` VARCHAR(512) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `property` VARCHAR(512) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `accessType` VARCHAR(512) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `permission` VARCHAR(512) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `principalType` VARCHAR(512) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `principalId` VARCHAR(512) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `outreach-master`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `outreach-master` (
  `id` VARCHAR(36) COLLATE 'utf8_unicode_ci' NOT NULL,
  `description` VARCHAR(100) COLLATE 'utf8_unicode_ci' NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `event-master`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `event-master` (
  `id` VARCHAR(36) CHARACTER SET 'utf8' NOT NULL,
  `event-name` VARCHAR(50) CHARACTER SET 'utf8' NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `devotee-event-calendar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devotee-event-calendar` (
  `devotee-id` VARCHAR(36) CHARACTER SET 'utf8' NOT NULL,
  `event-date` DATE NOT NULL,
  `event-master-id` VARCHAR(36) CHARACTER SET 'utf8' NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  PRIMARY KEY (`devotee-id`),
  INDEX `fk_devotee-event-calendar_devotee2_idx` (`devotee-id` ASC),
  INDEX `fk_devotee-event-calendar_event-master1_idx` (`event-master-id` ASC),
  CONSTRAINT `fk_devotee-event-calendar_devotee2`
    FOREIGN KEY (`devotee-id`)
    REFERENCES `devotee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_devotee-event-calendar_event-master1`
    FOREIGN KEY (`event-master-id`)
    REFERENCES `event-master` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `electronic-address-type-master`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `electronic-address-type-master` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(50) NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `electronic-address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `electronic-address` (
  `id` VARCHAR(36) NOT NULL,
  `electronic-address-type-master-id` VARCHAR(36) NULL,
  `electronic-address` VARCHAR(50) NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_electronic-address_electronic-address-type-master1_idx` (`electronic-address-type-master-id` ASC),
  CONSTRAINT `fk_electronic-address_electronic-address-type-master1`
    FOREIGN KEY (`electronic-address-type-master-id`)
    REFERENCES `electronic-address-type-master` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `donation-type-master`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `donation-type-master` (
  `id` VARCHAR(36) CHARACTER SET 'utf8' NOT NULL,
  `donation-type-name` VARCHAR(50) CHARACTER SET 'utf8' NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `mg-order-channel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg-order-channel` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Identify the Sales Channel - Online, POS';


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
-- Table `mg-order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg-order` (
  `id` VARCHAR(16) NOT NULL,
  `order-date-time` DATETIME NOT NULL,
  `request-no` INT(11) NOT NULL,
  `order-no` INT(11) NOT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  `order-status-id` VARCHAR(16) NOT NULL,
  `devotee-id` VARCHAR(36) NOT NULL,
  `serving-devotee-id` VARCHAR(36) NULL DEFAULT NULL,
  `order-channel-id` VARCHAR(36) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_table1_book-request-status1_idx` (`order-status-id` ASC),
  INDEX `fk_table1_devotee2_idx` (`devotee-id` ASC),
  INDEX `fk_order_devotee1_idx` (`serving-devotee-id` ASC),
  INDEX `fk_order_order-channel1_idx` (`order-channel-id` ASC),
  CONSTRAINT `fk_order_devotee1`
    FOREIGN KEY (`serving-devotee-id`)
    REFERENCES `devotee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_order-channel1`
    FOREIGN KEY (`order-channel-id`)
    REFERENCES `mg-order-channel` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_table1_book-request-status1`
    FOREIGN KEY (`order-status-id`)
    REFERENCES `mg-order-status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_table1_devotee2`
    FOREIGN KEY (`devotee-id`)
    REFERENCES `devotee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `payment-mode-master`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `payment-mode-master` (
  `id` VARCHAR(36) NOT NULL,
  `mode-name` VARCHAR(50) NOT NULL,
  `description` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `payment` (
  `id` VARCHAR(36) NOT NULL,
  `devotee-id` VARCHAR(36) NOT NULL,
  `payment-mode-master-id` VARCHAR(36) NOT NULL,
  `payment-date` DATETIME NOT NULL,
  `payment-amount` DECIMAL(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  INDEX `fk_order-payment_devotee1_idx` (`devotee-id` ASC),
  INDEX `fk_devotee-payment_payment-mode-master1_idx` (`payment-mode-master-id` ASC),
  CONSTRAINT `fk_devotee-payment_payment-mode-master1`
    FOREIGN KEY (`payment-mode-master-id`)
    REFERENCES `payment-mode-master` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order-payment_devotee1`
    FOREIGN KEY (`devotee-id`)
    REFERENCES `devotee` (`id`)
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
  `payment-id` VARCHAR(36) NULL DEFAULT NULL,
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
    REFERENCES `payment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


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
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mg-devotee-electronic-address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg-devotee-electronic-address` (
  `devotee-id` VARCHAR(36) NOT NULL,
  `electronic-address-id` VARCHAR(36) NOT NULL,
  PRIMARY KEY (`devotee-id`, `electronic-address-id`),
  INDEX `fk_devotee-electronic-address_devotee1_idx` (`devotee-id` ASC),
  INDEX `fk_devotee-electronic-address_electronic-address1_idx` (`electronic-address-id` ASC),
  CONSTRAINT `fk_devotee-electronic-address_devotee1`
    FOREIGN KEY (`devotee-id`)
    REFERENCES `devotee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_devotee-electronic-address_electronic-address1`
    FOREIGN KEY (`electronic-address-id`)
    REFERENCES `electronic-address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `physical-address-type-master`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `physical-address-type-master` (
  `id` VARCHAR(36) NOT NULL,
  `address-type` VARCHAR(50) NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `physical-address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `physical-address` (
  `id` VARCHAR(36) NOT NULL,
  `address-type-master-id` VARCHAR(36) NULL,
  `address-line-1` VARCHAR(100) NULL,
  `address-line-2` VARCHAR(100) NULL,
  `address-area` VARCHAR(100) NULL,
  `address-city` VARCHAR(100) NULL,
  `address-country` VARCHAR(100) NULL,
  `address-pin` VARCHAR(10) NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_physical-address_address-type-master1_idx` (`address-type-master-id` ASC),
  CONSTRAINT `fk_physical-address_address-type-master1`
    FOREIGN KEY (`address-type-master-id`)
    REFERENCES `physical-address-type-master` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mg-devotee-physical-address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg-devotee-physical-address` (
  `devotee-id` VARCHAR(36) NOT NULL,
  `physical-address-id` VARCHAR(36) NOT NULL,
  PRIMARY KEY (`physical-address-id`, `devotee-id`),
  INDEX `fk_devotee-address_devotee1_idx` (`devotee-id` ASC),
  INDEX `fk_devotee-address_physical-address1_idx` (`physical-address-id` ASC),
  CONSTRAINT `fk_devotee-address_devotee1`
    FOREIGN KEY (`devotee-id`)
    REFERENCES `devotee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_devotee-address_physical-address1`
    FOREIGN KEY (`physical-address-id`)
    REFERENCES `physical-address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mg-tax-category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg-tax-category` (
  `id` VARCHAR(36) NOT NULL,
  `tax-category-name` VARCHAR(50) NOT NULL,
  `tax-percent` DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


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
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mg-invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg-invoice` (
  `invoice-number` INT(11) NOT NULL,
  `order-id` VARCHAR(16) NOT NULL,
  `payment-id` VARCHAR(36) NULL DEFAULT NULL,
  `credit-note-id` VARCHAR(36) NULL DEFAULT NULL,
  `invoice-amount` DECIMAL(15,2) NOT NULL COMMENT '				',
  PRIMARY KEY (`invoice-number`),
  INDEX `fk_invoice_order1_idx` (`order-id` ASC),
  INDEX `fk_invoice_payment1_idx` (`payment-id` ASC),
  CONSTRAINT `fk_invoice_order1`
    FOREIGN KEY (`order-id`)
    REFERENCES `mg-order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoice_payment1`
    FOREIGN KEY (`payment-id`)
    REFERENCES `payment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mg-product-attribute`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg-product-attribute` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


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
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mg-unit-of-measure`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg-unit-of-measure` (
  `id` VARCHAR(36) NOT NULL,
  `uom-name` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mg-product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg-product` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(100) NULL DEFAULT NULL,
  `unit-of-measure-id` VARCHAR(36) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_product_unit-of-measure1_idx` (`unit-of-measure-id` ASC),
  CONSTRAINT `fk_product_unit-of-measure1`
    FOREIGN KEY (`unit-of-measure-id`)
    REFERENCES `mg-unit-of-measure` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


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
  `discount-allowed-ind` TINYINT(4) NOT NULL DEFAULT '1',
  `in-stock-qty` INT(11) NOT NULL DEFAULT '0',
  `manage-stock` TINYINT(4) NULL DEFAULT '1',
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
  CONSTRAINT `fk_product-sku_hsn1`
    FOREIGN KEY (`hsn-code`)
    REFERENCES `mg-hsn` (`hsn-code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product-sku_product1`
    FOREIGN KEY (`product-id`)
    REFERENCES `mg-product` (`id`)
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
  `request-qty` INT(11) NOT NULL,
  `approved-qty` INT(11) NULL DEFAULT NULL,
  `packed-qty` INT(11) NULL DEFAULT NULL,
  `mrp` DECIMAL(10,2) NOT NULL,
  `sell-price` DECIMAL(10,2) NOT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`order-id`, `product-instance-id`),
  INDEX `fk_book-marathon-order-detail_book1_idx` (`product-instance-id` ASC),
  INDEX `fk_book-marathon-order-detail_book-marathon-order1_idx` (`order-id` ASC),
  CONSTRAINT `fk_book-marathon-order-detail_book-marathon-order1`
    FOREIGN KEY (`order-id`)
    REFERENCES `mg-order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_book-marathon-order-detail_book1`
    FOREIGN KEY (`product-instance-id`)
    REFERENCES `mg-product-sku` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
  PRIMARY KEY (`id`),
  INDEX `fk_table1_devotee1_idx` (`devotee-id` ASC),
  CONSTRAINT `fk_table1_devotee1`
    FOREIGN KEY (`devotee-id`)
    REFERENCES `devotee` (`id`)
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
  `return-qty` INT(11) NOT NULL,
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
-- Table `mg-stock-current`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg-stock-current` (
  `id` VARCHAR(36) NOT NULL,
  `product-sku-id` VARCHAR(36) NOT NULL,
  `quantity` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  INDEX `fk_product-stock-current_product-sku1_idx` (`product-sku-id` ASC),
  CONSTRAINT `fk_product-stock-current_product-sku1`
    FOREIGN KEY (`product-sku-id`)
    REFERENCES `mg-product-sku` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mg-stock-inward`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg-stock-inward` (
  `id` VARCHAR(36) NOT NULL,
  `supplier-invoice-number` VARCHAR(50) NOT NULL,
  `invoice-date` DATE NOT NULL,
  `supplier-id` VARCHAR(36) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mg-stock-inward-diary`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg-stock-inward-diary` (
  `stock-inward-id` VARCHAR(36) NOT NULL,
  `line-number` SMALLINT(6) NOT NULL,
  `product-sku-id` VARCHAR(36) NOT NULL,
  `col` INT(11) NOT NULL,
  PRIMARY KEY (`line-number`, `stock-inward-id`),
  INDEX `fk_stock-inward-diary_product-sku1_idx` (`product-sku-id` ASC),
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
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mg-supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg-supplier` (
  `id` VARCHAR(36) NOT NULL,
  `supplier-name` VARCHAR(255) NOT NULL,
  `tax-identification-number` VARCHAR(20) NOT NULL,
  `gstn-number` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mg-supplier-electronic-address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg-supplier-electronic-address` (
  `electronic-address-id` VARCHAR(36) NOT NULL,
  `supplier-id` VARCHAR(36) NOT NULL,
  PRIMARY KEY (`supplier-id`, `electronic-address-id`),
  INDEX `fk_supplier-electronic-address_electronic-address1_idx` (`electronic-address-id` ASC),
  INDEX `fk_supplier-electronic-address_supplier1_idx` (`supplier-id` ASC),
  CONSTRAINT `fk_supplier-electronic-address_electronic-address1`
    FOREIGN KEY (`electronic-address-id`)
    REFERENCES `electronic-address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_supplier-electronic-address_supplier1`
    FOREIGN KEY (`supplier-id`)
    REFERENCES `mg-supplier` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mg-supplier-physical-address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg-supplier-physical-address` (
  `physical-address-id` VARCHAR(36) NOT NULL,
  `supplier-id` VARCHAR(36) NOT NULL,
  PRIMARY KEY (`physical-address-id`, `supplier-id`),
  INDEX `fk_supplier-address_physical-address1_idx` (`physical-address-id` ASC),
  INDEX `fk_supplier-physical-address_supplier1_idx` (`supplier-id` ASC),
  CONSTRAINT `fk_supplier-address_physical-address1`
    FOREIGN KEY (`physical-address-id`)
    REFERENCES `physical-address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_supplier-physical-address_supplier1`
    FOREIGN KEY (`supplier-id`)
    REFERENCES `mg-supplier` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mg-tax-component`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg-tax-component` (
  `id` VARCHAR(36) NOT NULL,
  `tax-component-name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mg-tax-category-component`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg-tax-category-component` (
  `tax-category-id` VARCHAR(36) NOT NULL,
  `tax-component-id` VARCHAR(36) NOT NULL,
  `tax-percent` DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (`tax-category-id`, `tax-component-id`),
  INDEX `fk_tax-category-component_tax-category1_idx` (`tax-category-id` ASC),
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
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mg-tax-line`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg-tax-line` (
  `id` VARCHAR(36) NOT NULL,
  `invoice-invoice-number` INT(11) NOT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `new-contact`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `new-contact` (
  `id` VARCHAR(36) CHARACTER SET 'utf8' NOT NULL,
  `name` VARCHAR(255) CHARACTER SET 'utf8' NULL,
  `physical-address-id` VARCHAR(36) CHARACTER SET 'utf8' NULL,
  `electronic-address-id` VARCHAR(36) CHARACTER SET 'utf8' NULL,
  `reference` VARCHAR(100) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `comments` VARCHAR(45) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_table1_physical-address1_idx` (`physical-address-id` ASC),
  INDEX `fk_table1_electronic-address1_idx` (`electronic-address-id` ASC),
  CONSTRAINT `fk_table1_electronic-address1`
    FOREIGN KEY (`electronic-address-id`)
    REFERENCES `electronic-address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_table1_physical-address1`
    FOREIGN KEY (`physical-address-id`)
    REFERENCES `physical-address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `pledge`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pledge` (
  `id` VARCHAR(36) CHARACTER SET 'utf8' NOT NULL,
  `start-date` DATE NOT NULL,
  `end-date` VARCHAR(50) CHARACTER SET 'utf8' NULL,
  `pledge-amount` DECIMAL(15,2) NOT NULL,
  `instalment-count` SMALLINT NULL,
  `pause-ind` TINYINT NOT NULL,
  `devotee-id` VARCHAR(36) CHARACTER SET 'utf8' NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_pledge_devotee2_idx` (`devotee-id` ASC),
  CONSTRAINT `fk_pledge_devotee2`
    FOREIGN KEY (`devotee-id`)
    REFERENCES `devotee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `pledge-payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pledge-payment` (
  `id` VARCHAR(36) NOT NULL,
  `instalment-number` SMALLINT(6) NOT NULL,
  `pledge-date` DATE NULL,
  `pledge-id` VARCHAR(36) NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `mg-payment-id` VARCHAR(36) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_pledge-payment_pledge1_idx` (`pledge-id` ASC),
  INDEX `fk_pledge-payment_mg-payment1_idx` (`mg-payment-id` ASC),
  CONSTRAINT `fk_pledge-payment_pledge1`
    FOREIGN KEY (`pledge-id`)
    REFERENCES `pledge` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pledge-payment_mg-payment1`
    FOREIGN KEY (`mg-payment-id`)
    REFERENCES `payment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `rolemapping`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rolemapping` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `principalType` VARCHAR(512) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `principalId` VARCHAR(255) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `roleId` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `principalId` (`principalId` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `temple`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `temple` (
  `id` VARCHAR(36) CHARACTER SET 'utf8' NOT NULL,
  `name` VARCHAR(100) CHARACTER SET 'utf8' NULL,
  `contact-number` VARCHAR(20) CHARACTER SET 'utf8' NULL,
  `contact-name` VARCHAR(50) CHARACTER SET 'utf8' NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `physical-address-id` VARCHAR(36) CHARACTER SET 'utf8' NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_temple_physical-address1_idx` (`physical-address-id` ASC),
  CONSTRAINT `fk_temple_physical-address1`
    FOREIGN KEY (`physical-address-id`)
    REFERENCES `physical-address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `temple-branch`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `temple-branch` (
  `id` VARCHAR(36) CHARACTER SET 'utf8' NOT NULL,
  `name` VARCHAR(100) CHARACTER SET 'utf8' NULL,
  `temple-id` VARCHAR(16) CHARACTER SET 'utf8' NULL,
  `physical-address-id` VARCHAR(36) CHARACTER SET 'utf8' NULL,
  `contact-number` VARCHAR(20) CHARACTER SET 'utf8' NULL,
  `contact-name` VARCHAR(50) CHARACTER SET 'utf8' NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_temple-branch_temple1_idx` (`temple-id` ASC),
  INDEX `fk_temple-branch_physical-address1_idx` (`physical-address-id` ASC),
  CONSTRAINT `fk_temple-branch_physical-address1`
    FOREIGN KEY (`physical-address-id`)
    REFERENCES `physical-address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_temple-branch_temple1`
    FOREIGN KEY (`temple-id`)
    REFERENCES `temple` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `task-master`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `task-master` (
  `id` VARCHAR(36) NOT NULL,
  `task-name` VARCHAR(50) NOT NULL,
  `application-route` VARCHAR(255) NOT NULL,
  `task-description` VARCHAR(100) NULL,
  `approval-rules-apply-ind` TINYINT NOT NULL DEFAULT 0,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `service`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `service` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(512) NOT NULL,
  `description` VARCHAR(512) NULL DEFAULT NULL,
  `created` DATETIME NULL DEFAULT NULL,
  `modified` DATETIME NULL DEFAULT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `service-task-master`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `service-task-master` (
  `task-master-id` VARCHAR(36) NOT NULL,
  `service-id` VARCHAR(36) NOT NULL,
  INDEX `fk_role-task-master_task-master1_idx` (`task-master-id` ASC),
  PRIMARY KEY (`task-master-id`, `service-id`),
  INDEX `fk_service-task-master_service1_idx` (`service-id` ASC),
  CONSTRAINT `fk_role-task-master_task-master1`
    FOREIGN KEY (`task-master-id`)
    REFERENCES `task-master` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_service-task-master_service1`
    FOREIGN KEY (`service-id`)
    REFERENCES `service` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `department` (
  `id` VARCHAR(36) NOT NULL,
  `temple-id` VARCHAR(36) NOT NULL,
  `department-name` VARCHAR(50) NOT NULL,
  `department-leader-devotee-id` VARCHAR(36) NOT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  INDEX `fk_department_temple1_idx` (`temple-id` ASC),
  PRIMARY KEY (`id`),
  INDEX `fk_department_devotee1_idx` (`department-leader-devotee-id` ASC),
  CONSTRAINT `fk_department_temple1`
    FOREIGN KEY (`temple-id`)
    REFERENCES `temple` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_department_devotee1`
    FOREIGN KEY (`department-leader-devotee-id`)
    REFERENCES `devotee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `department-service`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `department-service` (
  `department-id` VARCHAR(36) NOT NULL,
  `service-id` VARCHAR(36) NOT NULL,
  INDEX `fk_department-role_department1_idx` (`department-id` ASC),
  PRIMARY KEY (`department-id`, `service-id`),
  INDEX `fk_department-role_service1_idx` (`service-id` ASC),
  CONSTRAINT `fk_department-role_department1`
    FOREIGN KEY (`department-id`)
    REFERENCES `department` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_department-role_service1`
    FOREIGN KEY (`service-id`)
    REFERENCES `service` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `approval-rule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `approval-rule` (
  `id` VARCHAR(36) NOT NULL,
  `approval-artefact-id` VARCHAR(36) NOT NULL,
  `sequence-no` SMALLINT NOT NULL,
  `role-id` INT(11) NOT NULL,
  `last-approval-sequence-ind` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `approval-que`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `approval-que` (
  `id` VARCHAR(36) NOT NULL,
  `approver-id` VARCHAR(36) NOT NULL,
  `artefact-instance-id` VARCHAR(36) NOT NULL,
  `requesting-devotee-id` VARCHAR(36) NOT NULL,
  `approval-sequence-no` SMALLINT NOT NULL,
  `last-approver-ind` TINYINT NOT NULL DEFAULT 0,
  `approval-ind` TINYINT NULL DEFAULT 0,
  `activated-ind` TINYINT NOT NULL DEFAULT 0,
  `approver-remarks` VARCHAR(100) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_approval-que_devotee1_idx` (`approver-id` ASC),
  INDEX `fk_approval-que_devotee3_idx` (`requesting-devotee-id` ASC),
  CONSTRAINT `fk_approval-que_devotee1`
    FOREIGN KEY (`approver-id`)
    REFERENCES `devotee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_approval-que_devotee3`
    FOREIGN KEY (`requesting-devotee-id`)
    REFERENCES `devotee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `approval-artefact`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `approval-artefact` (
  `id` VARCHAR(36) NOT NULL,
  `artefact-name` VARCHAR(50) NULL,
  `description` VARCHAR(100) NOT NULL,
  `approval-after-action-message` VARCHAR(50) NOT NULL,
  `rejection-after-action-message` VARCHAR(50) NOT NULL,
  `approval-artefact-entity-name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `service-mapping`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `service-mapping` (
  `id` VARCHAR(36) NOT NULL,
  `principal-type` VARCHAR(512) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `principal-id` VARCHAR(255) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `role-id` VARCHAR(36) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_service-mapping_service1_idx` (`role-id` ASC),
  CONSTRAINT `fk_service-mapping_service1`
    FOREIGN KEY (`role-id`)
    REFERENCES `service` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `donation-receipt`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `donation-receipt` (
  `id` VARCHAR(36) NOT NULL,
  `devotee-id` VARCHAR(36) NOT NULL,
  `donation-type-master-id` VARCHAR(36) CHARACTER SET 'utf8' NOT NULL,
  `mg-payment-id` VARCHAR(36) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_donation-receipt_devotee1_idx` (`devotee-id` ASC),
  INDEX `fk_donation-receipt_donation-type-master1_idx` (`donation-type-master-id` ASC),
  INDEX `fk_donation-receipt_mg-payment1_idx` (`mg-payment-id` ASC),
  CONSTRAINT `fk_donation-receipt_devotee1`
    FOREIGN KEY (`devotee-id`)
    REFERENCES `devotee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_donation-receipt_donation-type-master1`
    FOREIGN KEY (`donation-type-master-id`)
    REFERENCES `donation-type-master` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_donation-receipt_mg-payment1`
    FOREIGN KEY (`mg-payment-id`)
    REFERENCES `payment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
