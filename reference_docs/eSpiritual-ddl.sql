-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema icc
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema icc
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `icc` DEFAULT CHARACTER SET utf8 ;
USE `icc` ;

-- -----------------------------------------------------
-- Table `icc`.`accesstoken`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`accesstoken` (
  `id` VARCHAR(255) NOT NULL,
  `ttl` INT(11) NULL DEFAULT NULL,
  `scopes` MEDIUMTEXT NULL DEFAULT NULL,
  `created` DATETIME NULL DEFAULT NULL,
  `userId` VARCHAR(512) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`acl`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`acl` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `model` VARCHAR(512) NULL DEFAULT NULL,
  `property` VARCHAR(512) NULL DEFAULT NULL,
  `accessType` VARCHAR(512) NULL DEFAULT NULL,
  `permission` VARCHAR(512) NULL DEFAULT NULL,
  `principalType` VARCHAR(512) NULL DEFAULT NULL,
  `principalId` VARCHAR(512) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`approval-artefact`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`approval-artefact` (
  `id` VARCHAR(36) NOT NULL,
  `artefact-name` VARCHAR(50) NULL DEFAULT NULL,
  `description` VARCHAR(100) NOT NULL,
  `approval-after-action-message` VARCHAR(50) NOT NULL,
  `rejection-after-action-message` VARCHAR(50) NOT NULL,
  `approval-artefact-entity-name` VARCHAR(255) NOT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
<<<<<<< HEAD
-- Table `icc`.`spiritual-level-master`
=======
-- Table `icc`.`asrama-master`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`asrama-master` (
  `id` VARCHAR(36) NOT NULL,
  `asrama-name` VARCHAR(50) NOT NULL,
  `asrama-description` VARCHAR(50) NOT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`circle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`circle` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(100) NULL DEFAULT NULL,
  `leader-devotee-id` VARCHAR(36) NULL DEFAULT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `idx_circle` (`id` ASC),
  INDEX `fk_circle_devotee1_idx` (`leader-devotee-id` ASC),
  CONSTRAINT `fk_circle_devotee1`
    FOREIGN KEY (`leader-devotee-id`)
    REFERENCES `icc`.`devotee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`gothra-master`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`gothra-master` (
  `gothra` VARCHAR(50) NOT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`gothra`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`language`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`language` (
  `id` VARCHAR(36) NOT NULL,
  `language` VARCHAR(50) NOT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`nakshatra-master`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`nakshatra-master` (
  `nakshatra` VARCHAR(50) NOT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`nakshatra`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`physical-address`
>>>>>>> development
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`physical-address` (
  `id` VARCHAR(36) NOT NULL,
  `address-type-master-id` VARCHAR(36) NULL DEFAULT NULL,
  `address-line-1` VARCHAR(100) NULL DEFAULT NULL,
  `address-line-2` VARCHAR(100) NULL DEFAULT NULL,
  `address-area` VARCHAR(100) NULL DEFAULT NULL,
  `address-city` VARCHAR(36) NULL DEFAULT NULL,
  `address-country` VARCHAR(36) NULL DEFAULT NULL,
  `address-pin` VARCHAR(10) NULL DEFAULT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  `address-state` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`profession-master`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`profession-master` (
  `profession-id` VARCHAR(36) NOT NULL,
  `profession-name` VARCHAR(100) NOT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`profession-id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`devotee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`devotee` (
  `id` VARCHAR(36) NOT NULL,
  `legal-name` VARCHAR(100) NULL DEFAULT NULL,
  `circle-id` VARCHAR(36) NULL DEFAULT NULL,
  `spiritual-name` VARCHAR(100) NULL DEFAULT NULL,
  `gender` CHAR(1) NULL DEFAULT NULL,
  `shiksha-level` VARCHAR(100) NULL DEFAULT NULL,
<<<<<<< HEAD
  `spiritual-level-master-id` VARCHAR(36) NULL,
  `credit-limit` DECIMAL(10,2) NOT NULL DEFAULT 0,
=======
  `credit-limit` INT(11) NOT NULL DEFAULT '0',
>>>>>>> development
  `realm` VARCHAR(512) NULL DEFAULT NULL,
  `username` VARCHAR(512) NULL DEFAULT NULL,
  `password` VARCHAR(512) NULL DEFAULT NULL,
  `email` VARCHAR(512) NULL DEFAULT NULL,
  `emailVerified` TINYINT(1) NULL DEFAULT NULL,
  `verificationToken` VARCHAR(512) NULL DEFAULT NULL,
  `access-id` VARCHAR(100) NULL DEFAULT NULL,
  `government-unique-id` VARCHAR(20) NULL DEFAULT NULL,
  `income-tax-id` VARCHAR(20) NULL DEFAULT NULL,
  `lpm-id` VARCHAR(20) NULL DEFAULT NULL,
  `kc-association-date` DATE NULL DEFAULT NULL,
  `mother-tongue-language-id` VARCHAR(36) NULL DEFAULT NULL,
  `date-of-birth` DATE NULL DEFAULT NULL,
  `nakshatra` VARCHAR(50) NULL DEFAULT NULL,
  `gothra` VARCHAR(50) NULL DEFAULT NULL,
  `asrama-master-id` VARCHAR(36) NULL DEFAULT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  `profession-id` VARCHAR(36) NULL DEFAULT NULL,
  `physical-address-id` VARCHAR(36) NULL DEFAULT NULL,
  `mobile-no` VARCHAR(15) NULL DEFAULT NULL,
  `landline-no` VARCHAR(15) NULL DEFAULT NULL,
  `day-month-of-birth` VARCHAR(6) NULL DEFAULT NULL,
  `unique-id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `access-id_UNIQUE` (`access-id` ASC),
  INDEX `fk_devotee_id_idx` (`id` ASC),
<<<<<<< HEAD
  INDEX `fk_devotee_spiritual-level-master1_idx` (`spiritual-level-master-id` ASC),
  INDEX `fk_devotee_circle1_idx` (`circle-id` ASC),
  UNIQUE INDEX `created-by_UNIQUE` (`created-by` ASC),
  CONSTRAINT `fk_devotee_spiritual-level-master1`
    FOREIGN KEY (`spiritual-level-master-id`)
    REFERENCES `icc`.`spiritual-level-master` (`id`)
=======
  INDEX `fk_devotee_circle1_idx` (`circle-id` ASC),
  INDEX `fk_devotee_language1_idx` (`mother-tongue-language-id` ASC),
  INDEX `fk_devotee_nakshatra-master1_idx` (`nakshatra` ASC),
  INDEX `fk_devotee_gothra-master1_idx` (`gothra` ASC),
  INDEX `fk_devotee_asrama-master1_idx` (`asrama-master-id` ASC),
  INDEX `fk_devotee_profession-master1_idx` (`profession-id` ASC),
  INDEX `fk_devotee_physical-address1_idx` (`physical-address-id` ASC),
  CONSTRAINT `fk_devotee_asrama-master1`
    FOREIGN KEY (`asrama-master-id`)
    REFERENCES `icc`.`asrama-master` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_devotee_circle1`
    FOREIGN KEY (`circle-id`)
    REFERENCES `icc`.`circle` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_devotee_gothra-master1`
    FOREIGN KEY (`gothra`)
    REFERENCES `icc`.`gothra-master` (`gothra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_devotee_language1`
    FOREIGN KEY (`mother-tongue-language-id`)
    REFERENCES `icc`.`language` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_devotee_nakshatra-master1`
    FOREIGN KEY (`nakshatra`)
    REFERENCES `icc`.`nakshatra-master` (`nakshatra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_devotee_physical-address1`
    FOREIGN KEY (`physical-address-id`)
    REFERENCES `icc`.`physical-address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_devotee_profession-master1`
    FOREIGN KEY (`profession-id`)
    REFERENCES `icc`.`profession-master` (`profession-id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`approval-que`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`approval-que` (
  `id` VARCHAR(36) NOT NULL,
  `approver-id` VARCHAR(36) NOT NULL,
  `artefact-instance-id` VARCHAR(36) NOT NULL,
  `requesting-devotee-id` VARCHAR(36) NOT NULL,
  `approval-sequence-no` SMALLINT(6) NOT NULL,
  `last-approver-ind` TINYINT(4) NOT NULL DEFAULT '0',
  `approval-ind` TINYINT(4) NULL DEFAULT '0',
  `activated-ind` TINYINT(4) NOT NULL DEFAULT '0',
  `approver-remarks` VARCHAR(100) NULL DEFAULT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_approval-que_devotee1_idx` (`approver-id` ASC),
  INDEX `fk_approval-que_devotee3_idx` (`requesting-devotee-id` ASC),
  CONSTRAINT `fk_approval-que_devotee1`
    FOREIGN KEY (`approver-id`)
    REFERENCES `icc`.`devotee` (`id`)
>>>>>>> development
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_approval-que_devotee3`
    FOREIGN KEY (`requesting-devotee-id`)
    REFERENCES `icc`.`devotee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`approval-rule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`approval-rule` (
  `id` VARCHAR(36) NOT NULL,
  `approval-artefact-id` VARCHAR(36) NOT NULL,
  `sequence-no` SMALLINT(6) NOT NULL,
  `role-id` INT(11) NOT NULL,
  `last-approval-sequence-ind` TINYINT(4) NOT NULL DEFAULT '0',
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`temple`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`temple` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(100) NULL DEFAULT NULL,
  `contact-number` VARCHAR(20) NULL DEFAULT NULL,
  `contact-name` VARCHAR(50) NULL DEFAULT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  `physical-address-id` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_temple_physical-address1_idx` (`physical-address-id` ASC),
  CONSTRAINT `fk_temple_physical-address1`
    FOREIGN KEY (`physical-address-id`)
    REFERENCES `icc`.`physical-address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`department` (
  `id` VARCHAR(36) NOT NULL,
  `temple-id` VARCHAR(36) NOT NULL,
  `department-name` VARCHAR(50) NOT NULL,
  `department-leader-devotee-id` VARCHAR(36) NOT NULL,
  `icon` VARCHAR(50) NULL DEFAULT NULL,
  `route` VARCHAR(255) NULL DEFAULT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_department_temple1_idx` (`temple-id` ASC),
  INDEX `fk_department_devotee1_idx` (`department-leader-devotee-id` ASC),
  CONSTRAINT `fk_department_devotee1`
    FOREIGN KEY (`department-leader-devotee-id`)
    REFERENCES `icc`.`devotee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_department_temple1`
    FOREIGN KEY (`temple-id`)
    REFERENCES `icc`.`temple` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`department-announcement`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`department-announcement` (
  `id` VARCHAR(36) NOT NULL,
  `department-id` VARCHAR(36) NOT NULL,
  `subject` VARCHAR(36) NOT NULL,
  `message` VARCHAR(200) NOT NULL,
  `valid-until` DATE NOT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_department-announcement_department1_idx` (`department-id` ASC),
  CONSTRAINT `fk_department-announcement_department1`
    FOREIGN KEY (`department-id`)
    REFERENCES `icc`.`department` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`department-calendar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`department-calendar` (
  `id` VARCHAR(36) NOT NULL,
  `department-id` VARCHAR(36) NOT NULL,
  `event-name` VARCHAR(50) NOT NULL,
  `event-description` VARCHAR(200) NULL DEFAULT NULL,
  `start-time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `end-time` TIMESTAMP NULL DEFAULT NULL,
  `all-day-ind` TINYINT(4) NOT NULL DEFAULT '0',
  `public-ind` TINYINT(4) NOT NULL DEFAULT '0',
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_department-calendar_department1_idx` (`department-id` ASC),
  CONSTRAINT `fk_department-calendar_department1`
    FOREIGN KEY (`department-id`)
    REFERENCES `icc`.`department` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`devotee-asrama`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`devotee-asrama` (
  `devotee-id` VARCHAR(36) NOT NULL,
  `asrama-master-id` VARCHAR(36) NOT NULL,
  `entry-date` DATE NOT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`devotee-id`, `asrama-master-id`),
  INDEX `fk_table1_devotee3_idx` (`devotee-id` ASC),
  INDEX `fk_table1_asrama-master1_idx` (`asrama-master-id` ASC),
  CONSTRAINT `fk_table1_asrama-master1`
    FOREIGN KEY (`asrama-master-id`)
    REFERENCES `icc`.`asrama-master` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_table1_devotee3`
    FOREIGN KEY (`devotee-id`)
    REFERENCES `icc`.`devotee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`electronic-address-type-master`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`electronic-address-type-master` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(50) NULL DEFAULT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`electronic-address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`electronic-address` (
  `id` VARCHAR(36) NOT NULL,
  `electronic-address-type-master-id` VARCHAR(36) NULL DEFAULT NULL,
  `electronic-address` VARCHAR(50) NULL DEFAULT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_electronic-address_electronic-address-type-master1_idx` (`electronic-address-type-master-id` ASC),
  CONSTRAINT `fk_electronic-address_electronic-address-type-master1`
    FOREIGN KEY (`electronic-address-type-master-id`)
    REFERENCES `icc`.`electronic-address-type-master` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`devotee-electronic-address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`devotee-electronic-address` (
  `devotee-id` VARCHAR(36) NOT NULL,
  `electronic-address-id` VARCHAR(36) NOT NULL,
  `preferred-flag` TINYINT(4) NOT NULL DEFAULT '0',
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`devotee-id`, `electronic-address-id`),
  INDEX `fk_devotee-electronic-address_devotee1_idx` (`devotee-id` ASC),
  INDEX `fk_devotee-electronic-address_electronic-address1_idx` (`electronic-address-id` ASC),
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
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`devotee-event-master`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`devotee-event-master` (
  `id` VARCHAR(36) NOT NULL,
  `event-name` VARCHAR(50) NULL DEFAULT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`devotee-event-calendar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`devotee-event-calendar` (
  `devotee-id` VARCHAR(36) NOT NULL,
  `event-date` DATE NOT NULL,
  `event-master-id` VARCHAR(36) NULL DEFAULT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`devotee-id`),
  INDEX `fk_devotee-event-calendar_devotee2_idx` (`devotee-id` ASC),
  INDEX `fk_devotee-event-calendar_event-master1_idx` (`event-master-id` ASC),
  CONSTRAINT `fk_devotee-event-calendar_devotee2`
    FOREIGN KEY (`devotee-id`)
    REFERENCES `icc`.`devotee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_devotee-event-calendar_event-master1`
    FOREIGN KEY (`event-master-id`)
    REFERENCES `icc`.`devotee-event-master` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
<<<<<<< HEAD
-- Table `icc`.`electronic-address-type-master`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`electronic-address-type-master` (
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
-- Table `icc`.`electronic-address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`electronic-address` (
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
    REFERENCES `icc`.`electronic-address-type-master` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`donation-type-master`
=======
-- Table `icc`.`group-master`
>>>>>>> development
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`group-master` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(50) NULL DEFAULT NULL,
  `description` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`devotee-grouping`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`devotee-grouping` (
  `devotee-id` VARCHAR(36) NOT NULL,
  `group-id` VARCHAR(36) NOT NULL,
  PRIMARY KEY (`devotee-id`, `group-id`),
  INDEX `fk_devotee-grouping_groups1_idx` (`group-id` ASC),
  CONSTRAINT `fk_devotee-grouping_devotee1`
    FOREIGN KEY (`devotee-id`)
    REFERENCES `icc`.`devotee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_devotee-grouping_groups1`
    FOREIGN KEY (`group-id`)
    REFERENCES `icc`.`group-master` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`relationship-master`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`relationship-master` (
  `id` VARCHAR(36) NOT NULL,
  `relation-name` VARCHAR(100) NULL DEFAULT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
<<<<<<< HEAD
-- Table `icc`.`physical-address-type-master`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`physical-address-type-master` (
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
-- Table `icc`.`physical-address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`physical-address` (
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
    REFERENCES `icc`.`physical-address-type-master` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`new-contact`
=======
-- Table `icc`.`devotee-karmi-family`
>>>>>>> development
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`devotee-karmi-family` (
  `family-name` VARCHAR(100) NULL DEFAULT NULL,
  `devotee-id` VARCHAR(36) NOT NULL,
  `related-devotee-id` VARCHAR(36) NOT NULL,
  `relationship-id` VARCHAR(36) NOT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`devotee-id`, `related-devotee-id`, `relationship-id`),
  INDEX `fk_devotee-karmi-family_relationship-master1_idx` (`relationship-id` ASC),
  INDEX `fk_devotee-karmi-family_devotee2_idx` (`devotee-id` ASC),
  INDEX `fk_devotee-karmi-family_devotee1_idx` (`related-devotee-id` ASC),
  CONSTRAINT `fk_devotee-karmi-family_devotee1`
    FOREIGN KEY (`related-devotee-id`)
    REFERENCES `icc`.`devotee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_devotee-karmi-family_devotee2`
    FOREIGN KEY (`devotee-id`)
    REFERENCES `icc`.`devotee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_devotee-karmi-family_relationship-master1`
    FOREIGN KEY (`relationship-id`)
    REFERENCES `icc`.`relationship-master` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`devotee-language`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`devotee-language` (
  `id` VARCHAR(36) NOT NULL,
  `devotee-id` VARCHAR(36) NOT NULL,
  `language-id` VARCHAR(36) NOT NULL,
  `read-ind` TINYINT(4) NOT NULL,
  `write-ind` TINYINT(4) NOT NULL,
  `speak-ind` TINYINT(4) NOT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_table1_language1_idx` (`language-id` ASC),
  INDEX `fk_devotee-language_devotee1_idx` (`devotee-id` ASC),
  CONSTRAINT `fk_devotee-language_devotee1`
    FOREIGN KEY (`devotee-id`)
    REFERENCES `icc`.`devotee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_table1_language1`
    FOREIGN KEY (`language-id`)
    REFERENCES `icc`.`language` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`devotee-physical-address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`devotee-physical-address` (
  `devotee-id` VARCHAR(36) NOT NULL,
  `physical-address-id` VARCHAR(36) NOT NULL,
  `preferred-flag` TINYINT(4) NOT NULL DEFAULT '0',
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`physical-address-id`, `devotee-id`),
  INDEX `fk_devotee-address_devotee1_idx` (`devotee-id` ASC),
  INDEX `fk_devotee-address_physical-address1_idx` (`physical-address-id` ASC),
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
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`devotee-service-availability`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`devotee-service-availability` (
  `id` VARCHAR(36) NOT NULL,
  `devotee-id` VARCHAR(36) NOT NULL,
  `service-date` DATE NOT NULL,
  `service-hours` SMALLINT(6) NOT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_devotee-service-availability_devotee1_idx` (`devotee-id` ASC),
  CONSTRAINT `fk_devotee-service-availability_devotee1`
    FOREIGN KEY (`devotee-id`)
    REFERENCES `icc`.`devotee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`service-area`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`service-area` (
  `id` VARCHAR(36) NOT NULL,
  `service-name` VARCHAR(50) NOT NULL,
  `description` VARCHAR(100) NOT NULL COMMENT '	',
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`devotee-service-interest`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`devotee-service-interest` (
  `devotee-id` VARCHAR(36) NOT NULL,
  `service-area-id` VARCHAR(36) NOT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`devotee-id`, `service-area-id`),
  INDEX `fk_devotee-service-interest_devotee1_idx` (`devotee-id` ASC),
  INDEX `fk_devotee-service-interest_service-area1_idx` (`service-area-id` ASC),
  CONSTRAINT `fk_devotee-service-interest_devotee1`
    FOREIGN KEY (`devotee-id`)
    REFERENCES `icc`.`devotee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_devotee-service-interest_service-area1`
    FOREIGN KEY (`service-area-id`)
    REFERENCES `icc`.`service-area` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`skill-category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`skill-category` (
  `id` VARCHAR(36) NOT NULL,
  `skill-category-name` VARCHAR(50) NULL DEFAULT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`skill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`skill` (
  `id` VARCHAR(36) NOT NULL,
  `skill-name` VARCHAR(50) NOT NULL,
  `skill-category-id` VARCHAR(36) NOT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_skill_skill-category1_idx` (`skill-category-id` ASC),
  CONSTRAINT `fk_skill_skill-category1`
    FOREIGN KEY (`skill-category-id`)
    REFERENCES `icc`.`skill-category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`devotee-skill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`devotee-skill` (
  `devotee-id` VARCHAR(36) NOT NULL,
  `skill-id` VARCHAR(36) NOT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`devotee-id`, `skill-id`),
  INDEX `fk_devotee-skill_devotee1_idx` (`devotee-id` ASC),
  INDEX `fk_devotee-skill_skill1_idx` (`skill-id` ASC),
  CONSTRAINT `fk_devotee-skill_devotee1`
    FOREIGN KEY (`devotee-id`)
    REFERENCES `icc`.`devotee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_devotee-skill_skill1`
    FOREIGN KEY (`skill-id`)
    REFERENCES `icc`.`skill` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`guru`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`guru` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(100) NULL DEFAULT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`spiritual-level-master`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`spiritual-level-master` (
  `id` VARCHAR(36) NOT NULL,
  `level` VARCHAR(30) NULL DEFAULT NULL,
  `description` VARCHAR(50) NULL DEFAULT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`devotee-spiritual-progress`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`devotee-spiritual-progress` (
  `id` VARCHAR(36) NOT NULL,
  `devotee-id` VARCHAR(36) NULL DEFAULT NULL,
  `level-date` DATE NOT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  `spiritual-level-master-id` VARCHAR(36) NOT NULL,
  `guru-id` VARCHAR(36) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_devotee-spiritual-family_devotee1_idx` (`devotee-id` ASC),
  INDEX `fk_devotee-spiritual-family_spiritual-level-master1_idx` (`spiritual-level-master-id` ASC),
  INDEX `fk_devotee-spiritual-family_guru1_idx` (`guru-id` ASC),
  CONSTRAINT `fk_devotee-spiritual-family_devotee1`
    FOREIGN KEY (`devotee-id`)
    REFERENCES `icc`.`devotee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_devotee-spiritual-family_guru1`
    FOREIGN KEY (`guru-id`)
    REFERENCES `icc`.`guru` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_devotee-spiritual-family_spiritual-level-master1`
    FOREIGN KEY (`spiritual-level-master-id`)
    REFERENCES `icc`.`spiritual-level-master` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`donation-category-master`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`donation-category-master` (
  `id` VARCHAR(36) NOT NULL,
  `donation-category-name` VARCHAR(50) NOT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`event-donation-item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`event-donation-item` (
  `id` VARCHAR(36) NOT NULL,
  `event-donation-name` VARCHAR(50) NOT NULL,
  `department-calendar-id` VARCHAR(36) NOT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_event-donation-master_department-calendar1_idx` (`department-calendar-id` ASC),
  CONSTRAINT `fk_event-donation-master_department-calendar1`
    FOREIGN KEY (`department-calendar-id`)
    REFERENCES `icc`.`department-calendar` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`payment-mode-master`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`payment-mode-master` (
  `id` VARCHAR(36) NOT NULL,
  `mode-name` VARCHAR(50) NOT NULL,
  `description` VARCHAR(100) NOT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`payment` (
  `id` VARCHAR(36) NOT NULL,
  `devotee-id` VARCHAR(36) NOT NULL,
  `payment-mode-master-id` VARCHAR(36) NOT NULL,
  `payment-date` DATETIME NOT NULL,
  `payment-amount` DECIMAL(10,2) NOT NULL DEFAULT '0.00',
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_order-payment_devotee1_idx` (`devotee-id` ASC),
  INDEX `fk_devotee-payment_payment-mode-master1_idx` (`payment-mode-master-id` ASC),
  CONSTRAINT `fk_devotee-payment_payment-mode-master1`
    FOREIGN KEY (`payment-mode-master-id`)
    REFERENCES `icc`.`payment-mode-master` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order-payment_devotee1`
    FOREIGN KEY (`devotee-id`)
    REFERENCES `icc`.`devotee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`donation-receipt`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`donation-receipt` (
  `id` VARCHAR(36) NOT NULL,
  `devotee-id` VARCHAR(36) NOT NULL,
  `donation-type-master-id` VARCHAR(36) NOT NULL,
  `mg-payment-id` VARCHAR(36) NOT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_donation-receipt_devotee1_idx` (`devotee-id` ASC),
  INDEX `fk_donation-receipt_donation-type-master1_idx` (`donation-type-master-id` ASC),
  INDEX `fk_donation-receipt_mg-payment1_idx` (`mg-payment-id` ASC),
  CONSTRAINT `fk_donation-receipt_devotee1`
    FOREIGN KEY (`devotee-id`)
    REFERENCES `icc`.`devotee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_donation-receipt_donation-type-master1`
    FOREIGN KEY (`donation-type-master-id`)
    REFERENCES `icc`.`event-donation-item` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_donation-receipt_mg-payment1`
    FOREIGN KEY (`mg-payment-id`)
    REFERENCES `icc`.`payment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`event-master`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`event-master` (
  `id` VARCHAR(36) NOT NULL,
  `event-name` VARCHAR(100) NOT NULL,
  `department-id` VARCHAR(36) NOT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_event-master_department1_idx` (`department-id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`event-donation-master`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`event-donation-master` (
  `event-master-id` VARCHAR(36) NOT NULL,
  `donation-category-master-id` VARCHAR(36) NOT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`event-master-id`, `donation-category-master-id`),
  INDEX `fk_event-donation-master_donation-category-master1_idx` (`donation-category-master-id` ASC),
  CONSTRAINT `fk_festival-donation-master_festival-master1`
    FOREIGN KEY (`event-master-id`)
    REFERENCES `icc`.`event-master` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`event-service`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`event-service` (
  `id` VARCHAR(36) NOT NULL,
  `department-calendar-id` VARCHAR(36) NOT NULL,
  `service-area-id` VARCHAR(36) NOT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_devotee-service_service-area1_idx` (`service-area-id` ASC),
  INDEX `fk_event-service_department-calendar1_idx` (`department-calendar-id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`event-service-master`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`event-service-master` (
  `event-master-id` VARCHAR(36) NOT NULL,
  `service-area-id` VARCHAR(36) NOT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`event-master-id`, `service-area-id`),
  INDEX `fk_festival-service-master_service-area1_idx` (`service-area-id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`lookup-table-master`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`lookup-table-master` (
  `table-name` VARCHAR(50) NOT NULL,
  `table-display-name` VARCHAR(100) NOT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`table-name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`lookup-table-detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`lookup-table-detail` (
  `table-name` VARCHAR(50) NOT NULL,
  `column-name` VARCHAR(50) NOT NULL,
  `column-display-name` VARCHAR(100) NOT NULL,
  `column-data-type` VARCHAR(50) NULL DEFAULT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`table-name`, `column-name`),
  CONSTRAINT `fk_lookup-table-detail_lookup-table-master1`
    FOREIGN KEY (`table-name`)
    REFERENCES `icc`.`lookup-table-master` (`table-name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`mg-order-channel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`mg-order-channel` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(50) NULL DEFAULT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Identify the Sales Channel - Online, POS';


-- -----------------------------------------------------
-- Table `icc`.`mg-order-status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`mg-order-status` (
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
-- Table `icc`.`mg-order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`mg-order` (
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
    REFERENCES `icc`.`devotee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_order-channel1`
    FOREIGN KEY (`order-channel-id`)
    REFERENCES `icc`.`mg-order-channel` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_table1_book-request-status1`
    FOREIGN KEY (`order-status-id`)
    REFERENCES `icc`.`mg-order-status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_table1_devotee2`
    FOREIGN KEY (`devotee-id`)
    REFERENCES `icc`.`devotee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`mg-credit-note`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`mg-credit-note` (
  `id` VARCHAR(36) NOT NULL,
  `order-id` VARCHAR(16) NOT NULL,
  `due-amount` DECIMAL(10,2) NOT NULL,
  `payment-id` VARCHAR(36) NULL DEFAULT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_credit-note_order1_idx` (`order-id` ASC),
  INDEX `fk_credit-note_payment1_idx` (`payment-id` ASC),
  CONSTRAINT `fk_credit-note_order1`
    FOREIGN KEY (`order-id`)
    REFERENCES `icc`.`mg-order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_credit-note_payment1`
    FOREIGN KEY (`payment-id`)
    REFERENCES `icc`.`payment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`mg-delivery-note`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`mg-delivery-note` (
  `id` VARCHAR(36) NOT NULL,
  `delivered-date` DATETIME NOT NULL,
  `delivery-notes` VARCHAR(255) NOT NULL,
  `order-id` VARCHAR(16) NOT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_delivery-note_order1_idx` (`order-id` ASC),
  CONSTRAINT `fk_delivery-note_order1`
    FOREIGN KEY (`order-id`)
    REFERENCES `icc`.`mg-order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`mg-tax-category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`mg-tax-category` (
  `id` VARCHAR(36) NOT NULL,
  `tax-category-name` VARCHAR(50) NOT NULL,
  `tax-percent` DECIMAL(6,2) NOT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`mg-hsn`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`mg-hsn` (
  `hsn-code` VARCHAR(50) NOT NULL,
  `tax-category-id` VARCHAR(36) NOT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`hsn-code`),
  INDEX `fk_hsn-tax-category_tax-category1_idx` (`tax-category-id` ASC),
  CONSTRAINT `fk_hsn-tax-category_tax-category1`
    FOREIGN KEY (`tax-category-id`)
    REFERENCES `icc`.`mg-tax-category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`mg-invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`mg-invoice` (
  `invoice-number` INT(11) NOT NULL,
  `order-id` VARCHAR(16) NOT NULL,
  `payment-id` VARCHAR(36) NULL DEFAULT NULL,
  `credit-note-id` VARCHAR(36) NULL DEFAULT NULL,
  `invoice-amount` DECIMAL(15,2) NOT NULL COMMENT '				',
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`invoice-number`),
  INDEX `fk_invoice_order1_idx` (`order-id` ASC),
  INDEX `fk_invoice_payment1_idx` (`payment-id` ASC),
  CONSTRAINT `fk_invoice_order1`
    FOREIGN KEY (`order-id`)
    REFERENCES `icc`.`mg-order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoice_payment1`
    FOREIGN KEY (`payment-id`)
    REFERENCES `icc`.`payment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`mg-product-attribute`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`mg-product-attribute` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`mg-product-attribute-instance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`mg-product-attribute-instance` (
  `id` VARCHAR(36) NOT NULL,
  `product-attribute-instance-value` VARCHAR(100) NOT NULL,
  `product-attribute-id` VARCHAR(36) NOT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_product-attribute-instance_product-attribute1_idx` (`product-attribute-id` ASC),
  CONSTRAINT `fk_product-attribute-instance_product-attribute1`
    FOREIGN KEY (`product-attribute-id`)
    REFERENCES `icc`.`mg-product-attribute` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`mg-unit-of-measure`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`mg-unit-of-measure` (
  `id` VARCHAR(36) NOT NULL,
  `uom-name` VARCHAR(50) NULL DEFAULT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`mg-product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`mg-product` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(100) NULL DEFAULT NULL,
  `unit-of-measure-id` VARCHAR(36) NOT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_product_unit-of-measure1_idx` (`unit-of-measure-id` ASC),
  CONSTRAINT `fk_product_unit-of-measure1`
    FOREIGN KEY (`unit-of-measure-id`)
    REFERENCES `icc`.`mg-unit-of-measure` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`mg-product-sku`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`mg-product-sku` (
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
    REFERENCES `icc`.`mg-product-attribute-instance` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product-sku_hsn1`
    FOREIGN KEY (`hsn-code`)
    REFERENCES `icc`.`mg-hsn` (`hsn-code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product-sku_product1`
    FOREIGN KEY (`product-id`)
    REFERENCES `icc`.`mg-product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`mg-order-line`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`mg-order-line` (
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
    REFERENCES `icc`.`mg-order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_book-marathon-order-detail_book1`
    FOREIGN KEY (`product-instance-id`)
    REFERENCES `icc`.`mg-product-sku` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`mg-order-return`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`mg-order-return` (
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
    REFERENCES `icc`.`devotee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`mg-order-return-line`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`mg-order-return-line` (
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
    REFERENCES `icc`.`mg-product-sku` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order-return-line_order-return1`
    FOREIGN KEY (`order-return-id`)
    REFERENCES `icc`.`mg-order-return` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`mg-stock-current`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`mg-stock-current` (
  `id` VARCHAR(36) NOT NULL,
  `product-sku-id` VARCHAR(36) NOT NULL,
  `quantity` INT(11) NOT NULL DEFAULT '0',
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_product-stock-current_product-sku1_idx` (`product-sku-id` ASC),
  CONSTRAINT `fk_product-stock-current_product-sku1`
    FOREIGN KEY (`product-sku-id`)
    REFERENCES `icc`.`mg-product-sku` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`mg-stock-inward`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`mg-stock-inward` (
  `id` VARCHAR(36) NOT NULL,
  `supplier-invoice-number` VARCHAR(50) NOT NULL,
  `invoice-date` DATE NOT NULL,
  `supplier-id` VARCHAR(36) NOT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`mg-stock-inward-diary`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`mg-stock-inward-diary` (
  `stock-inward-id` VARCHAR(36) NOT NULL,
  `line-number` SMALLINT(6) NOT NULL,
  `product-sku-id` VARCHAR(36) NOT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`line-number`, `stock-inward-id`),
  INDEX `fk_stock-inward-diary_product-sku1_idx` (`product-sku-id` ASC),
  INDEX `fk_stock-inward-diary_stock-inward1_idx` (`stock-inward-id` ASC),
  CONSTRAINT `fk_stock-inward-diary_product-sku1`
    FOREIGN KEY (`product-sku-id`)
    REFERENCES `icc`.`mg-product-sku` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stock-inward-diary_stock-inward1`
    FOREIGN KEY (`stock-inward-id`)
    REFERENCES `icc`.`mg-stock-inward` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`mg-supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`mg-supplier` (
  `id` VARCHAR(36) NOT NULL,
  `supplier-name` VARCHAR(255) NOT NULL,
  `tax-identification-number` VARCHAR(20) NOT NULL,
  `gstn-number` VARCHAR(50) NOT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`mg-supplier-electronic-address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`mg-supplier-electronic-address` (
  `electronic-address-id` VARCHAR(36) NOT NULL,
  `supplier-id` VARCHAR(36) NOT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`supplier-id`, `electronic-address-id`),
  INDEX `fk_supplier-electronic-address_electronic-address1_idx` (`electronic-address-id` ASC),
  INDEX `fk_supplier-electronic-address_supplier1_idx` (`supplier-id` ASC),
  CONSTRAINT `fk_supplier-electronic-address_electronic-address1`
    FOREIGN KEY (`electronic-address-id`)
    REFERENCES `icc`.`electronic-address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_supplier-electronic-address_supplier1`
    FOREIGN KEY (`supplier-id`)
    REFERENCES `icc`.`mg-supplier` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`mg-supplier-physical-address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`mg-supplier-physical-address` (
  `physical-address-id` VARCHAR(36) NOT NULL,
  `supplier-id` VARCHAR(36) NOT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`physical-address-id`, `supplier-id`),
  INDEX `fk_supplier-address_physical-address1_idx` (`physical-address-id` ASC),
  INDEX `fk_supplier-physical-address_supplier1_idx` (`supplier-id` ASC),
  CONSTRAINT `fk_supplier-address_physical-address1`
    FOREIGN KEY (`physical-address-id`)
    REFERENCES `icc`.`physical-address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_supplier-physical-address_supplier1`
    FOREIGN KEY (`supplier-id`)
    REFERENCES `icc`.`mg-supplier` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`mg-tax-component`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`mg-tax-component` (
  `id` VARCHAR(36) NOT NULL,
  `tax-component-name` VARCHAR(50) NOT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`mg-tax-category-component`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`mg-tax-category-component` (
  `tax-category-id` VARCHAR(36) NOT NULL,
  `tax-component-id` VARCHAR(36) NOT NULL,
  `tax-percent` DECIMAL(6,2) NOT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`tax-category-id`, `tax-component-id`),
  INDEX `fk_tax-category-component_tax-category1_idx` (`tax-category-id` ASC),
  INDEX `fk_tax-category-component_tax-component1_idx` (`tax-component-id` ASC),
  CONSTRAINT `fk_tax-category-component_tax-category1`
    FOREIGN KEY (`tax-category-id`)
    REFERENCES `icc`.`mg-tax-category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tax-category-component_tax-component1`
    FOREIGN KEY (`tax-component-id`)
    REFERENCES `icc`.`mg-tax-component` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`mg-tax-line`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`mg-tax-line` (
  `id` VARCHAR(36) NOT NULL,
  `invoice-invoice-number` INT(11) NOT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`new-contact`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`new-contact` (
  `id` VARCHAR(36) CHARACTER SET 'utf8' NOT NULL,
  `name` VARCHAR(255) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `physical-address-id` VARCHAR(36) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `electronic-address-id` VARCHAR(36) CHARACTER SET 'utf8' NULL DEFAULT NULL,
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
    REFERENCES `icc`.`electronic-address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_table1_physical-address1`
    FOREIGN KEY (`physical-address-id`)
    REFERENCES `icc`.`physical-address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

USE `mg` ;

-- -----------------------------------------------------
<<<<<<< HEAD
-- Table `mg`.`product-attribute`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg`.`product-attribute` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
=======
-- Table `icc`.`outreach-master`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`outreach-master` (
  `id` VARCHAR(36) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `description` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
>>>>>>> development
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
<<<<<<< HEAD
-- Table `mg`.`product-attribute-instance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg`.`product-attribute-instance` (
  `id` VARCHAR(36) NOT NULL,
  `product-attribute-instance-value` VARCHAR(100) NOT NULL,
  `product-attribute-id` VARCHAR(36) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_product-attribute-instance_product-attribute1_idx` (`product-attribute-id` ASC),
  CONSTRAINT `fk_product-attribute-instance_product-attribute1`
    FOREIGN KEY (`product-attribute-id`)
    REFERENCES `mg`.`product-attribute` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mg`.`unit-of-measure`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg`.`unit-of-measure` (
  `id` VARCHAR(36) NOT NULL,
  `uom-name` VARCHAR(50) NULL,
=======
-- Table `icc`.`physical-address-type-master`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`physical-address-type-master` (
  `id` VARCHAR(36) NOT NULL,
  `address-type` VARCHAR(50) NULL DEFAULT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
>>>>>>> development
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
<<<<<<< HEAD
-- Table `mg`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg`.`product` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(100) NULL,
  `unit-of-measure-id` VARCHAR(36) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_product_unit-of-measure1_idx` (`unit-of-measure-id` ASC),
  CONSTRAINT `fk_product_unit-of-measure1`
    FOREIGN KEY (`unit-of-measure-id`)
    REFERENCES `mg`.`unit-of-measure` (`id`)
=======
-- Table `icc`.`pledge`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`pledge` (
  `id` VARCHAR(36) NOT NULL,
  `start-date` DATE NOT NULL,
  `end-date` VARCHAR(50) NULL DEFAULT NULL,
  `pledge-amount` DECIMAL(15,2) NOT NULL,
  `instalment-count` SMALLINT(6) NULL DEFAULT NULL,
  `pause-ind` TINYINT(4) NOT NULL,
  `devotee-id` VARCHAR(36) NULL DEFAULT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_pledge_devotee2_idx` (`devotee-id` ASC),
  CONSTRAINT `fk_pledge_devotee2`
    FOREIGN KEY (`devotee-id`)
    REFERENCES `icc`.`devotee` (`id`)
>>>>>>> development
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
<<<<<<< HEAD
-- Table `mg`.`tax-category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg`.`tax-category` (
  `id` VARCHAR(36) NOT NULL,
  `tax-category-name` VARCHAR(50) NOT NULL,
  `tax-percent` DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mg`.`hsn`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg`.`hsn` (
  `hsn-code` VARCHAR(50) NOT NULL,
  `tax-category-id` VARCHAR(36) NOT NULL,
  PRIMARY KEY (`hsn-code`),
  INDEX `fk_hsn-tax-category_tax-category1_idx` (`tax-category-id` ASC),
  CONSTRAINT `fk_hsn-tax-category_tax-category1`
    FOREIGN KEY (`tax-category-id`)
    REFERENCES `mg`.`tax-category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
=======
-- Table `icc`.`pledge-payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`pledge-payment` (
  `id` VARCHAR(36) NOT NULL,
  `instalment-number` SMALLINT(6) NOT NULL,
  `pledge-date` DATE NULL DEFAULT NULL,
  `pledge-id` VARCHAR(36) NULL DEFAULT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  `mg-payment-id` VARCHAR(36) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_pledge-payment_pledge1_idx` (`pledge-id` ASC),
  INDEX `fk_pledge-payment_mg-payment1_idx` (`mg-payment-id` ASC),
  CONSTRAINT `fk_pledge-payment_mg-payment1`
    FOREIGN KEY (`mg-payment-id`)
    REFERENCES `icc`.`payment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pledge-payment_pledge1`
    FOREIGN KEY (`pledge-id`)
    REFERENCES `icc`.`pledge` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`task-master`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`task-master` (
  `id` VARCHAR(36) NOT NULL,
  `task-name` VARCHAR(50) NOT NULL,
  `application-route` VARCHAR(255) NOT NULL,
  `task-description` VARCHAR(100) NULL DEFAULT NULL,
  `approval-rules-apply-ind` TINYINT(4) NOT NULL DEFAULT '0',
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`service-role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`service-role` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(512) NOT NULL,
  `description` VARCHAR(512) NULL DEFAULT NULL,
  `created` DATETIME NULL DEFAULT NULL,
  `modified` DATETIME NULL DEFAULT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  `department-id` VARCHAR(36) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_service-role_department1_idx` (`department-id` ASC),
  CONSTRAINT `fk_service-role_department1`
    FOREIGN KEY (`department-id`)
    REFERENCES `icc`.`department` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`role-task-master`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`role-task-master` (
  `task-master-id` VARCHAR(36) NOT NULL,
  `role-id` VARCHAR(36) NOT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`task-master-id`, `role-id`),
  INDEX `fk_role-task-master_task-master1_idx` (`task-master-id` ASC),
  INDEX `fk_service-task-master_role_idx` (`role-id` ASC),
  CONSTRAINT `fk_role-task-master-task-master`
    FOREIGN KEY (`task-master-id`)
    REFERENCES `icc`.`task-master` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_service-role-task-master`
    FOREIGN KEY (`role-id`)
    REFERENCES `icc`.`service-role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`rolemapping`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`rolemapping` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `principalType` VARCHAR(512) NULL DEFAULT NULL,
  `principalId` VARCHAR(255) NULL DEFAULT NULL,
  `roleId` INT(11) NULL DEFAULT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `principalId` (`principalId` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
>>>>>>> development


-- -----------------------------------------------------
-- Table `icc`.`service-role-mapping`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`service-role-mapping` (
  `id` VARCHAR(36) NOT NULL,
<<<<<<< HEAD
  `bar-code` VARCHAR(255) NOT NULL,
  `bar-code-type` VARCHAR(50) NULL DEFAULT NULL,
  `title` VARCHAR(255) NOT NULL,
  `maximum-retail-price` DOUBLE NOT NULL DEFAULT '0',
  `discounted` VARCHAR(5) NULL DEFAULT 'no',
  `discount-allowed-ind` TINYINT NOT NULL DEFAULT b'1',
  `in-stock-qty` INT NOT NULL DEFAULT 0,
  `manage-stock` TINYINT NULL DEFAULT b'1',
=======
  `principal-type` VARCHAR(512) NULL DEFAULT NULL,
  `principal-id` VARCHAR(255) NULL DEFAULT NULL,
  `role-id` VARCHAR(36) NOT NULL,
>>>>>>> development
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
<<<<<<< HEAD
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
    REFERENCES `mg`.`product-attribute-instance` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product-sku_product1`
    FOREIGN KEY (`product-id`)
    REFERENCES `mg`.`product` (`id`)
=======
  PRIMARY KEY (`id`),
  INDEX `fk_service-mapping_service1_idx` (`role-id` ASC),
  CONSTRAINT `fk_service-role_mapping1`
    FOREIGN KEY (`role-id`)
    REFERENCES `icc`.`service-role` (`id`)
>>>>>>> development
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product-sku_hsn1`
    FOREIGN KEY (`hsn-code`)
    REFERENCES `mg`.`hsn` (`hsn-code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
<<<<<<< HEAD
-- Table `mg`.`order-status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg`.`order-status` (
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
-- Table `mg`.`order-return`
=======
-- Table `icc`.`stgdevotee`
>>>>>>> development
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`stgdevotee` (
  `id` VARCHAR(36) NOT NULL,
  `legal-name` VARCHAR(100) NULL DEFAULT NULL,
  `circle-id` VARCHAR(36) NULL DEFAULT NULL,
  `spiritual-name` VARCHAR(100) NULL DEFAULT NULL,
  `gender` CHAR(1) NULL DEFAULT NULL,
  `shiksha-level` VARCHAR(100) NULL DEFAULT NULL,
  `credit-limit` INT(11) NOT NULL DEFAULT '0',
  `realm` VARCHAR(512) NULL DEFAULT NULL,
  `username` VARCHAR(512) NULL DEFAULT NULL,
  `password` VARCHAR(512) NULL DEFAULT NULL,
  `email` VARCHAR(512) NULL DEFAULT NULL,
  `emailVerified` TINYINT(1) NULL DEFAULT NULL,
  `verificationToken` VARCHAR(512) NULL DEFAULT NULL,
  `access-id` VARCHAR(100) NULL DEFAULT NULL,
  `government-unique-id` VARCHAR(20) NULL DEFAULT NULL,
  `income-tax-id` VARCHAR(20) NULL DEFAULT NULL,
  `lpm-id` VARCHAR(20) NULL DEFAULT NULL,
  `kc-association-date` DATE NULL DEFAULT NULL,
  `mother-tongue-language-id` VARCHAR(36) NULL DEFAULT NULL,
  `date-of-birth` DATE NULL DEFAULT NULL,
  `day-month-of-birth` CHAR(65) NULL DEFAULT NULL,
  `nakshatra` VARCHAR(50) NULL DEFAULT NULL,
  `gothra` VARCHAR(50) NULL DEFAULT NULL,
  `asrama-master-id` VARCHAR(36) NULL DEFAULT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  `profession-id` VARCHAR(36) NULL DEFAULT NULL,
  `physical-address-id` VARCHAR(36) NULL DEFAULT NULL,
  `mobile-no` VARCHAR(15) NULL DEFAULT NULL,
  `landline-no` VARCHAR(15) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `access-id_UNIQUE` (`access-id` ASC),
  INDEX `fk_devotee_id_idx` (`id` ASC),
  INDEX `fk_devotee_circle1_idx` (`circle-id` ASC),
  INDEX `fk_devotee_language1_idx` (`mother-tongue-language-id` ASC),
  INDEX `fk_devotee_nakshatra-master1_idx` (`nakshatra` ASC),
  INDEX `fk_devotee_gothra-master1_idx` (`gothra` ASC),
  INDEX `fk_devotee_asrama-master1_idx` (`asrama-master-id` ASC),
  INDEX `fk_devotee_profession-master1_idx` (`profession-id` ASC),
  INDEX `fk_devotee_physical-address1_idx` (`physical-address-id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`stginitiateddevotees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`stginitiateddevotees` (
  `sname` VARCHAR(100) NOT NULL,
  `phone1` VARCHAR(45) NOT NULL,
  `phone2` VARCHAR(45) NULL DEFAULT NULL,
  `kname` VARCHAR(100) NULL DEFAULT NULL,
  `relation` VARCHAR(100) NULL DEFAULT NULL,
  `gender` VARCHAR(1) NULL DEFAULT NULL,
  PRIMARY KEY (`sname`, `phone1`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`stgphysical`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`stgphysical` (
  `id` VARCHAR(36) NOT NULL,
  `address-line-1` VARCHAR(100) NULL DEFAULT NULL,
  `address-line-2` VARCHAR(100) NULL DEFAULT NULL,
  `address-area` VARCHAR(100) NULL DEFAULT NULL,
  `address-city` VARCHAR(36) NULL DEFAULT NULL,
  `address-state` VARCHAR(100) NULL DEFAULT NULL,
  `address-country` VARCHAR(36) NULL DEFAULT NULL,
  `address-pin` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `icc`.`temple-branch`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`temple-branch` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(100) NULL DEFAULT NULL,
  `temple-id` VARCHAR(36) NULL DEFAULT NULL,
  `physical-address-id` VARCHAR(36) NULL DEFAULT NULL,
  `contact-number` VARCHAR(20) NULL DEFAULT NULL,
  `contact-name` VARCHAR(50) NULL DEFAULT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_temple-branch_temple1_idx` (`temple-id` ASC),
  INDEX `fk_temple-branch_physical-address1_idx` (`physical-address-id` ASC),
  CONSTRAINT `fk_temple-branch_physical-address1`
    FOREIGN KEY (`physical-address-id`)
    REFERENCES `icc`.`physical-address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_temple-branch_temple1`
    FOREIGN KEY (`temple-id`)
    REFERENCES `icc`.`temple` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
<<<<<<< HEAD
-- Table `mg`.`order-channel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg`.`order-channel` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(50) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = 'Identify the Sales Channel - Online, POS';


-- -----------------------------------------------------
-- Table `mg`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg`.`order` (
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
    REFERENCES `mg`.`order-status` (`id`)
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
    REFERENCES `mg`.`order-channel` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mg`.`order-line`
=======
-- Table `icc`.`fund-instrument-type`
>>>>>>> development
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`fund-instrument-type` (
  `id` VARCHAR(36) NOT NULL,
  `instrument-name` VARCHAR(50) NOT NULL,
  `denomination` INT NULL DEFAULT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `icc`.`fund-instrument`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`fund-instrument` (
  `id` VARCHAR(36) NOT NULL,
  `instrument-ref-no` VARCHAR(50) NOT NULL,
  `receipt-instrument-type-id` VARCHAR(36) NOT NULL,
  `start-no` INT NOT NULL,
  `end-no` INT NOT NULL,
  `current-start-no` INT NOT NULL,
  `current-end-no` INT NOT NULL,
  `status-id` VARCHAR(50) NOT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `current-start-no`, `current-end-no`),
  INDEX `fk_receipt-instrument-detail_receipt-instrument-master1_idx` (`receipt-instrument-type-id` ASC),
  CONSTRAINT `fk_receipt-instrument-detail_receipt-instrument-master1`
    FOREIGN KEY (`receipt-instrument-type-id`)
    REFERENCES `icc`.`fund-instrument-type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
<<<<<<< HEAD
-- Table `mg`.`payment-mode-master`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg`.`payment-mode-master` (
  `id` VARCHAR(36) NOT NULL,
  `mode-name` VARCHAR(50) NOT NULL,
  `description` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mg`.`payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg`.`payment` (
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
    REFERENCES `mg`.`payment-mode-master` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mg`.`tax-line`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg`.`tax-line` (
  `id` VARCHAR(36) NOT NULL,
  `invoice-invoice-number` INT NOT NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mg`.`delivery-note`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg`.`delivery-note` (
  `id` VARCHAR(36) NOT NULL,
  `delivered-date` DATETIME NOT NULL,
  `delivery-notes` VARCHAR(255) NOT NULL,
  `order-id` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_delivery-note_order1_idx` (`order-id` ASC),
  CONSTRAINT `fk_delivery-note_order1`
    FOREIGN KEY (`order-id`)
    REFERENCES `mg`.`order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mg`.`credit-note`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg`.`credit-note` (
  `id` VARCHAR(36) NOT NULL,
  `order-id` VARCHAR(16) NOT NULL,
  `due-amount` DECIMAL(10,2) NOT NULL,
  `payment-id` VARCHAR(36) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_credit-note_order1_idx` (`order-id` ASC),
  INDEX `fk_credit-note_payment1_idx` (`payment-id` ASC),
  CONSTRAINT `fk_credit-note_order1`
    FOREIGN KEY (`order-id`)
    REFERENCES `mg`.`order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_credit-note_payment1`
    FOREIGN KEY (`payment-id`)
    REFERENCES `mg`.`payment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mg`.`tax-component`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg`.`tax-component` (
  `id` VARCHAR(36) NOT NULL,
  `tax-component-name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mg`.`tax-category-component`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg`.`tax-category-component` (
  `tax-category-id` VARCHAR(36) NOT NULL,
  `tax-component-id` VARCHAR(36) NOT NULL,
  `tax-percent` DECIMAL(6,2) NOT NULL,
  INDEX `fk_tax-category-component_tax-category1_idx` (`tax-category-id` ASC),
  PRIMARY KEY (`tax-category-id`, `tax-component-id`),
  INDEX `fk_tax-category-component_tax-component1_idx` (`tax-component-id` ASC),
  CONSTRAINT `fk_tax-category-component_tax-category1`
    FOREIGN KEY (`tax-category-id`)
    REFERENCES `mg`.`tax-category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tax-category-component_tax-component1`
    FOREIGN KEY (`tax-component-id`)
    REFERENCES `mg`.`tax-component` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mg`.`invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg`.`invoice` (
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
    REFERENCES `mg`.`order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoice_payment1`
    FOREIGN KEY (`payment-id`)
    REFERENCES `mg`.`payment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mg`.`devotee-physical-address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg`.`devotee-physical-address` (
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
-- Table `mg`.`devotee-electronic-address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg`.`devotee-electronic-address` (
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
-- Table `mg`.`supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg`.`supplier` (
  `id` VARCHAR(36) NOT NULL,
  `supplier-name` VARCHAR(255) NOT NULL,
  `tax-identification-number` VARCHAR(20) NOT NULL,
  `gstn-number` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mg`.`supplier-physical-address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg`.`supplier-physical-address` (
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
    REFERENCES `mg`.`supplier` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mg`.`supplier-electronic-address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg`.`supplier-electronic-address` (
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
    REFERENCES `mg`.`supplier` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mg`.`stock-inward`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg`.`stock-inward` (
  `id` VARCHAR(36) NOT NULL,
  `supplier-invoice-number` VARCHAR(50) NOT NULL,
  `invoice-date` DATE NOT NULL,
  `supplier-id` VARCHAR(36) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mg`.`stock-current`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg`.`stock-current` (
  `id` VARCHAR(36) NOT NULL,
  `product-sku-id` VARCHAR(36) NOT NULL,
  `quantity` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `fk_product-stock-current_product-sku1_idx` (`product-sku-id` ASC),
  CONSTRAINT `fk_product-stock-current_product-sku1`
    FOREIGN KEY (`product-sku-id`)
    REFERENCES `mg`.`product-sku` (`id`)
=======
-- Table `icc`.`instrument-issue-register`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`instrument-issue-register` (
  `fund-instrument-id` VARCHAR(36) NOT NULL,
  `owning-devotee-id` VARCHAR(36) NOT NULL,
  `receipt-no` INT NOT NULL,
  `issue-date` TIMESTAMP NOT NULL,
  `issuer-id` VARCHAR(36) NOT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  INDEX `fk_instrument-issue-register_receipt-instrument1_idx` (`fund-instrument-id` ASC),
  PRIMARY KEY (`fund-instrument-id`, `owning-devotee-id`, `receipt-no`),
  INDEX `fk_instrument-issued-devotee_idx` (`issuer-id` ASC),
  CONSTRAINT `fk_instrument-issue-register_receipt-instrument1`
    FOREIGN KEY (`fund-instrument-id`)
    REFERENCES `icc`.`fund-instrument` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_instrument-issued-devotee`
    FOREIGN KEY (`issuer-id`)
    REFERENCES `icc`.`devotee` (`id`)
>>>>>>> development
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

<<<<<<< HEAD

-- -----------------------------------------------------
-- Table `mg`.`stock-inward-diary`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mg`.`stock-inward-diary` (
  `stock-inward-id` VARCHAR(36) NOT NULL,
  `line-number` SMALLINT NOT NULL,
  `product-sku-id` VARCHAR(36) NOT NULL,
  `col` INT(11) NOT NULL,
  INDEX `fk_stock-inward-diary_product-sku1_idx` (`product-sku-id` ASC),
  PRIMARY KEY (`line-number`, `stock-inward-id`),
  INDEX `fk_stock-inward-diary_stock-inward1_idx` (`stock-inward-id` ASC),
  CONSTRAINT `fk_stock-inward-diary_product-sku1`
    FOREIGN KEY (`product-sku-id`)
    REFERENCES `mg`.`product-sku` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stock-inward-diary_stock-inward1`
    FOREIGN KEY (`stock-inward-id`)
    REFERENCES `mg`.`stock-inward` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `placeholder` ;
=======
>>>>>>> development

-- -----------------------------------------------------
-- Table `icc`.`instrument-return-register`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`instrument-return-register` (
  `fund-instrument-id` VARCHAR(36) NOT NULL,
  `owning-devotee-id` VARCHAR(36) NOT NULL,
  `receipt-no` INT NOT NULL,
  `return-date` TIMESTAMP NOT NULL,
  `receiver-id` VARCHAR(36) NOT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`fund-instrument-id`, `owning-devotee-id`, `receipt-no`),
  INDEX `fk_instrument-return-devotee_idx` (`receiver-id` ASC),
  CONSTRAINT `fk_instrument-return-register_instrument-issue-register1`
    FOREIGN KEY (`fund-instrument-id` , `owning-devotee-id` , `receipt-no`)
    REFERENCES `icc`.`instrument-issue-register` (`fund-instrument-id` , `owning-devotee-id` , `receipt-no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_instrument-return-devotee`
    FOREIGN KEY (`receiver-id`)
    REFERENCES `icc`.`devotee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `icc`.`instrument-payment-register`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`instrument-payment-register` (
  `fund-instrument-id` VARCHAR(36) NOT NULL,
  `owning-devotee-id` VARCHAR(36) NOT NULL,
  `receipt-no` INT NOT NULL,
  `payment-mode-master-id` VARCHAR(36) NOT NULL,
  `payment-reference` VARCHAR(50) NULL,
  `payment-date` TIMESTAMP NOT NULL,
  `amount` INT NOT NULL,
  `receiver-id` VARCHAR(36) NOT NULL,
  `created-on` DATETIME NULL DEFAULT NULL,
  `updated-on` DATETIME NULL DEFAULT NULL,
  `created-by` VARCHAR(36) NULL DEFAULT NULL,
  `updated-by` VARCHAR(36) NULL DEFAULT NULL,
  PRIMARY KEY (`fund-instrument-id`, `owning-devotee-id`, `receipt-no`),
  INDEX `fk_instrument-payment-register_payment-mode-master1_idx` (`payment-mode-master-id` ASC),
  INDEX `fk_instrument-payment-receiver_idx` (`receiver-id` ASC),
  CONSTRAINT `fk_instrument-payment-register_instrument-issue-register1`
    FOREIGN KEY (`fund-instrument-id` , `owning-devotee-id` , `receipt-no`)
    REFERENCES `icc`.`instrument-issue-register` (`fund-instrument-id` , `owning-devotee-id` , `receipt-no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_instrument-payment-register_payment-mode-master1`
    FOREIGN KEY (`payment-mode-master-id`)
    REFERENCES `icc`.`payment-mode-master` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_instrument-payment-receiver`
    FOREIGN KEY (`receiver-id`)
    REFERENCES `icc`.`devotee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

<<<<<<< HEAD
=======
USE `icc` ;

-- -----------------------------------------------------
-- Placeholder table for view `icc`.`icc_council`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `icc`.`icc_council` (`id` INT, `legal-name` INT, `circle-id` INT, `spiritual-name` INT, `gender` INT, `shiksha-level` INT, `credit-limit` INT, `realm` INT, `username` INT, `password` INT, `email` INT, `emailVerified` INT, `verificationToken` INT, `access-id` INT, `government-unique-id` INT, `income-tax-id` INT, `lpm-id` INT, `kc-association-date` INT, `mother-tongue-language-id` INT, `date-of-birth` INT, `nakshatra` INT, `gothra` INT, `asrama-master-id` INT, `created-on` INT, `updated-on` INT, `created-by` INT, `updated-by` INT, `profession-id` INT, `physical-address-id` INT, `mobile-no` INT, `landline-no` INT, `day-month-of-birth` INT, `unique-id` INT);

-- -----------------------------------------------------
-- View `icc`.`icc_council`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `icc`.`icc_council`;
USE `icc`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`admin`@`%` SQL SECURITY DEFINER VIEW `icc`.`icc_council` AS select `icc`.`devotee`.`id` AS `id`,`icc`.`devotee`.`legal-name` AS `legal-name`,`icc`.`devotee`.`circle-id` AS `circle-id`,`icc`.`devotee`.`spiritual-name` AS `spiritual-name`,`icc`.`devotee`.`gender` AS `gender`,`icc`.`devotee`.`shiksha-level` AS `shiksha-level`,`icc`.`devotee`.`credit-limit` AS `credit-limit`,`icc`.`devotee`.`realm` AS `realm`,`icc`.`devotee`.`username` AS `username`,`icc`.`devotee`.`password` AS `password`,`icc`.`devotee`.`email` AS `email`,`icc`.`devotee`.`emailVerified` AS `emailVerified`,`icc`.`devotee`.`verificationToken` AS `verificationToken`,`icc`.`devotee`.`access-id` AS `access-id`,`icc`.`devotee`.`government-unique-id` AS `government-unique-id`,`icc`.`devotee`.`income-tax-id` AS `income-tax-id`,`icc`.`devotee`.`lpm-id` AS `lpm-id`,`icc`.`devotee`.`kc-association-date` AS `kc-association-date`,`icc`.`devotee`.`mother-tongue-language-id` AS `mother-tongue-language-id`,`icc`.`devotee`.`date-of-birth` AS `date-of-birth`,`icc`.`devotee`.`nakshatra` AS `nakshatra`,`icc`.`devotee`.`gothra` AS `gothra`,`icc`.`devotee`.`asrama-master-id` AS `asrama-master-id`,`icc`.`devotee`.`created-on` AS `created-on`,`icc`.`devotee`.`updated-on` AS `updated-on`,`icc`.`devotee`.`created-by` AS `created-by`,`icc`.`devotee`.`updated-by` AS `updated-by`,`icc`.`devotee`.`profession-id` AS `profession-id`,`icc`.`devotee`.`physical-address-id` AS `physical-address-id`,`icc`.`devotee`.`mobile-no` AS `mobile-no`,`icc`.`devotee`.`landline-no` AS `landline-no`,`icc`.`devotee`.`day-month-of-birth` AS `day-month-of-birth`,`icc`.`devotee`.`unique-id` AS `unique-id` from `icc`.`devotee` where `icc`.`devotee`.`id` in (select `icc`.`service-role-mapping`.`principal-id` from `icc`.`service-role-mapping` where `icc`.`service-role-mapping`.`role-id` in (select `icc`.`service-role`.`id` from `icc`.`service-role` where (`icc`.`service-role`.`name` = 'ICC Council')));
>>>>>>> development

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
