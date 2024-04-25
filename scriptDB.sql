-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema primavera
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `primavera` ;

-- -----------------------------------------------------
-- Schema primavera
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `primavera` DEFAULT CHARACTER SET utf8 ;
USE `primavera` ;

-- -----------------------------------------------------
-- Table `primavera`.`Profesores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `primavera`.`Profesores` (
  `idProfesor` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idProfesor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `primavera`.`Cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `primavera`.`Cursos` (
  `idCurso` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `idProfesor` INT NOT NULL,
  PRIMARY KEY (`idCurso`),
  INDEX `fk_Cursos_Profesores_idx` (`idProfesor` ASC) VISIBLE,
  CONSTRAINT `fk_Cursos_Profesores`
    FOREIGN KEY (`idProfesor`)
    REFERENCES `primavera`.`Profesores` (`idProfesor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `primavera`.`Alumnos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `primavera`.`Alumnos` (
  `idAlumno` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `nacimiento` DATETIME NOT NULL,
  `idCurso` INT NOT NULL,
  PRIMARY KEY (`idAlumno`),
  INDEX `fk_Alumnos_Cursos1_idx` (`idCurso` ASC) VISIBLE,
  CONSTRAINT `fk_Alumnos_Cursos1`
    FOREIGN KEY (`idCurso`)
    REFERENCES `primavera`.`Cursos` (`idCurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
