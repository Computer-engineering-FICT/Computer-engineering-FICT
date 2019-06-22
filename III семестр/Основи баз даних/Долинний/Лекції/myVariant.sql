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
-- Table `mydb`.`SomeTable`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`SomeTable` (
  `idSomeTable` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idSomeTable`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Foren`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Foren` (
  `idForen` INT NOT NULL AUTO_INCREMENT,
  `SomeTable_idSomeTable` INT NOT NULL,
  PRIMARY KEY (`idForen`),
  INDEX `fk_Foren_SomeTable_idx` (`SomeTable_idSomeTable` ASC),
  CONSTRAINT `fk_Foren_SomeTable`
    FOREIGN KEY (`SomeTable_idSomeTable`)
    REFERENCES `mydb`.`SomeTable` (`idSomeTable`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Product` (
  `idProduct` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `price` INT NULL,
  PRIMARY KEY (`idProduct`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Catalog`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Catalog` (
  `idCatalog` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `Product_idProduct` INT NOT NULL,
  `Catalog_idCatalog` INT NOT NULL,
  PRIMARY KEY (`idCatalog`),
  INDEX `fk_Catalog_Product1_idx` (`Product_idProduct` ASC),
  INDEX `fk_Catalog_Catalog1_idx` (`Catalog_idCatalog` ASC),
  CONSTRAINT `fk_Catalog_Product1`
    FOREIGN KEY (`Product_idProduct`)
    REFERENCES `mydb`.`Product` (`idProduct`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Catalog_Catalog1`
    FOREIGN KEY (`Catalog_idCatalog`)
    REFERENCES `mydb`.`Catalog` (`idCatalog`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Orders` (
  `idOrders` INT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NOT NULL,
  PRIMARY KEY (`idOrders`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Position`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Position` (
  `idPosition` INT NOT NULL AUTO_INCREMENT,
  `count` INT NOT NULL,
  `Product_idProduct` INT NOT NULL,
  `Orders_idOrders` INT NOT NULL,
  PRIMARY KEY (`idPosition`),
  INDEX `fk_Position_Product1_idx` (`Product_idProduct` ASC),
  INDEX `fk_Position_Orders1_idx` (`Orders_idOrders` ASC),
  CONSTRAINT `fk_Position_Product1`
    FOREIGN KEY (`Product_idProduct`)
    REFERENCES `mydb`.`Product` (`idProduct`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Position_Orders1`
    FOREIGN KEY (`Orders_idOrders`)
    REFERENCES `mydb`.`Orders` (`idOrders`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
