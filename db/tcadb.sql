SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `tcadb2013` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `tcadb2013` ;

-- -----------------------------------------------------
-- Table `tcadb2013`.`grupo`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `tcadb2013`.`grupo` (
  `idgrupo` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(50) NULL ,
  `descripcion` LONGTEXT NULL ,
  PRIMARY KEY (`idgrupo`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tcadb2013`.`usuarios`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `tcadb2013`.`usuarios` (
  `idusuario` INT NOT NULL AUTO_INCREMENT ,
  `usuario` VARCHAR(30) NULL ,
  `contraseña` VARCHAR(15) NULL ,
  `nombre` VARCHAR(50) NULL ,
  `apellido` VARCHAR(50) NULL ,
  `empresa` VARCHAR(70) NULL ,
  `direccion` VARCHAR(70) NULL ,
  `telefono` VARCHAR(13) NULL ,
  `email` VARCHAR(50) NULL ,
  `idgrupo` INT NOT NULL ,
  PRIMARY KEY (`idusuario`, `idgrupo`) ,
  INDEX `fk_usuarios_grupo_idx` (`idgrupo` ASC) ,
  CONSTRAINT `fk_usuarios_grupo`
    FOREIGN KEY (`idgrupo` )
    REFERENCES `tcadb2013`.`grupo` (`idgrupo` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tcadb2013`.`tipocontenido`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `tcadb2013`.`tipocontenido` (
  `idtipocont` INT NOT NULL AUTO_INCREMENT ,
  `descripcion` LONGTEXT NULL ,
  PRIMARY KEY (`idtipocont`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tcadb2013`.`contenido`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `tcadb2013`.`contenido` (
  `idcontenido` INT NOT NULL AUTO_INCREMENT ,
  `contenido` LONGTEXT NULL ,
  `fecha` DATETIME NULL ,
  `idgrupo` INT NOT NULL ,
  `idusuario` INT NOT NULL ,
  `idtipocont` INT NOT NULL ,
  PRIMARY KEY (`idcontenido`, `idgrupo`, `idusuario`, `idtipocont`) ,
  INDEX `fk_contenido_grupo1_idx` (`idgrupo` ASC) ,
  INDEX `fk_contenido_usuarios1_idx` (`idusuario` ASC) ,
  INDEX `fk_contenido_tipocontenido1_idx` (`idtipocont` ASC) ,
  CONSTRAINT `fk_contenido_grupo1`
    FOREIGN KEY (`idgrupo` )
    REFERENCES `tcadb2013`.`grupo` (`idgrupo` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_contenido_usuarios1`
    FOREIGN KEY (`idusuario` )
    REFERENCES `tcadb2013`.`usuarios` (`idusuario` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_contenido_tipocontenido1`
    FOREIGN KEY (`idtipocont` )
    REFERENCES `tcadb2013`.`tipocontenido` (`idtipocont` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `tcadb2013` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
