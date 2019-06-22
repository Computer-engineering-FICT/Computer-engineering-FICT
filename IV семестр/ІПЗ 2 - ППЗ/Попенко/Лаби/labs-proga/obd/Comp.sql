-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema obd
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `obd` ;

-- -----------------------------------------------------
-- Schema obd
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `obd` DEFAULT CHARACTER SET utf8 ;
USE `obd` ;

-- -----------------------------------------------------
-- Table `obd`.`users_categ`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `obd`.`users_categ` ;

CREATE TABLE IF NOT EXISTS `obd`.`users_categ` (
  `users_categ_id` INT NOT NULL,
  `category` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`users_categ_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `obd`.`profile`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `obd`.`profile` ;

CREATE TABLE IF NOT EXISTS `obd`.`profile` (
  `profile_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `photo` VARCHAR(45) NULL,
  `e-mail` VARCHAR(45) NULL,
  `contacts` VARCHAR(45) NOT NULL,
  `users_categ_id` INT NOT NULL,
  PRIMARY KEY (`profile_id`),
  CONSTRAINT `fk_Profile_Users category`
    FOREIGN KEY (`users_categ_id`)
    REFERENCES `obd`.`users_categ` (`users_categ_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Profile_Users category_idx` ON `obd`.`profile` (`users_categ_id` ASC);


-- -----------------------------------------------------
-- Table `obd`.`competition`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `obd`.`competition` ;

CREATE TABLE IF NOT EXISTS `obd`.`competition` (
  `competition_id` INT NOT NULL,
  `place` VARCHAR(45) NOT NULL,
  `date` DATETIME NOT NULL,
  `description` TEXT NULL,
  `rewarding` LONGTEXT NULL,
  PRIMARY KEY (`competition_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `obd`.`app_for_particip`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `obd`.`app_for_particip` ;

CREATE TABLE IF NOT EXISTS `obd`.`app_for_particip` (
  `app_for_particip` INT NOT NULL,
  `date` DATE NOT NULL,
  `result` INT NULL,
  `competition_id` INT NOT NULL,
  `users_category_id` INT NOT NULL,
  `profile_id` INT NOT NULL,
  PRIMARY KEY (`app_for_particip`),
  CONSTRAINT `fk_Application for participation_Competition1`
    FOREIGN KEY (`competition_id`)
    REFERENCES `obd`.`competition` (`competition_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Application for participation_Users category1`
    FOREIGN KEY (`users_category_id`)
    REFERENCES `obd`.`users_categ` (`users_categ_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Application for participation_Profile1`
    FOREIGN KEY (`profile_id`)
    REFERENCES `obd`.`profile` (`profile_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Application for participation_Competition1_idx` ON `obd`.`app_for_particip` (`competition_id` ASC);

CREATE INDEX `fk_Application for participation_Users category1_idx` ON `obd`.`app_for_particip` (`users_category_id` ASC);

CREATE INDEX `fk_Application for participation_Profile1_idx` ON `obd`.`app_for_particip` (`profile_id` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `obd`.`users_categ`
-- -----------------------------------------------------
START TRANSACTION;
USE `obd`;
INSERT INTO `obd`.`users_categ` (`users_categ_id`, `category`) VALUES (1, 'participant');
INSERT INTO `obd`.`users_categ` (`users_categ_id`, `category`) VALUES (2, 'judge');
INSERT INTO `obd`.`users_categ` (`users_categ_id`, `category`) VALUES (3, 'guest');
INSERT INTO `obd`.`users_categ` (`users_categ_id`, `category`) VALUES (4, 'organizer');

COMMIT;


-- -----------------------------------------------------
-- Data for table `obd`.`profile`
-- -----------------------------------------------------
START TRANSACTION;
USE `obd`;
INSERT INTO `obd`.`profile` (`profile_id`, `name`, `photo`, `e-mail`, `contacts`, `users_categ_id`) VALUES (1, 'Pavluchkov Vlad', NULL, NULL, '0981223425', 1);
INSERT INTO `obd`.`profile` (`profile_id`, `name`, `photo`, `e-mail`, `contacts`, `users_categ_id`) VALUES (2, 'Zmeul Evgeniy', NULL, NULL, '0671234569', 2);
INSERT INTO `obd`.`profile` (`profile_id`, `name`, `photo`, `e-mail`, `contacts`, `users_categ_id`) VALUES (3, 'Morozov Maks', NULL, NULL, '0671234565', 3);
INSERT INTO `obd`.`profile` (`profile_id`, `name`, `photo`, `e-mail`, `contacts`, `users_categ_id`) VALUES (4, 'Popenko Ruslan', NULL, NULL, '0984582499', 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `obd`.`competition`
-- -----------------------------------------------------
START TRANSACTION;
USE `obd`;
INSERT INTO `obd`.`competition` (`competition_id`, `place`, `date`, `description`, `rewarding`) VALUES (1, 'Stadium Start', '2014-11-15 19:00:00', NULL, NULL);
INSERT INTO `obd`.`competition` (`competition_id`, `place`, `date`, `description`, `rewarding`) VALUES (2, 'Metro Gidropark bus station', '2014-11-19 19:00:00', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `obd`.`app_for_particip`
-- -----------------------------------------------------
START TRANSACTION;
USE `obd`;
INSERT INTO `obd`.`app_for_particip` (`app_for_particip`, `date`, `result`, `competition_id`, `users_category_id`, `profile_id`) VALUES (1, '2014-11-15', NULL, 1, 1, 1);
INSERT INTO `obd`.`app_for_particip` (`app_for_particip`, `date`, `result`, `competition_id`, `users_category_id`, `profile_id`) VALUES (2, '2014-11-19', NULL, 2, 1, 1);
INSERT INTO `obd`.`app_for_particip` (`app_for_particip`, `date`, `result`, `competition_id`, `users_category_id`, `profile_id`) VALUES (3, '2014-11-15', NULL, 1, 2, 2);
INSERT INTO `obd`.`app_for_particip` (`app_for_particip`, `date`, `result`, `competition_id`, `users_category_id`, `profile_id`) VALUES (4, '2014-11-19', NULL, 2, 2, 2);
INSERT INTO `obd`.`app_for_particip` (`app_for_particip`, `date`, `result`, `competition_id`, `users_category_id`, `profile_id`) VALUES (5, '2014-11-15', NULL, 1, 3, 3);
INSERT INTO `obd`.`app_for_particip` (`app_for_particip`, `date`, `result`, `competition_id`, `users_category_id`, `profile_id`) VALUES (6, '2014-11-19', NULL, 2, 3, 3);
INSERT INTO `obd`.`app_for_particip` (`app_for_particip`, `date`, `result`, `competition_id`, `users_category_id`, `profile_id`) VALUES (7, '2014-11-15', NULL, 1, 4, 4);
INSERT INTO `obd`.`app_for_particip` (`app_for_particip`, `date`, `result`, `competition_id`, `users_category_id`, `profile_id`) VALUES (8, '2014-11-19', NULL, 2, 4, 4);

COMMIT;

