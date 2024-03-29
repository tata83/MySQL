-- MySQL Script generated by MySQL Workbench
-- Sun Jun 18 20:17:38 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema senacrs05
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema senacrs05
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `senacrs05` DEFAULT CHARACTER SET utf8mb4 ;
USE `senacrs05` ;

-- -----------------------------------------------------
-- Table `senacrs05`.`fabrica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `senacrs05`.`fabrica` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo_montagem` VARCHAR(45) NULL,
  `distribuidora` VARCHAR(45) NULL,
  `data_inicio` DATETIME NULL,
  `data_termino` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `senacrs05`.`carro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `senacrs05`.`carro` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fabrica_id` INT NOT NULL,
  `nome_carro` VARCHAR(255) NULL,
  `tipo_carro` VARCHAR(45) NULL,
  `placa` VARCHAR(7) NULL,
  PRIMARY KEY (`id`, `fabrica_id`),
  INDEX `fk_carro_fabrica_idx` (`fabrica_id` ASC) VISIBLE,
  CONSTRAINT `fk_carro_fabrica`
    FOREIGN KEY (`fabrica_id`)
    REFERENCES `senacrs05`.`fabrica` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `senacrs05`.`funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `senacrs05`.`funcionario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NULL,
  `cpf` VARCHAR(11) NULL,
  `ctps` VARCHAR(11) NULL,
  `tipo_funcionario` CHAR(1) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `senacrs05`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `senacrs05`.`cliente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NULL,
  `cpf` VARCHAR(11) NULL,
  `data_nascimento` DATE NULL,
  `rg` VARCHAR(9) NULL,
  `telefone` VARCHAR(11) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `senacrs05`.`venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `senacrs05`.`venda` (
  `id` INT NOT NULL,
  `carro_id` INT NOT NULL,
  `funcionario_id` INT NOT NULL,
  `cliente_id` INT NOT NULL,
  `forma_pagamento` CHAR(1) NULL,
  `data_venda` DATETIME NULL,
  `preco_carro` DECIMAL(9,2) NULL,
  PRIMARY KEY (`id`, `carro_id`, `funcionario_id`, `cliente_id`),
  INDEX `fk_venda_carro1_idx` (`carro_id` ASC) VISIBLE,
  INDEX `fk_venda_funcionario1_idx` (`funcionario_id` ASC) VISIBLE,
  INDEX `fk_venda_cliente1_idx` (`cliente_id` ASC) VISIBLE,
  CONSTRAINT `fk_venda_carro1`
    FOREIGN KEY (`carro_id`)
    REFERENCES `senacrs05`.`carro` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_venda_funcionario1`
    FOREIGN KEY (`funcionario_id`)
    REFERENCES `senacrs05`.`funcionario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_venda_cliente1`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `senacrs05`.`cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `senacrs05`.`fabrica`
-- -----------------------------------------------------
START TRANSACTION;
USE `senacrs05`;
INSERT INTO `senacrs05`.`fabrica` (`id`, `tipo_montagem`, `distribuidora`, `data_inicio`, `data_termino`) VALUES (1, 'Carro', 'Fiat', '2023-06-15', '2023-07-15');
INSERT INTO `senacrs05`.`fabrica` (`id`, `tipo_montagem`, `distribuidora`, `data_inicio`, `data_termino`) VALUES (2, 'Carro', 'Nissan', '2022-02-12', '2022-03-12');
INSERT INTO `senacrs05`.`fabrica` (`id`, `tipo_montagem`, `distribuidora`, `data_inicio`, `data_termino`) VALUES (3, 'Moto', 'Suzuki', '2021-05-22', '2021-06-22');
INSERT INTO `senacrs05`.`fabrica` (`id`, `tipo_montagem`, `distribuidora`, `data_inicio`, `data_termino`) VALUES (4, 'Moto', 'Honda', '2022-08-09', '2022-09-09');
INSERT INTO `senacrs05`.`fabrica` (`id`, `tipo_montagem`, `distribuidora`, `data_inicio`, `data_termino`) VALUES (5, 'Carro', 'Nissan', '2023-10-29', '2023-11-29');

COMMIT;


-- -----------------------------------------------------
-- Data for table `senacrs05`.`carro`
-- -----------------------------------------------------
START TRANSACTION;
USE `senacrs05`;
INSERT INTO `senacrs05`.`carro` (`id`, `fabrica_id`, `nome_carro`, `tipo_carro`, `placa`) VALUES (1, 1, 'Fiat Uno Firefly 1.0', 'Fiat Uno 1.0', 'LCC5170');
INSERT INTO `senacrs05`.`carro` (`id`, `fabrica_id`, `nome_carro`, `tipo_carro`, `placa`) VALUES (2, 3, 'Suzuki GSR 750A', 'Suzuki GSR', 'LCS8766');
INSERT INTO `senacrs05`.`carro` (`id`, `fabrica_id`, `nome_carro`, `tipo_carro`, `placa`) VALUES (3, 4, 'Honda CB 600F HORNET', 'Honda CB Hornet', 'LHD1285');
INSERT INTO `senacrs05`.`carro` (`id`, `fabrica_id`, `nome_carro`, `tipo_carro`, `placa`) VALUES (4, 2, 'Skyline R34 Turbo 320cv', 'Nissan Skyline R34 ', 'KXP0120');
INSERT INTO `senacrs05`.`carro` (`id`, `fabrica_id`, `nome_carro`, `tipo_carro`, `placa`) VALUES (5, 2, 'Frontier Platinium 190cv', 'Nissan Frontier Platinium', 'LUI7748');

COMMIT;


-- -----------------------------------------------------
-- Data for table `senacrs05`.`funcionario`
-- -----------------------------------------------------
START TRANSACTION;
USE `senacrs05`;
INSERT INTO `senacrs05`.`funcionario` (`id`, `nome`, `cpf`, `ctps`, `tipo_funcionario`) VALUES (1, 'Guilherme Miguel Murilo Alves', '21251853773', '64341297379', 'V');
INSERT INTO `senacrs05`.`funcionario` (`id`, `nome`, `cpf`, `ctps`, `tipo_funcionario`) VALUES (2, 'Kevin José Renato da Cruz', '52259505740', '01793355182', 'G');
INSERT INTO `senacrs05`.`funcionario` (`id`, `nome`, `cpf`, `ctps`, `tipo_funcionario`) VALUES (3, 'Alessandra Milena Julia Aragão', '14667483709', '19382712359', 'V');
INSERT INTO `senacrs05`.`funcionario` (`id`, `nome`, `cpf`, `ctps`, `tipo_funcionario`) VALUES (4, 'Kaique Carlos Eduardo Melo', '51783088753', '98683128419', 'V');
INSERT INTO `senacrs05`.`funcionario` (`id`, `nome`, `cpf`, `ctps`, `tipo_funcionario`) VALUES (5, 'Gabrielly Jaqueline Fátima Peixoto', '52413830774', '05246625750', 'V');
INSERT INTO `senacrs05`.`funcionario` (`id`, `nome`, `cpf`, `ctps`, `tipo_funcionario`) VALUES (6, 'Tiago Raul Edson Souza', '88905367720', '12389769030', 'G');
INSERT INTO `senacrs05`.`funcionario` (`id`, `nome`, `cpf`, `ctps`, `tipo_funcionario`) VALUES (7, 'Joana Marli Ramos', '50921426771', '11367097317', 'V');
INSERT INTO `senacrs05`.`funcionario` (`id`, `nome`, `cpf`, `ctps`, `tipo_funcionario`) VALUES (8, 'Yasmin Sophia Rafaela Lopes', '25909584715', '15811952671', 'V');

COMMIT;


-- -----------------------------------------------------
-- Data for table `senacrs05`.`cliente`
-- -----------------------------------------------------
START TRANSACTION;
USE `senacrs05`;
INSERT INTO `senacrs05`.`cliente` (`id`, `nome`, `cpf`, `data_nascimento`, `rg`, `telefone`) VALUES (1, 'Anderson Julio Ryan Bernardes', '70096455748', '1974-08-03', '200522875', '21939944822');
INSERT INTO `senacrs05`.`cliente` (`id`, `nome`, `cpf`, `data_nascimento`, `rg`, `telefone`) VALUES (2, 'Amanda Pietra Elza Pinto', '46123413767', '1967-05-04', '260054100', '21928125417');
INSERT INTO `senacrs05`.`cliente` (`id`, `nome`, `cpf`, `data_nascimento`, `rg`, `telefone`) VALUES (3, 'Vanessa Valentina Agatha Lopes', '78120256751', '1969-03-16', '398754032', '21928716687');
INSERT INTO `senacrs05`.`cliente` (`id`, `nome`, `cpf`, `data_nascimento`, `rg`, `telefone`) VALUES (4, 'Vitória Cristiane Andrea da Cruz', '02183184728', '2004-05-17', '455061245', '21927853653');
INSERT INTO `senacrs05`.`cliente` (`id`, `nome`, `cpf`, `data_nascimento`, `rg`, `telefone`) VALUES (5, 'Raquel Benedita Sales', '80519425740', '1971-01-05', '124917537', '24928841086');
INSERT INTO `senacrs05`.`cliente` (`id`, `nome`, `cpf`, `data_nascimento`, `rg`, `telefone`) VALUES (6, 'Caleb Vicente Corte Real', '18741610709', '1963-03-21', '194497276', '21998218206');
INSERT INTO `senacrs05`.`cliente` (`id`, `nome`, `cpf`, `data_nascimento`, `rg`, `telefone`) VALUES (7, 'Marcos Bernardo Tomás Pires', '70480514771', '1954-04-13', '169417396', '21989172685');
INSERT INTO `senacrs05`.`cliente` (`id`, `nome`, `cpf`, `data_nascimento`, `rg`, `telefone`) VALUES (8, 'Ana Bruna Milena Assis', '29820696798', '1977-08-04', '475684230', '21999951048');

COMMIT;


-- -----------------------------------------------------
-- Data for table `senacrs05`.`venda`
-- -----------------------------------------------------
START TRANSACTION;
USE `senacrs05`;
INSERT INTO `senacrs05`.`venda` (`id`, `carro_id`, `funcionario_id`, `cliente_id`, `forma_pagamento`, `data_venda`, `preco_carro`) VALUES (1, 1, 1, 3, 'D', '2023-03-23 11:23:10', 15000.00);
INSERT INTO `senacrs05`.`venda` (`id`, `carro_id`, `funcionario_id`, `cliente_id`, `forma_pagamento`, `data_venda`, `preco_carro`) VALUES (2, 4, 2, 4, 'C', '2023-05-14 03:02:10', 25000.00);
INSERT INTO `senacrs05`.`venda` (`id`, `carro_id`, `funcionario_id`, `cliente_id`, `forma_pagamento`, `data_venda`, `preco_carro`) VALUES (3, 4, 5, 2, 'D', '2023-04-03 14:30:45', 15000.00);
INSERT INTO `senacrs05`.`venda` (`id`, `carro_id`, `funcionario_id`, `cliente_id`, `forma_pagamento`, `data_venda`, `preco_carro`) VALUES (4, 3, 4, 6, 'D', '2023-06-09 20:45:23', 14000.00);
INSERT INTO `senacrs05`.`venda` (`id`, `carro_id`, `funcionario_id`, `cliente_id`, `forma_pagamento`, `data_venda`, `preco_carro`) VALUES (5, 1, 2, 5, 'C', '2023-05-25 17:15:15', 10000.00);
INSERT INTO `senacrs05`.`venda` (`id`, `carro_id`, `funcionario_id`, `cliente_id`, `forma_pagamento`, `data_venda`, `preco_carro`) VALUES (6, 5, 3, 7, 'C', '2023-01-03 11:45:02', 40000.00);
INSERT INTO `senacrs05`.`venda` (`id`, `carro_id`, `funcionario_id`, `cliente_id`, `forma_pagamento`, `data_venda`, `preco_carro`) VALUES (7, 4, 1, 2, 'C', '2023-02-01 23:02:05', 80000.00);
INSERT INTO `senacrs05`.`venda` (`id`, `carro_id`, `funcionario_id`, `cliente_id`, `forma_pagamento`, `data_venda`, `preco_carro`) VALUES (8, 3, 3, 8, 'D', '2023-01-30 10:09:03', 50000.00);

COMMIT;

