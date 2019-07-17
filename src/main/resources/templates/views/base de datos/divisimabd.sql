create database divisimabd;
use divisimabd;
CREATE TABLE brand (
  idbrand int(11) NOT NULL AUTO_INCREMENT,
  name varchar(100) DEFAULT NULL,
  PRIMARY KEY (idbrand)
) ;
use divisimabd;
CREATE TABLE category (
  idcategory int(11) NOT NULL AUTO_INCREMENT,
  name varchar(45) DEFAULT NULL,
  status int(11) DEFAULT NULL,
  parentid int(11) DEFAULT NULL,
  PRIMARY KEY (idcategory)
);
use divisimabd;
CREATE TABLE customer(
	idcustomer int(11) NOT NULL AUTO_INCREMENT,
    firstname varchar(45) DEFAULT NULL,
    lastname varchar(45) DEFAULT NULL,
    birthdate date DEFAULT NULL,
    address varchar(45) DEFAULT NULL,
    primary key (idcustomer)
);

use divisimabd;
CREATE TABLE product(
  idproduct int(11) NOT NULL,
  name varchar(100) NOT NULL,
  price decimal(18,2) NOT NULL,
  quantity int(11) NOT NULL,
  description varchar(500) DEFAULT NULL,
  urlimage varchar(100) DEFAULT NULL,
  feature tinyint(4) NOT NULL,
  idcategory int(11) NOT NULL,
  idcustomer int(11) NOT NULL,
  idbrand int(11) NOT NULL,
  PRIMARY KEY (idproduct),
  KEY fk_product_customer (idcustomer),
  KEY fk_product_brand (idbrand),
  KEY fk_product_category (idcategory),
  CONSTRAINT fk_product_brand FOREIGN KEY (idbrand) REFERENCES brand (idbrand) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_product_category FOREIGN KEY (idcategory) REFERENCES category (idcategory) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_product_customer FOREIGN KEY (idcustomer) REFERENCES customer (idcustomer) ON DELETE NO ACTION ON UPDATE NO ACTION);
use divisimabd;
CREATE TABLE pedido(
	idorder int(11) NOT NULL AUTO_INCREMENT,
    fecha date DEFAULT NULL,
    total int(11) DEFAULT NULL,
    estado tinyint(4) NOT NULL,
    idcuenta int(11) NOT NULL,
    primary key (idorder),
	KEY fk_pedido_cuenta (idcuenta),	
	CONSTRAINT fk_pedido_cuenta FOREIGN KEY (idcuenta) REFERENCES cuenta (idcuenta) ON DELETE NO ACTION ON UPDATE NO ACTION);
use divisimabd;
Create table detallepedido(
 idordersdetail int(11) NOT NULL AUTO_INCREMENT,
  idproduct int(11) NOT NULL,
  idorder int(11) NOT NULL,
  precio decimal(18,2) NOT NULL,
  cantidad int(11) NOT NULL,
  PRIMARY KEY (idordersdetail),
  KEY fk_detallepedido_product (idproduct),
  KEY fk_detallepedido_order (idorder),
  CONSTRAINT fk_detallepedido_pedido FOREIGN KEY (idorder) REFERENCES pedido (idorder) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_detallepedido_product FOREIGN KEY (idproduct) REFERENCES product (idproduct) ON DELETE NO ACTION ON UPDATE NO ACTION
);
use divisimabd;
CREATE TABLE cuenta (
  idcuenta int(11) NOT NULL AUTO_INCREMENT,
  name varchar(45) DEFAULT NULL,
  email varchar(100) DEFAULT NULL,
  contraseña varchar(80) DEFAULT NULL,
  photo varchar(100) DEFAULT NULL,
  estado tinyint(4) DEFAULT NULL,
  PRIMARY KEY (idcuenta)
  );