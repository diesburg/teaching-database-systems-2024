-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema student_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema student_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `student_db` DEFAULT CHARACTER SET utf8 ;
USE `student_db` ;

-- -----------------------------------------------------
-- Table `Student`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Student` ;

CREATE TABLE IF NOT EXISTS `Student` (
  `Student_ID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`Student_ID`)
  `Student_First_Name` VARCHAR(50),
  `Student_Last_Name` VARCHAR(50)
  )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Class`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Class` ;

CREATE TABLE IF NOT EXISTS `Class` (
  `Class_ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Class_ID`)
  `Class_UNI_ID` VARCHAR(50),
  `Class_Semester` VARCHAR(10),
  `Class_Year` VARCHAR(4)
  )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Student_Has_Class`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Student_Has_Class` ;

CREATE TABLE IF NOT EXISTS `Student_Has_Class` (
  `Student_ID` INT UNSIGNED NOT NULL,
  `Class_ID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`Student_ID`,`Class_ID`)
  `Grade` VARCHAR(2),
  `Percentage` DECIMAL(6,2),
  `Notes` VARCHAR(250),
  FOREIGN KEY (`Student_ID`) references `Student` (`Student_ID`)
	ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  FOREIGN KEY (`class_ID`) references `Class` (`Class_ID`)
	ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  )
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
