-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`UserCategory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`UserCategory` (
  `idCategory` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(3) NOT NULL,
  PRIMARY KEY (`idCategory`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Profile`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Profile` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(3) NOT NULL,
  `password` VARCHAR(3) NOT NULL,
  `contacts` VARCHAR(3) NOT NULL,
  `photo` MEDIUMBLOB NULL,
  `state` TINYINT(1) NOT NULL,
  `info` VARCHAR(3) NULL,
  `e-mail` VARCHAR(3) NOT NULL,
  `UserCategory_idCategory` INT NOT NULL,
  PRIMARY KEY (`id`, `UserCategory_idCategory`),
  UNIQUE INDEX `login_UNIQUE` (`login` ASC),
  UNIQUE INDEX `contacts_UNIQUE` (`contacts` ASC),
  UNIQUE INDEX `e-mail_UNIQUE` (`e-mail` ASC),
  INDEX `fk_Profile_UserCategory1_idx` (`UserCategory_idCategory` ASC),
  CONSTRAINT `fk_Profile_UserCategory1`
    FOREIGN KEY (`UserCategory_idCategory`)
    REFERENCES `mydb`.`UserCategory` (`idCategory`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Deal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Deal` (
  `idDeal` INT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NOT NULL,
  `Profile_id` INT NOT NULL,
  `Profile_UserCategory_idCategory` INT NOT NULL,
  PRIMARY KEY (`idDeal`),
  INDEX `fk_Deal_Profile1_idx` (`Profile_id` ASC, `Profile_UserCategory_idCategory` ASC),
  CONSTRAINT `fk_Deal_Profile1`
    FOREIGN KEY (`Profile_id` , `Profile_UserCategory_idCategory`)
    REFERENCES `mydb`.`Profile` (`id` , `UserCategory_idCategory`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ApplicationCategory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ApplicationCategory` (
  `idApplicationCategory` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idApplicationCategory`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ApplicationType`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ApplicationType` (
  `idApplicationType` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idApplicationType`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Application`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Application` (
  `idApplication` INT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NOT NULL,
  `description` VARCHAR(3) NOT NULL,
  `Deal_idDeal` INT NOT NULL,
  `ApplicationCategory_idApplicationCategory` INT NOT NULL,
  `ApplicationType_idApplicationType` INT NOT NULL,
  PRIMARY KEY (`idApplication`),
  INDEX `fk_Application_Deal1_idx` (`Deal_idDeal` ASC),
  INDEX `fk_Application_ApplicationCategory1_idx` (`ApplicationCategory_idApplicationCategory` ASC),
  INDEX `fk_Application_ApplicationType1_idx` (`ApplicationType_idApplicationType` ASC),
  CONSTRAINT `fk_Application_Deal1`
    FOREIGN KEY (`Deal_idDeal`)
    REFERENCES `mydb`.`Deal` (`idDeal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Application_ApplicationCategory1`
    FOREIGN KEY (`ApplicationCategory_idApplicationCategory`)
    REFERENCES `mydb`.`ApplicationCategory` (`idApplicationCategory`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Application_ApplicationType1`
    FOREIGN KEY (`ApplicationType_idApplicationType`)
    REFERENCES `mydb`.`ApplicationType` (`idApplicationType`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ApplicationPhoto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ApplicationPhoto` (
  `idApplicationPhoto` INT NOT NULL AUTO_INCREMENT,
  `url` VARCHAR(45) NULL,
  `Application_idApplication` INT NOT NULL,
  PRIMARY KEY (`idApplicationPhoto`, `Application_idApplication`),
  INDEX `fk_ApplicationPhoto_Application1_idx` (`Application_idApplication` ASC),
  CONSTRAINT `fk_ApplicationPhoto_Application1`
    FOREIGN KEY (`Application_idApplication`)
    REFERENCES `mydb`.`Application` (`idApplication`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Commentary`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Commentary` (
  `idCommentary` INT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NOT NULL,
  `rating` INT NOT NULL,
  `text` VARCHAR(3) NOT NULL,
  `Profile_id` INT NOT NULL,
  `Profile_UserCategory_idCategory` INT NOT NULL,
  `Deal_idDeal` INT NOT NULL,
  PRIMARY KEY (`idCommentary`),
  INDEX `fk_Commentary_Profile1_idx` (`Profile_id` ASC, `Profile_UserCategory_idCategory` ASC),
  INDEX `fk_Commentary_Deal1_idx` (`Deal_idDeal` ASC),
  CONSTRAINT `fk_Commentary_Profile1`
    FOREIGN KEY (`Profile_id` , `Profile_UserCategory_idCategory`)
    REFERENCES `mydb`.`Profile` (`id` , `UserCategory_idCategory`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Commentary_Deal1`
    FOREIGN KEY (`Deal_idDeal`)
    REFERENCES `mydb`.`Deal` (`idDeal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Decision`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Decision` (
  `idDecision` INT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NOT NULL,
  `commentary` VARCHAR(3) NULL,
  `Profile_id` INT NOT NULL,
  `Application_idApplication` INT NOT NULL,
  PRIMARY KEY (`idDecision`, `Profile_id`),
  INDEX `fk_Decision_Profile_idx` (`Profile_id` ASC),
  INDEX `fk_Decision_Application1_idx` (`Application_idApplication` ASC),
  CONSTRAINT `fk_Decision_Profile`
    FOREIGN KEY (`Profile_id`)
    REFERENCES `mydb`.`Profile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Decision_Application1`
    FOREIGN KEY (`Application_idApplication`)
    REFERENCES `mydb`.`Application` (`idApplication`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
