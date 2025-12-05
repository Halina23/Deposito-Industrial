-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: deposito_industrial
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `deposito_industrial`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `deposito_industrial` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `deposito_industrial`;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Parafuso'),(2,'Porca'),(3,'Ferramenta'),(4,'EPI'),(5,'Material de Limpeza'),(6,'Equipamento'),(7,'Máquina');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrada`
--

DROP TABLE IF EXISTS `entrada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrada` (
  `id_entrada` int NOT NULL AUTO_INCREMENT,
  `id_produto` int NOT NULL,
  `data_entrada` date NOT NULL,
  `quantidade` int NOT NULL,
  `id_funcionario` int NOT NULL,
  PRIMARY KEY (`id_entrada`),
  KEY `fk_entrada_funcionarios` (`id_funcionario`),
  KEY `fk_entrada_produtos` (`id_produto`),
  CONSTRAINT `fk_entrada_funcionarios` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionario`),
  CONSTRAINT `fk_entrada_produtos` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrada`
--

LOCK TABLES `entrada` WRITE;
/*!40000 ALTER TABLE `entrada` DISABLE KEYS */;
INSERT INTO `entrada` VALUES (1,1,'2025-12-01',100,1),(2,2,'2025-12-01',150,2),(3,3,'2025-12-02',200,3),(4,4,'2025-12-02',50,4),(5,5,'2025-12-03',120,5),(6,6,'2025-12-03',30,6),(7,7,'2025-12-04',10,7),(8,8,'2025-12-04',60,8),(9,9,'2025-12-05',80,9),(10,10,'2025-12-05',40,10);
/*!40000 ALTER TABLE `entrada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoque_local`
--

DROP TABLE IF EXISTS `estoque_local`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoque_local` (
  `id_estoque` int NOT NULL AUTO_INCREMENT,
  `id_produto` int NOT NULL,
  `quantidade` int NOT NULL,
  PRIMARY KEY (`id_estoque`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque_local`
--

LOCK TABLES `estoque_local` WRITE;
/*!40000 ALTER TABLE `estoque_local` DISABLE KEYS */;
INSERT INTO `estoque_local` VALUES (1,1,50),(2,2,30),(3,3,100),(4,4,50),(5,5,70),(6,6,60),(7,7,30),(8,8,90),(9,9,120),(10,10,60),(11,11,80),(12,12,50),(13,13,100),(14,14,70),(15,15,60),(16,16,50),(17,17,40),(18,18,30),(19,19,120),(20,20,60),(21,21,40),(22,22,90),(23,23,110),(24,24,50),(25,25,40),(26,26,100),(27,27,80),(28,28,70),(29,29,60),(30,30,50),(31,31,100),(32,32,90),(33,33,50),(34,34,60),(35,35,120),(36,36,40),(37,37,50),(38,38,80),(39,39,60),(40,40,30),(41,41,100),(42,42,90),(43,43,60),(44,44,70),(45,45,120),(46,46,50),(47,47,40),(48,48,80),(49,49,100),(50,50,60);
/*!40000 ALTER TABLE `estoque_local` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoque_minimo`
--

DROP TABLE IF EXISTS `estoque_minimo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoque_minimo` (
  `id_estoque` int NOT NULL AUTO_INCREMENT,
  `id_produto` int NOT NULL,
  `id_localizacao` int DEFAULT NULL,
  `quantidade_minima` decimal(18,3) NOT NULL,
  `criado_por` int DEFAULT NULL,
  `criado_em` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `atualizado_em` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_estoque`),
  KEY `fk_estoque_min_produto` (`id_produto`),
  KEY `fk_estoque_min_localizacao` (`id_localizacao`),
  CONSTRAINT `fk_estoque_min_localizacao` FOREIGN KEY (`id_localizacao`) REFERENCES `localizacao` (`id_localizacao`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_estoque_min_produto` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id_produto`) ON UPDATE CASCADE,
  CONSTRAINT `estoque_minimo_chk_1` CHECK ((`quantidade_minima` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque_minimo`
--

LOCK TABLES `estoque_minimo` WRITE;
/*!40000 ALTER TABLE `estoque_minimo` DISABLE KEYS */;
INSERT INTO `estoque_minimo` VALUES (1,1,3,50.000,1,'2025-12-02 15:03:43','2025-12-02 15:03:43'),(2,2,6,50.000,3,'2025-12-02 15:03:43','2025-12-02 15:03:43'),(3,3,23,50.000,1,'2025-12-02 15:03:43','2025-12-02 15:03:43'),(4,4,4,50.000,1,'2025-12-02 15:03:43','2025-12-02 15:03:43'),(5,6,12,50.000,3,'2025-12-02 15:03:43','2025-12-02 15:03:43'),(6,7,9,50.000,15,'2025-12-02 15:03:43','2025-12-02 15:03:43'),(7,8,6,50.000,15,'2025-12-02 15:03:43','2025-12-02 15:03:43'),(8,9,2,50.000,1,'2025-12-02 15:03:43','2025-12-02 15:03:43'),(9,10,5,50.000,1,'2025-12-02 15:03:43','2025-12-02 15:03:43'),(10,11,23,50.000,1,'2025-12-02 15:03:43','2025-12-02 15:03:43'),(11,12,43,50.000,1,'2025-12-02 15:03:43','2025-12-02 15:03:43'),(12,13,31,50.000,3,'2025-12-02 15:03:43','2025-12-02 15:03:43'),(13,14,22,50.000,3,'2025-12-02 15:03:43','2025-12-02 15:03:43'),(14,15,5,50.000,3,'2025-12-02 15:03:43','2025-12-02 15:03:43'),(15,16,6,50.000,3,'2025-12-02 15:03:43','2025-12-02 15:03:43'),(16,17,9,50.000,3,'2025-12-02 15:03:43','2025-12-02 15:03:43'),(17,18,1,50.000,3,'2025-12-02 15:03:43','2025-12-02 15:03:43'),(18,19,2,50.000,15,'2025-12-02 15:03:43','2025-12-02 15:03:43'),(19,20,4,50.000,15,'2025-12-02 15:03:43','2025-12-02 15:03:43');
/*!40000 ALTER TABLE `estoque_minimo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoques`
--

DROP TABLE IF EXISTS `estoques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoques` (
  `id_estoque` int NOT NULL AUTO_INCREMENT,
  `id_produto` int NOT NULL,
  `id_localizacao` int NOT NULL,
  `saldo` decimal(18,3) NOT NULL DEFAULT '0.000',
  PRIMARY KEY (`id_estoque`),
  UNIQUE KEY `uq_produto_local` (`id_produto`,`id_localizacao`),
  KEY `fk_estoques_localizacao` (`id_localizacao`),
  CONSTRAINT `fk_estoques_localizacao` FOREIGN KEY (`id_localizacao`) REFERENCES `localizacao` (`id_localizacao`) ON UPDATE CASCADE,
  CONSTRAINT `fk_estoques_produto` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id_produto`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoques`
--

LOCK TABLES `estoques` WRITE;
/*!40000 ALTER TABLE `estoques` DISABLE KEYS */;
INSERT INTO `estoques` VALUES (1,1,3,120.000),(2,2,6,200.000),(3,3,23,80.000),(4,4,4,150.000),(5,6,12,60.000),(6,7,9,300.000),(7,8,6,90.000),(8,9,2,40.000),(9,10,5,500.000),(10,11,23,70.000),(11,12,43,35.000),(12,13,31,110.000),(13,14,22,95.000),(14,15,5,60.000),(15,16,6,180.000),(16,17,9,210.000),(17,18,1,160.000),(18,19,2,55.000),(19,20,4,140.000);
/*!40000 ALTER TABLE `estoques` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_bloqueia_estoque_minimo` BEFORE UPDATE ON `estoques` FOR EACH ROW begin
       declare v_min_local decimal(18,3);
       declare v_min_global decimal (18,3);
       
       select quantidade_minima
       into v_min_local
       from estoque_minimo
       where id_produto = new.id_produto
       and id_localizacao=new.id_localizacao
       limit 1;
       
       if v_min_local is not null then
       if new.saldo < v_min_local then
            signal sqlstate '45000'
            set message_text = 'Bloqueado: saldo abaixo do estoque mínimo.';
            end if;
            
		else 
        select quantidade_minima
        into v_min_global
        from estoque_minimo
        where id_produto = new.id_produto
          and id_localizacao is null
          limit 1;
          
          if v_min_global is not null and new.saldo < v_min_global then 
             signal sqlstate '45000'
             set message_text = 'Bloqueado: saldo abaixo do estoque mínimo global.';
             end if;
             end if;
             
             end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor` (
  `id_fornecedor` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `CNPJ` varchar(20) NOT NULL,
  `endereco` text NOT NULL,
  PRIMARY KEY (`id_fornecedor`),
  UNIQUE KEY `CNPJ` (`CNPJ`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` VALUES (1,'ABC Distribuidora','31999990000','contato@abc.com','12.345.678/0001-90','Rua A, 100, Belo Horizonte, MG'),(2,'XYZ Materiais','31988880000','vendas@xyz.com','98.765.432/0001-12','Av. B, 200, Contagem, MG'),(3,'Tech Industrial','31997776655','suporte@techind.com.br','11.223.344/0001-56','Rua C, 300, Betim, MG'),(4,'Ferragens Brasil','31995554433','comercial@ferragensbr.com','22.334.455/0001-78','Av. D, 400, Nova Lima, MG'),(5,'EquipMax','31996663322','vendas@equipmax.com.br','33.445.566/0001-90','Rua E, 500, Contagem, MG'),(6,'Master Tools','31994443322','contato@mastertools.com.br','44.556.677/0001-01','Rua F, 600, Belo Horizonte, MG'),(7,'Indústria Sul','31993332211','vendas@industria-sul.com.br','55.667.788/0001-02','Av. G, 700, Contagem, MG'),(8,'Construmax','31992221100','comercial@construmax.com.br','66.778.899/0001-03','Rua H, 800, Betim, MG'),(9,'Metalúrgica Alfa','31991110099','suporte@metalalfa.com.br','77.889.900/0001-04','Av. I, 900, Nova Lima, MG'),(10,'Supremaq','31990009988','vendas@supremaq.com.br','88.990.011/0001-05','Rua J, 1000, Belo Horizonte, MG'),(11,'TecnoFerr','31998887766','comercial@tecnoferr.com.br','99.001.122/0001-06','Av. K, 1100, Contagem, MG'),(12,'Industrial Brasil','31997776655','contato@industrialbr.com.br','10.112.233/0001-07','Rua L, 1200, Betim, MG'),(13,'Ferragens Master','31996665544','vendas@ferragensmaster.com.br','11.223.344/0001-08','Av. M, 1300, Nova Lima, MG'),(14,'Equipamentos Norte','31995554433','comercial@equipnorte.com.br','12.334.455/0001-09','Rua N, 1400, Belo Horizonte, MG'),(15,'MaxiTools','31994443322','suporte@maxitools.com.br','13.445.566/0001-10','Av. O, 1500, Contagem, MG');
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionarios`
--

DROP TABLE IF EXISTS `funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionarios` (
  `id_funcionario` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `cargo` varchar(100) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `salario` decimal(10,2) NOT NULL,
  `ativo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_funcionario`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionarios`
--

LOCK TABLES `funcionarios` WRITE;
/*!40000 ALTER TABLE `funcionarios` DISABLE KEYS */;
INSERT INTO `funcionarios` VALUES (1,'Carlos Silva','Supervisor de Estoque','31991112233','carlos@empresa.com',3500.00,1),(2,'Maria Souza','Analista de Compras','31992223344','maria@empresa.com',3200.00,1),(3,'João Pereira','Auxiliar de Estoque','31993334455','joao@empresa.com',2200.00,1),(4,'Ana Costa','Recebimento','31994445566','ana@empresa.com',2000.00,1),(5,'Paulo Lima','Expedição','31995556677','paulo@empresa.com',2100.00,1),(6,'Fernanda Rocha','Analista de Inventário','31996667788','fernanda@empresa.com',3000.00,1),(7,'Ricardo Martins','Técnico de Manutenção','31997778899','ricardo@empresa.com',2800.00,1),(8,'Juliana Almeida','Controladora de Qualidade','31998889900','juliana@empresa.com',3200.00,1),(9,'Marcelo Fernandes','Motorista','31999990011','marcelo@empresa.com',2500.00,1),(10,'Patrícia Barbosa','Assistente Administrativo','31990001122','patricia@empresa.com',2700.00,1),(11,'Roberto Lima','Operador de Empilhadeira','31991112234','roberto@empresa.com',2300.00,1),(12,'Camila Santos','Supervisor de Expedição','31992223355','camila@empresa.com',3500.00,1),(13,'Leandro Oliveira','Auxiliar de Limpeza','31993334466','leandro@empresa.com',1800.00,1),(14,'Tatiane Ribeiro','Analista de Segurança do Trabalho','31994445577','tatiane@empresa.com',3300.00,1),(15,'Fábio Gomes','Coordenador de Logística','31995556688','fabio@empresa.com',4000.00,1),(16,'José Roberto','Motorista','34994894223','jose.roberto@empresa.com',4000.00,1);
/*!40000 ALTER TABLE `funcionarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itens_entrada`
--

DROP TABLE IF EXISTS `itens_entrada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itens_entrada` (
  `id_item_entrada` int NOT NULL AUTO_INCREMENT,
  `id_entrada` int NOT NULL,
  `id_produto` int NOT NULL,
  `quantidade` int NOT NULL,
  `valor_unitario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_item_entrada`),
  KEY `fk_itens_entrada` (`id_entrada`),
  KEY `fk_entrada_produto` (`id_produto`),
  CONSTRAINT `fk_entrada_produto` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id_produto`),
  CONSTRAINT `fk_itens_entrada` FOREIGN KEY (`id_entrada`) REFERENCES `entrada` (`id_entrada`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itens_entrada`
--

LOCK TABLES `itens_entrada` WRITE;
/*!40000 ALTER TABLE `itens_entrada` DISABLE KEYS */;
INSERT INTO `itens_entrada` VALUES (11,1,1,100,0.50),(12,2,2,150,0.30),(13,3,3,200,5.00),(14,4,4,50,25.00),(15,5,5,120,10.00),(16,6,6,30,15000.00),(17,7,7,10,25000.00),(18,8,8,60,12.00),(19,9,9,80,8.00),(20,10,10,40,6.00);
/*!40000 ALTER TABLE `itens_entrada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itens_pedido_compra`
--

DROP TABLE IF EXISTS `itens_pedido_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itens_pedido_compra` (
  `id_item` int NOT NULL AUTO_INCREMENT,
  `id_pedido` int NOT NULL,
  `id_produto` int NOT NULL,
  `quantidade` int NOT NULL,
  `preco_unitario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_item`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itens_pedido_compra`
--

LOCK TABLES `itens_pedido_compra` WRITE;
/*!40000 ALTER TABLE `itens_pedido_compra` DISABLE KEYS */;
INSERT INTO `itens_pedido_compra` VALUES (1,1,26,10,50.00),(2,1,27,5,120.00),(3,2,28,20,35.00),(4,2,29,15,80.00),(5,3,30,12,45.00),(6,3,31,8,60.00),(7,4,32,25,30.00),(8,4,33,10,100.00),(9,5,34,18,40.00),(10,5,35,7,150.00),(11,6,36,20,25.00),(12,6,37,15,70.00),(13,7,38,12,80.00),(14,7,39,10,90.00),(15,8,40,30,20.00),(16,8,41,5,110.00),(17,9,42,8,75.00),(18,9,43,14,60.00),(19,10,44,10,95.00),(20,10,45,6,130.00),(21,1,26,10,50.00),(22,1,27,5,120.00),(23,2,28,20,35.00),(24,2,29,15,80.00),(25,3,30,12,45.00),(26,3,31,8,60.00),(27,4,32,25,30.00),(28,4,33,10,100.00),(29,5,34,18,40.00),(30,5,35,7,150.00),(31,6,36,20,25.00),(32,6,37,15,70.00),(33,7,38,12,80.00),(34,7,39,10,90.00),(35,8,40,30,20.00),(36,8,41,5,110.00),(37,9,42,8,75.00),(38,9,43,14,60.00),(39,10,44,10,95.00),(40,10,45,6,130.00),(41,1,26,10,50.00),(42,1,27,5,120.00),(43,2,28,20,35.00),(44,2,29,15,80.00),(45,3,30,12,45.00),(46,3,31,8,60.00),(47,4,32,25,30.00),(48,4,33,10,100.00),(49,5,34,18,40.00),(50,5,35,7,150.00),(51,6,36,20,25.00),(52,6,37,15,70.00),(53,7,38,12,80.00),(54,7,39,10,90.00),(55,8,40,30,20.00),(56,8,41,5,110.00),(57,9,42,8,75.00),(58,9,43,14,60.00),(59,10,44,10,95.00),(60,10,45,6,130.00),(61,1,26,10,50.00),(62,1,27,5,120.00),(63,2,28,20,35.00),(64,2,29,15,80.00),(65,3,30,12,45.00),(66,3,31,8,60.00),(67,4,32,25,30.00),(68,4,33,10,100.00),(69,5,34,18,40.00),(70,5,35,7,150.00),(71,6,36,20,25.00),(72,6,37,15,70.00),(73,7,38,12,80.00),(74,7,39,10,90.00),(75,8,40,30,20.00),(76,8,41,5,110.00),(77,9,42,8,75.00),(78,9,43,14,60.00),(79,10,44,10,95.00),(80,10,45,6,130.00);
/*!40000 ALTER TABLE `itens_pedido_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itens_saida`
--

DROP TABLE IF EXISTS `itens_saida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itens_saida` (
  `id_item_saida` int NOT NULL AUTO_INCREMENT,
  `id_saida` int NOT NULL,
  `id_produto` int NOT NULL,
  `quantidade` int NOT NULL,
  `id_funcionario` int NOT NULL,
  PRIMARY KEY (`id_item_saida`),
  KEY `fk_itens_saida` (`id_saida`),
  KEY `fk_saida_funcionario` (`id_funcionario`),
  KEY `fk_saida_produto` (`id_produto`),
  CONSTRAINT `fk_itens_saida` FOREIGN KEY (`id_saida`) REFERENCES `saidas` (`id_saida`),
  CONSTRAINT `fk_saida_funcionario` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionario`),
  CONSTRAINT `fk_saida_produto` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itens_saida`
--

LOCK TABLES `itens_saida` WRITE;
/*!40000 ALTER TABLE `itens_saida` DISABLE KEYS */;
INSERT INTO `itens_saida` VALUES (1,1,1,20,1),(2,1,2,15,1),(3,2,3,30,2),(4,2,4,10,2),(5,3,5,25,3),(6,3,6,5,3),(7,4,7,2,4),(8,4,8,12,4),(9,5,9,8,5),(10,5,10,6,5);
/*!40000 ALTER TABLE `itens_saida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localizacao`
--

DROP TABLE IF EXISTS `localizacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `localizacao` (
  `id_localizacao` int NOT NULL AUTO_INCREMENT,
  `nome_local` varchar(100) NOT NULL,
  `descricao` text,
  PRIMARY KEY (`id_localizacao`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localizacao`
--

LOCK TABLES `localizacao` WRITE;
/*!40000 ALTER TABLE `localizacao` DISABLE KEYS */;
INSERT INTO `localizacao` VALUES (1,'A1','Prateleira A1 - Parafusos pequenos'),(2,'A2','Prateleira A2 - Parafusos médios'),(3,'A3','Prateleira A3 - Parafusos grandes'),(4,'A4','Prateleira A4 - Porcas pequenas'),(5,'A5','Prateleira A5 - Porcas médias'),(6,'A6','Prateleira A6 - Porcas grandes'),(7,'B1','Prateleira B1 - Ferramentas manuais leves'),(8,'B2','Prateleira B2 - Ferramentas manuais pesadas'),(9,'B3','Prateleira B3 - Chaves de fenda e alicates'),(10,'B4','Prateleira B4 - Martelos e maçaricos'),(11,'B5','Prateleira B5 - Equipamentos elétricos portáteis'),(12,'C1','Prateleira C1 - Luvas e capacetes'),(13,'C2','Prateleira C2 - Óculos e protetores auriculares'),(14,'C3','Prateleira C3 - Máscaras e respiradores'),(15,'C4','Prateleira C4 - Roupas de proteção'),(16,'D1','Área D1 - Lubrificantes e óleos'),(17,'D2','Área D2 - Produtos químicos e solventes'),(18,'D3','Área D3 - Tintas e vernizes'),(19,'E1','Depósito E1 - Máquinas pequenas'),(20,'E2','Depósito E2 - Máquinas médias'),(21,'E3','Depósito E3 - Máquinas grandes'),(22,'E4','Depósito E4 - Equipamentos de movimentação'),(23,'F1','Estoque F1 - Paletes e embalagens'),(24,'F2','Estoque F2 - Caixas e contentores'),(25,'F3','Estoque F3 - Equipamentos de segurança reserva'),(26,'F4','Estoque F4 - Ferramentas sobressalentes'),(27,'G1','Área G1 - Recebimento de mercadorias'),(28,'G2','Área G2 - Conferência de produtos'),(29,'G3','Área G3 - Separação de pedidos'),(30,'G4','Área G4 - Expedição e embarque'),(31,'H1','Setor H1 - Materiais críticos'),(32,'H2','Setor H2 - Materiais especiais'),(33,'H3','Setor H3 - Peças sobressalentes'),(34,'H4','Setor H4 - Equipamentos calibrados'),(35,'I1','Área I1 - Produtos de limpeza'),(36,'I2','Área I2 - Insumos diversos'),(37,'I3','Área I3 - Equipamentos de medição'),(38,'I4','Área I4 - Componentes elétricos'),(39,'J1','Prateleira J1 - Produtos importados'),(40,'J2','Prateleira J2 - Produtos nacionais'),(41,'J3','Prateleira J3 - Itens de reposição rápida'),(42,'J4','Prateleira J4 - Estoque de segurança'),(43,'K1','Depósito K1 - Equipamentos de grande porte'),(44,'K2','Depósito K2 - Máquinas inativas / reserva'),(45,'K3','Depósito K3 - Ferramentas especiais'),(46,'K4','Depósito K4 - Produtos embalados para transporte'),(47,'L1','Área L1 - Produtos químicos perigosos'),(48,'L2','Área L2 - Materiais inflamáveis'),(49,'L3','Área L3 - Materiais não inflamáveis'),(50,'L4','Área L4 - Armazenamento temporário');
/*!40000 ALTER TABLE `localizacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos_compra`
--

DROP TABLE IF EXISTS `pedidos_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos_compra` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `id_fornecedor` int NOT NULL,
  `data_pedido` date NOT NULL,
  `status` varchar(50) NOT NULL,
  `total_pedido` decimal(10,2) NOT NULL,
  `id_funcionario` int NOT NULL,
  PRIMARY KEY (`id_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos_compra`
--

LOCK TABLES `pedidos_compra` WRITE;
/*!40000 ALTER TABLE `pedidos_compra` DISABLE KEYS */;
INSERT INTO `pedidos_compra` VALUES (1,1,'2025-11-01','Pendente',1500.00,1),(2,2,'2025-11-03','Concluído',3200.00,2),(3,3,'2025-11-05','Pendente',2800.00,3),(4,4,'2025-11-07','Concluído',4500.00,4),(5,5,'2025-11-10','Cancelado',1200.00,5),(6,6,'2025-11-12','Concluído',3600.00,6),(7,7,'2025-11-15','Pendente',5000.00,7),(8,8,'2025-11-18','Concluído',4100.00,8),(9,9,'2025-11-20','Pendente',2700.00,9),(10,10,'2025-11-22','Concluído',3300.00,10);
/*!40000 ALTER TABLE `pedidos_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `id_produto` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `SKU` varchar(50) NOT NULL,
  `codigo_barras` varchar(50) DEFAULT NULL,
  `id_categoria` int DEFAULT NULL,
  `id_fornecedor` int DEFAULT NULL,
  `descricao` text,
  `unidade` varchar(20) NOT NULL,
  `estoque` int DEFAULT '0',
  `estoque_minimo` int DEFAULT '0',
  `preco` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_produto`),
  UNIQUE KEY `SKU` (`SKU`),
  UNIQUE KEY `codigo_barras` (`codigo_barras`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,'Parafuso de aço inox 3 por 16','PARA1001','7891000000001',1,1,'Parafuso de aço inoxidável 3 por 16 polegadas','500',500,100,0.50),(2,'Porca sextavada 1/4','PORC1002','7891000000002',2,2,'Porca sextavada de 1/4 polegadas','300',300,50,0.30),(3,'Chave de fenda Phillips','FERR1003','7891000000003',3,3,'Chave de fenda Phillips tamanho médio','150',150,20,5.00),(4,'Capacete de segurança amarelo','EPI1004','7891000000004',4,4,'Capacete de segurança para construção civil','80',80,10,25.00),(5,'Detergente neutro 5L','MATL1005','7891000000005',5,5,'Detergente neutro para limpeza geral - embalagem de 5 litros','200',200,30,10.00),(6,'Empilhadeira elétrica modelo X200','EQUI1006','7891000000006',6,6,'Empilhadeira elétrica com capacidade de carga de 2000kg','10',10,2,15000.00),(7,'Torno mecânico modelo T500','MAQU1007','7891000000007',7,7,'Torno mecânico para usinagem de peças metálicas - modelo T500','5',5,1,25000.00),(8,'Luva de proteção térmica','EPI1008','7891000000008',4,4,'Luva de proteção térmica para manuseio de objetos quentes','120',120,15,12.00),(9,'Alicate universal 8 polegadas','FERR1009','7891000000009',3,3,'Alicate universal de 8 polegadas para uso geral','90',90,10,8.00),(10,'Sabão em pó 1kg','MATL1010','7891000000010',5,5,'Sabão em pó para roupas - embalagem de 1kg','250',250,40,6.00),(11,'Broca de aço rápido 10mm','FERR1111','7891000000011',3,3,'Broca de aço rápido com diâmetro de 10mm','180',180,25,4.50),(12,'Óculos de proteção antiembaçante','EPI1012','7891000000012',4,4,'Óculos de proteção com lente antiembaçante','140',140,20,15.00),(13,'Empilhadeira a combustão modelo C300','EQUI1013','7891000000013',6,6,'Empilhadeira a combustão com capacidade de carga de 3000kg','8',8,1,18000.00),(14,'Limpador multiuso 1L','MATL1014','7891000000014',5,5,'Limpador multiuso para diversas superfícies - embalagem de 1 litro','220',220,35,7.00),(15,'Furadeira elétrica modelo F1000','MAQU1015','7891000000015',7,7,'Furadeira elétrica com controle de velocidade - modelo F1000','12',12,2,300.00),(16,'Paleteira hidráulica 2 toneladas','EQUI1016','7891000000016',6,6,'Paleteira hidráulica manual com capacidade de 2 toneladas','15',15,3,800.00),(17,'Esteiras transportadoras modulares','EQUI1017','7891000000017',6,6,'Esteiras transportadoras modulares para movimentação de materiais','50',50,10,120.00),(18,'Luva de proteção contra cortes','EPI1018','7891000000018',4,4,'Luva de proteção contra cortes para trabalhos com materiais afiados','100',100,15,14.00),(19,'Chave inglesa ajustável 10 polegadas','FERR1019','7891000000019',3,3,'Chave inglesa ajustável de 10 polegadas para uso geral','70',70,10,9.00),(20,'Misturador industrial de alta capacidade','MAQU1020','7891000000020',7,7,'Misturador industrial para grandes volumes - alta capacidade','4',4,1,5000.00),(21,'Cinta de amarração de carga 5 metros','EQUI1021','7891000000021',6,6,'Cinta de amarração de carga com comprimento de 5 metros','60',60,10,20.00),(22,'Compressores de ar portátil 10 litros','MAQU1022','7891000000022',7,7,'Compressor de ar portátil com tanque de 10 litros','7',7,1,400.00),(23,'Geradores elétricos 5kW','EQUI1023','7891000000023',6,6,'Gerador elétrico portátil com potência de 5kW','6',6,1,1200.00),(24,'Luva de proteção química','EPI1024','7891000000024',4,4,'Luva de proteção contra produtos químicos para uso industrial','110',110,15,16.00),(25,'Válvula de esfera 1 polegada','FERR1025','7891000000025',3,3,'Válvula de esfera com diâmetro de 1 polegada para controle de fluxo','130',130,20,18.00),(26,'Serra mecânica de bancada','MAQU1026','7891000000026',7,7,'Serra mecânica de bancada para cortes precisos em madeira e metal','9',9,2,1500.00),(27,'Lavadora de alta pressão 2000 PSI','MAQU1027','7891000000027',7,7,'Lavadora de alta pressão com capacidade de 2000 PSI para limpeza pesada','11',11,2,600.00),(28,'Extintor de pó químico 10kg','EPI1028','7891000000028',4,4,'Extintor de pó químico com capacidade de 10kg para combate a incêndios','50',50,5,150.00),(29,'Chave de impacto pneumática','FERR1029','7891000000029',3,3,'Chave de impacto pneumática para aperto e desaperto de parafusos','40',40,5,250.00),(30,'Prateleira grande de aço','EQUI1030','7891000000030',6,6,'Prateleira grande de aço para armazenamento em depósitos industriais','25',25,5,300.00),(31,'Prateleira média de aço','EQUI1031','7891000000031',6,6,'Prateleira média de aço para armazenamento em depósitos industriais','30',30,5,200.00),(32,'Prateleira pequena de aço','EQUI1032','7891000000032',6,6,'Prateleira pequena de aço para armazenamento em depósitos industriais','40',40,5,100.00),(33,'Carrinho de mão industrial','EQUI1033','7891000000033',6,6,'Carrinho de mão robusto para transporte de materiais pesados','20',20,3,180.00),(34,'Carrinho plataforma dobrável','EQUI1034','7891000000034',6,6,'Carrinho plataforma dobrável para facilitar o transporte de cargas','18',18,3,220.00),(35,'Carrinho elevador hidráulico','EQUI1035','7891000000035',6,6,'Carrinho elevador hidráulico para movimentação de pallets','10',10,2,900.00),(36,'Cinta de amarração de carga 10 metros','EQUI1036','7891000000036',6,6,'Cinta de amarração de carga com comprimento de 10 metros','40',40,8,35.00),(37,'Cinta de amarração de carga 15 metros','EQUI1037','7891000000037',6,6,'Cinta de amarração de carga com comprimento de 15 metros','30',30,6,50.00),(38,'Cinta de amarração de carga 20 metros','EQUI1038','7891000000038',6,6,'Cinta de amarração de carga com comprimento de 20 metros','20',20,4,70.00),(39,'Rack médio para pallets','EQUI1039','7891000000039',6,6,'Rack médio para armazenamento de pallets em depósitos industriais','15',15,3,400.00),(40,'Rack grande para pallets','EQUI1040','7891000000040',6,6,'Rack grande para armazenamento de pallets em depósitos industriais','10',10,2,600.00),(41,'Rack pequeno para pallets','EQUI1041','7891000000041',6,6,'Rack pequeno para armazenamento de pallets em depósitos industriais','20',20,4,300.00),(42,'Serra circular de bancada','MAQU1042','7891000000042',7,7,'Serra circular de bancada para cortes precisos em madeira e metal','8',8,2,1300.00),(43,'Lixadeira orbital elétrica','MAQU1043','7891000000043',7,7,'Lixadeira orbital elétrica para acabamento de superfícies','14',14,3,350.00),(44,'Esmerilhadeira angular 4.5 polegadas','MAQU1044','7891000000044',7,7,'Esmerilhadeira angular de 4.5 polegadas para corte e desbaste','16',16,3,280.00),(45,'Nível a laser autônomo','MAQU1045','7891000000045',7,7,'Nível a laser autônomo para medições precisas em obras','5',5,1,450.00),(46,'Trena de aço 5 metros','FERR1046','7891000000046',3,3,'Trena de aço com comprimento de 5 metros','200',200,30,15.00);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saidas`
--

DROP TABLE IF EXISTS `saidas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saidas` (
  `id_saida` int NOT NULL AUTO_INCREMENT,
  `data_saida` date NOT NULL,
  `destino` varchar(200) NOT NULL,
  `id_funcionario` int NOT NULL,
  `observacao` text,
  PRIMARY KEY (`id_saida`),
  KEY `fk_saidas_funcionarios` (`id_funcionario`),
  CONSTRAINT `fk_saidas_funcionarios` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionario`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saidas`
--

LOCK TABLES `saidas` WRITE;
/*!40000 ALTER TABLE `saidas` DISABLE KEYS */;
INSERT INTO `saidas` VALUES (1,'2025-12-01','Cliente A',1,'Entrega programada'),(2,'2025-12-01','Cliente B',2,'Entrega urgente'),(3,'2025-12-02','Cliente C',3,'Reposição de estoque'),(4,'2025-12-02','Cliente D',4,'Entrega agendada'),(5,'2025-12-03','Cliente E',5,'Pedido especial'),(6,'2025-12-03','Cliente F',6,'Entrega normal'),(7,'2025-12-04','Cliente G',7,'Reposição de estoque'),(8,'2025-12-04','Cliente H',8,'Entrega urgente'),(9,'2025-12-05','Cliente I',9,'Pedido programado'),(10,'2025-12-05','Cliente J',10,'Entrega programada');
/*!40000 ALTER TABLE `saidas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setores`
--

DROP TABLE IF EXISTS `setores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setores` (
  `id_setor` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`id_setor`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setores`
--

LOCK TABLES `setores` WRITE;
/*!40000 ALTER TABLE `setores` DISABLE KEYS */;
INSERT INTO `setores` VALUES (1,'Estoque'),(2,'Expedição'),(3,'Recebimento'),(4,'Manutenção'),(5,'Limpeza'),(6,'Administração');
/*!40000 ALTER TABLE `setores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transferencias`
--

DROP TABLE IF EXISTS `transferencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transferencias` (
  `id_trasnferencia` int NOT NULL AUTO_INCREMENT,
  `id_produto` int NOT NULL,
  `id_localizacao` int NOT NULL,
  `quantidade` int NOT NULL,
  `data_transferencia` date NOT NULL,
  `id_funcionario` int NOT NULL,
  PRIMARY KEY (`id_trasnferencia`),
  KEY `fk_transferencia_funcionarios` (`id_funcionario`),
  KEY `fk_transferencia_produto` (`id_produto`),
  KEY `fk_transferencia_localizacao` (`id_localizacao`),
  CONSTRAINT `fk_transferencia_funcionarios` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionario`),
  CONSTRAINT `fk_transferencia_localizacao` FOREIGN KEY (`id_localizacao`) REFERENCES `localizacao` (`id_localizacao`),
  CONSTRAINT `fk_transferencia_produto` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transferencias`
--

LOCK TABLES `transferencias` WRITE;
/*!40000 ALTER TABLE `transferencias` DISABLE KEYS */;
INSERT INTO `transferencias` VALUES (1,1,1,50,'2025-12-01',1),(2,2,2,30,'2025-12-01',2),(3,3,3,20,'2025-12-02',3),(4,4,4,10,'2025-12-02',4),(5,5,5,40,'2025-12-03',5),(6,6,1,5,'2025-12-03',6),(7,7,2,8,'2025-12-04',7),(8,8,3,12,'2025-12-04',8),(9,9,4,15,'2025-12-05',9),(10,10,5,25,'2025-12-05',10),(11,1,1,50,'2025-12-01',2),(12,3,2,30,'2025-12-02',5),(13,5,3,20,'2025-12-03',8);
/*!40000 ALTER TABLE `transferencias` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_validar_transferencia` BEFORE INSERT ON `transferencias` FOR EACH ROW begin
     declare cargo_funcionario varchar(100);
     select cargo into cargo_funcionario
     from funcionarios
     where id_funcionario = NEW.id_funcionario;
     if cargo_funcionario not in ('Motorista', 'Supervisor de Estoque') then
     signal SQLSTATE '45000'
     set message_text = 'Apenas motoristas e supervisores de estoque podem registrar tranferencias.';
     end if;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'deposito_industrial'
--

--
-- Dumping routines for database 'deposito_industrial'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-02 20:50:51
