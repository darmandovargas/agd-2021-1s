/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50542
 Source Host           : localhost:3306
 Source Schema         : agd_2021_1s_equipo

 Target Server Type    : MySQL
 Target Server Version : 50542
 File Encoding         : 65001

 Date: 17/05/2021 06:40:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for accidente
-- ----------------------------
DROP TABLE IF EXISTS `accidente`;
CREATE TABLE `accidente` (
  `id_accidente` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `ano` int(11) NOT NULL,
  `id_departamento` int(11) NOT NULL,
  `id_municipio` int(11) NOT NULL,
  `id_vehiculo` int(11) NOT NULL,
  `id_lesionado` int(11) NOT NULL,
  `id_objeto_colision` int(11) NOT NULL,
  PRIMARY KEY (`id_accidente`) USING BTREE,
  KEY `fk_accidente_objeto_colision_1` (`id_objeto_colision`),
  KEY `fk_accidente_departamento_1` (`id_departamento`),
  KEY `fk_accidente_lesionado_1` (`id_lesionado`),
  KEY `fk_accidente_municipio_1` (`id_municipio`),
  KEY `fk_accidente_vehiculo_1` (`id_vehiculo`),
  CONSTRAINT `fk_accidente_departamento_1` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_accidente_lesionado_1` FOREIGN KEY (`id_lesionado`) REFERENCES `lesionado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_accidente_municipio_1` FOREIGN KEY (`id_municipio`) REFERENCES `municipio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_accidente_objeto_colision_1` FOREIGN KEY (`id_objeto_colision`) REFERENCES `objeto_colision` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_accidente_vehiculo_1` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=124837 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for departamento
-- ----------------------------
DROP TABLE IF EXISTS `departamento`;
CREATE TABLE `departamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `codigo_departamento` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of departamento
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for lesionado
-- ----------------------------
DROP TABLE IF EXISTS `lesionado`;
CREATE TABLE `lesionado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rango_edad` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for municipio
-- ----------------------------
DROP TABLE IF EXISTS `municipio`;
CREATE TABLE `municipio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_municipio` varchar(5) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `id_departamento` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_municipio_id_departamento_1` (`id_departamento`)
) ENGINE=InnoDB AUTO_INCREMENT=970 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for objeto_colision
-- ----------------------------
DROP TABLE IF EXISTS `objeto_colision`;
CREATE TABLE `objeto_colision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tipo_vehiculo
-- ----------------------------
DROP TABLE IF EXISTS `tipo_vehiculo`;
CREATE TABLE `tipo_vehiculo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for objeto_colision
-- ----------------------------
DROP TABLE IF EXISTS `objeto_colision`;
CREATE TABLE `objeto_colision` (
  `id_objeto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tipo_vehiculo
-- ----------------------------
DROP TABLE IF EXISTS `tipo_vehiculo`;
CREATE TABLE `tipo_vehiculo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for vehiculo
-- ----------------------------
DROP TABLE IF EXISTS `vehiculo`;
CREATE TABLE `vehiculo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `id_tipo_de_vehiculo` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_vehiculo_tipo_vehiculo_1` (`id_tipo_de_vehiculo`),
  CONSTRAINT `fk_vehiculo_tipo_vehiculo_1` FOREIGN KEY (`id_tipo_de_vehiculo`) REFERENCES `tipo_vehiculo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

SET FOREIGN_KEY_CHECKS = 1;
