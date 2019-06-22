SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `db` ;

-- -----------------------------------------------------
-- Table `db`.`CategoryUsers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db`.`CategoryUsers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db`.`User` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `photo` BINARY NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_category1_idx` (`category_id` ASC),
  CONSTRAINT `fk_user_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `db`.`CategoryUsers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db`.`Contcacts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db`.`Contcacts` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `contact` VARCHAR(45) NOT NULL,
  `comment` VARCHAR(45) NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_contcacts_user_idx` (`user_id` ASC),
  CONSTRAINT `fk_contcacts_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `db`.`User` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db`.`PlaceOfWork`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db`.`PlaceOfWork` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `work` VARCHAR(45) NOT NULL,
  `comment` VARCHAR(45) NULL,
  `User_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_placeOfWork_user1_idx` (`User_id` ASC),
  CONSTRAINT `fk_placeOfWork_user1`
    FOREIGN KEY (`User_id`)
    REFERENCES `db`.`User` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db`.`groupOfExperts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db`.`groupOfExperts` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Director_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_groupOfExperts_User1_idx` (`Director_id` ASC),
  CONSTRAINT `fk_groupOfExperts_User1`
    FOREIGN KEY (`Director_id`)
    REFERENCES `db`.`User` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db`.`Consists`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db`.`Consists` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `User_id` INT NOT NULL,
  `groupOfExperts_id` INT NOT NULL,
  INDEX `fk_Consists_User1_idx` (`User_id` ASC),
  PRIMARY KEY (`id`),
  INDEX `fk_Consists_groupOfExperts1_idx` (`groupOfExperts_id` ASC),
  CONSTRAINT `fk_Consists_User1`
    FOREIGN KEY (`User_id`)
    REFERENCES `db`.`User` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Consists_groupOfExperts1`
    FOREIGN KEY (`groupOfExperts_id`)
    REFERENCES `db`.`groupOfExperts` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db`.`Test`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db`.`Test` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `comment` VARCHAR(45) NULL,
  `Author_id` INT NOT NULL,
  `task` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Test_User1_idx` (`Author_id` ASC),
  CONSTRAINT `fk_Test_User1`
    FOREIGN KEY (`Author_id`)
    REFERENCES `db`.`User` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db`.`units`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db`.`units` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `comment` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db`.`ResurseType`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db`.`ResurseType` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `units_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ResurseType_units1_idx` (`units_id` ASC),
  CONSTRAINT `fk_ResurseType_units1`
    FOREIGN KEY (`units_id`)
    REFERENCES `db`.`units` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db`.`Request`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db`.`Request` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `comment` VARCHAR(45) NULL,
  `content` VARCHAR(45) NOT NULL,
  `User_id` INT NOT NULL,
  `ResurseType_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Request_User1_idx` (`User_id` ASC),
  INDEX `fk_Request_ResurseType1_idx` (`ResurseType_id` ASC),
  CONSTRAINT `fk_Request_User1`
    FOREIGN KEY (`User_id`)
    REFERENCES `db`.`User` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Request_ResurseType1`
    FOREIGN KEY (`ResurseType_id`)
    REFERENCES `db`.`ResurseType` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db`.`ResultTest`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db`.`ResultTest` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `result` VARCHAR(45) NOT NULL,
  `comment` VARCHAR(45) NULL,
  `Test_id` INT NOT NULL,
  `Request_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ResultTest_Test1_idx` (`Test_id` ASC),
  INDEX `fk_ResultTest_Request1_idx` (`Request_id` ASC),
  CONSTRAINT `fk_ResultTest_Test1`
    FOREIGN KEY (`Test_id`)
    REFERENCES `db`.`Test` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ResultTest_Request1`
    FOREIGN KEY (`Request_id`)
    REFERENCES `db`.`Request` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db`.`Resurse`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db`.`Resurse` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `comment` VARCHAR(45) NULL,
  `ResurseType_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Resurse_ResurseType1_idx` (`ResurseType_id` ASC),
  CONSTRAINT `fk_Resurse_ResurseType1`
    FOREIGN KEY (`ResurseType_id`)
    REFERENCES `db`.`ResurseType` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db`.`Task`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db`.`Task` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `criterion` VARCHAR(45) NULL,
  `analysisTime` DATE NULL,
  `ParentTask_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Task_Task1_idx` (`ParentTask_id` ASC),
  CONSTRAINT `fk_Task_Task1`
    FOREIGN KEY (`ParentTask_id`)
    REFERENCES `db`.`Task` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db`.`ResurseUse`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db`.`ResurseUse` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `target` VARCHAR(45) NULL,
  `count` VARCHAR(45) NULL,
  `Resurse_id` INT NOT NULL,
  `Task_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ResurseUse_Resurse1_idx` (`Resurse_id` ASC),
  INDEX `fk_ResurseUse_Task1_idx` (`Task_id` ASC),
  CONSTRAINT `fk_ResurseUse_Resurse1`
    FOREIGN KEY (`Resurse_id`)
    REFERENCES `db`.`Resurse` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ResurseUse_Task1`
    FOREIGN KEY (`Task_id`)
    REFERENCES `db`.`Task` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `db` ;

-- -----------------------------------------------------
-- procedure routine1
-- -----------------------------------------------------

DELIMITER $$
USE `db`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `routine1`()
BEGIN

END$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
