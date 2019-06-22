SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `DataBase` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;

CREATE TABLE IF NOT EXISTS `DataBase`.`Profile` (
  `ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `LOGIN` VARCHAR(45) NOT NULL,
  `PASSWORD` VARCHAR(45) NOT NULL,
  `State_ID` INT(10) UNSIGNED NOT NULL,
  `ContactInformation_ID` INT(10) UNSIGNED NOT NULL,
  `Category_ID` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`ID`, `State_ID`, `ContactInformation_ID`, `Category_ID`),
  INDEX `fk_Profile_State_idx` (`State_ID` ASC),
  INDEX `fk_Profile_ContactInformation1_idx` (`ContactInformation_ID` ASC),
  INDEX `fk_Profile_Category1_idx` (`Category_ID` ASC),
  CONSTRAINT `fk_Profile_State`
    FOREIGN KEY (`State_ID`)
    REFERENCES `DataBase`.`State` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Profile_ContactInformation1`
    FOREIGN KEY (`ContactInformation_ID`)
    REFERENCES `DataBase`.`ContactInformation` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Profile_Category1`
    FOREIGN KEY (`Category_ID`)
    REFERENCES `DataBase`.`Category` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `DataBase`.`ContactInformation` (
  `ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `TELEPHONE` INT(11) NOT NULL,
  `EMAIL` VARCHAR(45) NOT NULL,
  `ADRESS` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `DataBase`.`Category` (
  `ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `CATEGORY` ENUM('Administrator','Client','Storeman', 'Courier') NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `DataBase`.`State` (
  `ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `STATE` ENUM('Active', 'Nonactive', 'Banned', 'Unbanned') NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `DataBase`.`OrderList` (
  `ID` INT(10) UNSIGNED NULL DEFAULT NULL AUTO_INCREMENT,
  `OrderListcol` VARCHAR(45) NULL DEFAULT NULL,
  `Profile_ID` INT(10) UNSIGNED NOT NULL,
  `Order_ID` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`ID`, `Profile_ID`, `Order_ID`),
  INDEX `fk_OrderList_Profile1_idx` (`Profile_ID` ASC),
  INDEX `fk_OrderList_Order1_idx` (`Order_ID` ASC),
  CONSTRAINT `fk_OrderList_Profile1`
    FOREIGN KEY (`Profile_ID`)
    REFERENCES `DataBase`.`Profile` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrderList_Order1`
    FOREIGN KEY (`Order_ID`)
    REFERENCES `DataBase`.`Order` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `DataBase`.`Order` (
  `ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Act_ID` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`ID`, `Act_ID`),
  INDEX `fk_Order_Act1_idx` (`Act_ID` ASC),
  CONSTRAINT `fk_Order_Act1`
    FOREIGN KEY (`Act_ID`)
    REFERENCES `DataBase`.`Act` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `DataBase`.`Act` (
  `ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `DATE` DATE NOT NULL,
  `Act_ID` INT(10) UNSIGNED NOT NULL,
  `StateOfOrder_ID` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`ID`, `Act_ID`, `StateOfOrder_ID`),
  INDEX `fk_Act_Act1_idx` (`Act_ID` ASC),
  INDEX `fk_Act_StateOfOrder1_idx` (`StateOfOrder_ID` ASC),
  CONSTRAINT `fk_Act_Act1`
    FOREIGN KEY (`Act_ID`)
    REFERENCES `DataBase`.`Act` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Act_StateOfOrder1`
    FOREIGN KEY (`StateOfOrder_ID`)
    REFERENCES `DataBase`.`StateOfOrder` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `DataBase`.`StateOfOrder` (
  `ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `StateOfOrdercol` ENUM('processing','canceled','completed') NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `DataBase`.`Goods` (
  `ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `NUMBEROFGOODS` INT(11) NOT NULL,
  `MARKOFGOODS` TINYINT(4) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `DataBase`.`Comment` (
  `ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `COMMENT` MEDIUMTEXT NOT NULL,
  `Goods_ID` INT(10) UNSIGNED NOT NULL,
  `Profile_ID` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`ID`, `Goods_ID`, `Profile_ID`),
  INDEX `fk_Comment_Goods1_idx` (`Goods_ID` ASC),
  INDEX `fk_Comment_Profile1_idx` (`Profile_ID` ASC),
  CONSTRAINT `fk_Comment_Goods1`
    FOREIGN KEY (`Goods_ID`)
    REFERENCES `DataBase`.`Goods` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comment_Profile1`
    FOREIGN KEY (`Profile_ID`)
    REFERENCES `DataBase`.`Profile` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `DataBase`.`Position` (
  `ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `COUNT` INT(11) NULL DEFAULT NULL,
  `Order_ID` INT(10) UNSIGNED NOT NULL,
  `Goods_ID` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`ID`, `Order_ID`, `Goods_ID`),
  INDEX `fk_Position_Order1_idx` (`Order_ID` ASC),
  INDEX `fk_Position_Goods1_idx` (`Goods_ID` ASC),
  CONSTRAINT `fk_Position_Order1`
    FOREIGN KEY (`Order_ID`)
    REFERENCES `DataBase`.`Order` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Position_Goods1`
    FOREIGN KEY (`Goods_ID`)
    REFERENCES `DataBase`.`Goods` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `DataBase`.`Catalog` (
  `ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `DataBase`.`Catalog_has_Goods` (
  `ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Goods_ID` INT(10) UNSIGNED NOT NULL,
  `Catalog_ID` INT(10) UNSIGNED NOT NULL,
  `Share_ID` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`ID`, `Goods_ID`, `Catalog_ID`, `Share_ID`),
  INDEX `fk_Catalog_has_Goods_Goods1_idx` (`Goods_ID` ASC),
  INDEX `fk_Catalog_has_Goods_Catalog1_idx` (`Catalog_ID` ASC),
  UNIQUE INDEX `Goods_ID_UNIQUE` (`Goods_ID` ASC),
  INDEX `fk_Catalog_has_Goods_Share1_idx` (`Share_ID` ASC),
  CONSTRAINT `fk_Catalog_has_Goods_Catalog1`
    FOREIGN KEY (`Catalog_ID`)
    REFERENCES `DataBase`.`Catalog` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Catalog_has_Goods_Goods1`
    FOREIGN KEY (`Goods_ID`)
    REFERENCES `DataBase`.`Goods` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Catalog_has_Goods_Share1`
    FOREIGN KEY (`Share_ID`)
    REFERENCES `DataBase`.`Share` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `DataBase`.`Catalog_has_Catalog` (
  `ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Catalog_ID` INT(10) UNSIGNED NOT NULL,
  `Catalog_ID1` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`ID`, `Catalog_ID`, `Catalog_ID1`),
  INDEX `fk_Catalog_has_Catalog_Catalog2_idx` (`Catalog_ID1` ASC),
  INDEX `fk_Catalog_has_Catalog_Catalog1_idx` (`Catalog_ID` ASC),
  UNIQUE INDEX `Catalog_ID1_UNIQUE` (`Catalog_ID1` ASC),
  CONSTRAINT `fk_Catalog_has_Catalog_Catalog1`
    FOREIGN KEY (`Catalog_ID`)
    REFERENCES `DataBase`.`Catalog` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Catalog_has_Catalog_Catalog2`
    FOREIGN KEY (`Catalog_ID1`)
    REFERENCES `DataBase`.`Catalog` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `DataBase`.`Share` (
  `ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `STATUS` ENUM('Active','Nonactive') NULL DEFAULT NULL,
  `DISCOUNT` TINYINT(3) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `DataBase`.`Description` (
  `ID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `NAME` VARCHAR(45) NOT NULL,
  `COMMENT` TEXT NOT NULL,
  `MAKER` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `DataBase`.`Goods_has_Description` (
  `Goods_ID` INT(10) UNSIGNED NOT NULL,
  `Description_ID` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`Goods_ID`, `Description_ID`),
  INDEX `fk_Goods_has_Description_Description1_idx` (`Description_ID` ASC),
  INDEX `fk_Goods_has_Description_Goods1_idx` (`Goods_ID` ASC),
  CONSTRAINT `fk_Goods_has_Description_Goods1`
    FOREIGN KEY (`Goods_ID`)
    REFERENCES `DataBase`.`Goods` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Goods_has_Description_Description1`
    FOREIGN KEY (`Description_ID`)
    REFERENCES `DataBase`.`Description` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
