-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema er5mod1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema er5mod1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `er5mod1` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `er5mod1` ;

-- -----------------------------------------------------
-- Table `er5mod1`.`cityzip`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `er5mod1`.`cityzip` (
  `cityzip_id` INT NOT NULL COMMENT '',
  `cityzip_name` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`cityzip_id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `er5mod1`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `er5mod1`.`customer` (
  `customer_id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `customer_name` VARCHAR(45) NOT NULL COMMENT '',
  `c_contactName` VARCHAR(45) NOT NULL COMMENT '',
  `c_contactPhone` INT(8) NOT NULL COMMENT '',
  `cityzip_cityzip_id` INT NOT NULL COMMENT '',
  PRIMARY KEY (`customer_id`)  COMMENT '',
  INDEX `fk_customer_cityzip_idx` (`cityzip_cityzip_id` ASC)  COMMENT '',
  CONSTRAINT `fk_customer_cityzip`
    FOREIGN KEY (`cityzip_cityzip_id`)
    REFERENCES `er5mod1`.`cityzip` (`cityzip_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `er5mod1`.`project`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `er5mod1`.`project` (
  `project_id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `project_name` VARCHAR(45) NOT NULL COMMENT '',
  `project_description` TEXT NOT NULL COMMENT '',
  `p_otherDetails` TEXT NOT NULL COMMENT '',
  `customer_customer_id` INT NOT NULL COMMENT '',
  PRIMARY KEY (`project_id`, `customer_customer_id`)  COMMENT '',
  INDEX `fk_project_customer1_idx` (`customer_customer_id` ASC)  COMMENT '',
  CONSTRAINT `fk_project_customer1`
    FOREIGN KEY (`customer_customer_id`)
    REFERENCES `er5mod1`.`customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `er5mod1`.`resourcetype`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `er5mod1`.`resourcetype` (
  `resourcetype_id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `resourcetype_name` VARCHAR(45) NOT NULL COMMENT '',
  `resourcetype_code` INT NOT NULL COMMENT '',
  PRIMARY KEY (`resourcetype_id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `er5mod1`.`resource`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `er5mod1`.`resource` (
  `resource_id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `resource_name` VARCHAR(45) NOT NULL COMMENT '',
  `resource_otherDetails` TEXT NOT NULL COMMENT '',
  `resourcetype_resourcetype_id` INT NOT NULL COMMENT '',
  PRIMARY KEY (`resource_id`)  COMMENT '',
  INDEX `fk_resource_resourcetype1_idx` (`resourcetype_resourcetype_id` ASC)  COMMENT '',
  CONSTRAINT `fk_resource_resourcetype1`
    FOREIGN KEY (`resourcetype_resourcetype_id`)
    REFERENCES `er5mod1`.`resourcetype` (`resourcetype_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `er5mod1`.`project_has_resource`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `er5mod1`.`project_has_resource` (
  `project_project_id` INT NOT NULL COMMENT '',
  `resource_resource_id` INT NOT NULL COMMENT '',
  `startDate` DATETIME NOT NULL COMMENT '',
  `endDate` DATETIME NOT NULL COMMENT '',
  `hourlyUsageRate` DECIMAL(4,2) NOT NULL COMMENT '',
  PRIMARY KEY (`project_project_id`, `resource_resource_id`)  COMMENT '',
  INDEX `fk_project_has_resource_resource1_idx` (`resource_resource_id` ASC)  COMMENT '',
  INDEX `fk_project_has_resource_project1_idx` (`project_project_id` ASC)  COMMENT '',
  CONSTRAINT `fk_project_has_resource_project1`
    FOREIGN KEY (`project_project_id`)
    REFERENCES `er5mod1`.`project` (`project_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_project_has_resource_resource1`
    FOREIGN KEY (`resource_resource_id`)
    REFERENCES `er5mod1`.`resource` (`resource_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
