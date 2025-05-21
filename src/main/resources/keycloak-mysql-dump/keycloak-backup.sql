-- MySQL dump 10.13  Distrib 9.2.0, for Linux (x86_64)
--
-- Host: localhost    Database: keycloak
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `ADMIN_EVENT_ENTITY`
--

DROP TABLE IF EXISTS `ADMIN_EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ADMIN_EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `ADMIN_EVENT_TIME` bigint DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `OPERATION_TYPE` varchar(255) DEFAULT NULL,
  `AUTH_REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_CLIENT_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `RESOURCE_PATH` text,
  `REPRESENTATION` text,
  `ERROR` varchar(255) DEFAULT NULL,
  `RESOURCE_TYPE` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ADMIN_EVENT_TIME` (`REALM_ID`,`ADMIN_EVENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMIN_EVENT_ENTITY`
--

LOCK TABLES `ADMIN_EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ASSOCIATED_POLICY`
--

DROP TABLE IF EXISTS `ASSOCIATED_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ASSOCIATED_POLICY` (
  `POLICY_ID` varchar(36) NOT NULL,
  `ASSOCIATED_POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`POLICY_ID`,`ASSOCIATED_POLICY_ID`),
  KEY `IDX_ASSOC_POL_ASSOC_POL_ID` (`ASSOCIATED_POLICY_ID`),
  CONSTRAINT `FK_FRSR5S213XCX4WNKOG82SSRFY` FOREIGN KEY (`ASSOCIATED_POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPAS14XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASSOCIATED_POLICY`
--

LOCK TABLES `ASSOCIATED_POLICY` WRITE;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_EXECUTION`
--

DROP TABLE IF EXISTS `AUTHENTICATION_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATION_EXECUTION` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `AUTHENTICATOR` varchar(36) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `REQUIREMENT` int DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `AUTHENTICATOR_FLOW` tinyint NOT NULL DEFAULT '0',
  `AUTH_FLOW_ID` varchar(36) DEFAULT NULL,
  `AUTH_CONFIG` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_EXEC_REALM_FLOW` (`REALM_ID`,`FLOW_ID`),
  KEY `IDX_AUTH_EXEC_FLOW` (`FLOW_ID`),
  CONSTRAINT `FK_AUTH_EXEC_FLOW` FOREIGN KEY (`FLOW_ID`) REFERENCES `AUTHENTICATION_FLOW` (`ID`),
  CONSTRAINT `FK_AUTH_EXEC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_EXECUTION`
--

LOCK TABLES `AUTHENTICATION_EXECUTION` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('04070c87-017b-4c89-89f8-7da88e23584f',NULL,'idp-email-verification','fc56c3ca-a729-402b-aa66-232ad730f09b','441a04f3-a853-42a5-8eb9-626956c973cf',2,10,0,NULL,NULL),('09ff8ab8-d937-4555-81bc-a26099a7e834',NULL,'identity-provider-redirector','fc56c3ca-a729-402b-aa66-232ad730f09b','d793d37c-73c7-4620-b4d0-bb32fc002a1f',2,25,0,NULL,NULL),('0ae06fd3-9d1c-46ce-88f7-9a65c575396a',NULL,'auth-spnego','fc56c3ca-a729-402b-aa66-232ad730f09b','d793d37c-73c7-4620-b4d0-bb32fc002a1f',3,20,0,NULL,NULL),('0c463955-7ae6-4379-8260-fb897255c3a3',NULL,'direct-grant-validate-otp','fc56c3ca-a729-402b-aa66-232ad730f09b','80fe6c12-fb6b-4072-84f7-aea752620dba',0,20,0,NULL,NULL),('17cb9b8c-3722-4c10-962d-1017221754ac',NULL,'registration-terms-and-conditions','fc56c3ca-a729-402b-aa66-232ad730f09b','1f9d4f24-8fb1-434d-8814-a209b7a84f0b',3,70,0,NULL,NULL),('19ab3d49-b080-459c-8832-d92307018576',NULL,NULL,'fc56c3ca-a729-402b-aa66-232ad730f09b','e6babe3a-3384-4242-8859-22ffb85c787f',0,20,1,'441a04f3-a853-42a5-8eb9-626956c973cf',NULL),('19d9a5cb-7d52-4201-aefb-120681ab58e9',NULL,'direct-grant-validate-otp','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','4fce689e-4871-4b94-975d-3b44582725b7',0,20,0,NULL,NULL),('1a3ad253-d473-4474-b28b-210f59e605de',NULL,'auth-otp-form','fc56c3ca-a729-402b-aa66-232ad730f09b','404b3208-4d15-46c3-80de-b3fae200a1df',0,20,0,NULL,NULL),('2157c035-0247-4399-b872-9ca154b94f2c',NULL,'client-secret-jwt','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','5aed61df-50c2-4464-94bb-fe61e1e0a3dd',2,30,0,NULL,NULL),('22d8b7bc-89f6-4774-9d87-8e01b3937a12',NULL,'client-jwt','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','5aed61df-50c2-4464-94bb-fe61e1e0a3dd',2,20,0,NULL,NULL),('2385116e-cb97-4750-b50f-8c282e39de31',NULL,'auth-spnego','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','26a54f43-9665-4b51-b7a7-f85b5c1b2356',3,20,0,NULL,NULL),('251876b3-46cc-41a1-bd17-eccfc2635e5d',NULL,'registration-page-form','fc56c3ca-a729-402b-aa66-232ad730f09b','6fa50a6a-f4e4-43e8-a874-99ef7bde4ca3',0,10,1,'1f9d4f24-8fb1-434d-8814-a209b7a84f0b',NULL),('2a23bdb7-0dcd-4ad4-909b-a8944f6f760d',NULL,'idp-create-user-if-unique','fc56c3ca-a729-402b-aa66-232ad730f09b','84611c52-8960-4161-ad65-a96b2030f00f',2,10,0,NULL,'066bed66-75ab-4be3-8cd2-07f00f73579c'),('2f4df4c1-2d1d-4a63-a594-9681da042170',NULL,'registration-password-action','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','559ba173-23f9-4026-80c3-214276b57278',0,50,0,NULL,NULL),('34b74ad9-0373-481a-b39a-8a794d390a2c',NULL,NULL,'fc56c3ca-a729-402b-aa66-232ad730f09b','84611c52-8960-4161-ad65-a96b2030f00f',2,20,1,'e6babe3a-3384-4242-8859-22ffb85c787f',NULL),('35ed6c85-b228-47f4-9baf-966df77e5e0f',NULL,'direct-grant-validate-password','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','055b49b9-dc50-462a-b3f6-6985af8b7567',0,20,0,NULL,NULL),('366e6a52-6147-4681-b58c-d4fde92d6d24',NULL,NULL,'d3a5ffa1-1601-43fe-aefc-247196ccd2b6','26a54f43-9665-4b51-b7a7-f85b5c1b2356',2,30,1,'31edb3ec-d9e6-409f-b798-33ae8b69095d',NULL),('3b292bb1-1129-4538-a6c8-03847392d25f',NULL,'client-secret-jwt','fc56c3ca-a729-402b-aa66-232ad730f09b','c14efc7d-fb2f-4b7b-80f6-915293776410',2,30,0,NULL,NULL),('3d6cebf8-31a5-40a4-a3ca-963a4ed90ec3',NULL,NULL,'d3a5ffa1-1601-43fe-aefc-247196ccd2b6','31edb3ec-d9e6-409f-b798-33ae8b69095d',1,20,1,'808062fe-f11c-4ac8-a36f-d03131132d8d',NULL),('401029ac-a705-496d-ba8c-7fb7aeaf2810',NULL,'idp-confirm-link','fc56c3ca-a729-402b-aa66-232ad730f09b','e6babe3a-3384-4242-8859-22ffb85c787f',0,10,0,NULL,NULL),('480506a5-37d7-4eb8-a277-9929e86e4696',NULL,'conditional-user-configured','fc56c3ca-a729-402b-aa66-232ad730f09b','404b3208-4d15-46c3-80de-b3fae200a1df',0,10,0,NULL,NULL),('49644185-1d4c-4fca-b609-d872542a1ed7',NULL,'direct-grant-validate-password','fc56c3ca-a729-402b-aa66-232ad730f09b','c31c7085-7bb0-45ac-900f-08f2fa050ce9',0,20,0,NULL,NULL),('4a659497-4731-44c7-b5ff-6ebe03774ead',NULL,'registration-recaptcha-action','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','559ba173-23f9-4026-80c3-214276b57278',3,60,0,NULL,NULL),('4e32f5d9-819b-40b4-a69c-e947b2e1acb6',NULL,'registration-password-action','fc56c3ca-a729-402b-aa66-232ad730f09b','1f9d4f24-8fb1-434d-8814-a209b7a84f0b',0,50,0,NULL,NULL),('4e7f59b9-390f-419c-afc2-088f6ec5bbf0',NULL,'direct-grant-validate-username','fc56c3ca-a729-402b-aa66-232ad730f09b','c31c7085-7bb0-45ac-900f-08f2fa050ce9',0,10,0,NULL,NULL),('54a882c8-c076-4b59-bb62-14e4303010b5',NULL,'reset-credentials-choose-user','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','8380f9de-7812-4ec2-a102-b639255cb958',0,10,0,NULL,NULL),('5ea6dc98-61ed-44a2-8c5a-811d0fe7af54',NULL,'conditional-user-configured','fc56c3ca-a729-402b-aa66-232ad730f09b','bec8bf0f-e33c-4591-a3bf-16d3ac43384e',0,10,0,NULL,NULL),('5ee8eb4b-5ae3-4760-b311-757a3e52f1a1',NULL,'conditional-user-configured','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','36aa0434-ed12-4b3f-902a-8452a1c9d5bc',0,10,0,NULL,NULL),('5f068318-95c1-4e4c-85af-bcbf5b0e2e38',NULL,NULL,'fc56c3ca-a729-402b-aa66-232ad730f09b','441a04f3-a853-42a5-8eb9-626956c973cf',2,20,1,'3b9c77a6-ef0b-4873-8000-4d60b9319af6',NULL),('63fdda2d-0aaa-4d87-af31-f9f1883784e5',NULL,'auth-username-password-form','fc56c3ca-a729-402b-aa66-232ad730f09b','0a978764-1547-4e5d-ad0e-674fdf86fbec',0,10,0,NULL,NULL),('6914408c-a209-4d0b-a7f4-dfd656d189e9',NULL,'reset-credentials-choose-user','fc56c3ca-a729-402b-aa66-232ad730f09b','c76fbcfd-cfa1-4b90-bba9-7bebc50de28b',0,10,0,NULL,NULL),('6ba317f3-91f4-42e8-9eba-6e296d15e672',NULL,'reset-credential-email','fc56c3ca-a729-402b-aa66-232ad730f09b','c76fbcfd-cfa1-4b90-bba9-7bebc50de28b',0,20,0,NULL,NULL),('71aed68a-9be6-499a-bee7-ea6072f8df67',NULL,'docker-http-basic-authenticator','fc56c3ca-a729-402b-aa66-232ad730f09b','f78b93f0-bcfc-4b23-a0d8-b61384b2466e',0,10,0,NULL,NULL),('72cc8a9e-1dad-4e44-ab4a-7b84a39507a8',NULL,'auth-otp-form','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','808062fe-f11c-4ac8-a36f-d03131132d8d',0,20,0,NULL,NULL),('74c051bf-f2ec-46de-a41a-f06e765ad9fb',NULL,NULL,'d3a5ffa1-1601-43fe-aefc-247196ccd2b6','055b49b9-dc50-462a-b3f6-6985af8b7567',1,30,1,'4fce689e-4871-4b94-975d-3b44582725b7',NULL),('75a2f8fc-cd7b-4130-87fd-d54aac6f86b2',NULL,'docker-http-basic-authenticator','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','885bb95b-b10d-4732-b20b-80f6e771c66c',0,10,0,NULL,NULL),('783aba33-1ec3-4b49-86d2-c04d0cad5766',NULL,'client-x509','fc56c3ca-a729-402b-aa66-232ad730f09b','c14efc7d-fb2f-4b7b-80f6-915293776410',2,40,0,NULL,NULL),('79724274-996d-4693-872e-45f253782bbe',NULL,'registration-page-form','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','9bfd5ffd-2cf8-4168-b9dd-9773701c5b7f',0,10,1,'559ba173-23f9-4026-80c3-214276b57278',NULL),('7a106f15-515e-46b3-81de-ca8dcdbbb318',NULL,'idp-review-profile','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','420c0610-544a-4854-ab70-b3ccf524ed4d',0,10,0,NULL,'f5676774-1232-4a90-bef4-bda161c1b6ce'),('808bb46e-7765-43d1-9b6a-8b448e58606b',NULL,NULL,'d3a5ffa1-1601-43fe-aefc-247196ccd2b6','0198dac6-a886-480c-8bb3-c10f4d037472',2,20,1,'ac53960a-540c-493a-b1f7-fce508739653',NULL),('81ce9d87-68d8-4a57-80f3-0a07561c64a5',NULL,'reset-password','fc56c3ca-a729-402b-aa66-232ad730f09b','c76fbcfd-cfa1-4b90-bba9-7bebc50de28b',0,30,0,NULL,NULL),('83b2ecc0-9653-48e6-916b-9293967b2b8f',NULL,'auth-cookie','fc56c3ca-a729-402b-aa66-232ad730f09b','d793d37c-73c7-4620-b4d0-bb32fc002a1f',2,10,0,NULL,NULL),('8553a890-af0b-420c-8a11-433d188602f0',NULL,'conditional-user-configured','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','808062fe-f11c-4ac8-a36f-d03131132d8d',0,10,0,NULL,NULL),('8621192e-68e9-4f9e-ba81-5150f96969b7',NULL,'reset-otp','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','238bee24-575c-4208-8aa2-2e5591d044d3',0,20,0,NULL,NULL),('86227a02-1ab8-477c-8de5-5b2be995d9da',NULL,NULL,'fc56c3ca-a729-402b-aa66-232ad730f09b','0a978764-1547-4e5d-ad0e-674fdf86fbec',1,20,1,'5f21b5b3-c92d-4972-b0e1-ec3ec6112889',NULL),('887f7c61-41e3-4c1e-bdfa-b9469aa34289',NULL,'direct-grant-validate-username','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','055b49b9-dc50-462a-b3f6-6985af8b7567',0,10,0,NULL,NULL),('8f42b00a-2b31-4975-b79b-ff64e9a7accd',NULL,NULL,'d3a5ffa1-1601-43fe-aefc-247196ccd2b6','cbfa4994-5ad4-40f9-84b3-3a4036ddc16d',0,20,1,'0198dac6-a886-480c-8bb3-c10f4d037472',NULL),('8f6d7648-ba77-4c0d-9e85-c5a23193ba45',NULL,'auth-otp-form','fc56c3ca-a729-402b-aa66-232ad730f09b','5f21b5b3-c92d-4972-b0e1-ec3ec6112889',0,20,0,NULL,NULL),('8fa3c25b-40c5-4898-bb14-db1daa81d8f8',NULL,NULL,'d3a5ffa1-1601-43fe-aefc-247196ccd2b6','ac53960a-540c-493a-b1f7-fce508739653',1,20,1,'36aa0434-ed12-4b3f-902a-8452a1c9d5bc',NULL),('91d6b3c5-5e8e-43b8-aa98-82e6b713bf4a',NULL,'identity-provider-redirector','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','26a54f43-9665-4b51-b7a7-f85b5c1b2356',2,25,0,NULL,NULL),('923f7746-1871-4212-a5a0-f130eebf8252',NULL,'client-secret','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','5aed61df-50c2-4464-94bb-fe61e1e0a3dd',2,10,0,NULL,NULL),('92a5ca39-abe1-4879-add1-2595dac48cc3',NULL,'http-basic-authenticator','fc56c3ca-a729-402b-aa66-232ad730f09b','fc663462-5dad-4e76-bd66-8eb20c0d427e',0,10,0,NULL,NULL),('95255093-8904-4b1a-b794-d300e14bb968',NULL,'idp-review-profile','fc56c3ca-a729-402b-aa66-232ad730f09b','0329209c-6a52-4a40-ac1c-4d995c97e629',0,10,0,NULL,'72aef97a-c9b9-460b-bf24-75a1aa0c6901'),('95e89410-ed0a-4fa5-a4c2-99fe953d9582',NULL,'auth-otp-form','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','36aa0434-ed12-4b3f-902a-8452a1c9d5bc',0,20,0,NULL,NULL),('99b18d8d-3cf0-4f03-9267-e5b75ae5e260',NULL,'auth-username-password-form','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','31edb3ec-d9e6-409f-b798-33ae8b69095d',0,10,0,NULL,NULL),('a0f8690a-419e-4635-8ddf-d05597d4453c',NULL,'reset-otp','fc56c3ca-a729-402b-aa66-232ad730f09b','bec8bf0f-e33c-4591-a3bf-16d3ac43384e',0,20,0,NULL,NULL),('a591d1fe-f92d-47a5-9802-42edc37d0456',NULL,NULL,'fc56c3ca-a729-402b-aa66-232ad730f09b','c76fbcfd-cfa1-4b90-bba9-7bebc50de28b',1,40,1,'bec8bf0f-e33c-4591-a3bf-16d3ac43384e',NULL),('a8958bb5-dc91-46ef-8d0d-ba8e0ef33b37',NULL,'conditional-user-configured','fc56c3ca-a729-402b-aa66-232ad730f09b','80fe6c12-fb6b-4072-84f7-aea752620dba',0,10,0,NULL,NULL),('a9b9c956-9240-49f2-9c8d-753e7ca2628d',NULL,NULL,'fc56c3ca-a729-402b-aa66-232ad730f09b','3b9c77a6-ef0b-4873-8000-4d60b9319af6',1,20,1,'404b3208-4d15-46c3-80de-b3fae200a1df',NULL),('ad977f94-dc4f-4c1d-b5c3-18301f9fd822',NULL,NULL,'fc56c3ca-a729-402b-aa66-232ad730f09b','0329209c-6a52-4a40-ac1c-4d995c97e629',0,20,1,'84611c52-8960-4161-ad65-a96b2030f00f',NULL),('afa6e8dd-2682-4749-9147-9864a448bb82',NULL,'conditional-user-configured','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','238bee24-575c-4208-8aa2-2e5591d044d3',0,10,0,NULL,NULL),('b0790f91-1266-40f8-bdc5-d32e5aefa156',NULL,'reset-credential-email','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','8380f9de-7812-4ec2-a102-b639255cb958',0,20,0,NULL,NULL),('b6aa304d-905e-4415-a69a-6dfd1062413b',NULL,'idp-confirm-link','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','cbfa4994-5ad4-40f9-84b3-3a4036ddc16d',0,10,0,NULL,NULL),('b8008438-5357-455f-aae5-815f36fe2d55',NULL,NULL,'fc56c3ca-a729-402b-aa66-232ad730f09b','c31c7085-7bb0-45ac-900f-08f2fa050ce9',1,30,1,'80fe6c12-fb6b-4072-84f7-aea752620dba',NULL),('b96dc143-eaba-4f8a-bf30-cf30e9d98443',NULL,NULL,'d3a5ffa1-1601-43fe-aefc-247196ccd2b6','8380f9de-7812-4ec2-a102-b639255cb958',1,40,1,'238bee24-575c-4208-8aa2-2e5591d044d3',NULL),('ba297a14-ec13-4aad-976a-293875bf22e0',NULL,NULL,'fc56c3ca-a729-402b-aa66-232ad730f09b','d793d37c-73c7-4620-b4d0-bb32fc002a1f',2,30,1,'0a978764-1547-4e5d-ad0e-674fdf86fbec',NULL),('bd67706b-e6d0-4e6a-80b4-8ad36e95239c',NULL,'conditional-user-configured','fc56c3ca-a729-402b-aa66-232ad730f09b','5f21b5b3-c92d-4972-b0e1-ec3ec6112889',0,10,0,NULL,NULL),('bfeb59de-71d3-48d4-991d-eef220288f47',NULL,'registration-terms-and-conditions','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','559ba173-23f9-4026-80c3-214276b57278',3,70,0,NULL,NULL),('c477ffa5-c38c-4d98-857f-6e28098e56b0',NULL,NULL,'d3a5ffa1-1601-43fe-aefc-247196ccd2b6','420c0610-544a-4854-ab70-b3ccf524ed4d',0,20,1,'8a80f9a6-404e-4322-b2f9-b17a706cbcc4',NULL),('c62cac45-b60b-48f2-805d-ea19e95020d4',NULL,'registration-recaptcha-action','fc56c3ca-a729-402b-aa66-232ad730f09b','1f9d4f24-8fb1-434d-8814-a209b7a84f0b',3,60,0,NULL,NULL),('cf9c414c-9f4c-43dd-ad2f-b91b2d34a828',NULL,'idp-create-user-if-unique','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','8a80f9a6-404e-4322-b2f9-b17a706cbcc4',2,10,0,NULL,'77d60613-b57b-4002-b994-15b7fa326129'),('d0653959-04de-4674-9ed5-5fea669bb44b',NULL,'reset-password','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','8380f9de-7812-4ec2-a102-b639255cb958',0,30,0,NULL,NULL),('d2e2a8e6-0bd0-4482-82ae-b2578da2c986',NULL,'client-secret','fc56c3ca-a729-402b-aa66-232ad730f09b','c14efc7d-fb2f-4b7b-80f6-915293776410',2,10,0,NULL,NULL),('d8afd92c-544d-40a0-81f1-437fe145069f',NULL,'client-x509','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','5aed61df-50c2-4464-94bb-fe61e1e0a3dd',2,40,0,NULL,NULL),('d9cca6a0-09ec-4552-9566-4747d84e6194',NULL,'idp-username-password-form','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','ac53960a-540c-493a-b1f7-fce508739653',0,10,0,NULL,NULL),('dda1cb25-5e1a-49ae-9c70-64b2522ba303',NULL,'registration-user-creation','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','559ba173-23f9-4026-80c3-214276b57278',0,20,0,NULL,NULL),('e4151c3a-da7f-49c3-87a0-68752632155b',NULL,'idp-username-password-form','fc56c3ca-a729-402b-aa66-232ad730f09b','3b9c77a6-ef0b-4873-8000-4d60b9319af6',0,10,0,NULL,NULL),('e747eacf-8f67-4629-a31c-e9745695085d',NULL,'conditional-user-configured','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','4fce689e-4871-4b94-975d-3b44582725b7',0,10,0,NULL,NULL),('e8e12535-d1f5-424b-aa22-003c33346e8b',NULL,'auth-cookie','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','26a54f43-9665-4b51-b7a7-f85b5c1b2356',2,10,0,NULL,NULL),('ef2478d9-d8a7-47a7-9440-7b8b09e3d0ec',NULL,NULL,'d3a5ffa1-1601-43fe-aefc-247196ccd2b6','8a80f9a6-404e-4322-b2f9-b17a706cbcc4',2,20,1,'cbfa4994-5ad4-40f9-84b3-3a4036ddc16d',NULL),('efff38c3-911c-4dfd-a543-35a0f4de3a7e',NULL,'registration-user-creation','fc56c3ca-a729-402b-aa66-232ad730f09b','1f9d4f24-8fb1-434d-8814-a209b7a84f0b',0,20,0,NULL,NULL),('f0ba817a-70a7-4255-a89a-28c6fac933fa',NULL,'idp-email-verification','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','0198dac6-a886-480c-8bb3-c10f4d037472',2,10,0,NULL,NULL),('f15b9746-1bae-4e2a-97e3-1ce80b29f618',NULL,'http-basic-authenticator','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','90682e84-cecf-483d-b75e-eea2cfd5262d',0,10,0,NULL,NULL),('f769d8d2-5b9a-4dd0-a2b6-52f93f786f66',NULL,'client-jwt','fc56c3ca-a729-402b-aa66-232ad730f09b','c14efc7d-fb2f-4b7b-80f6-915293776410',2,20,0,NULL,NULL);
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_FLOW`
--

DROP TABLE IF EXISTS `AUTHENTICATION_FLOW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATION_FLOW` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) NOT NULL DEFAULT 'basic-flow',
  `TOP_LEVEL` tinyint NOT NULL DEFAULT '0',
  `BUILT_IN` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_FLOW_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_FLOW_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_FLOW`
--

LOCK TABLES `AUTHENTICATION_FLOW` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('0198dac6-a886-480c-8bb3-c10f4d037472','Account verification options','Method with which to verity the existing account','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','basic-flow',0,1),('0329209c-6a52-4a40-ac1c-4d995c97e629','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','fc56c3ca-a729-402b-aa66-232ad730f09b','basic-flow',1,1),('055b49b9-dc50-462a-b3f6-6985af8b7567','direct grant','OpenID Connect Resource Owner Grant','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','basic-flow',1,1),('0a978764-1547-4e5d-ad0e-674fdf86fbec','forms','Username, password, otp and other auth forms.','fc56c3ca-a729-402b-aa66-232ad730f09b','basic-flow',0,1),('1f9d4f24-8fb1-434d-8814-a209b7a84f0b','registration form','registration form','fc56c3ca-a729-402b-aa66-232ad730f09b','form-flow',0,1),('238bee24-575c-4208-8aa2-2e5591d044d3','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','basic-flow',0,1),('26a54f43-9665-4b51-b7a7-f85b5c1b2356','browser','browser based authentication','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','basic-flow',1,1),('31edb3ec-d9e6-409f-b798-33ae8b69095d','forms','Username, password, otp and other auth forms.','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','basic-flow',0,1),('36aa0434-ed12-4b3f-902a-8452a1c9d5bc','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','basic-flow',0,1),('3b9c77a6-ef0b-4873-8000-4d60b9319af6','Verify Existing Account by Re-authentication','Reauthentication of existing account','fc56c3ca-a729-402b-aa66-232ad730f09b','basic-flow',0,1),('404b3208-4d15-46c3-80de-b3fae200a1df','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','fc56c3ca-a729-402b-aa66-232ad730f09b','basic-flow',0,1),('420c0610-544a-4854-ab70-b3ccf524ed4d','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','basic-flow',1,1),('441a04f3-a853-42a5-8eb9-626956c973cf','Account verification options','Method with which to verity the existing account','fc56c3ca-a729-402b-aa66-232ad730f09b','basic-flow',0,1),('4fce689e-4871-4b94-975d-3b44582725b7','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','basic-flow',0,1),('559ba173-23f9-4026-80c3-214276b57278','registration form','registration form','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','form-flow',0,1),('5aed61df-50c2-4464-94bb-fe61e1e0a3dd','clients','Base authentication for clients','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','client-flow',1,1),('5f21b5b3-c92d-4972-b0e1-ec3ec6112889','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','fc56c3ca-a729-402b-aa66-232ad730f09b','basic-flow',0,1),('6fa50a6a-f4e4-43e8-a874-99ef7bde4ca3','registration','registration flow','fc56c3ca-a729-402b-aa66-232ad730f09b','basic-flow',1,1),('808062fe-f11c-4ac8-a36f-d03131132d8d','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','basic-flow',0,1),('80fe6c12-fb6b-4072-84f7-aea752620dba','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','fc56c3ca-a729-402b-aa66-232ad730f09b','basic-flow',0,1),('8380f9de-7812-4ec2-a102-b639255cb958','reset credentials','Reset credentials for a user if they forgot their password or something','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','basic-flow',1,1),('84611c52-8960-4161-ad65-a96b2030f00f','User creation or linking','Flow for the existing/non-existing user alternatives','fc56c3ca-a729-402b-aa66-232ad730f09b','basic-flow',0,1),('885bb95b-b10d-4732-b20b-80f6e771c66c','docker auth','Used by Docker clients to authenticate against the IDP','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','basic-flow',1,1),('8a80f9a6-404e-4322-b2f9-b17a706cbcc4','User creation or linking','Flow for the existing/non-existing user alternatives','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','basic-flow',0,1),('90682e84-cecf-483d-b75e-eea2cfd5262d','saml ecp','SAML ECP Profile Authentication Flow','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','basic-flow',1,1),('9bfd5ffd-2cf8-4168-b9dd-9773701c5b7f','registration','registration flow','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','basic-flow',1,1),('ac53960a-540c-493a-b1f7-fce508739653','Verify Existing Account by Re-authentication','Reauthentication of existing account','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','basic-flow',0,1),('bec8bf0f-e33c-4591-a3bf-16d3ac43384e','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','fc56c3ca-a729-402b-aa66-232ad730f09b','basic-flow',0,1),('c14efc7d-fb2f-4b7b-80f6-915293776410','clients','Base authentication for clients','fc56c3ca-a729-402b-aa66-232ad730f09b','client-flow',1,1),('c31c7085-7bb0-45ac-900f-08f2fa050ce9','direct grant','OpenID Connect Resource Owner Grant','fc56c3ca-a729-402b-aa66-232ad730f09b','basic-flow',1,1),('c76fbcfd-cfa1-4b90-bba9-7bebc50de28b','reset credentials','Reset credentials for a user if they forgot their password or something','fc56c3ca-a729-402b-aa66-232ad730f09b','basic-flow',1,1),('cbfa4994-5ad4-40f9-84b3-3a4036ddc16d','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','basic-flow',0,1),('d793d37c-73c7-4620-b4d0-bb32fc002a1f','browser','browser based authentication','fc56c3ca-a729-402b-aa66-232ad730f09b','basic-flow',1,1),('e6babe3a-3384-4242-8859-22ffb85c787f','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','fc56c3ca-a729-402b-aa66-232ad730f09b','basic-flow',0,1),('f78b93f0-bcfc-4b23-a0d8-b61384b2466e','docker auth','Used by Docker clients to authenticate against the IDP','fc56c3ca-a729-402b-aa66-232ad730f09b','basic-flow',1,1),('fc663462-5dad-4e76-bd66-8eb20c0d427e','saml ecp','SAML ECP Profile Authentication Flow','fc56c3ca-a729-402b-aa66-232ad730f09b','basic-flow',1,1);
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATOR_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_CONFIG_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG`
--

LOCK TABLES `AUTHENTICATOR_CONFIG` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG` VALUES ('066bed66-75ab-4be3-8cd2-07f00f73579c','create unique user config','fc56c3ca-a729-402b-aa66-232ad730f09b'),('72aef97a-c9b9-460b-bf24-75a1aa0c6901','review profile config','fc56c3ca-a729-402b-aa66-232ad730f09b'),('77d60613-b57b-4002-b994-15b7fa326129','create unique user config','d3a5ffa1-1601-43fe-aefc-247196ccd2b6'),('f5676774-1232-4a90-bef4-bda161c1b6ce','review profile config','d3a5ffa1-1601-43fe-aefc-247196ccd2b6');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG_ENTRY`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG_ENTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATOR_CONFIG_ENTRY` (
  `AUTHENTICATOR_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`AUTHENTICATOR_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG_ENTRY`
--

LOCK TABLES `AUTHENTICATOR_CONFIG_ENTRY` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG_ENTRY` VALUES ('066bed66-75ab-4be3-8cd2-07f00f73579c','false','require.password.update.after.registration'),('72aef97a-c9b9-460b-bf24-75a1aa0c6901','missing','update.profile.on.first.login'),('77d60613-b57b-4002-b994-15b7fa326129','false','require.password.update.after.registration'),('f5676774-1232-4a90-bef4-bda161c1b6ce','missing','update.profile.on.first.login');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BROKER_LINK`
--

DROP TABLE IF EXISTS `BROKER_LINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BROKER_LINK` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  `BROKER_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BROKER_LINK`
--

LOCK TABLES `BROKER_LINK` WRITE;
/*!40000 ALTER TABLE `BROKER_LINK` DISABLE KEYS */;
/*!40000 ALTER TABLE `BROKER_LINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT`
--

DROP TABLE IF EXISTS `CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT` (
  `ID` varchar(36) NOT NULL,
  `ENABLED` tinyint NOT NULL DEFAULT '0',
  `FULL_SCOPE_ALLOWED` tinyint NOT NULL DEFAULT '0',
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int DEFAULT NULL,
  `PUBLIC_CLIENT` tinyint NOT NULL DEFAULT '0',
  `SECRET` varchar(255) DEFAULT NULL,
  `BASE_URL` varchar(255) DEFAULT NULL,
  `BEARER_ONLY` tinyint NOT NULL DEFAULT '0',
  `MANAGEMENT_URL` varchar(255) DEFAULT NULL,
  `SURROGATE_AUTH_REQUIRED` tinyint NOT NULL DEFAULT '0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  `NODE_REREG_TIMEOUT` int DEFAULT '0',
  `FRONTCHANNEL_LOGOUT` tinyint NOT NULL DEFAULT '0',
  `CONSENT_REQUIRED` tinyint NOT NULL DEFAULT '0',
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `SERVICE_ACCOUNTS_ENABLED` tinyint NOT NULL DEFAULT '0',
  `CLIENT_AUTHENTICATOR_TYPE` varchar(255) DEFAULT NULL,
  `ROOT_URL` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REGISTRATION_TOKEN` varchar(255) DEFAULT NULL,
  `STANDARD_FLOW_ENABLED` tinyint NOT NULL DEFAULT '1',
  `IMPLICIT_FLOW_ENABLED` tinyint NOT NULL DEFAULT '0',
  `DIRECT_ACCESS_GRANTS_ENABLED` tinyint NOT NULL DEFAULT '0',
  `ALWAYS_DISPLAY_IN_CONSOLE` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_B71CJLBENV945RB6GCON438AT` (`REALM_ID`,`CLIENT_ID`),
  KEY `IDX_CLIENT_ID` (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT`
--

LOCK TABLES `CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT` VALUES ('1e45724a-929f-42f4-81a3-3b3f7d9c372f',1,0,'admin-cli',0,1,NULL,NULL,0,NULL,0,'fc56c3ca-a729-402b-aa66-232ad730f09b','openid-connect',0,0,0,'${client_admin-cli}',0,'client-secret',NULL,NULL,NULL,0,0,1,0),('1e6e6c15-16d5-401f-aa08-c13ebc849464',1,0,'admin-cli',0,1,NULL,NULL,0,NULL,0,'d3a5ffa1-1601-43fe-aefc-247196ccd2b6','openid-connect',0,0,0,'${client_admin-cli}',0,'client-secret',NULL,NULL,NULL,0,0,1,0),('2f673c36-13c2-4277-bda6-844afeecef61',1,0,'security-admin-console',0,1,NULL,'/admin/Vacation-Application-Realm/console/',0,NULL,0,'fc56c3ca-a729-402b-aa66-232ad730f09b','openid-connect',0,0,0,'${client_security-admin-console}',0,'client-secret','${authAdminUrl}',NULL,NULL,1,0,0,0),('350eae82-5e5e-4e8f-99e2-ffd9b1ec77b8',1,0,'security-admin-console',0,1,NULL,'/admin/master/console/',0,NULL,0,'d3a5ffa1-1601-43fe-aefc-247196ccd2b6','openid-connect',0,0,0,'${client_security-admin-console}',0,'client-secret','${authAdminUrl}',NULL,NULL,1,0,0,0),('5e1b5a88-3651-4dc7-aadf-c382e372bc8d',1,0,'account-console',0,1,NULL,'/realms/Vacation-Application-Realm/account/',0,NULL,0,'fc56c3ca-a729-402b-aa66-232ad730f09b','openid-connect',0,0,0,'${client_account-console}',0,'client-secret','${authBaseUrl}',NULL,NULL,1,0,0,0),('6759a7bd-940b-4a74-a879-5e187472c652',1,0,'account',0,1,NULL,'/realms/Vacation-Application-Realm/account/',0,NULL,0,'fc56c3ca-a729-402b-aa66-232ad730f09b','openid-connect',0,0,0,'${client_account}',0,'client-secret','${authBaseUrl}',NULL,NULL,1,0,0,0),('75663b2c-45fa-4424-930a-6537753f27eb',1,0,'broker',0,0,NULL,NULL,1,NULL,0,'fc56c3ca-a729-402b-aa66-232ad730f09b','openid-connect',0,0,0,'${client_broker}',0,'client-secret',NULL,NULL,NULL,1,0,0,0),('813765c3-547f-4b77-855e-efb73057c17c',1,0,'account',0,1,NULL,'/realms/master/account/',0,NULL,0,'d3a5ffa1-1601-43fe-aefc-247196ccd2b6','openid-connect',0,0,0,'${client_account}',0,'client-secret','${authBaseUrl}',NULL,NULL,1,0,0,0),('a59aa05e-4d3d-4653-9a74-49457b0200e4',1,1,'Vacation_App_Client',0,1,NULL,'',0,'',0,'fc56c3ca-a729-402b-aa66-232ad730f09b','openid-connect',-1,1,0,'',0,'client-secret','','',NULL,1,0,1,0),('b12ef818-913c-453b-a74a-70bf8e9ad21a',1,0,'master-realm',0,0,NULL,NULL,1,NULL,0,'d3a5ffa1-1601-43fe-aefc-247196ccd2b6',NULL,0,0,0,'master Realm',0,'client-secret',NULL,NULL,NULL,1,0,0,0),('c36d15b8-22af-4756-8deb-6d885ecfd965',1,0,'realm-management',0,0,NULL,NULL,1,NULL,0,'fc56c3ca-a729-402b-aa66-232ad730f09b','openid-connect',0,0,0,'${client_realm-management}',0,'client-secret',NULL,NULL,NULL,1,0,0,0),('d29a8ead-7576-4e8f-9579-714ad7cbeb23',1,0,'broker',0,0,NULL,NULL,1,NULL,0,'d3a5ffa1-1601-43fe-aefc-247196ccd2b6','openid-connect',0,0,0,'${client_broker}',0,'client-secret',NULL,NULL,NULL,1,0,0,0),('db000120-e81c-4d0a-8a0b-036d7a2128dd',1,0,'Vacation-Application-Realm-realm',0,0,NULL,NULL,1,NULL,0,'d3a5ffa1-1601-43fe-aefc-247196ccd2b6',NULL,0,0,0,'Vacation-Application-Realm Realm',0,'client-secret',NULL,NULL,NULL,1,0,0,0),('f1cb4880-047a-4261-89bf-3395b94119a1',1,0,'account-console',0,1,NULL,'/realms/master/account/',0,NULL,0,'d3a5ffa1-1601-43fe-aefc-247196ccd2b6','openid-connect',0,0,0,'${client_account-console}',0,'client-secret','${authBaseUrl}',NULL,NULL,1,0,0,0);
/*!40000 ALTER TABLE `CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_ATTRIBUTES` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  KEY `IDX_CLIENT_ATT_BY_NAME_VALUE` (`NAME`,`VALUE`(255)),
  CONSTRAINT `FK3C47C64BEACCA966` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_ATTRIBUTES`
--

LOCK TABLES `CLIENT_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_ATTRIBUTES` VALUES ('1e45724a-929f-42f4-81a3-3b3f7d9c372f','post.logout.redirect.uris','+'),('2f673c36-13c2-4277-bda6-844afeecef61','pkce.code.challenge.method','S256'),('2f673c36-13c2-4277-bda6-844afeecef61','post.logout.redirect.uris','+'),('350eae82-5e5e-4e8f-99e2-ffd9b1ec77b8','pkce.code.challenge.method','S256'),('350eae82-5e5e-4e8f-99e2-ffd9b1ec77b8','post.logout.redirect.uris','+'),('5e1b5a88-3651-4dc7-aadf-c382e372bc8d','pkce.code.challenge.method','S256'),('5e1b5a88-3651-4dc7-aadf-c382e372bc8d','post.logout.redirect.uris','+'),('6759a7bd-940b-4a74-a879-5e187472c652','post.logout.redirect.uris','+'),('75663b2c-45fa-4424-930a-6537753f27eb','post.logout.redirect.uris','+'),('813765c3-547f-4b77-855e-efb73057c17c','post.logout.redirect.uris','+'),('a59aa05e-4d3d-4653-9a74-49457b0200e4','backchannel.logout.revoke.offline.tokens','false'),('a59aa05e-4d3d-4653-9a74-49457b0200e4','backchannel.logout.session.required','true'),('a59aa05e-4d3d-4653-9a74-49457b0200e4','oauth2.device.authorization.grant.enabled','false'),('a59aa05e-4d3d-4653-9a74-49457b0200e4','oidc.ciba.grant.enabled','false'),('a59aa05e-4d3d-4653-9a74-49457b0200e4','post.logout.redirect.uris','+'),('c36d15b8-22af-4756-8deb-6d885ecfd965','post.logout.redirect.uris','+'),('f1cb4880-047a-4261-89bf-3395b94119a1','pkce.code.challenge.method','S256'),('f1cb4880-047a-4261-89bf-3395b94119a1','post.logout.redirect.uris','+');
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_AUTH_FLOW_BINDINGS`
--

DROP TABLE IF EXISTS `CLIENT_AUTH_FLOW_BINDINGS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_AUTH_FLOW_BINDINGS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `BINDING_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`BINDING_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_AUTH_FLOW_BINDINGS`
--

LOCK TABLES `CLIENT_AUTH_FLOW_BINDINGS` WRITE;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_INITIAL_ACCESS`
--

DROP TABLE IF EXISTS `CLIENT_INITIAL_ACCESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_INITIAL_ACCESS` (
  `ID` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `EXPIRATION` int DEFAULT NULL,
  `COUNT` int DEFAULT NULL,
  `REMAINING_COUNT` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_INIT_ACC_REALM` (`REALM_ID`),
  CONSTRAINT `FK_CLIENT_INIT_ACC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_INITIAL_ACCESS`
--

LOCK TABLES `CLIENT_INITIAL_ACCESS` WRITE;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_NODE_REGISTRATIONS`
--

DROP TABLE IF EXISTS `CLIENT_NODE_REGISTRATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_NODE_REGISTRATIONS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` int DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK4129723BA992F594` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_NODE_REGISTRATIONS`
--

LOCK TABLES `CLIENT_NODE_REGISTRATIONS` WRITE;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_CLI_SCOPE` (`REALM_ID`,`NAME`),
  KEY `IDX_REALM_CLSCOPE` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE`
--

LOCK TABLES `CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE` VALUES ('08b93cbd-42a9-436c-a56d-cd7e97b615ba','email','fc56c3ca-a729-402b-aa66-232ad730f09b','OpenID Connect built-in scope: email','openid-connect'),('0daccc26-6279-4b89-b6ad-d41277217fe5','offline_access','fc56c3ca-a729-402b-aa66-232ad730f09b','OpenID Connect built-in scope: offline_access','openid-connect'),('0f5cc272-3487-4d0a-8105-7700ff9648a0','acr','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','OpenID Connect scope for add acr (authentication context class reference) to the token','openid-connect'),('138da499-a245-4aac-89da-7970f0e99f19','acr','fc56c3ca-a729-402b-aa66-232ad730f09b','OpenID Connect scope for add acr (authentication context class reference) to the token','openid-connect'),('2534e34c-8efb-42cd-a1d0-8ee669066f6e','phone','fc56c3ca-a729-402b-aa66-232ad730f09b','OpenID Connect built-in scope: phone','openid-connect'),('346d42aa-c630-42cb-8e77-9bbec1138868','web-origins','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('41611520-bf32-442f-9178-f83cfa5639a5','microprofile-jwt','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','Microprofile - JWT built-in scope','openid-connect'),('41de8e7d-2389-4d1d-bec0-9857cdecdd05','roles','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','OpenID Connect scope for add user roles to the access token','openid-connect'),('4723eb28-752a-4aa9-8d53-6ba25bc976e9','offline_access','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','OpenID Connect built-in scope: offline_access','openid-connect'),('64bd32f3-e173-4c11-9168-db0053e5f189','profile','fc56c3ca-a729-402b-aa66-232ad730f09b','OpenID Connect built-in scope: profile','openid-connect'),('6f3184c0-5b44-43f3-afb5-c48323aeed7d','phone','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','OpenID Connect built-in scope: phone','openid-connect'),('7833b79c-f847-4aee-98f1-cb5453d002b3','address','fc56c3ca-a729-402b-aa66-232ad730f09b','OpenID Connect built-in scope: address','openid-connect'),('8230f77b-3a6b-4366-902b-41337e144429','email','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','OpenID Connect built-in scope: email','openid-connect'),('87dff253-88cb-4726-a525-0d9a46ba2492','address','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','OpenID Connect built-in scope: address','openid-connect'),('8cfe6cfb-4e64-4f34-a060-601b3297134f','roles','fc56c3ca-a729-402b-aa66-232ad730f09b','OpenID Connect scope for add user roles to the access token','openid-connect'),('9da8b9e1-1aab-4a31-934d-7a2cc9e9a5e1','role_list','fc56c3ca-a729-402b-aa66-232ad730f09b','SAML role list','saml'),('d01f449c-537f-464f-a5bb-d3ed49e0a301','profile','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','OpenID Connect built-in scope: profile','openid-connect'),('eac77334-5547-4534-b91c-e26d577b40f0','microprofile-jwt','fc56c3ca-a729-402b-aa66-232ad730f09b','Microprofile - JWT built-in scope','openid-connect'),('f31f0448-dc3f-468e-972e-12b53ec39bdb','role_list','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','SAML role list','saml'),('f833323a-8666-46ba-bc30-2e071b91900b','web-origins','fc56c3ca-a729-402b-aa66-232ad730f09b','OpenID Connect scope for add allowed web origins to the access token','openid-connect');
/*!40000 ALTER TABLE `CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ATTRIBUTES` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `VALUE` text,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`NAME`),
  KEY `IDX_CLSCOPE_ATTRS` (`SCOPE_ID`),
  CONSTRAINT `FK_CL_SCOPE_ATTR_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ATTRIBUTES`
--

LOCK TABLES `CLIENT_SCOPE_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('08b93cbd-42a9-436c-a56d-cd7e97b615ba','${emailScopeConsentText}','consent.screen.text'),('08b93cbd-42a9-436c-a56d-cd7e97b615ba','true','display.on.consent.screen'),('08b93cbd-42a9-436c-a56d-cd7e97b615ba','true','include.in.token.scope'),('0daccc26-6279-4b89-b6ad-d41277217fe5','${offlineAccessScopeConsentText}','consent.screen.text'),('0daccc26-6279-4b89-b6ad-d41277217fe5','true','display.on.consent.screen'),('0f5cc272-3487-4d0a-8105-7700ff9648a0','false','display.on.consent.screen'),('0f5cc272-3487-4d0a-8105-7700ff9648a0','false','include.in.token.scope'),('138da499-a245-4aac-89da-7970f0e99f19','false','display.on.consent.screen'),('138da499-a245-4aac-89da-7970f0e99f19','false','include.in.token.scope'),('2534e34c-8efb-42cd-a1d0-8ee669066f6e','${phoneScopeConsentText}','consent.screen.text'),('2534e34c-8efb-42cd-a1d0-8ee669066f6e','true','display.on.consent.screen'),('2534e34c-8efb-42cd-a1d0-8ee669066f6e','true','include.in.token.scope'),('346d42aa-c630-42cb-8e77-9bbec1138868','','consent.screen.text'),('346d42aa-c630-42cb-8e77-9bbec1138868','false','display.on.consent.screen'),('346d42aa-c630-42cb-8e77-9bbec1138868','false','include.in.token.scope'),('41611520-bf32-442f-9178-f83cfa5639a5','false','display.on.consent.screen'),('41611520-bf32-442f-9178-f83cfa5639a5','true','include.in.token.scope'),('41de8e7d-2389-4d1d-bec0-9857cdecdd05','${rolesScopeConsentText}','consent.screen.text'),('41de8e7d-2389-4d1d-bec0-9857cdecdd05','true','display.on.consent.screen'),('41de8e7d-2389-4d1d-bec0-9857cdecdd05','false','include.in.token.scope'),('4723eb28-752a-4aa9-8d53-6ba25bc976e9','${offlineAccessScopeConsentText}','consent.screen.text'),('4723eb28-752a-4aa9-8d53-6ba25bc976e9','true','display.on.consent.screen'),('64bd32f3-e173-4c11-9168-db0053e5f189','${profileScopeConsentText}','consent.screen.text'),('64bd32f3-e173-4c11-9168-db0053e5f189','true','display.on.consent.screen'),('64bd32f3-e173-4c11-9168-db0053e5f189','true','include.in.token.scope'),('6f3184c0-5b44-43f3-afb5-c48323aeed7d','${phoneScopeConsentText}','consent.screen.text'),('6f3184c0-5b44-43f3-afb5-c48323aeed7d','true','display.on.consent.screen'),('6f3184c0-5b44-43f3-afb5-c48323aeed7d','true','include.in.token.scope'),('7833b79c-f847-4aee-98f1-cb5453d002b3','${addressScopeConsentText}','consent.screen.text'),('7833b79c-f847-4aee-98f1-cb5453d002b3','true','display.on.consent.screen'),('7833b79c-f847-4aee-98f1-cb5453d002b3','true','include.in.token.scope'),('8230f77b-3a6b-4366-902b-41337e144429','${emailScopeConsentText}','consent.screen.text'),('8230f77b-3a6b-4366-902b-41337e144429','true','display.on.consent.screen'),('8230f77b-3a6b-4366-902b-41337e144429','true','include.in.token.scope'),('87dff253-88cb-4726-a525-0d9a46ba2492','${addressScopeConsentText}','consent.screen.text'),('87dff253-88cb-4726-a525-0d9a46ba2492','true','display.on.consent.screen'),('87dff253-88cb-4726-a525-0d9a46ba2492','true','include.in.token.scope'),('8cfe6cfb-4e64-4f34-a060-601b3297134f','${rolesScopeConsentText}','consent.screen.text'),('8cfe6cfb-4e64-4f34-a060-601b3297134f','true','display.on.consent.screen'),('8cfe6cfb-4e64-4f34-a060-601b3297134f','false','include.in.token.scope'),('9da8b9e1-1aab-4a31-934d-7a2cc9e9a5e1','${samlRoleListScopeConsentText}','consent.screen.text'),('9da8b9e1-1aab-4a31-934d-7a2cc9e9a5e1','true','display.on.consent.screen'),('d01f449c-537f-464f-a5bb-d3ed49e0a301','${profileScopeConsentText}','consent.screen.text'),('d01f449c-537f-464f-a5bb-d3ed49e0a301','true','display.on.consent.screen'),('d01f449c-537f-464f-a5bb-d3ed49e0a301','true','include.in.token.scope'),('eac77334-5547-4534-b91c-e26d577b40f0','false','display.on.consent.screen'),('eac77334-5547-4534-b91c-e26d577b40f0','true','include.in.token.scope'),('f31f0448-dc3f-468e-972e-12b53ec39bdb','${samlRoleListScopeConsentText}','consent.screen.text'),('f31f0448-dc3f-468e-972e-12b53ec39bdb','true','display.on.consent.screen'),('f833323a-8666-46ba-bc30-2e071b91900b','','consent.screen.text'),('f833323a-8666-46ba-bc30-2e071b91900b','false','display.on.consent.screen'),('f833323a-8666-46ba-bc30-2e071b91900b','false','include.in.token.scope');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_CLIENT`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_CLIENT` (
  `CLIENT_ID` varchar(255) NOT NULL,
  `SCOPE_ID` varchar(255) NOT NULL,
  `DEFAULT_SCOPE` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`CLIENT_ID`,`SCOPE_ID`),
  KEY `IDX_CLSCOPE_CL` (`CLIENT_ID`),
  KEY `IDX_CL_CLSCOPE` (`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_CLIENT`
--

LOCK TABLES `CLIENT_SCOPE_CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('1e45724a-929f-42f4-81a3-3b3f7d9c372f','08b93cbd-42a9-436c-a56d-cd7e97b615ba',1),('1e45724a-929f-42f4-81a3-3b3f7d9c372f','0daccc26-6279-4b89-b6ad-d41277217fe5',0),('1e45724a-929f-42f4-81a3-3b3f7d9c372f','138da499-a245-4aac-89da-7970f0e99f19',1),('1e45724a-929f-42f4-81a3-3b3f7d9c372f','2534e34c-8efb-42cd-a1d0-8ee669066f6e',0),('1e45724a-929f-42f4-81a3-3b3f7d9c372f','64bd32f3-e173-4c11-9168-db0053e5f189',1),('1e45724a-929f-42f4-81a3-3b3f7d9c372f','7833b79c-f847-4aee-98f1-cb5453d002b3',0),('1e45724a-929f-42f4-81a3-3b3f7d9c372f','8cfe6cfb-4e64-4f34-a060-601b3297134f',1),('1e45724a-929f-42f4-81a3-3b3f7d9c372f','eac77334-5547-4534-b91c-e26d577b40f0',0),('1e45724a-929f-42f4-81a3-3b3f7d9c372f','f833323a-8666-46ba-bc30-2e071b91900b',1),('1e6e6c15-16d5-401f-aa08-c13ebc849464','0f5cc272-3487-4d0a-8105-7700ff9648a0',1),('1e6e6c15-16d5-401f-aa08-c13ebc849464','346d42aa-c630-42cb-8e77-9bbec1138868',1),('1e6e6c15-16d5-401f-aa08-c13ebc849464','41611520-bf32-442f-9178-f83cfa5639a5',0),('1e6e6c15-16d5-401f-aa08-c13ebc849464','41de8e7d-2389-4d1d-bec0-9857cdecdd05',1),('1e6e6c15-16d5-401f-aa08-c13ebc849464','4723eb28-752a-4aa9-8d53-6ba25bc976e9',0),('1e6e6c15-16d5-401f-aa08-c13ebc849464','6f3184c0-5b44-43f3-afb5-c48323aeed7d',0),('1e6e6c15-16d5-401f-aa08-c13ebc849464','8230f77b-3a6b-4366-902b-41337e144429',1),('1e6e6c15-16d5-401f-aa08-c13ebc849464','87dff253-88cb-4726-a525-0d9a46ba2492',0),('1e6e6c15-16d5-401f-aa08-c13ebc849464','d01f449c-537f-464f-a5bb-d3ed49e0a301',1),('2f673c36-13c2-4277-bda6-844afeecef61','08b93cbd-42a9-436c-a56d-cd7e97b615ba',1),('2f673c36-13c2-4277-bda6-844afeecef61','0daccc26-6279-4b89-b6ad-d41277217fe5',0),('2f673c36-13c2-4277-bda6-844afeecef61','138da499-a245-4aac-89da-7970f0e99f19',1),('2f673c36-13c2-4277-bda6-844afeecef61','2534e34c-8efb-42cd-a1d0-8ee669066f6e',0),('2f673c36-13c2-4277-bda6-844afeecef61','64bd32f3-e173-4c11-9168-db0053e5f189',1),('2f673c36-13c2-4277-bda6-844afeecef61','7833b79c-f847-4aee-98f1-cb5453d002b3',0),('2f673c36-13c2-4277-bda6-844afeecef61','8cfe6cfb-4e64-4f34-a060-601b3297134f',1),('2f673c36-13c2-4277-bda6-844afeecef61','eac77334-5547-4534-b91c-e26d577b40f0',0),('2f673c36-13c2-4277-bda6-844afeecef61','f833323a-8666-46ba-bc30-2e071b91900b',1),('350eae82-5e5e-4e8f-99e2-ffd9b1ec77b8','0f5cc272-3487-4d0a-8105-7700ff9648a0',1),('350eae82-5e5e-4e8f-99e2-ffd9b1ec77b8','346d42aa-c630-42cb-8e77-9bbec1138868',1),('350eae82-5e5e-4e8f-99e2-ffd9b1ec77b8','41611520-bf32-442f-9178-f83cfa5639a5',0),('350eae82-5e5e-4e8f-99e2-ffd9b1ec77b8','41de8e7d-2389-4d1d-bec0-9857cdecdd05',1),('350eae82-5e5e-4e8f-99e2-ffd9b1ec77b8','4723eb28-752a-4aa9-8d53-6ba25bc976e9',0),('350eae82-5e5e-4e8f-99e2-ffd9b1ec77b8','6f3184c0-5b44-43f3-afb5-c48323aeed7d',0),('350eae82-5e5e-4e8f-99e2-ffd9b1ec77b8','8230f77b-3a6b-4366-902b-41337e144429',1),('350eae82-5e5e-4e8f-99e2-ffd9b1ec77b8','87dff253-88cb-4726-a525-0d9a46ba2492',0),('350eae82-5e5e-4e8f-99e2-ffd9b1ec77b8','d01f449c-537f-464f-a5bb-d3ed49e0a301',1),('5e1b5a88-3651-4dc7-aadf-c382e372bc8d','08b93cbd-42a9-436c-a56d-cd7e97b615ba',1),('5e1b5a88-3651-4dc7-aadf-c382e372bc8d','0daccc26-6279-4b89-b6ad-d41277217fe5',0),('5e1b5a88-3651-4dc7-aadf-c382e372bc8d','138da499-a245-4aac-89da-7970f0e99f19',1),('5e1b5a88-3651-4dc7-aadf-c382e372bc8d','2534e34c-8efb-42cd-a1d0-8ee669066f6e',0),('5e1b5a88-3651-4dc7-aadf-c382e372bc8d','64bd32f3-e173-4c11-9168-db0053e5f189',1),('5e1b5a88-3651-4dc7-aadf-c382e372bc8d','7833b79c-f847-4aee-98f1-cb5453d002b3',0),('5e1b5a88-3651-4dc7-aadf-c382e372bc8d','8cfe6cfb-4e64-4f34-a060-601b3297134f',1),('5e1b5a88-3651-4dc7-aadf-c382e372bc8d','eac77334-5547-4534-b91c-e26d577b40f0',0),('5e1b5a88-3651-4dc7-aadf-c382e372bc8d','f833323a-8666-46ba-bc30-2e071b91900b',1),('6759a7bd-940b-4a74-a879-5e187472c652','08b93cbd-42a9-436c-a56d-cd7e97b615ba',1),('6759a7bd-940b-4a74-a879-5e187472c652','0daccc26-6279-4b89-b6ad-d41277217fe5',0),('6759a7bd-940b-4a74-a879-5e187472c652','138da499-a245-4aac-89da-7970f0e99f19',1),('6759a7bd-940b-4a74-a879-5e187472c652','2534e34c-8efb-42cd-a1d0-8ee669066f6e',0),('6759a7bd-940b-4a74-a879-5e187472c652','64bd32f3-e173-4c11-9168-db0053e5f189',1),('6759a7bd-940b-4a74-a879-5e187472c652','7833b79c-f847-4aee-98f1-cb5453d002b3',0),('6759a7bd-940b-4a74-a879-5e187472c652','8cfe6cfb-4e64-4f34-a060-601b3297134f',1),('6759a7bd-940b-4a74-a879-5e187472c652','eac77334-5547-4534-b91c-e26d577b40f0',0),('6759a7bd-940b-4a74-a879-5e187472c652','f833323a-8666-46ba-bc30-2e071b91900b',1),('75663b2c-45fa-4424-930a-6537753f27eb','08b93cbd-42a9-436c-a56d-cd7e97b615ba',1),('75663b2c-45fa-4424-930a-6537753f27eb','0daccc26-6279-4b89-b6ad-d41277217fe5',0),('75663b2c-45fa-4424-930a-6537753f27eb','138da499-a245-4aac-89da-7970f0e99f19',1),('75663b2c-45fa-4424-930a-6537753f27eb','2534e34c-8efb-42cd-a1d0-8ee669066f6e',0),('75663b2c-45fa-4424-930a-6537753f27eb','64bd32f3-e173-4c11-9168-db0053e5f189',1),('75663b2c-45fa-4424-930a-6537753f27eb','7833b79c-f847-4aee-98f1-cb5453d002b3',0),('75663b2c-45fa-4424-930a-6537753f27eb','8cfe6cfb-4e64-4f34-a060-601b3297134f',1),('75663b2c-45fa-4424-930a-6537753f27eb','eac77334-5547-4534-b91c-e26d577b40f0',0),('75663b2c-45fa-4424-930a-6537753f27eb','f833323a-8666-46ba-bc30-2e071b91900b',1),('813765c3-547f-4b77-855e-efb73057c17c','0f5cc272-3487-4d0a-8105-7700ff9648a0',1),('813765c3-547f-4b77-855e-efb73057c17c','346d42aa-c630-42cb-8e77-9bbec1138868',1),('813765c3-547f-4b77-855e-efb73057c17c','41611520-bf32-442f-9178-f83cfa5639a5',0),('813765c3-547f-4b77-855e-efb73057c17c','41de8e7d-2389-4d1d-bec0-9857cdecdd05',1),('813765c3-547f-4b77-855e-efb73057c17c','4723eb28-752a-4aa9-8d53-6ba25bc976e9',0),('813765c3-547f-4b77-855e-efb73057c17c','6f3184c0-5b44-43f3-afb5-c48323aeed7d',0),('813765c3-547f-4b77-855e-efb73057c17c','8230f77b-3a6b-4366-902b-41337e144429',1),('813765c3-547f-4b77-855e-efb73057c17c','87dff253-88cb-4726-a525-0d9a46ba2492',0),('813765c3-547f-4b77-855e-efb73057c17c','d01f449c-537f-464f-a5bb-d3ed49e0a301',1),('a59aa05e-4d3d-4653-9a74-49457b0200e4','08b93cbd-42a9-436c-a56d-cd7e97b615ba',1),('a59aa05e-4d3d-4653-9a74-49457b0200e4','0daccc26-6279-4b89-b6ad-d41277217fe5',0),('a59aa05e-4d3d-4653-9a74-49457b0200e4','138da499-a245-4aac-89da-7970f0e99f19',1),('a59aa05e-4d3d-4653-9a74-49457b0200e4','2534e34c-8efb-42cd-a1d0-8ee669066f6e',0),('a59aa05e-4d3d-4653-9a74-49457b0200e4','64bd32f3-e173-4c11-9168-db0053e5f189',1),('a59aa05e-4d3d-4653-9a74-49457b0200e4','7833b79c-f847-4aee-98f1-cb5453d002b3',0),('a59aa05e-4d3d-4653-9a74-49457b0200e4','8cfe6cfb-4e64-4f34-a060-601b3297134f',1),('a59aa05e-4d3d-4653-9a74-49457b0200e4','eac77334-5547-4534-b91c-e26d577b40f0',0),('a59aa05e-4d3d-4653-9a74-49457b0200e4','f833323a-8666-46ba-bc30-2e071b91900b',1),('b12ef818-913c-453b-a74a-70bf8e9ad21a','0f5cc272-3487-4d0a-8105-7700ff9648a0',1),('b12ef818-913c-453b-a74a-70bf8e9ad21a','346d42aa-c630-42cb-8e77-9bbec1138868',1),('b12ef818-913c-453b-a74a-70bf8e9ad21a','41611520-bf32-442f-9178-f83cfa5639a5',0),('b12ef818-913c-453b-a74a-70bf8e9ad21a','41de8e7d-2389-4d1d-bec0-9857cdecdd05',1),('b12ef818-913c-453b-a74a-70bf8e9ad21a','4723eb28-752a-4aa9-8d53-6ba25bc976e9',0),('b12ef818-913c-453b-a74a-70bf8e9ad21a','6f3184c0-5b44-43f3-afb5-c48323aeed7d',0),('b12ef818-913c-453b-a74a-70bf8e9ad21a','8230f77b-3a6b-4366-902b-41337e144429',1),('b12ef818-913c-453b-a74a-70bf8e9ad21a','87dff253-88cb-4726-a525-0d9a46ba2492',0),('b12ef818-913c-453b-a74a-70bf8e9ad21a','d01f449c-537f-464f-a5bb-d3ed49e0a301',1),('c36d15b8-22af-4756-8deb-6d885ecfd965','08b93cbd-42a9-436c-a56d-cd7e97b615ba',1),('c36d15b8-22af-4756-8deb-6d885ecfd965','0daccc26-6279-4b89-b6ad-d41277217fe5',0),('c36d15b8-22af-4756-8deb-6d885ecfd965','138da499-a245-4aac-89da-7970f0e99f19',1),('c36d15b8-22af-4756-8deb-6d885ecfd965','2534e34c-8efb-42cd-a1d0-8ee669066f6e',0),('c36d15b8-22af-4756-8deb-6d885ecfd965','64bd32f3-e173-4c11-9168-db0053e5f189',1),('c36d15b8-22af-4756-8deb-6d885ecfd965','7833b79c-f847-4aee-98f1-cb5453d002b3',0),('c36d15b8-22af-4756-8deb-6d885ecfd965','8cfe6cfb-4e64-4f34-a060-601b3297134f',1),('c36d15b8-22af-4756-8deb-6d885ecfd965','eac77334-5547-4534-b91c-e26d577b40f0',0),('c36d15b8-22af-4756-8deb-6d885ecfd965','f833323a-8666-46ba-bc30-2e071b91900b',1),('d29a8ead-7576-4e8f-9579-714ad7cbeb23','0f5cc272-3487-4d0a-8105-7700ff9648a0',1),('d29a8ead-7576-4e8f-9579-714ad7cbeb23','346d42aa-c630-42cb-8e77-9bbec1138868',1),('d29a8ead-7576-4e8f-9579-714ad7cbeb23','41611520-bf32-442f-9178-f83cfa5639a5',0),('d29a8ead-7576-4e8f-9579-714ad7cbeb23','41de8e7d-2389-4d1d-bec0-9857cdecdd05',1),('d29a8ead-7576-4e8f-9579-714ad7cbeb23','4723eb28-752a-4aa9-8d53-6ba25bc976e9',0),('d29a8ead-7576-4e8f-9579-714ad7cbeb23','6f3184c0-5b44-43f3-afb5-c48323aeed7d',0),('d29a8ead-7576-4e8f-9579-714ad7cbeb23','8230f77b-3a6b-4366-902b-41337e144429',1),('d29a8ead-7576-4e8f-9579-714ad7cbeb23','87dff253-88cb-4726-a525-0d9a46ba2492',0),('d29a8ead-7576-4e8f-9579-714ad7cbeb23','d01f449c-537f-464f-a5bb-d3ed49e0a301',1),('f1cb4880-047a-4261-89bf-3395b94119a1','0f5cc272-3487-4d0a-8105-7700ff9648a0',1),('f1cb4880-047a-4261-89bf-3395b94119a1','346d42aa-c630-42cb-8e77-9bbec1138868',1),('f1cb4880-047a-4261-89bf-3395b94119a1','41611520-bf32-442f-9178-f83cfa5639a5',0),('f1cb4880-047a-4261-89bf-3395b94119a1','41de8e7d-2389-4d1d-bec0-9857cdecdd05',1),('f1cb4880-047a-4261-89bf-3395b94119a1','4723eb28-752a-4aa9-8d53-6ba25bc976e9',0),('f1cb4880-047a-4261-89bf-3395b94119a1','6f3184c0-5b44-43f3-afb5-c48323aeed7d',0),('f1cb4880-047a-4261-89bf-3395b94119a1','8230f77b-3a6b-4366-902b-41337e144429',1),('f1cb4880-047a-4261-89bf-3395b94119a1','87dff253-88cb-4726-a525-0d9a46ba2492',0),('f1cb4880-047a-4261-89bf-3395b94119a1','d01f449c-537f-464f-a5bb-d3ed49e0a301',1);
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ROLE_MAPPING` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`ROLE_ID`),
  KEY `IDX_CLSCOPE_ROLE` (`SCOPE_ID`),
  KEY `IDX_ROLE_CLSCOPE` (`ROLE_ID`),
  CONSTRAINT `FK_CL_SCOPE_RM_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ROLE_MAPPING`
--

LOCK TABLES `CLIENT_SCOPE_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ROLE_MAPPING` VALUES ('0daccc26-6279-4b89-b6ad-d41277217fe5','ffa8b70f-f291-43ea-8ae8-3e099eb425bf'),('4723eb28-752a-4aa9-8d53-6ba25bc976e9','3a6868fa-7e89-451b-82ce-d71272b8cce5');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION`
--

DROP TABLE IF EXISTS `CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `REDIRECT_URI` varchar(255) DEFAULT NULL,
  `STATE` varchar(255) DEFAULT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `SESSION_ID` varchar(36) DEFAULT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(36) DEFAULT NULL,
  `CURRENT_ACTION` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_SESSION_SESSION` (`SESSION_ID`),
  CONSTRAINT `FK_B4AO2VCVAT6UKAU74WBWTFQO1` FOREIGN KEY (`SESSION_ID`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION`
--

LOCK TABLES `CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_AUTH_STATUS`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_AUTH_STATUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_AUTH_STATUS` (
  `AUTHENTICATOR` varchar(36) NOT NULL,
  `STATUS` int DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`AUTHENTICATOR`),
  CONSTRAINT `AUTH_STATUS_CONSTRAINT` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_AUTH_STATUS`
--

LOCK TABLES `CLIENT_SESSION_AUTH_STATUS` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51C2736` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_NOTE`
--

LOCK TABLES `CLIENT_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_PROT_MAPPER`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_PROT_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_PROT_MAPPER` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`PROTOCOL_MAPPER_ID`),
  CONSTRAINT `FK_33A8SGQW18I532811V7O2DK89` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_PROT_MAPPER`
--

LOCK TABLES `CLIENT_SESSION_PROT_MAPPER` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_ROLE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_ROLE` (
  `ROLE_ID` varchar(255) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`ROLE_ID`),
  CONSTRAINT `FK_11B7SGQW18I532811V7O2DV76` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_ROLE`
--

LOCK TABLES `CLIENT_SESSION_ROLE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_USER_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` text,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK_CL_USR_SES_NOTE` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_USER_SESSION_NOTE`
--

LOCK TABLES `CLIENT_USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT`
--

DROP TABLE IF EXISTS `COMPONENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPONENT` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_TYPE` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `SUB_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPONENT_REALM` (`REALM_ID`),
  KEY `IDX_COMPONENT_PROVIDER_TYPE` (`PROVIDER_TYPE`),
  CONSTRAINT `FK_COMPONENT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT`
--

LOCK TABLES `COMPONENT` WRITE;
/*!40000 ALTER TABLE `COMPONENT` DISABLE KEYS */;
INSERT INTO `COMPONENT` VALUES ('0392b494-3226-46c5-a73f-dc46a899ac41','Allowed Client Scopes','fc56c3ca-a729-402b-aa66-232ad730f09b','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','fc56c3ca-a729-402b-aa66-232ad730f09b','anonymous'),('06459450-f239-4556-93ff-776965af1dc1','hmac-generated-hs512','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','hmac-generated','org.keycloak.keys.KeyProvider','d3a5ffa1-1601-43fe-aefc-247196ccd2b6',NULL),('0653524d-d753-4a36-baea-7b3b385fd509','Allowed Client Scopes','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','authenticated'),('06d9d4be-7a7d-42d4-b27b-1e6f85cc6715','rsa-enc-generated','fc56c3ca-a729-402b-aa66-232ad730f09b','rsa-enc-generated','org.keycloak.keys.KeyProvider','fc56c3ca-a729-402b-aa66-232ad730f09b',NULL),('1d02142a-8f10-4a42-a94d-8ffccd7a8044','Allowed Protocol Mapper Types','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','authenticated'),('1d6d9740-ab63-46e1-a4d6-4cffc4492499','Allowed Protocol Mapper Types','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','anonymous'),('2679bd0d-15af-44f4-a98f-4f00da53aff2','Allowed Client Scopes','fc56c3ca-a729-402b-aa66-232ad730f09b','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','fc56c3ca-a729-402b-aa66-232ad730f09b','authenticated'),('2eabaa4d-35fe-4d22-b5d9-04a6970bbe85','Consent Required','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','anonymous'),('2fb28eff-e513-4c8e-b68c-f8e0b202fb18','Allowed Protocol Mapper Types','fc56c3ca-a729-402b-aa66-232ad730f09b','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','fc56c3ca-a729-402b-aa66-232ad730f09b','anonymous'),('4257f9ff-cbf5-4cf3-8422-165ebefae6b9','Allowed Protocol Mapper Types','fc56c3ca-a729-402b-aa66-232ad730f09b','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','fc56c3ca-a729-402b-aa66-232ad730f09b','authenticated'),('7401f488-0dea-41f5-bd74-8203f4cb5931','Full Scope Disabled','fc56c3ca-a729-402b-aa66-232ad730f09b','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','fc56c3ca-a729-402b-aa66-232ad730f09b','anonymous'),('7c480c78-c5d7-4212-a624-7edf6445aa1e','Max Clients Limit','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','anonymous'),('81dc4d76-c65b-490e-9aa3-23e1e78bd477','rsa-enc-generated','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','rsa-enc-generated','org.keycloak.keys.KeyProvider','d3a5ffa1-1601-43fe-aefc-247196ccd2b6',NULL),('8e864a80-d087-41e8-a03a-7119b34adc34','Trusted Hosts','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','anonymous'),('91976d9b-2762-4724-9892-3453213c6b5a','hmac-generated-hs512','fc56c3ca-a729-402b-aa66-232ad730f09b','hmac-generated','org.keycloak.keys.KeyProvider','fc56c3ca-a729-402b-aa66-232ad730f09b',NULL),('9b023f60-e86d-4bbd-a46c-3d4745b850d9','Allowed Client Scopes','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','anonymous'),('9b445d66-2dc2-4ff1-a511-59d189df31a2',NULL,'d3a5ffa1-1601-43fe-aefc-247196ccd2b6','declarative-user-profile','org.keycloak.userprofile.UserProfileProvider','d3a5ffa1-1601-43fe-aefc-247196ccd2b6',NULL),('9f9d429c-4bbf-4f47-9ec2-5348b8b040e3','aes-generated','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','aes-generated','org.keycloak.keys.KeyProvider','d3a5ffa1-1601-43fe-aefc-247196ccd2b6',NULL),('bbc4af7d-2b53-477c-ad52-857d404339c0','rsa-generated','fc56c3ca-a729-402b-aa66-232ad730f09b','rsa-generated','org.keycloak.keys.KeyProvider','fc56c3ca-a729-402b-aa66-232ad730f09b',NULL),('c50b2504-a711-41e6-b1eb-1d43d6aa620e','Trusted Hosts','fc56c3ca-a729-402b-aa66-232ad730f09b','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','fc56c3ca-a729-402b-aa66-232ad730f09b','anonymous'),('c62c9bcb-f45d-419b-a354-5af95dc1258c','rsa-generated','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','rsa-generated','org.keycloak.keys.KeyProvider','d3a5ffa1-1601-43fe-aefc-247196ccd2b6',NULL),('d7e36b0f-ffa3-476a-8bd4-d43f26f592bf','aes-generated','fc56c3ca-a729-402b-aa66-232ad730f09b','aes-generated','org.keycloak.keys.KeyProvider','fc56c3ca-a729-402b-aa66-232ad730f09b',NULL),('dd07351a-f6c2-4e67-80cc-7e440f0f276c','Full Scope Disabled','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','anonymous'),('f735f3b4-128a-4a21-8153-4c801555c61d','Max Clients Limit','fc56c3ca-a729-402b-aa66-232ad730f09b','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','fc56c3ca-a729-402b-aa66-232ad730f09b','anonymous'),('f8524113-8398-45b0-a214-71802e5ee6c6','Consent Required','fc56c3ca-a729-402b-aa66-232ad730f09b','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','fc56c3ca-a729-402b-aa66-232ad730f09b','anonymous');
/*!40000 ALTER TABLE `COMPONENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT_CONFIG`
--

DROP TABLE IF EXISTS `COMPONENT_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPONENT_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `COMPONENT_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPO_CONFIG_COMPO` (`COMPONENT_ID`),
  CONSTRAINT `FK_COMPONENT_CONFIG` FOREIGN KEY (`COMPONENT_ID`) REFERENCES `COMPONENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT_CONFIG`
--

LOCK TABLES `COMPONENT_CONFIG` WRITE;
/*!40000 ALTER TABLE `COMPONENT_CONFIG` DISABLE KEYS */;
INSERT INTO `COMPONENT_CONFIG` VALUES ('00f75394-bea4-438b-b74d-d89f9fc6bf8d','4257f9ff-cbf5-4cf3-8422-165ebefae6b9','allowed-protocol-mapper-types','oidc-address-mapper'),('0226355c-34fa-45c5-893e-2b79d6497da4','d7e36b0f-ffa3-476a-8bd4-d43f26f592bf','priority','100'),('046bdb09-2a71-43da-855d-08d0ecd6ce32','1d02142a-8f10-4a42-a94d-8ffccd7a8044','allowed-protocol-mapper-types','saml-role-list-mapper'),('089d6fa8-1897-4447-a82a-aafcf19cce4c','06d9d4be-7a7d-42d4-b27b-1e6f85cc6715','priority','100'),('0a0a937a-0e94-4c3d-bef5-a7975f2653d2','1d02142a-8f10-4a42-a94d-8ffccd7a8044','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('0a80f6ef-a011-4709-aef4-aefe238c3cda','06d9d4be-7a7d-42d4-b27b-1e6f85cc6715','keyUse','ENC'),('11c8e1d7-e510-4e18-aeba-12d3581aa203','2fb28eff-e513-4c8e-b68c-f8e0b202fb18','allowed-protocol-mapper-types','oidc-full-name-mapper'),('157b54fc-21a7-4dad-a3b7-52c4bcbdf2e8','4257f9ff-cbf5-4cf3-8422-165ebefae6b9','allowed-protocol-mapper-types','oidc-full-name-mapper'),('1964019d-9e09-491c-b7ae-8aa1c89ca113','8e864a80-d087-41e8-a03a-7119b34adc34','client-uris-must-match','true'),('1bf7e211-6d7d-488e-b712-42a5bbe8ab21','9f9d429c-4bbf-4f47-9ec2-5348b8b040e3','secret','z6xgOpmfVaNA4FrbyI00Nw'),('1d0acbca-e75d-4b43-9c5f-7ec9bfa29bd3','1d6d9740-ab63-46e1-a4d6-4cffc4492499','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('247e8374-8e04-4ec1-bdba-bbf34d23afeb','4257f9ff-cbf5-4cf3-8422-165ebefae6b9','allowed-protocol-mapper-types','saml-role-list-mapper'),('2672ed67-faf0-4933-8cdb-fdde5565d0df','2fb28eff-e513-4c8e-b68c-f8e0b202fb18','allowed-protocol-mapper-types','saml-user-property-mapper'),('2827d3c4-d6cf-4ea9-8b7a-a06f9bdd9c1c','4257f9ff-cbf5-4cf3-8422-165ebefae6b9','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('2aa43b5e-9f68-4b9b-adf0-fe88410745d4','1d02142a-8f10-4a42-a94d-8ffccd7a8044','allowed-protocol-mapper-types','saml-user-property-mapper'),('2d730412-ddc8-4020-b0ea-cc1bb99840cd','1d6d9740-ab63-46e1-a4d6-4cffc4492499','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('2fdad2bf-be44-4cfe-9563-560bc6665d49','d7e36b0f-ffa3-476a-8bd4-d43f26f592bf','kid','5cae2c12-1ee8-4dd1-bd72-5f050589a44c'),('35651e16-216d-47a2-841e-8282c893c341','06d9d4be-7a7d-42d4-b27b-1e6f85cc6715','algorithm','RSA-OAEP'),('3bd8faa7-af7a-4175-b1d3-d93650a60ea8','bbc4af7d-2b53-477c-ad52-857d404339c0','privateKey','MIIEogIBAAKCAQEAu5LpAKxRILoWOrvVXSecQ+PS+HiBiyNIM1HugT7vq8TPVBgH5fy+Obw6Bfv3uYaZb2+7llmbb6X2X746pm1MKAbmasqeT6T0DNd2Q+HDUktxoYW0TcCHZWSnpNIhXJP1lCccONJqhJ+QojCXVf2qxoU8weeu/ni1cauAmkvGF72YV9WrWW38JWgJmt4jhETOXjwA+COwB0Uv5FSApQYRSo7mG8GwpbSXeW+p0V2ISIHFaUoP70z59VSe5Hstg2T6BZ6v4qAxN09SAbKELHqDmQp3BD12GfVNkgRCUtgLWN3fdbjC/NJ1Gw2OlkxduuKSQTFzbXVztupFHqx22tfy5QIDAQABAoIBABaq2xqC4xjz3qeBYc2XRv89+Gr2JnLZ3tSeLuw9M/nLgmHqDNuiY/CWimKFFRDoBFce/F81Jp9i7HechaTtag8flQJ3HZOICRrGLPC+HHxaSU9Dg6BZHGOd5X55taC6Rqqn4Uq37uRmY17zmqOV0JNGBat0eUV08Tmyh+Ddjauk6ejYd4BUP3fOtCq/PmbmbaNto51Us1iJ87sX4hEKFzl12tCxMlFEwhuv05apZOP7Q2IxKEN+uOUiQcHlxRfAElHuA26vyiJWVH13XxPtF35nUJhLpdK+YEk0yR9ynOLRNzrvCknmczE0sqaCBGd1ZFYxDnWF50wJHN+Vmw9vlO8CgYEA+egBcl5jZKU4hbncGZJGOHC9ZyQsu92V7S5p6p1kyd6O1j+eFfXMGVRpim6Haqi7rPRaoi3Jez2nzmob7XhRGhioGoUTUTaGplOWFrLnL7Z6laZJqDAYYoilnZQWRPm5Zk/fTlHa4YfetZxMwSoG5PXh2pkUUukzFmmnaA4fWPcCgYEAwCXOS8y8FWUrBH9T9uFbyPdnU4ejQYyftZ7jJBiNRzMIPIOOFZQRx55gGRw4UGdTbkn7GV6SE53p0unZ2YWeHy75WgMjdjVLk8h96OTmzSdZHkiCJO14rkJ08Rjy/lDaHa1XsIidf1ywPUxGCZb9dkgU/SZRz/rHK2i5qFkDWAMCgYA8IWfftfhiaiLMgmkEOh7tS6s3Gwwsc+e0NxvDGPX8YLGruYj3LbpbSeVPKsMolcr6lZ0NMsks/yvWTc/EdtPE3LPuFaENRHpnoOsXMRrRby3Vvjow3smvQ8Pdw5kMJa5HgOZxON7ar0+WETKis9MO2l7qszShsnzZYrimH+fJBwKBgCVidavbzrBe+aqrV1vOZvxH3ouq9UGYqa49lrX8LOiwbibP9cIPCBKNpubbzb0fDWWE8VzzQHqem9LUevVOgQBSNGOl/q1OG0FKnezFNH6v7C/vLZsftP46oeQS1ZxTgMyLYGdRfUs9bnDOuUW+Ydw0lBjY7swHX977RjwR7YufAoGAfrm3TGfsyqnzFIkH+MfAPGRC+p2PEWEeTJsTurw1BU+ENB7+HunUISJx80t4y6EdySliVql2u0RkVBz4B34VdMumxFmAw38IQOvjNv+QzGllOB+Kz3FKga19/G0mDCAzNc+G1rP18RxQBzO33cnqILr7iwQaVADFitVy1YZC3P0='),('3fc10488-ecc5-4437-a109-9f6476132f3a','1d02142a-8f10-4a42-a94d-8ffccd7a8044','allowed-protocol-mapper-types','oidc-full-name-mapper'),('4197cf33-0274-4519-b56b-2494009624d8','06459450-f239-4556-93ff-776965af1dc1','kid','0bd9dcea-89ac-4c97-8258-7c2c222e556a'),('41ecb4f8-a765-4c49-b335-9e83caf749c6','81dc4d76-c65b-490e-9aa3-23e1e78bd477','keyUse','ENC'),('43dede34-757d-42ad-9818-dc53e0797291','c62c9bcb-f45d-419b-a354-5af95dc1258c','priority','100'),('44b1a665-2b1a-4586-849d-86beb6f05534','4257f9ff-cbf5-4cf3-8422-165ebefae6b9','allowed-protocol-mapper-types','saml-user-property-mapper'),('468aeb2f-bc2e-4f11-a150-c21dde47d402','2fb28eff-e513-4c8e-b68c-f8e0b202fb18','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('483dee62-0e91-408f-a1da-664eceeef51b','2fb28eff-e513-4c8e-b68c-f8e0b202fb18','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('499900ec-4ffa-42a4-9fa0-e5eca4994ab4','bbc4af7d-2b53-477c-ad52-857d404339c0','keyUse','SIG'),('4b81a521-5702-4c13-8847-0eb762e42c62','7c480c78-c5d7-4212-a624-7edf6445aa1e','max-clients','200'),('4be00a84-db75-4bcf-a1d0-93bf16b0ed89','06d9d4be-7a7d-42d4-b27b-1e6f85cc6715','privateKey','MIIEowIBAAKCAQEAvdiRH5n6yyttQfmgVwAbhJ3cVBSg2y6n2JIffOa8pYEWaKeuuXb/31sjSYteL74JVr3ISk1KdtYhSpyAyEQRdbCxd97rZpmj7KRekEREe+w0HZ/zkEP+FtqlzDXKJs6pNg82tP/ADf8CVSUyWky/lTfcv+/BVKC4tRXDjPk6+FrqFdBe3WryHrBSt0yCmipnV/0EyzlpIKX5oUn59wfwbmkAhKvQQSMyeZnuFSZxie7qMhk083fhnH9BUF/PB1mDa2aAQJZ3JLX5DqvH39XjdiAk40AbAqQRPuuiyputIEgg7ETPmRBpfCPQgPn0VWqe+vbew0tcm090HhRRe84ZawIDAQABAoIBABAycIdCsUWX1rWA4UleH/roWpdUPzkUBov3dsPgQVemTZqJaK9rU+Wv6X3P0mEkx7hkoevJvMDdmgkhYYQ0kn/5BQ5WFyPLMSCMEYLurO0c604pV5o6XGy0vaqDke2BRw+7ePTOUSNtW1SXKaM2PK4z2uihQVxbOtPWuVCT8inYHW1cAvlYRwTqJlePl5UQT8ohh4VVVQO5sr/jFr1F2xWB0j4RrI4omg/6ajgHfkKup2e9W4jEWTS1sii4Ym9K913e+9QR/D+e8jq6FLPIHKAFryD/Ts1pK/1X5x+9IisZxaiEa0R7PpfKZQSvSdNEvhm6IxgUJWLr4Mzf7kwgbPECgYEA4WVr+y5i4kOLIbsjD3YGOH/MNehZXz4BlQu6uMWAV5VptYoKWtRfGZewK/oStEzZNmGwAJlJJPSUTu8tDSPs4cLKbi8C//WhrZrxo6fngzuvDcb0zMEFCn/ZVGBhxuq9MPrE4ABuFpTN3a72GPXPXmrtQVXW6AvgeO/2t+IRbYMCgYEA159zN610QwHHnTuotMHRtpy4XWR60gaF4O08PvhYTbUpUPkBLMNiHgCKGu0FlnEeSZ8hT2VnuMCeU+QXATt+3DTN6pKIRTbc5vhHEwTYFBduCxMZU8XEEOoYe/D1XSyeEWYN/Ofh0IREgRHJwqkxY/XJm2vleeejoL1Jhur0B/kCgYAfGPEm/KVj9lGx27HgpjYBgZBZN69s9o8dUzr11zn324N0KpF3KqncTBNgXeZKvfeSCzRPQNbYpG353gHnODeshkWLoizVx7wAycng/H9ymb9zNSn9PfxGEJGZlJqo6SYlJdQX27dUoj8tAMCvfOqZakNFqmQ2K71Ssjjl8ejZpQKBgH9MCHaPdbr1ewaNqR0F7Cx2O7YPUx9ZcIKJLG80qNU/pePDDfmCZBO4V9BrrEfUAoCObNj10hVVymNWnmpA2LVii0r4NXE/YY0OeM92paa+6l2paeN2NzmRKuFJMWJPrAYzjQCJWVyEKflVKhs9TgZonhyex3x/z69e8OCxJ17pAoGBAM6cwiyiaxKdDp0SfzO4l78oHcN4ipauBj+dnxsJ4+6hkBmWCTtteEwmO+MHcySfuSPjZftPOV8SDrahxx2FZpWG4pSTE765Zsf8fIdjsSY/sifcqk6EHPlSLYgx6xwP8I/59shxk55Sr0NY7EkZy8iAyJ1npHC2JVwizyAWd0yi'),('52ebdd67-a8b0-46de-a468-9935eaad8da7','0653524d-d753-4a36-baea-7b3b385fd509','allow-default-scopes','true'),('576ea33e-5d44-41a1-9cf0-43e5380d728c','91976d9b-2762-4724-9892-3453213c6b5a','priority','100'),('58075b34-112f-4fdb-b014-9e554b8e3f21','c50b2504-a711-41e6-b1eb-1d43d6aa620e','client-uris-must-match','true'),('5b8a81f2-5de8-4e60-adfa-49f50a86ecac','c62c9bcb-f45d-419b-a354-5af95dc1258c','privateKey','MIIEpAIBAAKCAQEAv076Y7h8aHZgB/C1QDKtq+8Na8YsPfsMrFiEJel+LU0VyiZqJEYHTHiVFHkBeiI3xZEUX4nrnelvcrGi4ST7R+ahEKOfEmg3v7lMnb7u09/YNAWx/X1DWS/FtFmbsbAhFvRyYgJeS4VasLUgeRnT0oe4Rke8Q+rci2Vg4AP9SdNEcclQYy3AZPozBY80XmkfGzR4R6QRD3mOqj1V4tpsTlAct/tEUmK9sHZod+6Q5xPd1QX7ifFfSyejEsBHY6n75w0G3i+bITXEN+445qRcwljmwW1YKffpyFpbJtVG4FLHgBn9qxwDQK6nL12Nlu3hNvO6Qg8sOB63m4H/czlTtwIDAQABAoIBAEo0a7n3asYoOFqMGvniTmwU5wtJTIrkEIffM67y8R7IOi31lZEpWpZmZUkSIKkLkb9/5TujpzFSxQhjb67N5ev/QLVQChkdNJaY3OeJEmE7f8S5+s684j07Yv/wDAyxqTwaqC1tBr9bZBCLySNACeItA6S7GYLsnAwz0A5EbeBOtuuefQTBIL7O3m2QVccO7qXCNuWWxzjVc8E5Cm+KdSgbsyWiaDL9HuITCrX/CrudCobPpSqSRi4NxCvlz8VP+vrkjtUxbiaKoR5LuX81QUyqUpLRqZ5lBVGfr8EswwLxi4CDOwoXznFdKXWrZPvuFr1TJGuceUf+UbRqzj4YTXECgYEA6AugSZkjecwrWwG19ZGKKv1T8nv91qary0ixjJxE/u74TxvSVE7j62Iyl4LmWOFvrEP+87JfTnNPz6Zb1m8Pkmn+W68Y5VIKZOb7GF/iyeVhwqwTXyYFQ0BwU3XGQgxUiRHplFTdzQXOsY339Fekw0IjgQ8LKp5tPNOnDoTWP4cCgYEA0w7HSjMPXxq5B0rNsie50jeUIWS7Hx3tUERjffth6gApexaJlj7JtoD7NEnLPS03VDIgFN3BKJI8TFB97FgrNZxr/aO75R3B9iy7epvTjLX3OWGebacV2FvdgiqyRtbBx8xL8GAg/dkSsm+dQJejr3PMyXFxxuoJHfuOwqhhdlECgYEA5t+abV/Wsjp38KZ1Go3iAP/oZF0FpGpUh4AeV56r71Jo8Jzn2kZb8zjSyXjOIyS57ZYBtwqEVRPaFuqYeXQq9CxNjX9br96+xMIklo3goax+Zii7ZXH4zn7ww7lstw55lZ+i3ZjKzlC25GYyjIQfRL8rgB8tpwvV+C1GC+YTHUUCgYEAqOb3x8KK96IsFtDfQkaWZ8wAqKSzNxi9FPJV6LknR5uvloiXvPwscvhPkC3KDwBDegbPM8OvU+eLh8sWqvB4S+QNbCL/OEETOw3bTyirKL1qxqn/nmMLkWUbJJNErnopA9rTnt9fJ6bzVocKAmoYHU3/weoekoAyoaLyQYd8z7ECgYBANgnj+unqvK61jDQwqgSt0tjbUN9VmMHmTslHehYtickSNPJv+1NCuz87JLgvz6JAtVE90e3O/1HfI+67SXI1K36LwgdLm6cZ8XXzXRRoxzNRedfPJwKQzH8jr8IumyqB+9Kuir3R7ESBNjJknKG74L93Ppa4g0inmOkOM16qeQ=='),('62da7492-efcd-44bb-89ab-990b33eb3d86','c62c9bcb-f45d-419b-a354-5af95dc1258c','certificate','MIICmzCCAYMCBgGW8oKYRDANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjUwNTIxMTEwMTA3WhcNMzUwNTIxMTEwMjQ3WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC/TvpjuHxodmAH8LVAMq2r7w1rxiw9+wysWIQl6X4tTRXKJmokRgdMeJUUeQF6IjfFkRRfieud6W9ysaLhJPtH5qEQo58SaDe/uUydvu7T39g0BbH9fUNZL8W0WZuxsCEW9HJiAl5LhVqwtSB5GdPSh7hGR7xD6tyLZWDgA/1J00RxyVBjLcBk+jMFjzReaR8bNHhHpBEPeY6qPVXi2mxOUBy3+0RSYr2wdmh37pDnE93VBfuJ8V9LJ6MSwEdjqfvnDQbeL5shNcQ37jjmpFzCWObBbVgp9+nIWlsm1UbgUseAGf2rHANArqcvXY2W7eE287pCDyw4Hrebgf9zOVO3AgMBAAEwDQYJKoZIhvcNAQELBQADggEBAHIjSXDuH4RZe4xpWNyOSlxahA/6SCUz2/A1XkrFXmOyNG3KEo+WeOG1PkGNQr4l5o49mFjkZ6z4KOiPBwUrBCh9mVbN4qmyyVX2pcMh99RXXtbB7yBBOOg+JXMOTEaTtxE3QLyClU686swbYbFrIKa36xs4gvxcCb8aZwuyXjz0a9eTdT5NtOmI+cvyD85cKurISdIDv4oIk2iwZL17DXjKcbGDEeqrSssxNfbwuyAHPfuathlj/s4pkFgObBnOImQ52F5yItkIa7ulFPyVs5YQ209/oGsGfzaxu6/cdB4ekVbXVhnzS+mTasrjaLlizd2jKln14LQ8EoAnbtM0iq0='),('63448759-4366-4201-a3d9-c2da658b5a52','1d6d9740-ab63-46e1-a4d6-4cffc4492499','allowed-protocol-mapper-types','oidc-full-name-mapper'),('63d0455f-50ac-41a6-a4bf-327393146950','d7e36b0f-ffa3-476a-8bd4-d43f26f592bf','secret','XFMH31fd_SBUyO8icSdAsg'),('694ac601-aafc-4519-90dd-2e53f38724b0','81dc4d76-c65b-490e-9aa3-23e1e78bd477','algorithm','RSA-OAEP'),('6993e715-20b7-4965-b827-6b95358b1225','4257f9ff-cbf5-4cf3-8422-165ebefae6b9','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('6b499426-f653-4f2d-aea7-d033dc8d04ad','bbc4af7d-2b53-477c-ad52-857d404339c0','certificate','MIICwzCCAasCBgGW57EAcTANBgkqhkiG9w0BAQsFADAlMSMwIQYDVQQDDBpWYWNhdGlvbi1BcHBsaWNhdGlvbi1SZWFsbTAeFw0yNTA1MTkwODM1NTlaFw0zNTA1MTkwODM3MzlaMCUxIzAhBgNVBAMMGlZhY2F0aW9uLUFwcGxpY2F0aW9uLVJlYWxtMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAu5LpAKxRILoWOrvVXSecQ+PS+HiBiyNIM1HugT7vq8TPVBgH5fy+Obw6Bfv3uYaZb2+7llmbb6X2X746pm1MKAbmasqeT6T0DNd2Q+HDUktxoYW0TcCHZWSnpNIhXJP1lCccONJqhJ+QojCXVf2qxoU8weeu/ni1cauAmkvGF72YV9WrWW38JWgJmt4jhETOXjwA+COwB0Uv5FSApQYRSo7mG8GwpbSXeW+p0V2ISIHFaUoP70z59VSe5Hstg2T6BZ6v4qAxN09SAbKELHqDmQp3BD12GfVNkgRCUtgLWN3fdbjC/NJ1Gw2OlkxduuKSQTFzbXVztupFHqx22tfy5QIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQA0uHIIFmZvb+CMVxEyYs3vI3xIGgq27bMFi8IWWOKBt00D8RUNRf2Vyp0Mi+C+utb6imdhiFKUoKXZAF8cGFKw8NAG+HSELqYhP9XEYqRAX0jZjvxEfbttiQYRN5yQOFEZYwc9W0hj9JlMXYr9Xun1zJyhS3Msf7eaGVu6TRuCFNBYglv/sW7LXOJYpCCHYPeOoHGC4aeMJqqSa4ZP95972LOZVfPaRtfWCEczeX31/EV24/w4nwwWoUA62P0xAKZi+DI6/2NuEgHfXqWypridNS0i3N1qBtNSyGQ7cFXAaoVSYB8okUK727RG3lA/9GKIC+kzDa903VCgROhjHca1'),('6fa4bd71-c557-4278-9b61-ee4d688f181b','9b023f60-e86d-4bbd-a46c-3d4745b850d9','allow-default-scopes','true'),('78dc52bf-7dfd-4b96-b342-a30c04d07602','1d6d9740-ab63-46e1-a4d6-4cffc4492499','allowed-protocol-mapper-types','saml-role-list-mapper'),('7a91e92f-4a73-4e66-b734-e10bb724cf76','8e864a80-d087-41e8-a03a-7119b34adc34','host-sending-registration-request-must-match','true'),('7cd7f3d2-741e-4551-b42e-fa3bade0a906','2fb28eff-e513-4c8e-b68c-f8e0b202fb18','allowed-protocol-mapper-types','saml-role-list-mapper'),('7ea34f5d-2237-4685-a172-e9416ba1a250','1d02142a-8f10-4a42-a94d-8ffccd7a8044','allowed-protocol-mapper-types','oidc-address-mapper'),('800ec7a1-ac43-451a-a1c1-8500e2c1bdb4','1d6d9740-ab63-46e1-a4d6-4cffc4492499','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('805b61c4-9a99-4b15-8bd6-63f43d8347e7','c50b2504-a711-41e6-b1eb-1d43d6aa620e','host-sending-registration-request-must-match','true'),('83c999d3-daad-43ab-8d78-1f15983d2ce0','06459450-f239-4556-93ff-776965af1dc1','priority','100'),('83d3ba12-fe1f-4c9b-9e36-ff13239a8d23','2fb28eff-e513-4c8e-b68c-f8e0b202fb18','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('8f49485c-951a-4f48-9dd4-2bcd49a5ceca','1d02142a-8f10-4a42-a94d-8ffccd7a8044','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('8f7b2d7a-91f4-4523-9e18-5fd5166d45fd','91976d9b-2762-4724-9892-3453213c6b5a','kid','93e44efd-3b56-4f0f-bee4-72b44f730aa7'),('90cbd880-f73e-4da4-9a19-4f4b0c5dc325','1d6d9740-ab63-46e1-a4d6-4cffc4492499','allowed-protocol-mapper-types','oidc-address-mapper'),('9539eda1-b754-4174-b013-17ac29f71eb9','9f9d429c-4bbf-4f47-9ec2-5348b8b040e3','priority','100'),('982d238e-6664-492f-be3a-d557f48fc3c3','81dc4d76-c65b-490e-9aa3-23e1e78bd477','privateKey','MIIEowIBAAKCAQEAz4JB5YLyC82fUy3gAccoD1vH84yjqgw1h+ATHUnRa9s0YHAp+VK5Blt1tMWY0+lmqvHvn+8YgUeeu9F1TrMjllMRKXLg0wqibkXouIgmw6+YMNqbLZlbPFTyWrAmLNBzmI1n+K4feEcpLwr/kD6UfL/X+jLlmp6QsK95FlLSo8aU7ZqKK1K5QB4vvd6VyXTePuU8O4jimma5I3uf2wLY0B15piOzWZM0z1q8wwtmTsNPoLmXi8K7mmE5Wn44KFtXBkhTaeKRUa6Eh96sXF20ny5ZZeNS91XTcNMx0Rz9A/nYxtpmifepOQeXmAlpnLp0QYKVkJnG2h4SQ/kRY9rc+QIDAQABAoIBAAL4cuK1tVWnlmR1mijRsIhJFeYtzmP588Q5Ase0YvvqcegALbb6Jlg/HpgSt2WFMv6MeGkviN1vkzKjb3dLx4fN3Zzcc6J3GwHSx1+TjLaCwNN7ivrOoLM5kL9CmUain0ernTWT9zMHaxasz3bBppTYlt9n3h3mBN06oymc0D4e7DC3RxxJMr0AojZIS7m0ZZXDwgMBVJiWksh6npmIut5NaDxGaSE3gJfWYJfEYSHIGmAz33GadCgZKlfUGAxE/qjgqQtRx8w+rvMyEsNqgLP0rn0nxcPhVHBYYAHH2rDDyUzTHUPQ4CMxAzMnk75SNL3rAgK+sLicFF90G0NZrUECgYEA7CqAJMbpMy2COZFTIt3FQFtrCb4zUAdjvckxLqz4iUeCg5D52blDIzVXelJ4BugnaT4w2k49YaOTnglatHot5/IXKy9VlloChCKAPb3wGnnrngsVPBpwuSUdNuPaeSJhKyWnyJmoGDcImPPVIy5qA9MYUw1LK4LSF0wfcWIBozECgYEA4O+isqSuMKd/BijzI2xy0tPI2HX2265MVCiQRqkm/SmpUn3FL6MkUxbcKrS134QbJu1EeyqJ61hy+8dyOfN5uJt+uEP3mJcI3IvWapL8X30/hJjnNxxyxeKGFf1aCRn/FCdtzk07KMCOgoedCmGYDRJjjGR2i+MnJbWMNN77lEkCgYEAybV3I3I85Xg+HLsx3bq66b/rCTRJkVXua7+2YR5dXKsWHxcpPzuLyzuZDqH3YDbSyoHSqfJfXNCgmT92GGWuZcgQ39Ka8ELKmV76V0GuHH77rk3bAi23D3tSm3o7NHEXuwl7Z8tNlfkTP8gqx9SxubiHsw/Mn0op9LoQtP+3VFECgYBvoBxigPz8ojKUUQAQBUKaQ4V5flkKPd4dKaAnoMv7eJBRop6XfGOLZF3QR6u2B24eDEMeyEZ3Z4ZwUlLqVVyDc48YTIpzzAgWwsKeUuExVguOdv7PR6vhbf/Sq87hk2gVjVeduI/yMlTGjBwvyazWV9jVFAoMc6a6vPSeTEYXGQKBgE8s2mc+2YZTmj3i2gE2A/XeZx1S66GzFyRc+Ql4Zl2yBDbhTq//TfHURnU8hTxMg/xy/La+R0+k+FAKLlT9mMdN1CdVxL7CGeVcZjEW8VtXa4XoWTaHVwEi8Rxvgmqx68QFxTJHp9NLuKXk8E7WAONx7oLJP+Y8RuZy6YZDN4nK'),('a4e5de69-40bf-49cd-b231-e77914ad97df','2679bd0d-15af-44f4-a98f-4f00da53aff2','allow-default-scopes','true'),('a60ba22e-030f-4b37-9b83-bc646183a89f','06459450-f239-4556-93ff-776965af1dc1','algorithm','HS512'),('a7c285c2-1fd8-450e-9f62-7b9c274afe5d','91976d9b-2762-4724-9892-3453213c6b5a','secret','gTaj_KhNUk2VpFuW9T1YWAte_2V61jENXC1zfVSGB2GjFEaJ4N0GxneRviewhpdgX59xh8ATr2LLrsPCipd3G85S_7ZnGwxqfJsior60LM-6k51prgsdSU-nn5ib3w1o8g20sJPdkdeSaJVppU2PxFs3jFSVkiljuPU8Uszo70c'),('b0b4ae4d-6f7c-4247-9b84-98693870bf13','4257f9ff-cbf5-4cf3-8422-165ebefae6b9','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('b9581e64-44ff-4af2-a5a5-84f832a45efe','bbc4af7d-2b53-477c-ad52-857d404339c0','priority','100'),('befb3226-43b5-4020-bbf4-2c4041cf8ea8','06459450-f239-4556-93ff-776965af1dc1','secret','pezlNNzl_uZ_ymT4jKOLNllgCpE3uCSpWGmi_XlT1aJm7PA18d5XxoVF_xc1PiBTUtQ7t9F7JdR6VVkkGTv8KKDuHKKbzi3wK1-zvy5tFPyQX9kpGadqlHUTD9enA1E9B3cU1UD635MPVW7KdQygDckF5W2jxnRmlSf3nlTD1BQ'),('c138ffee-fb21-4636-9daf-87340ec4b927','1d02142a-8f10-4a42-a94d-8ffccd7a8044','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('c25af5bb-dfc8-48b2-82d5-eaa36525643f','81dc4d76-c65b-490e-9aa3-23e1e78bd477','priority','100'),('c8c184d0-366f-4082-9f1a-54d3a63c8fc8','9f9d429c-4bbf-4f47-9ec2-5348b8b040e3','kid','cee9f272-6232-40fc-9356-6b0bdcb8a589'),('d1b3ea9e-5c3b-4ca4-a79c-321bdb6cf30a','9b445d66-2dc2-4ff1-a511-59d189df31a2','kc.user.profile.config','{\"attributes\":[{\"name\":\"username\",\"displayName\":\"${username}\",\"validations\":{\"length\":{\"min\":3,\"max\":255},\"username-prohibited-characters\":{},\"up-username-not-idn-homograph\":{}},\"permissions\":{\"view\":[\"admin\",\"user\"],\"edit\":[\"admin\",\"user\"]},\"multivalued\":false},{\"name\":\"email\",\"displayName\":\"${email}\",\"validations\":{\"email\":{},\"length\":{\"max\":255}},\"permissions\":{\"view\":[\"admin\",\"user\"],\"edit\":[\"admin\",\"user\"]},\"multivalued\":false},{\"name\":\"firstName\",\"displayName\":\"${firstName}\",\"validations\":{\"length\":{\"max\":255},\"person-name-prohibited-characters\":{}},\"permissions\":{\"view\":[\"admin\",\"user\"],\"edit\":[\"admin\",\"user\"]},\"multivalued\":false},{\"name\":\"lastName\",\"displayName\":\"${lastName}\",\"validations\":{\"length\":{\"max\":255},\"person-name-prohibited-characters\":{}},\"permissions\":{\"view\":[\"admin\",\"user\"],\"edit\":[\"admin\",\"user\"]},\"multivalued\":false}],\"groups\":[{\"name\":\"user-metadata\",\"displayHeader\":\"User metadata\",\"displayDescription\":\"Attributes, which refer to user metadata\"}]}'),('d45f36ae-dd06-4743-be8b-dd6288c15e70','1d02142a-8f10-4a42-a94d-8ffccd7a8044','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('d7430eb8-e036-4be1-a35a-6ea6c0822e1f','1d6d9740-ab63-46e1-a4d6-4cffc4492499','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('d9681786-4b63-42f8-acd7-23eff81d65ea','81dc4d76-c65b-490e-9aa3-23e1e78bd477','certificate','MIICmzCCAYMCBgGW8oKYxjANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjUwNTIxMTEwMTA3WhcNMzUwNTIxMTEwMjQ3WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDPgkHlgvILzZ9TLeABxygPW8fzjKOqDDWH4BMdSdFr2zRgcCn5UrkGW3W0xZjT6Waq8e+f7xiBR5670XVOsyOWUxEpcuDTCqJuRei4iCbDr5gw2pstmVs8VPJasCYs0HOYjWf4rh94RykvCv+QPpR8v9f6MuWanpCwr3kWUtKjxpTtmoorUrlAHi+93pXJdN4+5Tw7iOKaZrkje5/bAtjQHXmmI7NZkzTPWrzDC2ZOw0+guZeLwruaYTlafjgoW1cGSFNp4pFRroSH3qxcXbSfLlll41L3VdNw0zHRHP0D+djG2maJ96k5B5eYCWmcunRBgpWQmcbaHhJD+RFj2tz5AgMBAAEwDQYJKoZIhvcNAQELBQADggEBAIpL+rtIrr8iZkyeacBD0KGscVP2aBVxAcTojQRDzugSaC4PY7Z647Re6cVAvnbV2H65Otl1Er0sGCooAgktQEtRNbXo45YmhGzkuqIouMc3S+8JqB+IcyoN08XUgWL3ZTiGEsfyH0VymsNbG6egkLjlaSvNxzamiQaCyk1SAYBAD8tfbWMZndnZGFxtimdkHIRZlZflMqE/wQU+JfDYlTPlIYxwgDBZ4Edv/oPobdzH20BVUtdi9WkoSl5ktrEBizgwoXdFt9g9tg1maLDygD5yqGpl1Sy2pXTj4YOqOV6zS8q1Z1Iioqspq6XI9vHvMpXKuS5IA2pASiah5/cW7gU='),('e10724dd-c7e1-41a3-9754-3a93595aea0e','91976d9b-2762-4724-9892-3453213c6b5a','algorithm','HS512'),('e1fa1572-277d-4ed5-8dfe-bab465f278d4','2fb28eff-e513-4c8e-b68c-f8e0b202fb18','allowed-protocol-mapper-types','oidc-address-mapper'),('e25a5301-e7ce-4e7e-90bb-8a8774ebe90a','2fb28eff-e513-4c8e-b68c-f8e0b202fb18','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('e8924645-77b3-48b0-bb81-222cf90c52fb','0392b494-3226-46c5-a73f-dc46a899ac41','allow-default-scopes','true'),('eedb3757-a870-4d3f-a522-6e9edf0cd161','06d9d4be-7a7d-42d4-b27b-1e6f85cc6715','certificate','MIICwzCCAasCBgGW57EArjANBgkqhkiG9w0BAQsFADAlMSMwIQYDVQQDDBpWYWNhdGlvbi1BcHBsaWNhdGlvbi1SZWFsbTAeFw0yNTA1MTkwODM1NTlaFw0zNTA1MTkwODM3MzlaMCUxIzAhBgNVBAMMGlZhY2F0aW9uLUFwcGxpY2F0aW9uLVJlYWxtMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAvdiRH5n6yyttQfmgVwAbhJ3cVBSg2y6n2JIffOa8pYEWaKeuuXb/31sjSYteL74JVr3ISk1KdtYhSpyAyEQRdbCxd97rZpmj7KRekEREe+w0HZ/zkEP+FtqlzDXKJs6pNg82tP/ADf8CVSUyWky/lTfcv+/BVKC4tRXDjPk6+FrqFdBe3WryHrBSt0yCmipnV/0EyzlpIKX5oUn59wfwbmkAhKvQQSMyeZnuFSZxie7qMhk083fhnH9BUF/PB1mDa2aAQJZ3JLX5DqvH39XjdiAk40AbAqQRPuuiyputIEgg7ETPmRBpfCPQgPn0VWqe+vbew0tcm090HhRRe84ZawIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQAhEWPDsPD0/S1x6/gbVs484EVDSrOqfcMRirSZw0q3FG5PwEq8slTIIvku5FrHUTLXot2RXxPxvVuenz5vnO4INGuwXdjbIgCH3IV2lRfNKjZkC6eKEtUEv53TL8XngGzk0hTclWMmrV9ppz0SOXhwSLBwtrrZUErRhHZcggYeC4B8k6RPFm/BnfAUiCK/VvsZtVOOWuZqdPaiGxbcSBzuacn5ebRq9otTryi5vBtE+2k83RhDcTmZtsEUino6vBpPHRx/9xDbVoX07Yp3XkPLhZUvgR6QVFjiZGfZhFoLyMf5Io8NsEtc8H2eXHrpiD05ll1HL6EnN3dZ4uqyohci'),('efd39acd-b639-4bb7-94be-18068d0d2c15','f735f3b4-128a-4a21-8153-4c801555c61d','max-clients','200'),('f1c0d187-9379-4307-8503-14b17f606293','c62c9bcb-f45d-419b-a354-5af95dc1258c','keyUse','SIG'),('f345c8b1-3840-4c81-8483-01823ffa27a0','1d6d9740-ab63-46e1-a4d6-4cffc4492499','allowed-protocol-mapper-types','saml-user-property-mapper'),('f3a1b674-0418-4d32-ab9a-f09161339ab5','4257f9ff-cbf5-4cf3-8422-165ebefae6b9','allowed-protocol-mapper-types','saml-user-attribute-mapper');
/*!40000 ALTER TABLE `COMPONENT_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPOSITE_ROLE`
--

DROP TABLE IF EXISTS `COMPOSITE_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPOSITE_ROLE` (
  `COMPOSITE` varchar(36) NOT NULL,
  `CHILD_ROLE` varchar(36) NOT NULL,
  PRIMARY KEY (`COMPOSITE`,`CHILD_ROLE`),
  KEY `IDX_COMPOSITE` (`COMPOSITE`),
  KEY `IDX_COMPOSITE_CHILD` (`CHILD_ROLE`),
  CONSTRAINT `FK_A63WVEKFTU8JO1PNJ81E7MCE2` FOREIGN KEY (`COMPOSITE`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  CONSTRAINT `FK_GR7THLLB9LU8Q4VQA4524JJY8` FOREIGN KEY (`CHILD_ROLE`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPOSITE_ROLE`
--

LOCK TABLES `COMPOSITE_ROLE` WRITE;
/*!40000 ALTER TABLE `COMPOSITE_ROLE` DISABLE KEYS */;
INSERT INTO `COMPOSITE_ROLE` VALUES ('184a5a2a-ee8b-432e-9c5c-7d3cc48c35dc','0c43be53-3652-4fbd-8ed7-956a7e48bbda'),('184a5a2a-ee8b-432e-9c5c-7d3cc48c35dc','0cc9314e-cba7-45eb-a3b6-e8b73f91560d'),('184a5a2a-ee8b-432e-9c5c-7d3cc48c35dc','1111b9a1-4675-4a0c-b3fa-9987676311c4'),('184a5a2a-ee8b-432e-9c5c-7d3cc48c35dc','14d51b92-c2cf-4a5e-9899-a4e92e2cceec'),('184a5a2a-ee8b-432e-9c5c-7d3cc48c35dc','1ace4c2f-7b4f-46e1-bd29-27bbf9f264e1'),('184a5a2a-ee8b-432e-9c5c-7d3cc48c35dc','237ba0c5-4615-41eb-b3fa-b1ae34a0ab2a'),('184a5a2a-ee8b-432e-9c5c-7d3cc48c35dc','2b2f30c8-3084-4b7c-8396-d134964e583d'),('184a5a2a-ee8b-432e-9c5c-7d3cc48c35dc','31f9ac1d-aff2-4e26-90b4-ecaefa810224'),('184a5a2a-ee8b-432e-9c5c-7d3cc48c35dc','38924d94-c83c-4b34-8017-57a07d529d43'),('184a5a2a-ee8b-432e-9c5c-7d3cc48c35dc','39bfb7e3-d920-4eb1-8c84-cb462ff38eb4'),('184a5a2a-ee8b-432e-9c5c-7d3cc48c35dc','3de5dcfc-1191-46bb-86f6-87b193a7666e'),('184a5a2a-ee8b-432e-9c5c-7d3cc48c35dc','3eadea75-babf-465a-8cae-d0b99fcddf8c'),('184a5a2a-ee8b-432e-9c5c-7d3cc48c35dc','441944ba-c379-48b8-bbf8-27672ffde5f3'),('184a5a2a-ee8b-432e-9c5c-7d3cc48c35dc','4f50ffc2-5964-48bf-83cc-a943fa6010f9'),('184a5a2a-ee8b-432e-9c5c-7d3cc48c35dc','53cacc79-1006-4d9d-a3fe-5d469feb74c8'),('184a5a2a-ee8b-432e-9c5c-7d3cc48c35dc','54d3cbf6-2f36-46b8-8fc0-e05e155d016e'),('184a5a2a-ee8b-432e-9c5c-7d3cc48c35dc','5ddab29b-d94c-4d4c-8f8f-f60fe338b37c'),('184a5a2a-ee8b-432e-9c5c-7d3cc48c35dc','6af6b12b-b62f-4caf-a1b7-eb8396f5e310'),('184a5a2a-ee8b-432e-9c5c-7d3cc48c35dc','6cdbc74a-ac1b-47ae-bbf4-9e9b0e268058'),('184a5a2a-ee8b-432e-9c5c-7d3cc48c35dc','81b13ac4-6c29-4092-8907-1f5a4d8b4afc'),('184a5a2a-ee8b-432e-9c5c-7d3cc48c35dc','839c7967-7450-47bd-9839-64112478ff03'),('184a5a2a-ee8b-432e-9c5c-7d3cc48c35dc','949043c8-e6ac-4c38-9d19-c70c5aa15bd0'),('184a5a2a-ee8b-432e-9c5c-7d3cc48c35dc','985e2654-2f28-4048-ac91-00b494f6dd44'),('184a5a2a-ee8b-432e-9c5c-7d3cc48c35dc','b05f11bd-7b5e-4a3d-b614-cae9021a5697'),('184a5a2a-ee8b-432e-9c5c-7d3cc48c35dc','b3edca27-004f-4cba-9068-e1c8f0d67dcd'),('184a5a2a-ee8b-432e-9c5c-7d3cc48c35dc','c2b12b07-be9e-43c9-b15e-0d1c0d2016e7'),('184a5a2a-ee8b-432e-9c5c-7d3cc48c35dc','c712f8d7-7521-41f9-b2db-f59434ce3792'),('184a5a2a-ee8b-432e-9c5c-7d3cc48c35dc','c9c9a349-0be8-4e93-a801-07ff4ad5e530'),('184a5a2a-ee8b-432e-9c5c-7d3cc48c35dc','d007969f-ce36-43a3-b3b1-c289c07e0129'),('184a5a2a-ee8b-432e-9c5c-7d3cc48c35dc','da0c8ae2-4aae-4a86-8bb7-9f7dc92053db'),('184a5a2a-ee8b-432e-9c5c-7d3cc48c35dc','da3516e3-0d2c-4a32-94ed-cac5d88fd47d'),('184a5a2a-ee8b-432e-9c5c-7d3cc48c35dc','e11f0c58-e684-47da-a445-dce0f238fa18'),('184a5a2a-ee8b-432e-9c5c-7d3cc48c35dc','e18c9b29-973b-4d85-b3e8-352333ebc585'),('184a5a2a-ee8b-432e-9c5c-7d3cc48c35dc','e74bb1b4-8dd8-40f1-ac13-fe1cd623c147'),('184a5a2a-ee8b-432e-9c5c-7d3cc48c35dc','e9538ba9-f959-4916-aeb2-b03093692780'),('184a5a2a-ee8b-432e-9c5c-7d3cc48c35dc','ec2bf874-2c49-47a6-89c0-74a94b6cbc9c'),('184a5a2a-ee8b-432e-9c5c-7d3cc48c35dc','f8148bf2-c114-45e8-acae-06c2d7f8c16c'),('5ddab29b-d94c-4d4c-8f8f-f60fe338b37c','1111b9a1-4675-4a0c-b3fa-9987676311c4'),('5ddab29b-d94c-4d4c-8f8f-f60fe338b37c','3eadea75-babf-465a-8cae-d0b99fcddf8c'),('5f82855d-a7aa-4005-bc85-e78cf78f4652','0d104174-6f9a-47d3-92ba-1a3b16e41588'),('6cdbc74a-ac1b-47ae-bbf4-9e9b0e268058','54d3cbf6-2f36-46b8-8fc0-e05e155d016e'),('7029872d-b92d-4f2a-9d9b-777bbb23b80a','869920e0-32c4-42d9-8e08-0551f1cd6198'),('7029872d-b92d-4f2a-9d9b-777bbb23b80a','de813c81-b789-494a-b108-54b8f4723c74'),('8d27ef85-da16-4ba9-90f5-fcb90f63d9f8','b21b99e5-c9e2-4b41-b1b7-78e69a171c1e'),('9e1fe19a-8fdd-42b7-a119-377217d7d321','b3dd5ed2-01e4-4a45-ad16-9b48a7b7a83f'),('ac34a50c-0c2e-4fcc-bf21-94fd0453241a','3a6868fa-7e89-451b-82ce-d71272b8cce5'),('ac34a50c-0c2e-4fcc-bf21-94fd0453241a','9833b7d3-39b8-4da5-bc49-f8c462cfea9d'),('ac34a50c-0c2e-4fcc-bf21-94fd0453241a','c2fb1042-de54-4555-8c61-8e09fa7fc1a2'),('ac34a50c-0c2e-4fcc-bf21-94fd0453241a','daebd200-b3d3-4db2-b97b-32db0c2856ca'),('c9c9a349-0be8-4e93-a801-07ff4ad5e530','1ace4c2f-7b4f-46e1-bd29-27bbf9f264e1'),('cbf4e559-3a25-4379-8780-e1a78229471f','02d0d17e-13c4-402f-9896-d61257a3a079'),('cbf4e559-3a25-4379-8780-e1a78229471f','06088566-c1e8-4c32-afb1-3798005d158a'),('cbf4e559-3a25-4379-8780-e1a78229471f','0d104174-6f9a-47d3-92ba-1a3b16e41588'),('cbf4e559-3a25-4379-8780-e1a78229471f','0eb71ff0-8e09-4860-b60b-1ba88e6844a4'),('cbf4e559-3a25-4379-8780-e1a78229471f','13db7752-29e7-434a-aa50-ad65ffe38957'),('cbf4e559-3a25-4379-8780-e1a78229471f','207d4d31-4026-4c28-9bd9-a935e19567df'),('cbf4e559-3a25-4379-8780-e1a78229471f','24fc090d-d4c8-40cf-89d9-4336ce4adde3'),('cbf4e559-3a25-4379-8780-e1a78229471f','25addf6f-8d88-4683-9f82-a095d8a55601'),('cbf4e559-3a25-4379-8780-e1a78229471f','5f82855d-a7aa-4005-bc85-e78cf78f4652'),('cbf4e559-3a25-4379-8780-e1a78229471f','6564ffdb-edd1-4945-b1ef-940020985fd5'),('cbf4e559-3a25-4379-8780-e1a78229471f','7029872d-b92d-4f2a-9d9b-777bbb23b80a'),('cbf4e559-3a25-4379-8780-e1a78229471f','7e1906b1-00c2-40a3-bbf1-c885619666aa'),('cbf4e559-3a25-4379-8780-e1a78229471f','82448ad6-9b59-48d7-b7d7-4586b7ebe462'),('cbf4e559-3a25-4379-8780-e1a78229471f','869920e0-32c4-42d9-8e08-0551f1cd6198'),('cbf4e559-3a25-4379-8780-e1a78229471f','9cf6044d-02bc-4b9b-b720-9124c0ef09aa'),('cbf4e559-3a25-4379-8780-e1a78229471f','aad6f306-11ce-4661-baf1-b7a7358bd426'),('cbf4e559-3a25-4379-8780-e1a78229471f','de813c81-b789-494a-b108-54b8f4723c74'),('cbf4e559-3a25-4379-8780-e1a78229471f','ff5aa85c-7f69-4e14-9210-8d5d14fed6d2'),('da3516e3-0d2c-4a32-94ed-cac5d88fd47d','985e2654-2f28-4048-ac91-00b494f6dd44'),('da3516e3-0d2c-4a32-94ed-cac5d88fd47d','d007969f-ce36-43a3-b3b1-c289c07e0129'),('daebd200-b3d3-4db2-b97b-32db0c2856ca','dab33d92-d975-4a54-b48b-01847a482d41'),('f8c5c287-e578-4636-aeea-109d3f323dae','0ccb3025-24f1-4c04-b301-b8e14c7191d1'),('ffcd9e1e-a28e-4fd5-8e32-c8c51e313e3c','9e1fe19a-8fdd-42b7-a119-377217d7d321'),('ffcd9e1e-a28e-4fd5-8e32-c8c51e313e3c','cc7800c3-eeb3-4bc9-b394-01d8cae7cedd'),('ffcd9e1e-a28e-4fd5-8e32-c8c51e313e3c','ee0fe54a-dbc8-4240-85a4-c6e47d8fa458'),('ffcd9e1e-a28e-4fd5-8e32-c8c51e313e3c','ffa8b70f-f291-43ea-8ae8-3e099eb425bf');
/*!40000 ALTER TABLE `COMPOSITE_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CREDENTIAL`
--

DROP TABLE IF EXISTS `CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext,
  `CREDENTIAL_DATA` longtext,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_CREDENTIAL` (`USER_ID`),
  CONSTRAINT `FK_PFYR0GLASQYL0DEI3KL69R6V0` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CREDENTIAL`
--

LOCK TABLES `CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `CREDENTIAL` DISABLE KEYS */;
INSERT INTO `CREDENTIAL` VALUES ('49275e44-16de-455f-900d-4471e42e0422',NULL,'password','75c083ed-0e38-4a37-9044-06b47ec9d88e',1747825369921,NULL,'{\"value\":\"LRshIa9ytVFHU3XmBKU3S5foRVPVEMb44c3m1Fhv+HkfT47W8PC2FT0ttAKSzzzY5+MTZHRG098icLBBUdXx2w==\",\"salt\":\"Yfxrxu9U+7/ZUztqoIN9iQ==\",\"additionalParameters\":{}}','{\"hashIterations\":210000,\"algorithm\":\"pbkdf2-sha512\",\"additionalParameters\":{}}',10),('dfcc62dd-a30d-4f56-b9a0-3076b1f62002',NULL,'password','053434a0-fba3-4204-839a-de90561cf9d3',1747643900157,'My password','{\"value\":\"kOM+aZCUdbcpAvU4rpytwNZAjOp1iberFLppIBfeddPREKJOUjGD9K2P+MXkXaA9g1m6ycjR/Ei+fBFR7Fi3Vw==\",\"salt\":\"gaPKONtKiwBKFWQSrLouVA==\",\"additionalParameters\":{}}','{\"hashIterations\":210000,\"algorithm\":\"pbkdf2-sha512\",\"additionalParameters\":{}}',10);
/*!40000 ALTER TABLE `CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOG`
--

LOCK TABLES `DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOG` VALUES ('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2025-05-21 11:02:23',1,'EXECUTED','9:6f1016664e21e16d26517a4418f5e3df','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'4.25.1',NULL,NULL,'7825340853'),('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/db2-jpa-changelog-1.0.0.Final.xml','2025-05-21 11:02:23',2,'MARK_RAN','9:828775b1596a07d1200ba1d49e5e3941','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'4.25.1',NULL,NULL,'7825340853'),('1.1.0.Beta1','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Beta1.xml','2025-05-21 11:02:24',3,'EXECUTED','9:5f090e44a7d595883c1fb61f4b41fd38','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...','',NULL,'4.25.1',NULL,NULL,'7825340853'),('1.1.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Final.xml','2025-05-21 11:02:24',4,'EXECUTED','9:c07e577387a3d2c04d1adc9aaad8730e','renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY','',NULL,'4.25.1',NULL,NULL,'7825340853'),('1.2.0.Beta1','psilva@redhat.com','META-INF/jpa-changelog-1.2.0.Beta1.xml','2025-05-21 11:02:25',5,'EXECUTED','9:b68ce996c655922dbcd2fe6b6ae72686','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'4.25.1',NULL,NULL,'7825340853'),('1.2.0.Beta1','psilva@redhat.com','META-INF/db2-jpa-changelog-1.2.0.Beta1.xml','2025-05-21 11:02:25',6,'MARK_RAN','9:543b5c9989f024fe35c6f6c5a97de88e','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'4.25.1',NULL,NULL,'7825340853'),('1.2.0.RC1','bburke@redhat.com','META-INF/jpa-changelog-1.2.0.CR1.xml','2025-05-21 11:02:27',7,'EXECUTED','9:765afebbe21cf5bbca048e632df38336','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'4.25.1',NULL,NULL,'7825340853'),('1.2.0.RC1','bburke@redhat.com','META-INF/db2-jpa-changelog-1.2.0.CR1.xml','2025-05-21 11:02:27',8,'MARK_RAN','9:db4a145ba11a6fdaefb397f6dbf829a1','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'4.25.1',NULL,NULL,'7825340853'),('1.2.0.Final','keycloak','META-INF/jpa-changelog-1.2.0.Final.xml','2025-05-21 11:02:27',9,'EXECUTED','9:9d05c7be10cdb873f8bcb41bc3a8ab23','update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT','',NULL,'4.25.1',NULL,NULL,'7825340853'),('1.3.0','bburke@redhat.com','META-INF/jpa-changelog-1.3.0.xml','2025-05-21 11:02:28',10,'EXECUTED','9:18593702353128d53111f9b1ff0b82b8','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...','',NULL,'4.25.1',NULL,NULL,'7825340853'),('1.4.0','bburke@redhat.com','META-INF/jpa-changelog-1.4.0.xml','2025-05-21 11:02:29',11,'EXECUTED','9:6122efe5f090e41a85c0f1c9e52cbb62','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.25.1',NULL,NULL,'7825340853'),('1.4.0','bburke@redhat.com','META-INF/db2-jpa-changelog-1.4.0.xml','2025-05-21 11:02:29',12,'MARK_RAN','9:e1ff28bf7568451453f844c5d54bb0b5','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.25.1',NULL,NULL,'7825340853'),('1.5.0','bburke@redhat.com','META-INF/jpa-changelog-1.5.0.xml','2025-05-21 11:02:29',13,'EXECUTED','9:7af32cd8957fbc069f796b61217483fd','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.25.1',NULL,NULL,'7825340853'),('1.6.1_from15','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2025-05-21 11:02:29',14,'EXECUTED','9:6005e15e84714cd83226bf7879f54190','addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...','',NULL,'4.25.1',NULL,NULL,'7825340853'),('1.6.1_from16-pre','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2025-05-21 11:02:29',15,'MARK_RAN','9:bf656f5a2b055d07f314431cae76f06c','delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION','',NULL,'4.25.1',NULL,NULL,'7825340853'),('1.6.1_from16','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2025-05-21 11:02:29',16,'MARK_RAN','9:f8dadc9284440469dcf71e25ca6ab99b','dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...','',NULL,'4.25.1',NULL,NULL,'7825340853'),('1.6.1','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2025-05-21 11:02:29',17,'EXECUTED','9:d41d8cd98f00b204e9800998ecf8427e','empty','',NULL,'4.25.1',NULL,NULL,'7825340853'),('1.7.0','bburke@redhat.com','META-INF/jpa-changelog-1.7.0.xml','2025-05-21 11:02:30',18,'EXECUTED','9:3368ff0be4c2855ee2dd9ca813b38d8e','createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...','',NULL,'4.25.1',NULL,NULL,'7825340853'),('1.8.0','mposolda@redhat.com','META-INF/jpa-changelog-1.8.0.xml','2025-05-21 11:02:31',19,'EXECUTED','9:8ac2fb5dd030b24c0570a763ed75ed20','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'4.25.1',NULL,NULL,'7825340853'),('1.8.0-2','keycloak','META-INF/jpa-changelog-1.8.0.xml','2025-05-21 11:02:31',20,'EXECUTED','9:f91ddca9b19743db60e3057679810e6c','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'4.25.1',NULL,NULL,'7825340853'),('1.8.0','mposolda@redhat.com','META-INF/db2-jpa-changelog-1.8.0.xml','2025-05-21 11:02:31',21,'MARK_RAN','9:831e82914316dc8a57dc09d755f23c51','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'4.25.1',NULL,NULL,'7825340853'),('1.8.0-2','keycloak','META-INF/db2-jpa-changelog-1.8.0.xml','2025-05-21 11:02:31',22,'MARK_RAN','9:f91ddca9b19743db60e3057679810e6c','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'4.25.1',NULL,NULL,'7825340853'),('1.9.0','mposolda@redhat.com','META-INF/jpa-changelog-1.9.0.xml','2025-05-21 11:02:31',23,'EXECUTED','9:bc3d0f9e823a69dc21e23e94c7a94bb1','update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...','',NULL,'4.25.1',NULL,NULL,'7825340853'),('1.9.1','keycloak','META-INF/jpa-changelog-1.9.1.xml','2025-05-21 11:02:31',24,'EXECUTED','9:c9999da42f543575ab790e76439a2679','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'4.25.1',NULL,NULL,'7825340853'),('1.9.1','keycloak','META-INF/db2-jpa-changelog-1.9.1.xml','2025-05-21 11:02:31',25,'MARK_RAN','9:0d6c65c6f58732d81569e77b10ba301d','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'4.25.1',NULL,NULL,'7825340853'),('1.9.2','keycloak','META-INF/jpa-changelog-1.9.2.xml','2025-05-21 11:02:31',26,'EXECUTED','9:fc576660fc016ae53d2d4778d84d86d0','createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...','',NULL,'4.25.1',NULL,NULL,'7825340853'),('authz-2.0.0','psilva@redhat.com','META-INF/jpa-changelog-authz-2.0.0.xml','2025-05-21 11:02:32',27,'EXECUTED','9:43ed6b0da89ff77206289e87eaa9c024','createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...','',NULL,'4.25.1',NULL,NULL,'7825340853'),('authz-2.5.1','psilva@redhat.com','META-INF/jpa-changelog-authz-2.5.1.xml','2025-05-21 11:02:32',28,'EXECUTED','9:44bae577f551b3738740281eceb4ea70','update tableName=RESOURCE_SERVER_POLICY','',NULL,'4.25.1',NULL,NULL,'7825340853'),('2.1.0-KEYCLOAK-5461','bburke@redhat.com','META-INF/jpa-changelog-2.1.0.xml','2025-05-21 11:02:33',29,'EXECUTED','9:bd88e1f833df0420b01e114533aee5e8','createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...','',NULL,'4.25.1',NULL,NULL,'7825340853'),('2.2.0','bburke@redhat.com','META-INF/jpa-changelog-2.2.0.xml','2025-05-21 11:02:33',30,'EXECUTED','9:a7022af5267f019d020edfe316ef4371','addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...','',NULL,'4.25.1',NULL,NULL,'7825340853'),('2.3.0','bburke@redhat.com','META-INF/jpa-changelog-2.3.0.xml','2025-05-21 11:02:34',31,'EXECUTED','9:fc155c394040654d6a79227e56f5e25a','createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...','',NULL,'4.25.1',NULL,NULL,'7825340853'),('2.4.0','bburke@redhat.com','META-INF/jpa-changelog-2.4.0.xml','2025-05-21 11:02:34',32,'EXECUTED','9:eac4ffb2a14795e5dc7b426063e54d88','customChange','',NULL,'4.25.1',NULL,NULL,'7825340853'),('2.5.0','bburke@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2025-05-21 11:02:34',33,'EXECUTED','9:54937c05672568c4c64fc9524c1e9462','customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION','',NULL,'4.25.1',NULL,NULL,'7825340853'),('2.5.0-unicode-oracle','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2025-05-21 11:02:34',34,'MARK_RAN','9:3a32bace77c84d7678d035a7f5a8084e','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'4.25.1',NULL,NULL,'7825340853'),('2.5.0-unicode-other-dbs','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2025-05-21 11:02:35',35,'EXECUTED','9:33d72168746f81f98ae3a1e8e0ca3554','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'4.25.1',NULL,NULL,'7825340853'),('2.5.0-duplicate-email-support','slawomir@dabek.name','META-INF/jpa-changelog-2.5.0.xml','2025-05-21 11:02:35',36,'EXECUTED','9:61b6d3d7a4c0e0024b0c839da283da0c','addColumn tableName=REALM','',NULL,'4.25.1',NULL,NULL,'7825340853'),('2.5.0-unique-group-names','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2025-05-21 11:02:35',37,'EXECUTED','9:8dcac7bdf7378e7d823cdfddebf72fda','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.25.1',NULL,NULL,'7825340853'),('2.5.1','bburke@redhat.com','META-INF/jpa-changelog-2.5.1.xml','2025-05-21 11:02:35',38,'EXECUTED','9:a2b870802540cb3faa72098db5388af3','addColumn tableName=FED_USER_CONSENT','',NULL,'4.25.1',NULL,NULL,'7825340853'),('3.0.0','bburke@redhat.com','META-INF/jpa-changelog-3.0.0.xml','2025-05-21 11:02:35',39,'EXECUTED','9:132a67499ba24bcc54fb5cbdcfe7e4c0','addColumn tableName=IDENTITY_PROVIDER','',NULL,'4.25.1',NULL,NULL,'7825340853'),('3.2.0-fix','keycloak','META-INF/jpa-changelog-3.2.0.xml','2025-05-21 11:02:35',40,'MARK_RAN','9:938f894c032f5430f2b0fafb1a243462','addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS','',NULL,'4.25.1',NULL,NULL,'7825340853'),('3.2.0-fix-with-keycloak-5416','keycloak','META-INF/jpa-changelog-3.2.0.xml','2025-05-21 11:02:35',41,'MARK_RAN','9:845c332ff1874dc5d35974b0babf3006','dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS','',NULL,'4.25.1',NULL,NULL,'7825340853'),('3.2.0-fix-offline-sessions','hmlnarik','META-INF/jpa-changelog-3.2.0.xml','2025-05-21 11:02:35',42,'EXECUTED','9:fc86359c079781adc577c5a217e4d04c','customChange','',NULL,'4.25.1',NULL,NULL,'7825340853'),('3.2.0-fixed','keycloak','META-INF/jpa-changelog-3.2.0.xml','2025-05-21 11:02:36',43,'EXECUTED','9:59a64800e3c0d09b825f8a3b444fa8f4','addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...','',NULL,'4.25.1',NULL,NULL,'7825340853'),('3.3.0','keycloak','META-INF/jpa-changelog-3.3.0.xml','2025-05-21 11:02:36',44,'EXECUTED','9:d48d6da5c6ccf667807f633fe489ce88','addColumn tableName=USER_ENTITY','',NULL,'4.25.1',NULL,NULL,'7825340853'),('authz-3.4.0.CR1-resource-server-pk-change-part1','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2025-05-21 11:02:36',45,'EXECUTED','9:dde36f7973e80d71fceee683bc5d2951','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE','',NULL,'4.25.1',NULL,NULL,'7825340853'),('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2025-05-21 11:02:36',46,'EXECUTED','9:b855e9b0a406b34fa323235a0cf4f640','customChange','',NULL,'4.25.1',NULL,NULL,'7825340853'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2025-05-21 11:02:36',47,'MARK_RAN','9:51abbacd7b416c50c4421a8cabf7927e','dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE','',NULL,'4.25.1',NULL,NULL,'7825340853'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2025-05-21 11:02:37',48,'EXECUTED','9:bdc99e567b3398bac83263d375aad143','addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...','',NULL,'4.25.1',NULL,NULL,'7825340853'),('authn-3.4.0.CR1-refresh-token-max-reuse','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2025-05-21 11:02:37',49,'EXECUTED','9:d198654156881c46bfba39abd7769e69','addColumn tableName=REALM','',NULL,'4.25.1',NULL,NULL,'7825340853'),('3.4.0','keycloak','META-INF/jpa-changelog-3.4.0.xml','2025-05-21 11:02:38',50,'EXECUTED','9:cfdd8736332ccdd72c5256ccb42335db','addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...','',NULL,'4.25.1',NULL,NULL,'7825340853'),('3.4.0-KEYCLOAK-5230','hmlnarik@redhat.com','META-INF/jpa-changelog-3.4.0.xml','2025-05-21 11:02:38',51,'EXECUTED','9:7c84de3d9bd84d7f077607c1a4dcb714','createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...','',NULL,'4.25.1',NULL,NULL,'7825340853'),('3.4.1','psilva@redhat.com','META-INF/jpa-changelog-3.4.1.xml','2025-05-21 11:02:38',52,'EXECUTED','9:5a6bb36cbefb6a9d6928452c0852af2d','modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.25.1',NULL,NULL,'7825340853'),('3.4.2','keycloak','META-INF/jpa-changelog-3.4.2.xml','2025-05-21 11:02:38',53,'EXECUTED','9:8f23e334dbc59f82e0a328373ca6ced0','update tableName=REALM','',NULL,'4.25.1',NULL,NULL,'7825340853'),('3.4.2-KEYCLOAK-5172','mkanis@redhat.com','META-INF/jpa-changelog-3.4.2.xml','2025-05-21 11:02:38',54,'EXECUTED','9:9156214268f09d970cdf0e1564d866af','update tableName=CLIENT','',NULL,'4.25.1',NULL,NULL,'7825340853'),('4.0.0-KEYCLOAK-6335','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2025-05-21 11:02:38',55,'EXECUTED','9:db806613b1ed154826c02610b7dbdf74','createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS','',NULL,'4.25.1',NULL,NULL,'7825340853'),('4.0.0-CLEANUP-UNUSED-TABLE','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2025-05-21 11:02:38',56,'EXECUTED','9:229a041fb72d5beac76bb94a5fa709de','dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING','',NULL,'4.25.1',NULL,NULL,'7825340853'),('4.0.0-KEYCLOAK-6228','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2025-05-21 11:02:39',57,'EXECUTED','9:079899dade9c1e683f26b2aa9ca6ff04','dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...','',NULL,'4.25.1',NULL,NULL,'7825340853'),('4.0.0-KEYCLOAK-5579-fixed','mposolda@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2025-05-21 11:02:41',58,'EXECUTED','9:139b79bcbbfe903bb1c2d2a4dbf001d9','dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...','',NULL,'4.25.1',NULL,NULL,'7825340853'),('authz-4.0.0.CR1','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.CR1.xml','2025-05-21 11:02:41',59,'EXECUTED','9:b55738ad889860c625ba2bf483495a04','createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...','',NULL,'4.25.1',NULL,NULL,'7825340853'),('authz-4.0.0.Beta3','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.Beta3.xml','2025-05-21 11:02:41',60,'EXECUTED','9:e0057eac39aa8fc8e09ac6cfa4ae15fe','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY','',NULL,'4.25.1',NULL,NULL,'7825340853'),('authz-4.2.0.Final','mhajas@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2025-05-21 11:02:41',61,'EXECUTED','9:42a33806f3a0443fe0e7feeec821326c','createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...','',NULL,'4.25.1',NULL,NULL,'7825340853'),('authz-4.2.0.Final-KEYCLOAK-9944','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2025-05-21 11:02:41',62,'EXECUTED','9:9968206fca46eecc1f51db9c024bfe56','addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS','',NULL,'4.25.1',NULL,NULL,'7825340853'),('4.2.0-KEYCLOAK-6313','wadahiro@gmail.com','META-INF/jpa-changelog-4.2.0.xml','2025-05-21 11:02:41',63,'EXECUTED','9:92143a6daea0a3f3b8f598c97ce55c3d','addColumn tableName=REQUIRED_ACTION_PROVIDER','',NULL,'4.25.1',NULL,NULL,'7825340853'),('4.3.0-KEYCLOAK-7984','wadahiro@gmail.com','META-INF/jpa-changelog-4.3.0.xml','2025-05-21 11:02:41',64,'EXECUTED','9:82bab26a27195d889fb0429003b18f40','update tableName=REQUIRED_ACTION_PROVIDER','',NULL,'4.25.1',NULL,NULL,'7825340853'),('4.6.0-KEYCLOAK-7950','psilva@redhat.com','META-INF/jpa-changelog-4.6.0.xml','2025-05-21 11:02:41',65,'EXECUTED','9:e590c88ddc0b38b0ae4249bbfcb5abc3','update tableName=RESOURCE_SERVER_RESOURCE','',NULL,'4.25.1',NULL,NULL,'7825340853'),('4.6.0-KEYCLOAK-8377','keycloak','META-INF/jpa-changelog-4.6.0.xml','2025-05-21 11:02:41',66,'EXECUTED','9:5c1f475536118dbdc38d5d7977950cc0','createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...','',NULL,'4.25.1',NULL,NULL,'7825340853'),('4.6.0-KEYCLOAK-8555','gideonray@gmail.com','META-INF/jpa-changelog-4.6.0.xml','2025-05-21 11:02:42',67,'EXECUTED','9:e7c9f5f9c4d67ccbbcc215440c718a17','createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT','',NULL,'4.25.1',NULL,NULL,'7825340853'),('4.7.0-KEYCLOAK-1267','sguilhen@redhat.com','META-INF/jpa-changelog-4.7.0.xml','2025-05-21 11:02:42',68,'EXECUTED','9:88e0bfdda924690d6f4e430c53447dd5','addColumn tableName=REALM','',NULL,'4.25.1',NULL,NULL,'7825340853'),('4.7.0-KEYCLOAK-7275','keycloak','META-INF/jpa-changelog-4.7.0.xml','2025-05-21 11:02:42',69,'EXECUTED','9:f53177f137e1c46b6a88c59ec1cb5218','renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...','',NULL,'4.25.1',NULL,NULL,'7825340853'),('4.8.0-KEYCLOAK-8835','sguilhen@redhat.com','META-INF/jpa-changelog-4.8.0.xml','2025-05-21 11:02:42',70,'EXECUTED','9:a74d33da4dc42a37ec27121580d1459f','addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM','',NULL,'4.25.1',NULL,NULL,'7825340853'),('authz-7.0.0-KEYCLOAK-10443','psilva@redhat.com','META-INF/jpa-changelog-authz-7.0.0.xml','2025-05-21 11:02:42',71,'EXECUTED','9:fd4ade7b90c3b67fae0bfcfcb42dfb5f','addColumn tableName=RESOURCE_SERVER','',NULL,'4.25.1',NULL,NULL,'7825340853'),('8.0.0-adding-credential-columns','keycloak','META-INF/jpa-changelog-8.0.0.xml','2025-05-21 11:02:42',72,'EXECUTED','9:aa072ad090bbba210d8f18781b8cebf4','addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL','',NULL,'4.25.1',NULL,NULL,'7825340853'),('8.0.0-updating-credential-data-not-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2025-05-21 11:02:42',73,'EXECUTED','9:1ae6be29bab7c2aa376f6983b932be37','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'4.25.1',NULL,NULL,'7825340853'),('8.0.0-updating-credential-data-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2025-05-21 11:02:42',74,'MARK_RAN','9:14706f286953fc9a25286dbd8fb30d97','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'4.25.1',NULL,NULL,'7825340853'),('8.0.0-credential-cleanup-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2025-05-21 11:02:43',75,'EXECUTED','9:2b9cc12779be32c5b40e2e67711a218b','dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...','',NULL,'4.25.1',NULL,NULL,'7825340853'),('8.0.0-resource-tag-support','keycloak','META-INF/jpa-changelog-8.0.0.xml','2025-05-21 11:02:43',76,'EXECUTED','9:91fa186ce7a5af127a2d7a91ee083cc5','addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL','',NULL,'4.25.1',NULL,NULL,'7825340853'),('9.0.0-always-display-client','keycloak','META-INF/jpa-changelog-9.0.0.xml','2025-05-21 11:02:43',77,'EXECUTED','9:6335e5c94e83a2639ccd68dd24e2e5ad','addColumn tableName=CLIENT','',NULL,'4.25.1',NULL,NULL,'7825340853'),('9.0.0-drop-constraints-for-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2025-05-21 11:02:43',78,'MARK_RAN','9:6bdb5658951e028bfe16fa0a8228b530','dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...','',NULL,'4.25.1',NULL,NULL,'7825340853'),('9.0.0-increase-column-size-federated-fk','keycloak','META-INF/jpa-changelog-9.0.0.xml','2025-05-21 11:02:43',79,'EXECUTED','9:d5bc15a64117ccad481ce8792d4c608f','modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...','',NULL,'4.25.1',NULL,NULL,'7825340853'),('9.0.0-recreate-constraints-after-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2025-05-21 11:02:43',80,'MARK_RAN','9:077cba51999515f4d3e7ad5619ab592c','addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...','',NULL,'4.25.1',NULL,NULL,'7825340853'),('9.0.1-add-index-to-client.client_id','keycloak','META-INF/jpa-changelog-9.0.1.xml','2025-05-21 11:02:43',81,'EXECUTED','9:be969f08a163bf47c6b9e9ead8ac2afb','createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT','',NULL,'4.25.1',NULL,NULL,'7825340853'),('9.0.1-KEYCLOAK-12579-drop-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2025-05-21 11:02:43',82,'MARK_RAN','9:6d3bb4408ba5a72f39bd8a0b301ec6e3','dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.25.1',NULL,NULL,'7825340853'),('9.0.1-KEYCLOAK-12579-add-not-null-constraint','keycloak','META-INF/jpa-changelog-9.0.1.xml','2025-05-21 11:02:43',83,'EXECUTED','9:966bda61e46bebf3cc39518fbed52fa7','addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP','',NULL,'4.25.1',NULL,NULL,'7825340853'),('9.0.1-KEYCLOAK-12579-recreate-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2025-05-21 11:02:43',84,'MARK_RAN','9:8dcac7bdf7378e7d823cdfddebf72fda','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.25.1',NULL,NULL,'7825340853'),('9.0.1-add-index-to-events','keycloak','META-INF/jpa-changelog-9.0.1.xml','2025-05-21 11:02:43',85,'EXECUTED','9:7d93d602352a30c0c317e6a609b56599','createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY','',NULL,'4.25.1',NULL,NULL,'7825340853'),('map-remove-ri','keycloak','META-INF/jpa-changelog-11.0.0.xml','2025-05-21 11:02:43',86,'EXECUTED','9:71c5969e6cdd8d7b6f47cebc86d37627','dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9','',NULL,'4.25.1',NULL,NULL,'7825340853'),('map-remove-ri','keycloak','META-INF/jpa-changelog-12.0.0.xml','2025-05-21 11:02:44',87,'EXECUTED','9:a9ba7d47f065f041b7da856a81762021','dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...','',NULL,'4.25.1',NULL,NULL,'7825340853'),('12.1.0-add-realm-localization-table','keycloak','META-INF/jpa-changelog-12.0.0.xml','2025-05-21 11:02:44',88,'EXECUTED','9:fffabce2bc01e1a8f5110d5278500065','createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS','',NULL,'4.25.1',NULL,NULL,'7825340853'),('default-roles','keycloak','META-INF/jpa-changelog-13.0.0.xml','2025-05-21 11:02:44',89,'EXECUTED','9:fa8a5b5445e3857f4b010bafb5009957','addColumn tableName=REALM; customChange','',NULL,'4.25.1',NULL,NULL,'7825340853'),('default-roles-cleanup','keycloak','META-INF/jpa-changelog-13.0.0.xml','2025-05-21 11:02:44',90,'EXECUTED','9:67ac3241df9a8582d591c5ed87125f39','dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES','',NULL,'4.25.1',NULL,NULL,'7825340853'),('13.0.0-KEYCLOAK-16844','keycloak','META-INF/jpa-changelog-13.0.0.xml','2025-05-21 11:02:44',91,'EXECUTED','9:ad1194d66c937e3ffc82386c050ba089','createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION','',NULL,'4.25.1',NULL,NULL,'7825340853'),('map-remove-ri-13.0.0','keycloak','META-INF/jpa-changelog-13.0.0.xml','2025-05-21 11:02:44',92,'EXECUTED','9:d9be619d94af5a2f5d07b9f003543b91','dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...','',NULL,'4.25.1',NULL,NULL,'7825340853'),('13.0.0-KEYCLOAK-17992-drop-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2025-05-21 11:02:44',93,'MARK_RAN','9:544d201116a0fcc5a5da0925fbbc3bde','dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT','',NULL,'4.25.1',NULL,NULL,'7825340853'),('13.0.0-increase-column-size-federated','keycloak','META-INF/jpa-changelog-13.0.0.xml','2025-05-21 11:02:44',94,'EXECUTED','9:43c0c1055b6761b4b3e89de76d612ccf','modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT','',NULL,'4.25.1',NULL,NULL,'7825340853'),('13.0.0-KEYCLOAK-17992-recreate-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2025-05-21 11:02:44',95,'MARK_RAN','9:8bd711fd0330f4fe980494ca43ab1139','addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...','',NULL,'4.25.1',NULL,NULL,'7825340853'),('json-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-13.0.0.xml','2025-05-21 11:02:44',96,'EXECUTED','9:e07d2bc0970c348bb06fb63b1f82ddbf','addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE','',NULL,'4.25.1',NULL,NULL,'7825340853'),('14.0.0-KEYCLOAK-11019','keycloak','META-INF/jpa-changelog-14.0.0.xml','2025-05-21 11:02:44',97,'EXECUTED','9:24fb8611e97f29989bea412aa38d12b7','createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION','',NULL,'4.25.1',NULL,NULL,'7825340853'),('14.0.0-KEYCLOAK-18286','keycloak','META-INF/jpa-changelog-14.0.0.xml','2025-05-21 11:02:44',98,'MARK_RAN','9:259f89014ce2506ee84740cbf7163aa7','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.25.1',NULL,NULL,'7825340853'),('14.0.0-KEYCLOAK-18286-revert','keycloak','META-INF/jpa-changelog-14.0.0.xml','2025-05-21 11:02:44',99,'MARK_RAN','9:04baaf56c116ed19951cbc2cca584022','dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.25.1',NULL,NULL,'7825340853'),('14.0.0-KEYCLOAK-18286-supported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2025-05-21 11:02:44',100,'EXECUTED','9:bd2bd0fc7768cf0845ac96a8786fa735','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.25.1',NULL,NULL,'7825340853'),('14.0.0-KEYCLOAK-18286-unsupported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2025-05-21 11:02:44',101,'MARK_RAN','9:d3d977031d431db16e2c181ce49d73e9','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.25.1',NULL,NULL,'7825340853'),('KEYCLOAK-17267-add-index-to-user-attributes','keycloak','META-INF/jpa-changelog-14.0.0.xml','2025-05-21 11:02:44',102,'EXECUTED','9:0b305d8d1277f3a89a0a53a659ad274c','createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE','',NULL,'4.25.1',NULL,NULL,'7825340853'),('KEYCLOAK-18146-add-saml-art-binding-identifier','keycloak','META-INF/jpa-changelog-14.0.0.xml','2025-05-21 11:02:44',103,'EXECUTED','9:2c374ad2cdfe20e2905a84c8fac48460','customChange','',NULL,'4.25.1',NULL,NULL,'7825340853'),('15.0.0-KEYCLOAK-18467','keycloak','META-INF/jpa-changelog-15.0.0.xml','2025-05-21 11:02:44',104,'EXECUTED','9:47a760639ac597360a8219f5b768b4de','addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...','',NULL,'4.25.1',NULL,NULL,'7825340853'),('17.0.0-9562','keycloak','META-INF/jpa-changelog-17.0.0.xml','2025-05-21 11:02:44',105,'EXECUTED','9:a6272f0576727dd8cad2522335f5d99e','createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY','',NULL,'4.25.1',NULL,NULL,'7825340853'),('18.0.0-10625-IDX_ADMIN_EVENT_TIME','keycloak','META-INF/jpa-changelog-18.0.0.xml','2025-05-21 11:02:44',106,'EXECUTED','9:015479dbd691d9cc8669282f4828c41d','createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY','',NULL,'4.25.1',NULL,NULL,'7825340853'),('19.0.0-10135','keycloak','META-INF/jpa-changelog-19.0.0.xml','2025-05-21 11:02:44',107,'EXECUTED','9:9518e495fdd22f78ad6425cc30630221','customChange','',NULL,'4.25.1',NULL,NULL,'7825340853'),('20.0.0-12964-supported-dbs','keycloak','META-INF/jpa-changelog-20.0.0.xml','2025-05-21 11:02:44',108,'EXECUTED','9:f2e1331a71e0aa85e5608fe42f7f681c','createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE','',NULL,'4.25.1',NULL,NULL,'7825340853'),('20.0.0-12964-unsupported-dbs','keycloak','META-INF/jpa-changelog-20.0.0.xml','2025-05-21 11:02:44',109,'MARK_RAN','9:1a6fcaa85e20bdeae0a9ce49b41946a5','createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE','',NULL,'4.25.1',NULL,NULL,'7825340853'),('client-attributes-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-20.0.0.xml','2025-05-21 11:02:44',110,'EXECUTED','9:3f332e13e90739ed0c35b0b25b7822ca','addColumn tableName=CLIENT_ATTRIBUTES; update tableName=CLIENT_ATTRIBUTES; dropColumn columnName=VALUE, tableName=CLIENT_ATTRIBUTES; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=CLIENT_ATTRIBUTES','',NULL,'4.25.1',NULL,NULL,'7825340853'),('21.0.2-17277','keycloak','META-INF/jpa-changelog-21.0.2.xml','2025-05-21 11:02:44',111,'EXECUTED','9:7ee1f7a3fb8f5588f171fb9a6ab623c0','customChange','',NULL,'4.25.1',NULL,NULL,'7825340853'),('21.1.0-19404','keycloak','META-INF/jpa-changelog-21.1.0.xml','2025-05-21 11:02:45',112,'EXECUTED','9:3d7e830b52f33676b9d64f7f2b2ea634','modifyDataType columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=LOGIC, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=POLICY_ENFORCE_MODE, tableName=RESOURCE_SERVER','',NULL,'4.25.1',NULL,NULL,'7825340853'),('21.1.0-19404-2','keycloak','META-INF/jpa-changelog-21.1.0.xml','2025-05-21 11:02:45',113,'MARK_RAN','9:627d032e3ef2c06c0e1f73d2ae25c26c','addColumn tableName=RESOURCE_SERVER_POLICY; update tableName=RESOURCE_SERVER_POLICY; dropColumn columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; renameColumn newColumnName=DECISION_STRATEGY, oldColumnName=DECISION_STRATEGY_NEW, tabl...','',NULL,'4.25.1',NULL,NULL,'7825340853'),('22.0.0-17484-updated','keycloak','META-INF/jpa-changelog-22.0.0.xml','2025-05-21 11:02:45',114,'EXECUTED','9:90af0bfd30cafc17b9f4d6eccd92b8b3','customChange','',NULL,'4.25.1',NULL,NULL,'7825340853'),('22.0.5-24031','keycloak','META-INF/jpa-changelog-22.0.0.xml','2025-05-21 11:02:45',115,'MARK_RAN','9:a60d2d7b315ec2d3eba9e2f145f9df28','customChange','',NULL,'4.25.1',NULL,NULL,'7825340853'),('23.0.0-12062','keycloak','META-INF/jpa-changelog-23.0.0.xml','2025-05-21 11:02:45',116,'EXECUTED','9:2168fbe728fec46ae9baf15bf80927b8','addColumn tableName=COMPONENT_CONFIG; update tableName=COMPONENT_CONFIG; dropColumn columnName=VALUE, tableName=COMPONENT_CONFIG; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=COMPONENT_CONFIG','',NULL,'4.25.1',NULL,NULL,'7825340853'),('23.0.0-17258','keycloak','META-INF/jpa-changelog-23.0.0.xml','2025-05-21 11:02:45',117,'EXECUTED','9:36506d679a83bbfda85a27ea1864dca8','addColumn tableName=EVENT_ENTITY','',NULL,'4.25.1',NULL,NULL,'7825340853'),('24.0.0-9758','keycloak','META-INF/jpa-changelog-24.0.0.xml','2025-05-21 11:02:45',118,'EXECUTED','9:502c557a5189f600f0f445a9b49ebbce','addColumn tableName=USER_ATTRIBUTE; addColumn tableName=FED_USER_ATTRIBUTE; createIndex indexName=USER_ATTR_LONG_VALUES, tableName=USER_ATTRIBUTE; createIndex indexName=FED_USER_ATTR_LONG_VALUES, tableName=FED_USER_ATTRIBUTE; createIndex indexName...','',NULL,'4.25.1',NULL,NULL,'7825340853'),('24.0.0-9758-2','keycloak','META-INF/jpa-changelog-24.0.0.xml','2025-05-21 11:02:45',119,'EXECUTED','9:bf0fdee10afdf597a987adbf291db7b2','customChange','',NULL,'4.25.1',NULL,NULL,'7825340853'),('24.0.0-26618-drop-index-if-present','keycloak','META-INF/jpa-changelog-24.0.0.xml','2025-05-21 11:02:45',120,'EXECUTED','9:04baaf56c116ed19951cbc2cca584022','dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.25.1',NULL,NULL,'7825340853'),('24.0.0-26618-reindex','keycloak','META-INF/jpa-changelog-24.0.0.xml','2025-05-21 11:02:45',121,'EXECUTED','9:bd2bd0fc7768cf0845ac96a8786fa735','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.25.1',NULL,NULL,'7825340853');
/*!40000 ALTER TABLE `DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int NOT NULL,
  `LOCKED` tinyint NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

LOCK TABLES `DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOGLOCK` VALUES (1,0,NULL,NULL),(1000,0,NULL,NULL),(1001,0,NULL,NULL);
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEFAULT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `DEFAULT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DEFAULT_CLIENT_SCOPE` (
  `REALM_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  `DEFAULT_SCOPE` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`REALM_ID`,`SCOPE_ID`),
  KEY `IDX_DEFCLS_REALM` (`REALM_ID`),
  KEY `IDX_DEFCLS_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_R_DEF_CLI_SCOPE_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEFAULT_CLIENT_SCOPE`
--

LOCK TABLES `DEFAULT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('d3a5ffa1-1601-43fe-aefc-247196ccd2b6','0f5cc272-3487-4d0a-8105-7700ff9648a0',1),('d3a5ffa1-1601-43fe-aefc-247196ccd2b6','346d42aa-c630-42cb-8e77-9bbec1138868',1),('d3a5ffa1-1601-43fe-aefc-247196ccd2b6','41611520-bf32-442f-9178-f83cfa5639a5',0),('d3a5ffa1-1601-43fe-aefc-247196ccd2b6','41de8e7d-2389-4d1d-bec0-9857cdecdd05',1),('d3a5ffa1-1601-43fe-aefc-247196ccd2b6','4723eb28-752a-4aa9-8d53-6ba25bc976e9',0),('d3a5ffa1-1601-43fe-aefc-247196ccd2b6','6f3184c0-5b44-43f3-afb5-c48323aeed7d',0),('d3a5ffa1-1601-43fe-aefc-247196ccd2b6','8230f77b-3a6b-4366-902b-41337e144429',1),('d3a5ffa1-1601-43fe-aefc-247196ccd2b6','87dff253-88cb-4726-a525-0d9a46ba2492',0),('d3a5ffa1-1601-43fe-aefc-247196ccd2b6','d01f449c-537f-464f-a5bb-d3ed49e0a301',1),('d3a5ffa1-1601-43fe-aefc-247196ccd2b6','f31f0448-dc3f-468e-972e-12b53ec39bdb',1),('fc56c3ca-a729-402b-aa66-232ad730f09b','08b93cbd-42a9-436c-a56d-cd7e97b615ba',1),('fc56c3ca-a729-402b-aa66-232ad730f09b','0daccc26-6279-4b89-b6ad-d41277217fe5',0),('fc56c3ca-a729-402b-aa66-232ad730f09b','138da499-a245-4aac-89da-7970f0e99f19',1),('fc56c3ca-a729-402b-aa66-232ad730f09b','2534e34c-8efb-42cd-a1d0-8ee669066f6e',0),('fc56c3ca-a729-402b-aa66-232ad730f09b','64bd32f3-e173-4c11-9168-db0053e5f189',1),('fc56c3ca-a729-402b-aa66-232ad730f09b','7833b79c-f847-4aee-98f1-cb5453d002b3',0),('fc56c3ca-a729-402b-aa66-232ad730f09b','8cfe6cfb-4e64-4f34-a060-601b3297134f',1),('fc56c3ca-a729-402b-aa66-232ad730f09b','9da8b9e1-1aab-4a31-934d-7a2cc9e9a5e1',1),('fc56c3ca-a729-402b-aa66-232ad730f09b','eac77334-5547-4534-b91c-e26d577b40f0',0),('fc56c3ca-a729-402b-aa66-232ad730f09b','f833323a-8666-46ba-bc30-2e071b91900b',1);
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EVENT_ENTITY`
--

DROP TABLE IF EXISTS `EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `DETAILS_JSON` text,
  `ERROR` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `SESSION_ID` varchar(255) DEFAULT NULL,
  `EVENT_TIME` bigint DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `DETAILS_JSON_LONG_VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`ID`),
  KEY `IDX_EVENT_TIME` (`REALM_ID`,`EVENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EVENT_ENTITY`
--

LOCK TABLES `EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_IDENTITY`
--

DROP TABLE IF EXISTS `FEDERATED_IDENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FEDERATED_IDENTITY` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FEDERATED_USER_ID` varchar(255) DEFAULT NULL,
  `FEDERATED_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`),
  KEY `IDX_FEDIDENTITY_USER` (`USER_ID`),
  KEY `IDX_FEDIDENTITY_FEDUSER` (`FEDERATED_USER_ID`),
  CONSTRAINT `FK404288B92EF007A6` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_IDENTITY`
--

LOCK TABLES `FEDERATED_IDENTITY` WRITE;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_USER`
--

DROP TABLE IF EXISTS `FEDERATED_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FEDERATED_USER` (
  `ID` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_USER`
--

LOCK TABLES `FEDERATED_USER` WRITE;
/*!40000 ALTER TABLE `FEDERATED_USER` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `FED_USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `VALUE` text,
  `LONG_VALUE_HASH` binary(64) DEFAULT NULL,
  `LONG_VALUE_HASH_LOWER_CASE` binary(64) DEFAULT NULL,
  `LONG_VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_ATTRIBUTE` (`USER_ID`,`REALM_ID`,`NAME`),
  KEY `FED_USER_ATTR_LONG_VALUES` (`LONG_VALUE_HASH`,`NAME`),
  KEY `FED_USER_ATTR_LONG_VALUES_LOWER_CASE` (`LONG_VALUE_HASH_LOWER_CASE`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ATTRIBUTE`
--

LOCK TABLES `FED_USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CONSENT` (`USER_ID`,`CLIENT_ID`),
  KEY `IDX_FU_CONSENT_RU` (`REALM_ID`,`USER_ID`),
  KEY `IDX_FU_CNSNT_EXT` (`USER_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT`
--

LOCK TABLES `FED_USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT_CL_SCOPE`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT_CL_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CONSENT_CL_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT_CL_SCOPE`
--

LOCK TABLES `FED_USER_CONSENT_CL_SCOPE` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CREDENTIAL`
--

DROP TABLE IF EXISTS `FED_USER_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext,
  `CREDENTIAL_DATA` longtext,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CREDENTIAL` (`USER_ID`,`TYPE`),
  KEY `IDX_FU_CREDENTIAL_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CREDENTIAL`
--

LOCK TABLES `FED_USER_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `FED_USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP` (`USER_ID`,`GROUP_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `FED_USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `FED_USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_REQUIRED_ACTION` (
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_FU_REQUIRED_ACTION` (`USER_ID`,`REQUIRED_ACTION`),
  KEY `IDX_FU_REQUIRED_ACTION_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_REQUIRED_ACTION`
--

LOCK TABLES `FED_USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `FED_USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_FU_ROLE_MAPPING` (`USER_ID`,`ROLE_ID`),
  KEY `IDX_FU_ROLE_MAPPING_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ROLE_MAPPING`
--

LOCK TABLES `FED_USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ATTRIBUTE`
--

DROP TABLE IF EXISTS `GROUP_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GROUP_ATTR_GROUP` (`GROUP_ID`),
  KEY `IDX_GROUP_ATT_BY_NAME_VALUE` (`NAME`,`VALUE`),
  CONSTRAINT `FK_GROUP_ATTRIBUTE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ATTRIBUTE`
--

LOCK TABLES `GROUP_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `GROUP_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`GROUP_ID`),
  KEY `IDX_GROUP_ROLE_MAPP_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ROLE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ROLE_MAPPING`
--

LOCK TABLES `GROUP_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER` (
  `INTERNAL_ID` varchar(36) NOT NULL,
  `ENABLED` tinyint NOT NULL DEFAULT '0',
  `PROVIDER_ALIAS` varchar(255) DEFAULT NULL,
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `STORE_TOKEN` tinyint NOT NULL DEFAULT '0',
  `AUTHENTICATE_BY_DEFAULT` tinyint NOT NULL DEFAULT '0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ADD_TOKEN_ROLE` tinyint NOT NULL DEFAULT '1',
  `TRUST_EMAIL` tinyint NOT NULL DEFAULT '0',
  `FIRST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `POST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `LINK_ONLY` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`INTERNAL_ID`),
  UNIQUE KEY `UK_2DAELWNIBJI49AVXSRTUF6XJ33` (`PROVIDER_ALIAS`,`REALM_ID`),
  KEY `IDX_IDENT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK2B4EBC52AE5C3B34` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER`
--

LOCK TABLES `IDENTITY_PROVIDER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_CONFIG`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER_CONFIG` (
  `IDENTITY_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FKDC4897CF864C4E43` FOREIGN KEY (`IDENTITY_PROVIDER_ID`) REFERENCES `IDENTITY_PROVIDER` (`INTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_CONFIG`
--

LOCK TABLES `IDENTITY_PROVIDER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_MAPPER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `IDP_ALIAS` varchar(255) NOT NULL,
  `IDP_MAPPER_NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ID_PROV_MAPP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_IDPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_MAPPER`
--

LOCK TABLES `IDENTITY_PROVIDER_MAPPER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `IDP_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDP_MAPPER_CONFIG` (
  `IDP_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDP_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_IDPMCONFIG` FOREIGN KEY (`IDP_MAPPER_ID`) REFERENCES `IDENTITY_PROVIDER_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_MAPPER_CONFIG`
--

LOCK TABLES `IDP_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_GROUP`
--

DROP TABLE IF EXISTS `KEYCLOAK_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYCLOAK_GROUP` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PARENT_GROUP` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SIBLING_NAMES` (`REALM_ID`,`PARENT_GROUP`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_GROUP`
--

LOCK TABLES `KEYCLOAK_GROUP` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_ROLE`
--

DROP TABLE IF EXISTS `KEYCLOAK_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYCLOAK_ROLE` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_REALM_CONSTRAINT` varchar(255) DEFAULT NULL,
  `CLIENT_ROLE` tinyint DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `CLIENT` varchar(36) DEFAULT NULL,
  `REALM` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_J3RWUVD56ONTGSUHOGM184WW2-2` (`NAME`,`CLIENT_REALM_CONSTRAINT`),
  KEY `IDX_KEYCLOAK_ROLE_CLIENT` (`CLIENT`),
  KEY `IDX_KEYCLOAK_ROLE_REALM` (`REALM`),
  CONSTRAINT `FK_6VYQFE4CN4WLQ8R6KT5VDSJ5C` FOREIGN KEY (`REALM`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_ROLE`
--

LOCK TABLES `KEYCLOAK_ROLE` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` DISABLE KEYS */;
INSERT INTO `KEYCLOAK_ROLE` VALUES ('02d0d17e-13c4-402f-9896-d61257a3a079','c36d15b8-22af-4756-8deb-6d885ecfd965',1,'${role_impersonation}','impersonation','fc56c3ca-a729-402b-aa66-232ad730f09b','c36d15b8-22af-4756-8deb-6d885ecfd965',NULL),('02dfb616-f59d-45de-9263-35ca54d903a2','6759a7bd-940b-4a74-a879-5e187472c652',1,'${role_delete-account}','delete-account','fc56c3ca-a729-402b-aa66-232ad730f09b','6759a7bd-940b-4a74-a879-5e187472c652',NULL),('03f65659-28be-4313-8312-d6557456489e','813765c3-547f-4b77-855e-efb73057c17c',1,'${role_delete-account}','delete-account','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','813765c3-547f-4b77-855e-efb73057c17c',NULL),('06088566-c1e8-4c32-afb1-3798005d158a','c36d15b8-22af-4756-8deb-6d885ecfd965',1,'${role_manage-identity-providers}','manage-identity-providers','fc56c3ca-a729-402b-aa66-232ad730f09b','c36d15b8-22af-4756-8deb-6d885ecfd965',NULL),('0c43be53-3652-4fbd-8ed7-956a7e48bbda','db000120-e81c-4d0a-8a0b-036d7a2128dd',1,'${role_manage-users}','manage-users','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','db000120-e81c-4d0a-8a0b-036d7a2128dd',NULL),('0cc9314e-cba7-45eb-a3b6-e8b73f91560d','db000120-e81c-4d0a-8a0b-036d7a2128dd',1,'${role_view-realm}','view-realm','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','db000120-e81c-4d0a-8a0b-036d7a2128dd',NULL),('0ccb3025-24f1-4c04-b301-b8e14c7191d1','813765c3-547f-4b77-855e-efb73057c17c',1,'${role_view-consent}','view-consent','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','813765c3-547f-4b77-855e-efb73057c17c',NULL),('0d104174-6f9a-47d3-92ba-1a3b16e41588','c36d15b8-22af-4756-8deb-6d885ecfd965',1,'${role_query-clients}','query-clients','fc56c3ca-a729-402b-aa66-232ad730f09b','c36d15b8-22af-4756-8deb-6d885ecfd965',NULL),('0eb71ff0-8e09-4860-b60b-1ba88e6844a4','c36d15b8-22af-4756-8deb-6d885ecfd965',1,'${role_manage-realm}','manage-realm','fc56c3ca-a729-402b-aa66-232ad730f09b','c36d15b8-22af-4756-8deb-6d885ecfd965',NULL),('1111b9a1-4675-4a0c-b3fa-9987676311c4','db000120-e81c-4d0a-8a0b-036d7a2128dd',1,'${role_query-groups}','query-groups','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','db000120-e81c-4d0a-8a0b-036d7a2128dd',NULL),('13db7752-29e7-434a-aa50-ad65ffe38957','c36d15b8-22af-4756-8deb-6d885ecfd965',1,'${role_manage-authorization}','manage-authorization','fc56c3ca-a729-402b-aa66-232ad730f09b','c36d15b8-22af-4756-8deb-6d885ecfd965',NULL),('14d51b92-c2cf-4a5e-9899-a4e92e2cceec','db000120-e81c-4d0a-8a0b-036d7a2128dd',1,'${role_impersonation}','impersonation','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','db000120-e81c-4d0a-8a0b-036d7a2128dd',NULL),('184a5a2a-ee8b-432e-9c5c-7d3cc48c35dc','d3a5ffa1-1601-43fe-aefc-247196ccd2b6',0,'${role_admin}','admin','d3a5ffa1-1601-43fe-aefc-247196ccd2b6',NULL,NULL),('1ace4c2f-7b4f-46e1-bd29-27bbf9f264e1','db000120-e81c-4d0a-8a0b-036d7a2128dd',1,'${role_query-clients}','query-clients','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','db000120-e81c-4d0a-8a0b-036d7a2128dd',NULL),('207d4d31-4026-4c28-9bd9-a935e19567df','c36d15b8-22af-4756-8deb-6d885ecfd965',1,'${role_manage-clients}','manage-clients','fc56c3ca-a729-402b-aa66-232ad730f09b','c36d15b8-22af-4756-8deb-6d885ecfd965',NULL),('237ba0c5-4615-41eb-b3fa-b1ae34a0ab2a','b12ef818-913c-453b-a74a-70bf8e9ad21a',1,'${role_manage-clients}','manage-clients','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','b12ef818-913c-453b-a74a-70bf8e9ad21a',NULL),('24fc090d-d4c8-40cf-89d9-4336ce4adde3','c36d15b8-22af-4756-8deb-6d885ecfd965',1,'${role_view-identity-providers}','view-identity-providers','fc56c3ca-a729-402b-aa66-232ad730f09b','c36d15b8-22af-4756-8deb-6d885ecfd965',NULL),('25addf6f-8d88-4683-9f82-a095d8a55601','c36d15b8-22af-4756-8deb-6d885ecfd965',1,'${role_create-client}','create-client','fc56c3ca-a729-402b-aa66-232ad730f09b','c36d15b8-22af-4756-8deb-6d885ecfd965',NULL),('2b2f30c8-3084-4b7c-8396-d134964e583d','b12ef818-913c-453b-a74a-70bf8e9ad21a',1,'${role_manage-users}','manage-users','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','b12ef818-913c-453b-a74a-70bf8e9ad21a',NULL),('31f9ac1d-aff2-4e26-90b4-ecaefa810224','db000120-e81c-4d0a-8a0b-036d7a2128dd',1,'${role_view-authorization}','view-authorization','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','db000120-e81c-4d0a-8a0b-036d7a2128dd',NULL),('38924d94-c83c-4b34-8017-57a07d529d43','b12ef818-913c-453b-a74a-70bf8e9ad21a',1,'${role_view-events}','view-events','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','b12ef818-913c-453b-a74a-70bf8e9ad21a',NULL),('39bfb7e3-d920-4eb1-8c84-cb462ff38eb4','b12ef818-913c-453b-a74a-70bf8e9ad21a',1,'${role_manage-events}','manage-events','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','b12ef818-913c-453b-a74a-70bf8e9ad21a',NULL),('3a6868fa-7e89-451b-82ce-d71272b8cce5','d3a5ffa1-1601-43fe-aefc-247196ccd2b6',0,'${role_offline-access}','offline_access','d3a5ffa1-1601-43fe-aefc-247196ccd2b6',NULL,NULL),('3bd15bad-6b90-4c40-a6d8-e479cf9b41b1','fc56c3ca-a729-402b-aa66-232ad730f09b',0,'','Admin','fc56c3ca-a729-402b-aa66-232ad730f09b',NULL,NULL),('3de5dcfc-1191-46bb-86f6-87b193a7666e','b12ef818-913c-453b-a74a-70bf8e9ad21a',1,'${role_manage-authorization}','manage-authorization','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','b12ef818-913c-453b-a74a-70bf8e9ad21a',NULL),('3eadea75-babf-465a-8cae-d0b99fcddf8c','db000120-e81c-4d0a-8a0b-036d7a2128dd',1,'${role_query-users}','query-users','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','db000120-e81c-4d0a-8a0b-036d7a2128dd',NULL),('441944ba-c379-48b8-bbf8-27672ffde5f3','db000120-e81c-4d0a-8a0b-036d7a2128dd',1,'${role_manage-events}','manage-events','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','db000120-e81c-4d0a-8a0b-036d7a2128dd',NULL),('4f41224a-a0b5-4657-8d70-b1ccbac385f8','813765c3-547f-4b77-855e-efb73057c17c',1,'${role_view-groups}','view-groups','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','813765c3-547f-4b77-855e-efb73057c17c',NULL),('4f50ffc2-5964-48bf-83cc-a943fa6010f9','b12ef818-913c-453b-a74a-70bf8e9ad21a',1,'${role_view-identity-providers}','view-identity-providers','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','b12ef818-913c-453b-a74a-70bf8e9ad21a',NULL),('53cacc79-1006-4d9d-a3fe-5d469feb74c8','db000120-e81c-4d0a-8a0b-036d7a2128dd',1,'${role_query-realms}','query-realms','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','db000120-e81c-4d0a-8a0b-036d7a2128dd',NULL),('54d3cbf6-2f36-46b8-8fc0-e05e155d016e','b12ef818-913c-453b-a74a-70bf8e9ad21a',1,'${role_query-clients}','query-clients','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','b12ef818-913c-453b-a74a-70bf8e9ad21a',NULL),('5ddab29b-d94c-4d4c-8f8f-f60fe338b37c','db000120-e81c-4d0a-8a0b-036d7a2128dd',1,'${role_view-users}','view-users','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','db000120-e81c-4d0a-8a0b-036d7a2128dd',NULL),('5f82855d-a7aa-4005-bc85-e78cf78f4652','c36d15b8-22af-4756-8deb-6d885ecfd965',1,'${role_view-clients}','view-clients','fc56c3ca-a729-402b-aa66-232ad730f09b','c36d15b8-22af-4756-8deb-6d885ecfd965',NULL),('6564ffdb-edd1-4945-b1ef-940020985fd5','c36d15b8-22af-4756-8deb-6d885ecfd965',1,'${role_view-authorization}','view-authorization','fc56c3ca-a729-402b-aa66-232ad730f09b','c36d15b8-22af-4756-8deb-6d885ecfd965',NULL),('6af6b12b-b62f-4caf-a1b7-eb8396f5e310','b12ef818-913c-453b-a74a-70bf8e9ad21a',1,'${role_create-client}','create-client','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','b12ef818-913c-453b-a74a-70bf8e9ad21a',NULL),('6cdbc74a-ac1b-47ae-bbf4-9e9b0e268058','b12ef818-913c-453b-a74a-70bf8e9ad21a',1,'${role_view-clients}','view-clients','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','b12ef818-913c-453b-a74a-70bf8e9ad21a',NULL),('6d9b1dd8-d139-48e2-af8e-7ba8a072f6e6','6759a7bd-940b-4a74-a879-5e187472c652',1,'${role_view-groups}','view-groups','fc56c3ca-a729-402b-aa66-232ad730f09b','6759a7bd-940b-4a74-a879-5e187472c652',NULL),('7029872d-b92d-4f2a-9d9b-777bbb23b80a','c36d15b8-22af-4756-8deb-6d885ecfd965',1,'${role_view-users}','view-users','fc56c3ca-a729-402b-aa66-232ad730f09b','c36d15b8-22af-4756-8deb-6d885ecfd965',NULL),('77ba921d-ac6f-4aa0-b91e-8eae383b1a8f','813765c3-547f-4b77-855e-efb73057c17c',1,'${role_view-applications}','view-applications','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','813765c3-547f-4b77-855e-efb73057c17c',NULL),('7e1906b1-00c2-40a3-bbf1-c885619666aa','c36d15b8-22af-4756-8deb-6d885ecfd965',1,'${role_view-events}','view-events','fc56c3ca-a729-402b-aa66-232ad730f09b','c36d15b8-22af-4756-8deb-6d885ecfd965',NULL),('81b13ac4-6c29-4092-8907-1f5a4d8b4afc','d3a5ffa1-1601-43fe-aefc-247196ccd2b6',0,'${role_create-realm}','create-realm','d3a5ffa1-1601-43fe-aefc-247196ccd2b6',NULL,NULL),('82448ad6-9b59-48d7-b7d7-4586b7ebe462','c36d15b8-22af-4756-8deb-6d885ecfd965',1,'${role_view-realm}','view-realm','fc56c3ca-a729-402b-aa66-232ad730f09b','c36d15b8-22af-4756-8deb-6d885ecfd965',NULL),('839c7967-7450-47bd-9839-64112478ff03','db000120-e81c-4d0a-8a0b-036d7a2128dd',1,'${role_manage-authorization}','manage-authorization','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','db000120-e81c-4d0a-8a0b-036d7a2128dd',NULL),('869920e0-32c4-42d9-8e08-0551f1cd6198','c36d15b8-22af-4756-8deb-6d885ecfd965',1,'${role_query-users}','query-users','fc56c3ca-a729-402b-aa66-232ad730f09b','c36d15b8-22af-4756-8deb-6d885ecfd965',NULL),('8d27ef85-da16-4ba9-90f5-fcb90f63d9f8','6759a7bd-940b-4a74-a879-5e187472c652',1,'${role_manage-consent}','manage-consent','fc56c3ca-a729-402b-aa66-232ad730f09b','6759a7bd-940b-4a74-a879-5e187472c652',NULL),('949043c8-e6ac-4c38-9d19-c70c5aa15bd0','db000120-e81c-4d0a-8a0b-036d7a2128dd',1,'${role_manage-realm}','manage-realm','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','db000120-e81c-4d0a-8a0b-036d7a2128dd',NULL),('9833b7d3-39b8-4da5-bc49-f8c462cfea9d','d3a5ffa1-1601-43fe-aefc-247196ccd2b6',0,'${role_uma_authorization}','uma_authorization','d3a5ffa1-1601-43fe-aefc-247196ccd2b6',NULL,NULL),('985e2654-2f28-4048-ac91-00b494f6dd44','b12ef818-913c-453b-a74a-70bf8e9ad21a',1,'${role_query-users}','query-users','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','b12ef818-913c-453b-a74a-70bf8e9ad21a',NULL),('9cf6044d-02bc-4b9b-b720-9124c0ef09aa','c36d15b8-22af-4756-8deb-6d885ecfd965',1,'${role_manage-users}','manage-users','fc56c3ca-a729-402b-aa66-232ad730f09b','c36d15b8-22af-4756-8deb-6d885ecfd965',NULL),('9e1fe19a-8fdd-42b7-a119-377217d7d321','6759a7bd-940b-4a74-a879-5e187472c652',1,'${role_manage-account}','manage-account','fc56c3ca-a729-402b-aa66-232ad730f09b','6759a7bd-940b-4a74-a879-5e187472c652',NULL),('aad6f306-11ce-4661-baf1-b7a7358bd426','c36d15b8-22af-4756-8deb-6d885ecfd965',1,'${role_query-realms}','query-realms','fc56c3ca-a729-402b-aa66-232ad730f09b','c36d15b8-22af-4756-8deb-6d885ecfd965',NULL),('ac34a50c-0c2e-4fcc-bf21-94fd0453241a','d3a5ffa1-1601-43fe-aefc-247196ccd2b6',0,'${role_default-roles}','default-roles-master','d3a5ffa1-1601-43fe-aefc-247196ccd2b6',NULL,NULL),('adc25f40-3930-47ef-8e82-9917eb07e5c2','75663b2c-45fa-4424-930a-6537753f27eb',1,'${role_read-token}','read-token','fc56c3ca-a729-402b-aa66-232ad730f09b','75663b2c-45fa-4424-930a-6537753f27eb',NULL),('b05f11bd-7b5e-4a3d-b614-cae9021a5697','db000120-e81c-4d0a-8a0b-036d7a2128dd',1,'${role_view-events}','view-events','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','db000120-e81c-4d0a-8a0b-036d7a2128dd',NULL),('b21b99e5-c9e2-4b41-b1b7-78e69a171c1e','6759a7bd-940b-4a74-a879-5e187472c652',1,'${role_view-consent}','view-consent','fc56c3ca-a729-402b-aa66-232ad730f09b','6759a7bd-940b-4a74-a879-5e187472c652',NULL),('b3dd5ed2-01e4-4a45-ad16-9b48a7b7a83f','6759a7bd-940b-4a74-a879-5e187472c652',1,'${role_manage-account-links}','manage-account-links','fc56c3ca-a729-402b-aa66-232ad730f09b','6759a7bd-940b-4a74-a879-5e187472c652',NULL),('b3edca27-004f-4cba-9068-e1c8f0d67dcd','b12ef818-913c-453b-a74a-70bf8e9ad21a',1,'${role_impersonation}','impersonation','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','b12ef818-913c-453b-a74a-70bf8e9ad21a',NULL),('c2b12b07-be9e-43c9-b15e-0d1c0d2016e7','db000120-e81c-4d0a-8a0b-036d7a2128dd',1,'${role_manage-clients}','manage-clients','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','db000120-e81c-4d0a-8a0b-036d7a2128dd',NULL),('c2fb1042-de54-4555-8c61-8e09fa7fc1a2','813765c3-547f-4b77-855e-efb73057c17c',1,'${role_view-profile}','view-profile','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','813765c3-547f-4b77-855e-efb73057c17c',NULL),('c712f8d7-7521-41f9-b2db-f59434ce3792','b12ef818-913c-453b-a74a-70bf8e9ad21a',1,'${role_view-authorization}','view-authorization','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','b12ef818-913c-453b-a74a-70bf8e9ad21a',NULL),('c837056d-7a9c-4147-981f-1281232972ee','d29a8ead-7576-4e8f-9579-714ad7cbeb23',1,'${role_read-token}','read-token','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','d29a8ead-7576-4e8f-9579-714ad7cbeb23',NULL),('c9c9a349-0be8-4e93-a801-07ff4ad5e530','db000120-e81c-4d0a-8a0b-036d7a2128dd',1,'${role_view-clients}','view-clients','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','db000120-e81c-4d0a-8a0b-036d7a2128dd',NULL),('cbf4e559-3a25-4379-8780-e1a78229471f','c36d15b8-22af-4756-8deb-6d885ecfd965',1,'${role_realm-admin}','realm-admin','fc56c3ca-a729-402b-aa66-232ad730f09b','c36d15b8-22af-4756-8deb-6d885ecfd965',NULL),('cc7800c3-eeb3-4bc9-b394-01d8cae7cedd','6759a7bd-940b-4a74-a879-5e187472c652',1,'${role_view-profile}','view-profile','fc56c3ca-a729-402b-aa66-232ad730f09b','6759a7bd-940b-4a74-a879-5e187472c652',NULL),('cfb03abc-7a89-4359-a8ce-0888d69079a1','fc56c3ca-a729-402b-aa66-232ad730f09b',0,'','Employee','fc56c3ca-a729-402b-aa66-232ad730f09b',NULL,NULL),('d007969f-ce36-43a3-b3b1-c289c07e0129','b12ef818-913c-453b-a74a-70bf8e9ad21a',1,'${role_query-groups}','query-groups','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','b12ef818-913c-453b-a74a-70bf8e9ad21a',NULL),('d9e343a5-054d-4a02-a263-12dde2d756dd','6759a7bd-940b-4a74-a879-5e187472c652',1,'${role_view-applications}','view-applications','fc56c3ca-a729-402b-aa66-232ad730f09b','6759a7bd-940b-4a74-a879-5e187472c652',NULL),('da0c8ae2-4aae-4a86-8bb7-9f7dc92053db','b12ef818-913c-453b-a74a-70bf8e9ad21a',1,'${role_query-realms}','query-realms','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','b12ef818-913c-453b-a74a-70bf8e9ad21a',NULL),('da3516e3-0d2c-4a32-94ed-cac5d88fd47d','b12ef818-913c-453b-a74a-70bf8e9ad21a',1,'${role_view-users}','view-users','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','b12ef818-913c-453b-a74a-70bf8e9ad21a',NULL),('dab33d92-d975-4a54-b48b-01847a482d41','813765c3-547f-4b77-855e-efb73057c17c',1,'${role_manage-account-links}','manage-account-links','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','813765c3-547f-4b77-855e-efb73057c17c',NULL),('daebd200-b3d3-4db2-b97b-32db0c2856ca','813765c3-547f-4b77-855e-efb73057c17c',1,'${role_manage-account}','manage-account','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','813765c3-547f-4b77-855e-efb73057c17c',NULL),('de813c81-b789-494a-b108-54b8f4723c74','c36d15b8-22af-4756-8deb-6d885ecfd965',1,'${role_query-groups}','query-groups','fc56c3ca-a729-402b-aa66-232ad730f09b','c36d15b8-22af-4756-8deb-6d885ecfd965',NULL),('e11f0c58-e684-47da-a445-dce0f238fa18','b12ef818-913c-453b-a74a-70bf8e9ad21a',1,'${role_view-realm}','view-realm','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','b12ef818-913c-453b-a74a-70bf8e9ad21a',NULL),('e18c9b29-973b-4d85-b3e8-352333ebc585','db000120-e81c-4d0a-8a0b-036d7a2128dd',1,'${role_view-identity-providers}','view-identity-providers','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','db000120-e81c-4d0a-8a0b-036d7a2128dd',NULL),('e74bb1b4-8dd8-40f1-ac13-fe1cd623c147','b12ef818-913c-453b-a74a-70bf8e9ad21a',1,'${role_manage-realm}','manage-realm','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','b12ef818-913c-453b-a74a-70bf8e9ad21a',NULL),('e9538ba9-f959-4916-aeb2-b03093692780','db000120-e81c-4d0a-8a0b-036d7a2128dd',1,'${role_manage-identity-providers}','manage-identity-providers','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','db000120-e81c-4d0a-8a0b-036d7a2128dd',NULL),('ec2bf874-2c49-47a6-89c0-74a94b6cbc9c','b12ef818-913c-453b-a74a-70bf8e9ad21a',1,'${role_manage-identity-providers}','manage-identity-providers','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','b12ef818-913c-453b-a74a-70bf8e9ad21a',NULL),('ee0fe54a-dbc8-4240-85a4-c6e47d8fa458','fc56c3ca-a729-402b-aa66-232ad730f09b',0,'${role_uma_authorization}','uma_authorization','fc56c3ca-a729-402b-aa66-232ad730f09b',NULL,NULL),('f8148bf2-c114-45e8-acae-06c2d7f8c16c','db000120-e81c-4d0a-8a0b-036d7a2128dd',1,'${role_create-client}','create-client','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','db000120-e81c-4d0a-8a0b-036d7a2128dd',NULL),('f8c5c287-e578-4636-aeea-109d3f323dae','813765c3-547f-4b77-855e-efb73057c17c',1,'${role_manage-consent}','manage-consent','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','813765c3-547f-4b77-855e-efb73057c17c',NULL),('ff5aa85c-7f69-4e14-9210-8d5d14fed6d2','c36d15b8-22af-4756-8deb-6d885ecfd965',1,'${role_manage-events}','manage-events','fc56c3ca-a729-402b-aa66-232ad730f09b','c36d15b8-22af-4756-8deb-6d885ecfd965',NULL),('ffa8b70f-f291-43ea-8ae8-3e099eb425bf','fc56c3ca-a729-402b-aa66-232ad730f09b',0,'${role_offline-access}','offline_access','fc56c3ca-a729-402b-aa66-232ad730f09b',NULL,NULL),('ffcd9e1e-a28e-4fd5-8e32-c8c51e313e3c','fc56c3ca-a729-402b-aa66-232ad730f09b',0,'${role_default-roles}','default-roles-vacation-application-realm','fc56c3ca-a729-402b-aa66-232ad730f09b',NULL,NULL);
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MIGRATION_MODEL`
--

DROP TABLE IF EXISTS `MIGRATION_MODEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MIGRATION_MODEL` (
  `ID` varchar(36) NOT NULL,
  `VERSION` varchar(36) DEFAULT NULL,
  `UPDATE_TIME` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IDX_UPDATE_TIME` (`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MIGRATION_MODEL`
--

LOCK TABLES `MIGRATION_MODEL` WRITE;
/*!40000 ALTER TABLE `MIGRATION_MODEL` DISABLE KEYS */;
INSERT INTO `MIGRATION_MODEL` VALUES ('sum8h','24.0.1',1747825365);
/*!40000 ALTER TABLE `MIGRATION_MODEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_CLIENT_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFLINE_CLIENT_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `DATA` longtext,
  `CLIENT_STORAGE_PROVIDER` varchar(36) NOT NULL DEFAULT 'local',
  `EXTERNAL_CLIENT_ID` varchar(255) NOT NULL DEFAULT 'local',
  PRIMARY KEY (`USER_SESSION_ID`,`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`OFFLINE_FLAG`),
  KEY `IDX_US_SESS_ID_ON_CL_SESS` (`USER_SESSION_ID`),
  KEY `IDX_OFFLINE_CSS_PRELOAD` (`CLIENT_ID`,`OFFLINE_FLAG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_CLIENT_SESSION`
--

LOCK TABLES `OFFLINE_CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_USER_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFLINE_USER_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `CREATED_ON` int NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `DATA` longtext,
  `LAST_SESSION_REFRESH` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`USER_SESSION_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_CREATEDON` (`CREATED_ON`),
  KEY `IDX_OFFLINE_USS_PRELOAD` (`OFFLINE_FLAG`,`CREATED_ON`,`USER_SESSION_ID`),
  KEY `IDX_OFFLINE_USS_BY_USER` (`USER_ID`,`REALM_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_BY_USERSESS` (`REALM_ID`,`OFFLINE_FLAG`,`USER_SESSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_USER_SESSION`
--

LOCK TABLES `OFFLINE_USER_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POLICY_CONFIG`
--

DROP TABLE IF EXISTS `POLICY_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `POLICY_CONFIG` (
  `POLICY_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` longtext,
  PRIMARY KEY (`POLICY_ID`,`NAME`),
  CONSTRAINT `FKDC34197CF864C4E43` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POLICY_CONFIG`
--

LOCK TABLES `POLICY_CONFIG` WRITE;
/*!40000 ALTER TABLE `POLICY_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `POLICY_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROTOCOL_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `PROTOCOL` varchar(255) NOT NULL,
  `PROTOCOL_MAPPER_NAME` varchar(255) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `CLIENT_SCOPE_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_PROTOCOL_MAPPER_CLIENT` (`CLIENT_ID`),
  KEY `IDX_CLSCOPE_PROTMAP` (`CLIENT_SCOPE_ID`),
  CONSTRAINT `FK_CLI_SCOPE_MAPPER` FOREIGN KEY (`CLIENT_SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`),
  CONSTRAINT `FK_PCM_REALM` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER`
--

LOCK TABLES `PROTOCOL_MAPPER` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER` VALUES ('0224afc1-d0eb-4507-9369-0b4017696653','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d01f449c-537f-464f-a5bb-d3ed49e0a301'),('024b0f9d-3a0b-4862-b23a-b68cd2c213d2','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'8cfe6cfb-4e64-4f34-a060-601b3297134f'),('034a53d6-c489-4b35-a0a8-4927cdb6ec5a','username','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d01f449c-537f-464f-a5bb-d3ed49e0a301'),('0a06a8b5-82a4-4b56-ac68-455e5cc3e937','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d01f449c-537f-464f-a5bb-d3ed49e0a301'),('0c0dc2e0-1d9c-409d-b99d-648273c5c7b1','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d01f449c-537f-464f-a5bb-d3ed49e0a301'),('0c7b2e99-3aae-48fe-b119-b9527c18056e','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'2534e34c-8efb-42cd-a1d0-8ee669066f6e'),('14d9f018-9297-4358-8cb8-a720153c6222','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'64bd32f3-e173-4c11-9168-db0053e5f189'),('183f8c9f-87ad-4ef8-b0fe-406206b85fd2','full name','openid-connect','oidc-full-name-mapper',NULL,'d01f449c-537f-464f-a5bb-d3ed49e0a301'),('236fe696-fdbc-46c8-94f6-8c0f0f159325','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'64bd32f3-e173-4c11-9168-db0053e5f189'),('23dbe2ed-bfb8-4c91-91c9-890b3d28a88e','role list','saml','saml-role-list-mapper',NULL,'f31f0448-dc3f-468e-972e-12b53ec39bdb'),('23ef90bb-d761-47dc-bd1f-a43d3230ceab','acr loa level','openid-connect','oidc-acr-mapper',NULL,'0f5cc272-3487-4d0a-8105-7700ff9648a0'),('295e5401-fa75-4407-be44-70e430667ecc','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'8cfe6cfb-4e64-4f34-a060-601b3297134f'),('305eeb00-68ac-4ecd-a078-54e7c6d90dd3','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'8cfe6cfb-4e64-4f34-a060-601b3297134f'),('313fc841-aaf3-425a-b2b1-6e641aefa758','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6f3184c0-5b44-43f3-afb5-c48323aeed7d'),('31929589-23ce-4ae8-b6fe-05895d11b861','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d01f449c-537f-464f-a5bb-d3ed49e0a301'),('38c4a921-b7a3-4a7b-9aae-b7a26e0e66d6','audience resolve','openid-connect','oidc-audience-resolve-mapper','5e1b5a88-3651-4dc7-aadf-c382e372bc8d',NULL),('3afe4d1e-7e15-4018-a416-8755e48873a5','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'64bd32f3-e173-4c11-9168-db0053e5f189'),('3ee6bb56-48ba-48e6-b4fd-1d1796dcb14e','upn','openid-connect','oidc-usermodel-attribute-mapper',NULL,'41611520-bf32-442f-9178-f83cfa5639a5'),('40bd3fb5-f1ca-444a-a884-d6f30161404c','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'64bd32f3-e173-4c11-9168-db0053e5f189'),('41ee8753-6030-4024-91ea-e93557b49bce','email','openid-connect','oidc-usermodel-attribute-mapper',NULL,'08b93cbd-42a9-436c-a56d-cd7e97b615ba'),('4dc0efa2-c0f2-4fde-9598-b96edd7b9b16','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'346d42aa-c630-42cb-8e77-9bbec1138868'),('507f9c42-fc70-45d3-a3c4-2a6573457bf4','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'8230f77b-3a6b-4366-902b-41337e144429'),('53b01d7d-71f8-4df1-b8e3-79ed5e747494','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'eac77334-5547-4534-b91c-e26d577b40f0'),('63256e17-fc43-4e24-aa57-9fd55758602d','email','openid-connect','oidc-usermodel-attribute-mapper',NULL,'8230f77b-3a6b-4366-902b-41337e144429'),('6be8f846-7fb0-4f0d-a66d-8a6f412bdf27','username','openid-connect','oidc-usermodel-attribute-mapper',NULL,'64bd32f3-e173-4c11-9168-db0053e5f189'),('6c11a6f9-7f02-45c3-b82b-87ea0078b838','locale','openid-connect','oidc-usermodel-attribute-mapper','350eae82-5e5e-4e8f-99e2-ffd9b1ec77b8',NULL),('7baf8191-603b-4c65-ac78-352b8d2e6843','address','openid-connect','oidc-address-mapper',NULL,'7833b79c-f847-4aee-98f1-cb5453d002b3'),('7d720aeb-e654-4600-aae9-5940d7bb0a5a','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'64bd32f3-e173-4c11-9168-db0053e5f189'),('83bc4153-488e-4289-b814-422d9b63a6a1','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'64bd32f3-e173-4c11-9168-db0053e5f189'),('83dcdea9-f8d9-44b4-b632-c99456b2a6b9','audience resolve','openid-connect','oidc-audience-resolve-mapper','f1cb4880-047a-4261-89bf-3395b94119a1',NULL),('899566c6-54e8-4406-bd51-568692ff115c','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d01f449c-537f-464f-a5bb-d3ed49e0a301'),('90d5409a-8425-44f2-a310-b933982607f3','role list','saml','saml-role-list-mapper',NULL,'9da8b9e1-1aab-4a31-934d-7a2cc9e9a5e1'),('9a8ef45b-6069-48cd-b71a-42b33f678ef5','upn','openid-connect','oidc-usermodel-attribute-mapper',NULL,'eac77334-5547-4534-b91c-e26d577b40f0'),('9d9f7212-9186-49a0-8688-60cf71109104','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'41de8e7d-2389-4d1d-bec0-9857cdecdd05'),('a0f42ead-5caf-4105-aa59-15ece5b5a548','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d01f449c-537f-464f-a5bb-d3ed49e0a301'),('a1b31b14-e920-4ac3-966d-05bf6b594a9f','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'f833323a-8666-46ba-bc30-2e071b91900b'),('a76c3357-78f3-4be9-b0d1-12ba9e584e3f','given name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'64bd32f3-e173-4c11-9168-db0053e5f189'),('ac5a1c3b-e37e-4c18-9703-796cff3d21a6','locale','openid-connect','oidc-usermodel-attribute-mapper','2f673c36-13c2-4277-bda6-844afeecef61',NULL),('b4004996-2373-4e44-b7b7-e21747224d04','family name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d01f449c-537f-464f-a5bb-d3ed49e0a301'),('b41d54d3-f504-4e8f-b56a-f5a232919b02','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'64bd32f3-e173-4c11-9168-db0053e5f189'),('b60d07a7-551d-4cda-a96b-ffb0a0b7bf75','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'41de8e7d-2389-4d1d-bec0-9857cdecdd05'),('b6a303a6-17d8-47d1-a073-19d7732852b4','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d01f449c-537f-464f-a5bb-d3ed49e0a301'),('b8ce6fd9-312e-4418-b895-ec1aee120316','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'64bd32f3-e173-4c11-9168-db0053e5f189'),('ba3a955c-b6ed-4190-af22-fcf8a88a695d','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6f3184c0-5b44-43f3-afb5-c48323aeed7d'),('ba8f7982-2a19-4912-9dbc-c2ce251b6f0b','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d01f449c-537f-464f-a5bb-d3ed49e0a301'),('bcad225f-d954-490f-86dd-ac46b390cd2d','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'2534e34c-8efb-42cd-a1d0-8ee669066f6e'),('bdb4e1fd-e53d-4635-aff5-e222f2ad4a0f','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d01f449c-537f-464f-a5bb-d3ed49e0a301'),('bfd079d0-b466-4ce4-af75-ff9301e08fca','acr loa level','openid-connect','oidc-acr-mapper',NULL,'138da499-a245-4aac-89da-7970f0e99f19'),('c317dccb-d1ca-4c62-80bb-1efe7ff4d48e','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'64bd32f3-e173-4c11-9168-db0053e5f189'),('c4029ebd-1fad-456c-8d3f-da827f4fd242','family name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'64bd32f3-e173-4c11-9168-db0053e5f189'),('c8fc4490-175c-43ab-a539-20193b8e0e18','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'41611520-bf32-442f-9178-f83cfa5639a5'),('cedfc403-22ba-493c-97d7-ff44fae7c400','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'41de8e7d-2389-4d1d-bec0-9857cdecdd05'),('d08f2b25-7e0f-4a6c-a28f-aaf7b8765272','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d01f449c-537f-464f-a5bb-d3ed49e0a301'),('d282d97c-13fb-450e-b6e5-8322f125eb3c','address','openid-connect','oidc-address-mapper',NULL,'87dff253-88cb-4726-a525-0d9a46ba2492'),('d47ed71d-fc35-4e0b-9aa0-e850f2a7d625','given name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d01f449c-537f-464f-a5bb-d3ed49e0a301'),('d525a487-d828-40b4-98ad-8e741591db76','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'08b93cbd-42a9-436c-a56d-cd7e97b615ba'),('dbaca211-0d37-4e4d-bb0a-dee34f8362d4','full name','openid-connect','oidc-full-name-mapper',NULL,'64bd32f3-e173-4c11-9168-db0053e5f189'),('f5c0cb31-499a-45c6-81ff-7d01249e64fe','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'64bd32f3-e173-4c11-9168-db0053e5f189');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROTOCOL_MAPPER_CONFIG` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`PROTOCOL_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_PMCONFIG` FOREIGN KEY (`PROTOCOL_MAPPER_ID`) REFERENCES `PROTOCOL_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER_CONFIG`
--

LOCK TABLES `PROTOCOL_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('0224afc1-d0eb-4507-9369-0b4017696653','true','access.token.claim'),('0224afc1-d0eb-4507-9369-0b4017696653','middle_name','claim.name'),('0224afc1-d0eb-4507-9369-0b4017696653','true','id.token.claim'),('0224afc1-d0eb-4507-9369-0b4017696653','true','introspection.token.claim'),('0224afc1-d0eb-4507-9369-0b4017696653','String','jsonType.label'),('0224afc1-d0eb-4507-9369-0b4017696653','middleName','user.attribute'),('0224afc1-d0eb-4507-9369-0b4017696653','true','userinfo.token.claim'),('024b0f9d-3a0b-4862-b23a-b68cd2c213d2','true','access.token.claim'),('024b0f9d-3a0b-4862-b23a-b68cd2c213d2','resource_access.${client_id}.roles','claim.name'),('024b0f9d-3a0b-4862-b23a-b68cd2c213d2','true','introspection.token.claim'),('024b0f9d-3a0b-4862-b23a-b68cd2c213d2','String','jsonType.label'),('024b0f9d-3a0b-4862-b23a-b68cd2c213d2','true','multivalued'),('024b0f9d-3a0b-4862-b23a-b68cd2c213d2','foo','user.attribute'),('034a53d6-c489-4b35-a0a8-4927cdb6ec5a','true','access.token.claim'),('034a53d6-c489-4b35-a0a8-4927cdb6ec5a','preferred_username','claim.name'),('034a53d6-c489-4b35-a0a8-4927cdb6ec5a','true','id.token.claim'),('034a53d6-c489-4b35-a0a8-4927cdb6ec5a','true','introspection.token.claim'),('034a53d6-c489-4b35-a0a8-4927cdb6ec5a','String','jsonType.label'),('034a53d6-c489-4b35-a0a8-4927cdb6ec5a','username','user.attribute'),('034a53d6-c489-4b35-a0a8-4927cdb6ec5a','true','userinfo.token.claim'),('0a06a8b5-82a4-4b56-ac68-455e5cc3e937','true','access.token.claim'),('0a06a8b5-82a4-4b56-ac68-455e5cc3e937','website','claim.name'),('0a06a8b5-82a4-4b56-ac68-455e5cc3e937','true','id.token.claim'),('0a06a8b5-82a4-4b56-ac68-455e5cc3e937','true','introspection.token.claim'),('0a06a8b5-82a4-4b56-ac68-455e5cc3e937','String','jsonType.label'),('0a06a8b5-82a4-4b56-ac68-455e5cc3e937','website','user.attribute'),('0a06a8b5-82a4-4b56-ac68-455e5cc3e937','true','userinfo.token.claim'),('0c0dc2e0-1d9c-409d-b99d-648273c5c7b1','true','access.token.claim'),('0c0dc2e0-1d9c-409d-b99d-648273c5c7b1','updated_at','claim.name'),('0c0dc2e0-1d9c-409d-b99d-648273c5c7b1','true','id.token.claim'),('0c0dc2e0-1d9c-409d-b99d-648273c5c7b1','true','introspection.token.claim'),('0c0dc2e0-1d9c-409d-b99d-648273c5c7b1','long','jsonType.label'),('0c0dc2e0-1d9c-409d-b99d-648273c5c7b1','updatedAt','user.attribute'),('0c0dc2e0-1d9c-409d-b99d-648273c5c7b1','true','userinfo.token.claim'),('0c7b2e99-3aae-48fe-b119-b9527c18056e','true','access.token.claim'),('0c7b2e99-3aae-48fe-b119-b9527c18056e','phone_number','claim.name'),('0c7b2e99-3aae-48fe-b119-b9527c18056e','true','id.token.claim'),('0c7b2e99-3aae-48fe-b119-b9527c18056e','true','introspection.token.claim'),('0c7b2e99-3aae-48fe-b119-b9527c18056e','String','jsonType.label'),('0c7b2e99-3aae-48fe-b119-b9527c18056e','phoneNumber','user.attribute'),('0c7b2e99-3aae-48fe-b119-b9527c18056e','true','userinfo.token.claim'),('14d9f018-9297-4358-8cb8-a720153c6222','true','access.token.claim'),('14d9f018-9297-4358-8cb8-a720153c6222','birthdate','claim.name'),('14d9f018-9297-4358-8cb8-a720153c6222','true','id.token.claim'),('14d9f018-9297-4358-8cb8-a720153c6222','true','introspection.token.claim'),('14d9f018-9297-4358-8cb8-a720153c6222','String','jsonType.label'),('14d9f018-9297-4358-8cb8-a720153c6222','birthdate','user.attribute'),('14d9f018-9297-4358-8cb8-a720153c6222','true','userinfo.token.claim'),('183f8c9f-87ad-4ef8-b0fe-406206b85fd2','true','access.token.claim'),('183f8c9f-87ad-4ef8-b0fe-406206b85fd2','true','id.token.claim'),('183f8c9f-87ad-4ef8-b0fe-406206b85fd2','true','introspection.token.claim'),('183f8c9f-87ad-4ef8-b0fe-406206b85fd2','true','userinfo.token.claim'),('236fe696-fdbc-46c8-94f6-8c0f0f159325','true','access.token.claim'),('236fe696-fdbc-46c8-94f6-8c0f0f159325','updated_at','claim.name'),('236fe696-fdbc-46c8-94f6-8c0f0f159325','true','id.token.claim'),('236fe696-fdbc-46c8-94f6-8c0f0f159325','true','introspection.token.claim'),('236fe696-fdbc-46c8-94f6-8c0f0f159325','long','jsonType.label'),('236fe696-fdbc-46c8-94f6-8c0f0f159325','updatedAt','user.attribute'),('236fe696-fdbc-46c8-94f6-8c0f0f159325','true','userinfo.token.claim'),('23dbe2ed-bfb8-4c91-91c9-890b3d28a88e','Role','attribute.name'),('23dbe2ed-bfb8-4c91-91c9-890b3d28a88e','Basic','attribute.nameformat'),('23dbe2ed-bfb8-4c91-91c9-890b3d28a88e','false','single'),('23ef90bb-d761-47dc-bd1f-a43d3230ceab','true','access.token.claim'),('23ef90bb-d761-47dc-bd1f-a43d3230ceab','true','id.token.claim'),('23ef90bb-d761-47dc-bd1f-a43d3230ceab','true','introspection.token.claim'),('295e5401-fa75-4407-be44-70e430667ecc','true','access.token.claim'),('295e5401-fa75-4407-be44-70e430667ecc','true','introspection.token.claim'),('305eeb00-68ac-4ecd-a078-54e7c6d90dd3','true','access.token.claim'),('305eeb00-68ac-4ecd-a078-54e7c6d90dd3','realm_access.roles','claim.name'),('305eeb00-68ac-4ecd-a078-54e7c6d90dd3','true','introspection.token.claim'),('305eeb00-68ac-4ecd-a078-54e7c6d90dd3','String','jsonType.label'),('305eeb00-68ac-4ecd-a078-54e7c6d90dd3','true','multivalued'),('305eeb00-68ac-4ecd-a078-54e7c6d90dd3','foo','user.attribute'),('313fc841-aaf3-425a-b2b1-6e641aefa758','true','access.token.claim'),('313fc841-aaf3-425a-b2b1-6e641aefa758','phone_number','claim.name'),('313fc841-aaf3-425a-b2b1-6e641aefa758','true','id.token.claim'),('313fc841-aaf3-425a-b2b1-6e641aefa758','true','introspection.token.claim'),('313fc841-aaf3-425a-b2b1-6e641aefa758','String','jsonType.label'),('313fc841-aaf3-425a-b2b1-6e641aefa758','phoneNumber','user.attribute'),('313fc841-aaf3-425a-b2b1-6e641aefa758','true','userinfo.token.claim'),('31929589-23ce-4ae8-b6fe-05895d11b861','true','access.token.claim'),('31929589-23ce-4ae8-b6fe-05895d11b861','locale','claim.name'),('31929589-23ce-4ae8-b6fe-05895d11b861','true','id.token.claim'),('31929589-23ce-4ae8-b6fe-05895d11b861','true','introspection.token.claim'),('31929589-23ce-4ae8-b6fe-05895d11b861','String','jsonType.label'),('31929589-23ce-4ae8-b6fe-05895d11b861','locale','user.attribute'),('31929589-23ce-4ae8-b6fe-05895d11b861','true','userinfo.token.claim'),('3afe4d1e-7e15-4018-a416-8755e48873a5','true','access.token.claim'),('3afe4d1e-7e15-4018-a416-8755e48873a5','zoneinfo','claim.name'),('3afe4d1e-7e15-4018-a416-8755e48873a5','true','id.token.claim'),('3afe4d1e-7e15-4018-a416-8755e48873a5','true','introspection.token.claim'),('3afe4d1e-7e15-4018-a416-8755e48873a5','String','jsonType.label'),('3afe4d1e-7e15-4018-a416-8755e48873a5','zoneinfo','user.attribute'),('3afe4d1e-7e15-4018-a416-8755e48873a5','true','userinfo.token.claim'),('3ee6bb56-48ba-48e6-b4fd-1d1796dcb14e','true','access.token.claim'),('3ee6bb56-48ba-48e6-b4fd-1d1796dcb14e','upn','claim.name'),('3ee6bb56-48ba-48e6-b4fd-1d1796dcb14e','true','id.token.claim'),('3ee6bb56-48ba-48e6-b4fd-1d1796dcb14e','true','introspection.token.claim'),('3ee6bb56-48ba-48e6-b4fd-1d1796dcb14e','String','jsonType.label'),('3ee6bb56-48ba-48e6-b4fd-1d1796dcb14e','username','user.attribute'),('3ee6bb56-48ba-48e6-b4fd-1d1796dcb14e','true','userinfo.token.claim'),('40bd3fb5-f1ca-444a-a884-d6f30161404c','true','access.token.claim'),('40bd3fb5-f1ca-444a-a884-d6f30161404c','gender','claim.name'),('40bd3fb5-f1ca-444a-a884-d6f30161404c','true','id.token.claim'),('40bd3fb5-f1ca-444a-a884-d6f30161404c','true','introspection.token.claim'),('40bd3fb5-f1ca-444a-a884-d6f30161404c','String','jsonType.label'),('40bd3fb5-f1ca-444a-a884-d6f30161404c','gender','user.attribute'),('40bd3fb5-f1ca-444a-a884-d6f30161404c','true','userinfo.token.claim'),('41ee8753-6030-4024-91ea-e93557b49bce','true','access.token.claim'),('41ee8753-6030-4024-91ea-e93557b49bce','email','claim.name'),('41ee8753-6030-4024-91ea-e93557b49bce','true','id.token.claim'),('41ee8753-6030-4024-91ea-e93557b49bce','true','introspection.token.claim'),('41ee8753-6030-4024-91ea-e93557b49bce','String','jsonType.label'),('41ee8753-6030-4024-91ea-e93557b49bce','email','user.attribute'),('41ee8753-6030-4024-91ea-e93557b49bce','true','userinfo.token.claim'),('4dc0efa2-c0f2-4fde-9598-b96edd7b9b16','true','access.token.claim'),('4dc0efa2-c0f2-4fde-9598-b96edd7b9b16','true','introspection.token.claim'),('507f9c42-fc70-45d3-a3c4-2a6573457bf4','true','access.token.claim'),('507f9c42-fc70-45d3-a3c4-2a6573457bf4','email_verified','claim.name'),('507f9c42-fc70-45d3-a3c4-2a6573457bf4','true','id.token.claim'),('507f9c42-fc70-45d3-a3c4-2a6573457bf4','true','introspection.token.claim'),('507f9c42-fc70-45d3-a3c4-2a6573457bf4','boolean','jsonType.label'),('507f9c42-fc70-45d3-a3c4-2a6573457bf4','emailVerified','user.attribute'),('507f9c42-fc70-45d3-a3c4-2a6573457bf4','true','userinfo.token.claim'),('53b01d7d-71f8-4df1-b8e3-79ed5e747494','true','access.token.claim'),('53b01d7d-71f8-4df1-b8e3-79ed5e747494','groups','claim.name'),('53b01d7d-71f8-4df1-b8e3-79ed5e747494','true','id.token.claim'),('53b01d7d-71f8-4df1-b8e3-79ed5e747494','true','introspection.token.claim'),('53b01d7d-71f8-4df1-b8e3-79ed5e747494','String','jsonType.label'),('53b01d7d-71f8-4df1-b8e3-79ed5e747494','true','multivalued'),('53b01d7d-71f8-4df1-b8e3-79ed5e747494','foo','user.attribute'),('53b01d7d-71f8-4df1-b8e3-79ed5e747494','true','userinfo.token.claim'),('63256e17-fc43-4e24-aa57-9fd55758602d','true','access.token.claim'),('63256e17-fc43-4e24-aa57-9fd55758602d','email','claim.name'),('63256e17-fc43-4e24-aa57-9fd55758602d','true','id.token.claim'),('63256e17-fc43-4e24-aa57-9fd55758602d','true','introspection.token.claim'),('63256e17-fc43-4e24-aa57-9fd55758602d','String','jsonType.label'),('63256e17-fc43-4e24-aa57-9fd55758602d','email','user.attribute'),('63256e17-fc43-4e24-aa57-9fd55758602d','true','userinfo.token.claim'),('6be8f846-7fb0-4f0d-a66d-8a6f412bdf27','true','access.token.claim'),('6be8f846-7fb0-4f0d-a66d-8a6f412bdf27','preferred_username','claim.name'),('6be8f846-7fb0-4f0d-a66d-8a6f412bdf27','true','id.token.claim'),('6be8f846-7fb0-4f0d-a66d-8a6f412bdf27','true','introspection.token.claim'),('6be8f846-7fb0-4f0d-a66d-8a6f412bdf27','String','jsonType.label'),('6be8f846-7fb0-4f0d-a66d-8a6f412bdf27','username','user.attribute'),('6be8f846-7fb0-4f0d-a66d-8a6f412bdf27','true','userinfo.token.claim'),('6c11a6f9-7f02-45c3-b82b-87ea0078b838','true','access.token.claim'),('6c11a6f9-7f02-45c3-b82b-87ea0078b838','locale','claim.name'),('6c11a6f9-7f02-45c3-b82b-87ea0078b838','true','id.token.claim'),('6c11a6f9-7f02-45c3-b82b-87ea0078b838','true','introspection.token.claim'),('6c11a6f9-7f02-45c3-b82b-87ea0078b838','String','jsonType.label'),('6c11a6f9-7f02-45c3-b82b-87ea0078b838','locale','user.attribute'),('6c11a6f9-7f02-45c3-b82b-87ea0078b838','true','userinfo.token.claim'),('7baf8191-603b-4c65-ac78-352b8d2e6843','true','access.token.claim'),('7baf8191-603b-4c65-ac78-352b8d2e6843','true','id.token.claim'),('7baf8191-603b-4c65-ac78-352b8d2e6843','true','introspection.token.claim'),('7baf8191-603b-4c65-ac78-352b8d2e6843','country','user.attribute.country'),('7baf8191-603b-4c65-ac78-352b8d2e6843','formatted','user.attribute.formatted'),('7baf8191-603b-4c65-ac78-352b8d2e6843','locality','user.attribute.locality'),('7baf8191-603b-4c65-ac78-352b8d2e6843','postal_code','user.attribute.postal_code'),('7baf8191-603b-4c65-ac78-352b8d2e6843','region','user.attribute.region'),('7baf8191-603b-4c65-ac78-352b8d2e6843','street','user.attribute.street'),('7baf8191-603b-4c65-ac78-352b8d2e6843','true','userinfo.token.claim'),('7d720aeb-e654-4600-aae9-5940d7bb0a5a','true','access.token.claim'),('7d720aeb-e654-4600-aae9-5940d7bb0a5a','nickname','claim.name'),('7d720aeb-e654-4600-aae9-5940d7bb0a5a','true','id.token.claim'),('7d720aeb-e654-4600-aae9-5940d7bb0a5a','true','introspection.token.claim'),('7d720aeb-e654-4600-aae9-5940d7bb0a5a','String','jsonType.label'),('7d720aeb-e654-4600-aae9-5940d7bb0a5a','nickname','user.attribute'),('7d720aeb-e654-4600-aae9-5940d7bb0a5a','true','userinfo.token.claim'),('83bc4153-488e-4289-b814-422d9b63a6a1','true','access.token.claim'),('83bc4153-488e-4289-b814-422d9b63a6a1','picture','claim.name'),('83bc4153-488e-4289-b814-422d9b63a6a1','true','id.token.claim'),('83bc4153-488e-4289-b814-422d9b63a6a1','true','introspection.token.claim'),('83bc4153-488e-4289-b814-422d9b63a6a1','String','jsonType.label'),('83bc4153-488e-4289-b814-422d9b63a6a1','picture','user.attribute'),('83bc4153-488e-4289-b814-422d9b63a6a1','true','userinfo.token.claim'),('899566c6-54e8-4406-bd51-568692ff115c','true','access.token.claim'),('899566c6-54e8-4406-bd51-568692ff115c','zoneinfo','claim.name'),('899566c6-54e8-4406-bd51-568692ff115c','true','id.token.claim'),('899566c6-54e8-4406-bd51-568692ff115c','true','introspection.token.claim'),('899566c6-54e8-4406-bd51-568692ff115c','String','jsonType.label'),('899566c6-54e8-4406-bd51-568692ff115c','zoneinfo','user.attribute'),('899566c6-54e8-4406-bd51-568692ff115c','true','userinfo.token.claim'),('90d5409a-8425-44f2-a310-b933982607f3','Role','attribute.name'),('90d5409a-8425-44f2-a310-b933982607f3','Basic','attribute.nameformat'),('90d5409a-8425-44f2-a310-b933982607f3','false','single'),('9a8ef45b-6069-48cd-b71a-42b33f678ef5','true','access.token.claim'),('9a8ef45b-6069-48cd-b71a-42b33f678ef5','upn','claim.name'),('9a8ef45b-6069-48cd-b71a-42b33f678ef5','true','id.token.claim'),('9a8ef45b-6069-48cd-b71a-42b33f678ef5','true','introspection.token.claim'),('9a8ef45b-6069-48cd-b71a-42b33f678ef5','String','jsonType.label'),('9a8ef45b-6069-48cd-b71a-42b33f678ef5','username','user.attribute'),('9a8ef45b-6069-48cd-b71a-42b33f678ef5','true','userinfo.token.claim'),('9d9f7212-9186-49a0-8688-60cf71109104','true','access.token.claim'),('9d9f7212-9186-49a0-8688-60cf71109104','resource_access.${client_id}.roles','claim.name'),('9d9f7212-9186-49a0-8688-60cf71109104','true','introspection.token.claim'),('9d9f7212-9186-49a0-8688-60cf71109104','String','jsonType.label'),('9d9f7212-9186-49a0-8688-60cf71109104','true','multivalued'),('9d9f7212-9186-49a0-8688-60cf71109104','foo','user.attribute'),('a0f42ead-5caf-4105-aa59-15ece5b5a548','true','access.token.claim'),('a0f42ead-5caf-4105-aa59-15ece5b5a548','gender','claim.name'),('a0f42ead-5caf-4105-aa59-15ece5b5a548','true','id.token.claim'),('a0f42ead-5caf-4105-aa59-15ece5b5a548','true','introspection.token.claim'),('a0f42ead-5caf-4105-aa59-15ece5b5a548','String','jsonType.label'),('a0f42ead-5caf-4105-aa59-15ece5b5a548','gender','user.attribute'),('a0f42ead-5caf-4105-aa59-15ece5b5a548','true','userinfo.token.claim'),('a1b31b14-e920-4ac3-966d-05bf6b594a9f','true','access.token.claim'),('a1b31b14-e920-4ac3-966d-05bf6b594a9f','true','introspection.token.claim'),('a76c3357-78f3-4be9-b0d1-12ba9e584e3f','true','access.token.claim'),('a76c3357-78f3-4be9-b0d1-12ba9e584e3f','given_name','claim.name'),('a76c3357-78f3-4be9-b0d1-12ba9e584e3f','true','id.token.claim'),('a76c3357-78f3-4be9-b0d1-12ba9e584e3f','true','introspection.token.claim'),('a76c3357-78f3-4be9-b0d1-12ba9e584e3f','String','jsonType.label'),('a76c3357-78f3-4be9-b0d1-12ba9e584e3f','firstName','user.attribute'),('a76c3357-78f3-4be9-b0d1-12ba9e584e3f','true','userinfo.token.claim'),('ac5a1c3b-e37e-4c18-9703-796cff3d21a6','true','access.token.claim'),('ac5a1c3b-e37e-4c18-9703-796cff3d21a6','locale','claim.name'),('ac5a1c3b-e37e-4c18-9703-796cff3d21a6','true','id.token.claim'),('ac5a1c3b-e37e-4c18-9703-796cff3d21a6','true','introspection.token.claim'),('ac5a1c3b-e37e-4c18-9703-796cff3d21a6','String','jsonType.label'),('ac5a1c3b-e37e-4c18-9703-796cff3d21a6','locale','user.attribute'),('ac5a1c3b-e37e-4c18-9703-796cff3d21a6','true','userinfo.token.claim'),('b4004996-2373-4e44-b7b7-e21747224d04','true','access.token.claim'),('b4004996-2373-4e44-b7b7-e21747224d04','family_name','claim.name'),('b4004996-2373-4e44-b7b7-e21747224d04','true','id.token.claim'),('b4004996-2373-4e44-b7b7-e21747224d04','true','introspection.token.claim'),('b4004996-2373-4e44-b7b7-e21747224d04','String','jsonType.label'),('b4004996-2373-4e44-b7b7-e21747224d04','lastName','user.attribute'),('b4004996-2373-4e44-b7b7-e21747224d04','true','userinfo.token.claim'),('b41d54d3-f504-4e8f-b56a-f5a232919b02','true','access.token.claim'),('b41d54d3-f504-4e8f-b56a-f5a232919b02','middle_name','claim.name'),('b41d54d3-f504-4e8f-b56a-f5a232919b02','true','id.token.claim'),('b41d54d3-f504-4e8f-b56a-f5a232919b02','true','introspection.token.claim'),('b41d54d3-f504-4e8f-b56a-f5a232919b02','String','jsonType.label'),('b41d54d3-f504-4e8f-b56a-f5a232919b02','middleName','user.attribute'),('b41d54d3-f504-4e8f-b56a-f5a232919b02','true','userinfo.token.claim'),('b60d07a7-551d-4cda-a96b-ffb0a0b7bf75','true','access.token.claim'),('b60d07a7-551d-4cda-a96b-ffb0a0b7bf75','realm_access.roles','claim.name'),('b60d07a7-551d-4cda-a96b-ffb0a0b7bf75','true','introspection.token.claim'),('b60d07a7-551d-4cda-a96b-ffb0a0b7bf75','String','jsonType.label'),('b60d07a7-551d-4cda-a96b-ffb0a0b7bf75','true','multivalued'),('b60d07a7-551d-4cda-a96b-ffb0a0b7bf75','foo','user.attribute'),('b6a303a6-17d8-47d1-a073-19d7732852b4','true','access.token.claim'),('b6a303a6-17d8-47d1-a073-19d7732852b4','birthdate','claim.name'),('b6a303a6-17d8-47d1-a073-19d7732852b4','true','id.token.claim'),('b6a303a6-17d8-47d1-a073-19d7732852b4','true','introspection.token.claim'),('b6a303a6-17d8-47d1-a073-19d7732852b4','String','jsonType.label'),('b6a303a6-17d8-47d1-a073-19d7732852b4','birthdate','user.attribute'),('b6a303a6-17d8-47d1-a073-19d7732852b4','true','userinfo.token.claim'),('b8ce6fd9-312e-4418-b895-ec1aee120316','true','access.token.claim'),('b8ce6fd9-312e-4418-b895-ec1aee120316','website','claim.name'),('b8ce6fd9-312e-4418-b895-ec1aee120316','true','id.token.claim'),('b8ce6fd9-312e-4418-b895-ec1aee120316','true','introspection.token.claim'),('b8ce6fd9-312e-4418-b895-ec1aee120316','String','jsonType.label'),('b8ce6fd9-312e-4418-b895-ec1aee120316','website','user.attribute'),('b8ce6fd9-312e-4418-b895-ec1aee120316','true','userinfo.token.claim'),('ba3a955c-b6ed-4190-af22-fcf8a88a695d','true','access.token.claim'),('ba3a955c-b6ed-4190-af22-fcf8a88a695d','phone_number_verified','claim.name'),('ba3a955c-b6ed-4190-af22-fcf8a88a695d','true','id.token.claim'),('ba3a955c-b6ed-4190-af22-fcf8a88a695d','true','introspection.token.claim'),('ba3a955c-b6ed-4190-af22-fcf8a88a695d','boolean','jsonType.label'),('ba3a955c-b6ed-4190-af22-fcf8a88a695d','phoneNumberVerified','user.attribute'),('ba3a955c-b6ed-4190-af22-fcf8a88a695d','true','userinfo.token.claim'),('ba8f7982-2a19-4912-9dbc-c2ce251b6f0b','true','access.token.claim'),('ba8f7982-2a19-4912-9dbc-c2ce251b6f0b','profile','claim.name'),('ba8f7982-2a19-4912-9dbc-c2ce251b6f0b','true','id.token.claim'),('ba8f7982-2a19-4912-9dbc-c2ce251b6f0b','true','introspection.token.claim'),('ba8f7982-2a19-4912-9dbc-c2ce251b6f0b','String','jsonType.label'),('ba8f7982-2a19-4912-9dbc-c2ce251b6f0b','profile','user.attribute'),('ba8f7982-2a19-4912-9dbc-c2ce251b6f0b','true','userinfo.token.claim'),('bcad225f-d954-490f-86dd-ac46b390cd2d','true','access.token.claim'),('bcad225f-d954-490f-86dd-ac46b390cd2d','phone_number_verified','claim.name'),('bcad225f-d954-490f-86dd-ac46b390cd2d','true','id.token.claim'),('bcad225f-d954-490f-86dd-ac46b390cd2d','true','introspection.token.claim'),('bcad225f-d954-490f-86dd-ac46b390cd2d','boolean','jsonType.label'),('bcad225f-d954-490f-86dd-ac46b390cd2d','phoneNumberVerified','user.attribute'),('bcad225f-d954-490f-86dd-ac46b390cd2d','true','userinfo.token.claim'),('bdb4e1fd-e53d-4635-aff5-e222f2ad4a0f','true','access.token.claim'),('bdb4e1fd-e53d-4635-aff5-e222f2ad4a0f','picture','claim.name'),('bdb4e1fd-e53d-4635-aff5-e222f2ad4a0f','true','id.token.claim'),('bdb4e1fd-e53d-4635-aff5-e222f2ad4a0f','true','introspection.token.claim'),('bdb4e1fd-e53d-4635-aff5-e222f2ad4a0f','String','jsonType.label'),('bdb4e1fd-e53d-4635-aff5-e222f2ad4a0f','picture','user.attribute'),('bdb4e1fd-e53d-4635-aff5-e222f2ad4a0f','true','userinfo.token.claim'),('bfd079d0-b466-4ce4-af75-ff9301e08fca','true','access.token.claim'),('bfd079d0-b466-4ce4-af75-ff9301e08fca','true','id.token.claim'),('bfd079d0-b466-4ce4-af75-ff9301e08fca','true','introspection.token.claim'),('bfd079d0-b466-4ce4-af75-ff9301e08fca','true','userinfo.token.claim'),('c317dccb-d1ca-4c62-80bb-1efe7ff4d48e','true','access.token.claim'),('c317dccb-d1ca-4c62-80bb-1efe7ff4d48e','profile','claim.name'),('c317dccb-d1ca-4c62-80bb-1efe7ff4d48e','true','id.token.claim'),('c317dccb-d1ca-4c62-80bb-1efe7ff4d48e','true','introspection.token.claim'),('c317dccb-d1ca-4c62-80bb-1efe7ff4d48e','String','jsonType.label'),('c317dccb-d1ca-4c62-80bb-1efe7ff4d48e','profile','user.attribute'),('c317dccb-d1ca-4c62-80bb-1efe7ff4d48e','true','userinfo.token.claim'),('c4029ebd-1fad-456c-8d3f-da827f4fd242','true','access.token.claim'),('c4029ebd-1fad-456c-8d3f-da827f4fd242','family_name','claim.name'),('c4029ebd-1fad-456c-8d3f-da827f4fd242','true','id.token.claim'),('c4029ebd-1fad-456c-8d3f-da827f4fd242','true','introspection.token.claim'),('c4029ebd-1fad-456c-8d3f-da827f4fd242','String','jsonType.label'),('c4029ebd-1fad-456c-8d3f-da827f4fd242','lastName','user.attribute'),('c4029ebd-1fad-456c-8d3f-da827f4fd242','true','userinfo.token.claim'),('c8fc4490-175c-43ab-a539-20193b8e0e18','true','access.token.claim'),('c8fc4490-175c-43ab-a539-20193b8e0e18','groups','claim.name'),('c8fc4490-175c-43ab-a539-20193b8e0e18','true','id.token.claim'),('c8fc4490-175c-43ab-a539-20193b8e0e18','true','introspection.token.claim'),('c8fc4490-175c-43ab-a539-20193b8e0e18','String','jsonType.label'),('c8fc4490-175c-43ab-a539-20193b8e0e18','true','multivalued'),('c8fc4490-175c-43ab-a539-20193b8e0e18','foo','user.attribute'),('cedfc403-22ba-493c-97d7-ff44fae7c400','true','access.token.claim'),('cedfc403-22ba-493c-97d7-ff44fae7c400','true','introspection.token.claim'),('d08f2b25-7e0f-4a6c-a28f-aaf7b8765272','true','access.token.claim'),('d08f2b25-7e0f-4a6c-a28f-aaf7b8765272','nickname','claim.name'),('d08f2b25-7e0f-4a6c-a28f-aaf7b8765272','true','id.token.claim'),('d08f2b25-7e0f-4a6c-a28f-aaf7b8765272','true','introspection.token.claim'),('d08f2b25-7e0f-4a6c-a28f-aaf7b8765272','String','jsonType.label'),('d08f2b25-7e0f-4a6c-a28f-aaf7b8765272','nickname','user.attribute'),('d08f2b25-7e0f-4a6c-a28f-aaf7b8765272','true','userinfo.token.claim'),('d282d97c-13fb-450e-b6e5-8322f125eb3c','true','access.token.claim'),('d282d97c-13fb-450e-b6e5-8322f125eb3c','true','id.token.claim'),('d282d97c-13fb-450e-b6e5-8322f125eb3c','true','introspection.token.claim'),('d282d97c-13fb-450e-b6e5-8322f125eb3c','country','user.attribute.country'),('d282d97c-13fb-450e-b6e5-8322f125eb3c','formatted','user.attribute.formatted'),('d282d97c-13fb-450e-b6e5-8322f125eb3c','locality','user.attribute.locality'),('d282d97c-13fb-450e-b6e5-8322f125eb3c','postal_code','user.attribute.postal_code'),('d282d97c-13fb-450e-b6e5-8322f125eb3c','region','user.attribute.region'),('d282d97c-13fb-450e-b6e5-8322f125eb3c','street','user.attribute.street'),('d282d97c-13fb-450e-b6e5-8322f125eb3c','true','userinfo.token.claim'),('d47ed71d-fc35-4e0b-9aa0-e850f2a7d625','true','access.token.claim'),('d47ed71d-fc35-4e0b-9aa0-e850f2a7d625','given_name','claim.name'),('d47ed71d-fc35-4e0b-9aa0-e850f2a7d625','true','id.token.claim'),('d47ed71d-fc35-4e0b-9aa0-e850f2a7d625','true','introspection.token.claim'),('d47ed71d-fc35-4e0b-9aa0-e850f2a7d625','String','jsonType.label'),('d47ed71d-fc35-4e0b-9aa0-e850f2a7d625','firstName','user.attribute'),('d47ed71d-fc35-4e0b-9aa0-e850f2a7d625','true','userinfo.token.claim'),('d525a487-d828-40b4-98ad-8e741591db76','true','access.token.claim'),('d525a487-d828-40b4-98ad-8e741591db76','email_verified','claim.name'),('d525a487-d828-40b4-98ad-8e741591db76','true','id.token.claim'),('d525a487-d828-40b4-98ad-8e741591db76','true','introspection.token.claim'),('d525a487-d828-40b4-98ad-8e741591db76','boolean','jsonType.label'),('d525a487-d828-40b4-98ad-8e741591db76','emailVerified','user.attribute'),('d525a487-d828-40b4-98ad-8e741591db76','true','userinfo.token.claim'),('dbaca211-0d37-4e4d-bb0a-dee34f8362d4','true','access.token.claim'),('dbaca211-0d37-4e4d-bb0a-dee34f8362d4','true','id.token.claim'),('dbaca211-0d37-4e4d-bb0a-dee34f8362d4','true','introspection.token.claim'),('dbaca211-0d37-4e4d-bb0a-dee34f8362d4','true','userinfo.token.claim'),('f5c0cb31-499a-45c6-81ff-7d01249e64fe','true','access.token.claim'),('f5c0cb31-499a-45c6-81ff-7d01249e64fe','locale','claim.name'),('f5c0cb31-499a-45c6-81ff-7d01249e64fe','true','id.token.claim'),('f5c0cb31-499a-45c6-81ff-7d01249e64fe','true','introspection.token.claim'),('f5c0cb31-499a-45c6-81ff-7d01249e64fe','String','jsonType.label'),('f5c0cb31-499a-45c6-81ff-7d01249e64fe','locale','user.attribute'),('f5c0cb31-499a-45c6-81ff-7d01249e64fe','true','userinfo.token.claim');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM`
--

DROP TABLE IF EXISTS `REALM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM` (
  `ID` varchar(36) NOT NULL,
  `ACCESS_CODE_LIFESPAN` int DEFAULT NULL,
  `USER_ACTION_LIFESPAN` int DEFAULT NULL,
  `ACCESS_TOKEN_LIFESPAN` int DEFAULT NULL,
  `ACCOUNT_THEME` varchar(255) DEFAULT NULL,
  `ADMIN_THEME` varchar(255) DEFAULT NULL,
  `EMAIL_THEME` varchar(255) DEFAULT NULL,
  `ENABLED` tinyint NOT NULL DEFAULT '0',
  `EVENTS_ENABLED` tinyint NOT NULL DEFAULT '0',
  `EVENTS_EXPIRATION` bigint DEFAULT NULL,
  `LOGIN_THEME` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int DEFAULT NULL,
  `PASSWORD_POLICY` text,
  `REGISTRATION_ALLOWED` tinyint NOT NULL DEFAULT '0',
  `REMEMBER_ME` tinyint NOT NULL DEFAULT '0',
  `RESET_PASSWORD_ALLOWED` tinyint NOT NULL DEFAULT '0',
  `SOCIAL` tinyint NOT NULL DEFAULT '0',
  `SSL_REQUIRED` varchar(255) DEFAULT NULL,
  `SSO_IDLE_TIMEOUT` int DEFAULT NULL,
  `SSO_MAX_LIFESPAN` int DEFAULT NULL,
  `UPDATE_PROFILE_ON_SOC_LOGIN` tinyint NOT NULL DEFAULT '0',
  `VERIFY_EMAIL` tinyint NOT NULL DEFAULT '0',
  `MASTER_ADMIN_CLIENT` varchar(36) DEFAULT NULL,
  `LOGIN_LIFESPAN` int DEFAULT NULL,
  `INTERNATIONALIZATION_ENABLED` tinyint NOT NULL DEFAULT '0',
  `DEFAULT_LOCALE` varchar(255) DEFAULT NULL,
  `REG_EMAIL_AS_USERNAME` tinyint NOT NULL DEFAULT '0',
  `ADMIN_EVENTS_ENABLED` tinyint NOT NULL DEFAULT '0',
  `ADMIN_EVENTS_DETAILS_ENABLED` tinyint NOT NULL DEFAULT '0',
  `EDIT_USERNAME_ALLOWED` tinyint NOT NULL DEFAULT '0',
  `OTP_POLICY_COUNTER` int DEFAULT '0',
  `OTP_POLICY_WINDOW` int DEFAULT '1',
  `OTP_POLICY_PERIOD` int DEFAULT '30',
  `OTP_POLICY_DIGITS` int DEFAULT '6',
  `OTP_POLICY_ALG` varchar(36) DEFAULT 'HmacSHA1',
  `OTP_POLICY_TYPE` varchar(36) DEFAULT 'totp',
  `BROWSER_FLOW` varchar(36) DEFAULT NULL,
  `REGISTRATION_FLOW` varchar(36) DEFAULT NULL,
  `DIRECT_GRANT_FLOW` varchar(36) DEFAULT NULL,
  `RESET_CREDENTIALS_FLOW` varchar(36) DEFAULT NULL,
  `CLIENT_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `OFFLINE_SESSION_IDLE_TIMEOUT` int DEFAULT '0',
  `REVOKE_REFRESH_TOKEN` tinyint NOT NULL DEFAULT '0',
  `ACCESS_TOKEN_LIFE_IMPLICIT` int DEFAULT '0',
  `LOGIN_WITH_EMAIL_ALLOWED` tinyint NOT NULL DEFAULT '1',
  `DUPLICATE_EMAILS_ALLOWED` tinyint NOT NULL DEFAULT '0',
  `DOCKER_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `REFRESH_TOKEN_MAX_REUSE` int DEFAULT '0',
  `ALLOW_USER_MANAGED_ACCESS` tinyint NOT NULL DEFAULT '0',
  `SSO_MAX_LIFESPAN_REMEMBER_ME` int NOT NULL,
  `SSO_IDLE_TIMEOUT_REMEMBER_ME` int NOT NULL,
  `DEFAULT_ROLE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_ORVSDMLA56612EAEFIQ6WL5OI` (`NAME`),
  KEY `IDX_REALM_MASTER_ADM_CLI` (`MASTER_ADMIN_CLIENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM`
--

LOCK TABLES `REALM` WRITE;
/*!40000 ALTER TABLE `REALM` DISABLE KEYS */;
INSERT INTO `REALM` VALUES ('d3a5ffa1-1601-43fe-aefc-247196ccd2b6',60,300,60,NULL,NULL,NULL,1,0,0,NULL,'master',0,NULL,0,0,0,0,'EXTERNAL',1800,36000,0,0,'b12ef818-913c-453b-a74a-70bf8e9ad21a',1800,0,NULL,0,0,0,0,0,1,30,6,'HmacSHA1','totp','26a54f43-9665-4b51-b7a7-f85b5c1b2356','9bfd5ffd-2cf8-4168-b9dd-9773701c5b7f','055b49b9-dc50-462a-b3f6-6985af8b7567','8380f9de-7812-4ec2-a102-b639255cb958','5aed61df-50c2-4464-94bb-fe61e1e0a3dd',2592000,0,900,1,0,'885bb95b-b10d-4732-b20b-80f6e771c66c',0,0,0,0,'ac34a50c-0c2e-4fcc-bf21-94fd0453241a'),('fc56c3ca-a729-402b-aa66-232ad730f09b',60,300,300,NULL,NULL,NULL,1,0,0,NULL,'Vacation-Application-Realm',0,NULL,0,0,0,0,'EXTERNAL',1800,36000,0,0,'db000120-e81c-4d0a-8a0b-036d7a2128dd',1800,0,NULL,0,0,0,0,0,1,30,6,'HmacSHA1','totp','d793d37c-73c7-4620-b4d0-bb32fc002a1f','6fa50a6a-f4e4-43e8-a874-99ef7bde4ca3','c31c7085-7bb0-45ac-900f-08f2fa050ce9','c76fbcfd-cfa1-4b90-bba9-7bebc50de28b','c14efc7d-fb2f-4b7b-80f6-915293776410',2592000,0,900,1,0,'f78b93f0-bcfc-4b23-a0d8-b61384b2466e',0,0,0,0,'ffcd9e1e-a28e-4fd5-8e32-c8c51e313e3c');
/*!40000 ALTER TABLE `REALM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ATTRIBUTE`
--

DROP TABLE IF EXISTS `REALM_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`NAME`,`REALM_ID`),
  KEY `IDX_REALM_ATTR_REALM` (`REALM_ID`),
  CONSTRAINT `FK_8SHXD6L3E9ATQUKACXGPFFPTW` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ATTRIBUTE`
--

LOCK TABLES `REALM_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `REALM_ATTRIBUTE` VALUES ('_browser_header.contentSecurityPolicy','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicy','fc56c3ca-a729-402b-aa66-232ad730f09b','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicyReportOnly','d3a5ffa1-1601-43fe-aefc-247196ccd2b6',''),('_browser_header.contentSecurityPolicyReportOnly','fc56c3ca-a729-402b-aa66-232ad730f09b',''),('_browser_header.referrerPolicy','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','no-referrer'),('_browser_header.referrerPolicy','fc56c3ca-a729-402b-aa66-232ad730f09b','no-referrer'),('_browser_header.strictTransportSecurity','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','max-age=31536000; includeSubDomains'),('_browser_header.strictTransportSecurity','fc56c3ca-a729-402b-aa66-232ad730f09b','max-age=31536000; includeSubDomains'),('_browser_header.xContentTypeOptions','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','nosniff'),('_browser_header.xContentTypeOptions','fc56c3ca-a729-402b-aa66-232ad730f09b','nosniff'),('_browser_header.xFrameOptions','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','SAMEORIGIN'),('_browser_header.xFrameOptions','fc56c3ca-a729-402b-aa66-232ad730f09b','SAMEORIGIN'),('_browser_header.xRobotsTag','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','none'),('_browser_header.xRobotsTag','fc56c3ca-a729-402b-aa66-232ad730f09b','none'),('_browser_header.xXSSProtection','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','1; mode=block'),('_browser_header.xXSSProtection','fc56c3ca-a729-402b-aa66-232ad730f09b','1; mode=block'),('actionTokenGeneratedByAdminLifespan','fc56c3ca-a729-402b-aa66-232ad730f09b','43200'),('actionTokenGeneratedByUserLifespan','fc56c3ca-a729-402b-aa66-232ad730f09b','300'),('bruteForceProtected','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','false'),('bruteForceProtected','fc56c3ca-a729-402b-aa66-232ad730f09b','false'),('cibaAuthRequestedUserHint','fc56c3ca-a729-402b-aa66-232ad730f09b','login_hint'),('cibaBackchannelTokenDeliveryMode','fc56c3ca-a729-402b-aa66-232ad730f09b','poll'),('cibaExpiresIn','fc56c3ca-a729-402b-aa66-232ad730f09b','120'),('cibaInterval','fc56c3ca-a729-402b-aa66-232ad730f09b','5'),('client-policies.policies','fc56c3ca-a729-402b-aa66-232ad730f09b','{\"policies\":[]}'),('client-policies.profiles','fc56c3ca-a729-402b-aa66-232ad730f09b','{\"profiles\":[]}'),('clientOfflineSessionIdleTimeout','fc56c3ca-a729-402b-aa66-232ad730f09b','0'),('clientOfflineSessionMaxLifespan','fc56c3ca-a729-402b-aa66-232ad730f09b','0'),('clientSessionIdleTimeout','fc56c3ca-a729-402b-aa66-232ad730f09b','0'),('clientSessionMaxLifespan','fc56c3ca-a729-402b-aa66-232ad730f09b','0'),('defaultSignatureAlgorithm','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','RS256'),('defaultSignatureAlgorithm','fc56c3ca-a729-402b-aa66-232ad730f09b','RS256'),('displayName','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','Keycloak'),('displayNameHtml','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','<div class=\"kc-logo-text\"><span>Keycloak</span></div>'),('failureFactor','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','30'),('failureFactor','fc56c3ca-a729-402b-aa66-232ad730f09b','30'),('firstBrokerLoginFlowId','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','420c0610-544a-4854-ab70-b3ccf524ed4d'),('firstBrokerLoginFlowId','fc56c3ca-a729-402b-aa66-232ad730f09b','0329209c-6a52-4a40-ac1c-4d995c97e629'),('maxDeltaTimeSeconds','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','43200'),('maxDeltaTimeSeconds','fc56c3ca-a729-402b-aa66-232ad730f09b','43200'),('maxFailureWaitSeconds','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','900'),('maxFailureWaitSeconds','fc56c3ca-a729-402b-aa66-232ad730f09b','900'),('maxTemporaryLockouts','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','0'),('maxTemporaryLockouts','fc56c3ca-a729-402b-aa66-232ad730f09b','0'),('minimumQuickLoginWaitSeconds','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','60'),('minimumQuickLoginWaitSeconds','fc56c3ca-a729-402b-aa66-232ad730f09b','60'),('oauth2DeviceCodeLifespan','fc56c3ca-a729-402b-aa66-232ad730f09b','600'),('oauth2DevicePollingInterval','fc56c3ca-a729-402b-aa66-232ad730f09b','5'),('offlineSessionMaxLifespan','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','5184000'),('offlineSessionMaxLifespan','fc56c3ca-a729-402b-aa66-232ad730f09b','5184000'),('offlineSessionMaxLifespanEnabled','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','false'),('offlineSessionMaxLifespanEnabled','fc56c3ca-a729-402b-aa66-232ad730f09b','false'),('parRequestUriLifespan','fc56c3ca-a729-402b-aa66-232ad730f09b','60'),('permanentLockout','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','false'),('permanentLockout','fc56c3ca-a729-402b-aa66-232ad730f09b','false'),('quickLoginCheckMilliSeconds','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','1000'),('quickLoginCheckMilliSeconds','fc56c3ca-a729-402b-aa66-232ad730f09b','1000'),('realmReusableOtpCode','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','false'),('realmReusableOtpCode','fc56c3ca-a729-402b-aa66-232ad730f09b','false'),('waitIncrementSeconds','d3a5ffa1-1601-43fe-aefc-247196ccd2b6','60'),('waitIncrementSeconds','fc56c3ca-a729-402b-aa66-232ad730f09b','60'),('webAuthnPolicyAttestationConveyancePreference','fc56c3ca-a729-402b-aa66-232ad730f09b','not specified'),('webAuthnPolicyAttestationConveyancePreferencePasswordless','fc56c3ca-a729-402b-aa66-232ad730f09b','not specified'),('webAuthnPolicyAuthenticatorAttachment','fc56c3ca-a729-402b-aa66-232ad730f09b','not specified'),('webAuthnPolicyAuthenticatorAttachmentPasswordless','fc56c3ca-a729-402b-aa66-232ad730f09b','not specified'),('webAuthnPolicyAvoidSameAuthenticatorRegister','fc56c3ca-a729-402b-aa66-232ad730f09b','false'),('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless','fc56c3ca-a729-402b-aa66-232ad730f09b','false'),('webAuthnPolicyCreateTimeout','fc56c3ca-a729-402b-aa66-232ad730f09b','0'),('webAuthnPolicyCreateTimeoutPasswordless','fc56c3ca-a729-402b-aa66-232ad730f09b','0'),('webAuthnPolicyRequireResidentKey','fc56c3ca-a729-402b-aa66-232ad730f09b','not specified'),('webAuthnPolicyRequireResidentKeyPasswordless','fc56c3ca-a729-402b-aa66-232ad730f09b','not specified'),('webAuthnPolicyRpEntityName','fc56c3ca-a729-402b-aa66-232ad730f09b','keycloak'),('webAuthnPolicyRpEntityNamePasswordless','fc56c3ca-a729-402b-aa66-232ad730f09b','keycloak'),('webAuthnPolicyRpId','fc56c3ca-a729-402b-aa66-232ad730f09b',''),('webAuthnPolicyRpIdPasswordless','fc56c3ca-a729-402b-aa66-232ad730f09b',''),('webAuthnPolicySignatureAlgorithms','fc56c3ca-a729-402b-aa66-232ad730f09b','ES256'),('webAuthnPolicySignatureAlgorithmsPasswordless','fc56c3ca-a729-402b-aa66-232ad730f09b','ES256'),('webAuthnPolicyUserVerificationRequirement','fc56c3ca-a729-402b-aa66-232ad730f09b','not specified'),('webAuthnPolicyUserVerificationRequirementPasswordless','fc56c3ca-a729-402b-aa66-232ad730f09b','not specified');
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_DEFAULT_GROUPS`
--

DROP TABLE IF EXISTS `REALM_DEFAULT_GROUPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_DEFAULT_GROUPS` (
  `REALM_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`GROUP_ID`),
  UNIQUE KEY `CON_GROUP_ID_DEF_GROUPS` (`GROUP_ID`),
  KEY `IDX_REALM_DEF_GRP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_DEF_GROUPS_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_DEFAULT_GROUPS`
--

LOCK TABLES `REALM_DEFAULT_GROUPS` WRITE;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ENABLED_EVENT_TYPES`
--

DROP TABLE IF EXISTS `REALM_ENABLED_EVENT_TYPES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_ENABLED_EVENT_TYPES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_TYPES_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NWEDRF5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ENABLED_EVENT_TYPES`
--

LOCK TABLES `REALM_ENABLED_EVENT_TYPES` WRITE;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_EVENTS_LISTENERS`
--

DROP TABLE IF EXISTS `REALM_EVENTS_LISTENERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_EVENTS_LISTENERS` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_LIST_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NXEV9F5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_EVENTS_LISTENERS`
--

LOCK TABLES `REALM_EVENTS_LISTENERS` WRITE;
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` DISABLE KEYS */;
INSERT INTO `REALM_EVENTS_LISTENERS` VALUES ('d3a5ffa1-1601-43fe-aefc-247196ccd2b6','jboss-logging'),('fc56c3ca-a729-402b-aa66-232ad730f09b','jboss-logging');
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_LOCALIZATIONS`
--

DROP TABLE IF EXISTS `REALM_LOCALIZATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_LOCALIZATIONS` (
  `REALM_ID` varchar(255) NOT NULL,
  `LOCALE` varchar(255) NOT NULL,
  `TEXTS` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`LOCALE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_LOCALIZATIONS`
--

LOCK TABLES `REALM_LOCALIZATIONS` WRITE;
/*!40000 ALTER TABLE `REALM_LOCALIZATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_LOCALIZATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_REQUIRED_CREDENTIAL`
--

DROP TABLE IF EXISTS `REALM_REQUIRED_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_REQUIRED_CREDENTIAL` (
  `TYPE` varchar(255) NOT NULL,
  `FORM_LABEL` varchar(255) DEFAULT NULL,
  `INPUT` tinyint NOT NULL DEFAULT '0',
  `SECRET` tinyint NOT NULL DEFAULT '0',
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`TYPE`),
  CONSTRAINT `FK_5HG65LYBEVAVKQFKI3KPONH9V` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_REQUIRED_CREDENTIAL`
--

LOCK TABLES `REALM_REQUIRED_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` DISABLE KEYS */;
INSERT INTO `REALM_REQUIRED_CREDENTIAL` VALUES ('password','password',1,1,'d3a5ffa1-1601-43fe-aefc-247196ccd2b6'),('password','password',1,1,'fc56c3ca-a729-402b-aa66-232ad730f09b');
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SMTP_CONFIG`
--

DROP TABLE IF EXISTS `REALM_SMTP_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_SMTP_CONFIG` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`NAME`),
  CONSTRAINT `FK_70EJ8XDXGXD0B9HH6180IRR0O` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SMTP_CONFIG`
--

LOCK TABLES `REALM_SMTP_CONFIG` WRITE;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SUPPORTED_LOCALES`
--

DROP TABLE IF EXISTS `REALM_SUPPORTED_LOCALES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_SUPPORTED_LOCALES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_SUPP_LOCAL_REALM` (`REALM_ID`),
  CONSTRAINT `FK_SUPPORTED_LOCALES_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SUPPORTED_LOCALES`
--

LOCK TABLES `REALM_SUPPORTED_LOCALES` WRITE;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REDIRECT_URIS`
--

DROP TABLE IF EXISTS `REDIRECT_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REDIRECT_URIS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_REDIR_URI_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_1BURS8PB4OUJ97H5WUPPAHV9F` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REDIRECT_URIS`
--

LOCK TABLES `REDIRECT_URIS` WRITE;
/*!40000 ALTER TABLE `REDIRECT_URIS` DISABLE KEYS */;
INSERT INTO `REDIRECT_URIS` VALUES ('2f673c36-13c2-4277-bda6-844afeecef61','/admin/Vacation-Application-Realm/console/*'),('350eae82-5e5e-4e8f-99e2-ffd9b1ec77b8','/admin/master/console/*'),('5e1b5a88-3651-4dc7-aadf-c382e372bc8d','/realms/Vacation-Application-Realm/account/*'),('6759a7bd-940b-4a74-a879-5e187472c652','/realms/Vacation-Application-Realm/account/*'),('813765c3-547f-4b77-855e-efb73057c17c','/realms/master/account/*'),('a59aa05e-4d3d-4653-9a74-49457b0200e4','/*'),('f1cb4880-047a-4261-89bf-3395b94119a1','/realms/master/account/*');
/*!40000 ALTER TABLE `REDIRECT_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_CONFIG`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIRED_ACTION_CONFIG` (
  `REQUIRED_ACTION_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REQUIRED_ACTION_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_CONFIG`
--

LOCK TABLES `REQUIRED_ACTION_CONFIG` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_PROVIDER`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIRED_ACTION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ENABLED` tinyint NOT NULL DEFAULT '0',
  `DEFAULT_ACTION` tinyint NOT NULL DEFAULT '0',
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_REQ_ACT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_REQ_ACT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_PROVIDER`
--

LOCK TABLES `REQUIRED_ACTION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` DISABLE KEYS */;
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('25a3e0a8-8c26-4fe1-8831-4445026856e5','TERMS_AND_CONDITIONS','Terms and Conditions','d3a5ffa1-1601-43fe-aefc-247196ccd2b6',0,0,'TERMS_AND_CONDITIONS',20),('28a6c33d-c606-4f97-a183-0129b51b28f1','UPDATE_PASSWORD','Update Password','d3a5ffa1-1601-43fe-aefc-247196ccd2b6',1,0,'UPDATE_PASSWORD',30),('549fed4b-ef99-4028-b758-8e0f28c00ebb','VERIFY_PROFILE','Verify Profile','d3a5ffa1-1601-43fe-aefc-247196ccd2b6',1,0,'VERIFY_PROFILE',90),('54dd004d-6d57-47e4-88c6-63d5321ced25','VERIFY_EMAIL','Verify Email','fc56c3ca-a729-402b-aa66-232ad730f09b',0,0,'VERIFY_EMAIL',50),('5b504c13-632e-4d64-86c0-ab5cb94aefb3','webauthn-register','Webauthn Register','fc56c3ca-a729-402b-aa66-232ad730f09b',1,0,'webauthn-register',70),('6517ca91-b50a-4f7b-a32e-316c201f74c9','VERIFY_EMAIL','Verify Email','d3a5ffa1-1601-43fe-aefc-247196ccd2b6',1,0,'VERIFY_EMAIL',50),('6e5133a5-2359-4222-91d5-e5faf83dafe8','update_user_locale','Update User Locale','fc56c3ca-a729-402b-aa66-232ad730f09b',1,0,'update_user_locale',1000),('92d565a2-49f9-49f4-9887-df1a2a38a963','UPDATE_PROFILE','Update Profile','d3a5ffa1-1601-43fe-aefc-247196ccd2b6',1,0,'UPDATE_PROFILE',40),('9582cb5b-2e1f-406d-bb57-c5b76bf1367a','CONFIGURE_TOTP','Configure OTP','fc56c3ca-a729-402b-aa66-232ad730f09b',1,0,'CONFIGURE_TOTP',10),('9609138e-eea3-473a-94b6-4137c554cdb5','delete_account','Delete Account','d3a5ffa1-1601-43fe-aefc-247196ccd2b6',0,0,'delete_account',60),('9c7472e2-8ec1-4b48-8105-0574d9176694','TERMS_AND_CONDITIONS','Terms and Conditions','fc56c3ca-a729-402b-aa66-232ad730f09b',0,0,'TERMS_AND_CONDITIONS',20),('b608cffa-ff30-4511-a16c-445b2c18827a','webauthn-register','Webauthn Register','d3a5ffa1-1601-43fe-aefc-247196ccd2b6',1,0,'webauthn-register',70),('b85aebb4-ade5-47ad-af4d-c10fcf4c1d33','webauthn-register-passwordless','Webauthn Register Passwordless','d3a5ffa1-1601-43fe-aefc-247196ccd2b6',1,0,'webauthn-register-passwordless',80),('bc4dbf37-7315-4c47-ad45-f23cd236d0f1','UPDATE_PROFILE','Update Profile','fc56c3ca-a729-402b-aa66-232ad730f09b',1,0,'UPDATE_PROFILE',40),('c886ef66-8a10-41ac-a489-55a99a1efdeb','VERIFY_PROFILE','Verify Profile','fc56c3ca-a729-402b-aa66-232ad730f09b',0,0,'VERIFY_PROFILE',90),('dfcf2b74-3544-4e79-b815-62d8d27bb81e','update_user_locale','Update User Locale','d3a5ffa1-1601-43fe-aefc-247196ccd2b6',1,0,'update_user_locale',1000),('e0269c89-d3fb-4137-8ee4-8b77e878f91f','webauthn-register-passwordless','Webauthn Register Passwordless','fc56c3ca-a729-402b-aa66-232ad730f09b',1,0,'webauthn-register-passwordless',80),('e058825f-878f-4f26-b931-302de2df45da','CONFIGURE_TOTP','Configure OTP','d3a5ffa1-1601-43fe-aefc-247196ccd2b6',1,0,'CONFIGURE_TOTP',10),('eb73a765-8540-45f5-b57a-5f03a1052889','delete_account','Delete Account','fc56c3ca-a729-402b-aa66-232ad730f09b',0,0,'delete_account',60),('f7612c08-2cd8-4ea0-947f-43b904ff9321','UPDATE_PASSWORD','Update Password','fc56c3ca-a729-402b-aa66-232ad730f09b',1,0,'UPDATE_PASSWORD',30);
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `RESOURCE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_5HRM2VLF9QL5FU022KQEPOVBR` (`RESOURCE_ID`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU022KQEPOVBR` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_ATTRIBUTE`
--

LOCK TABLES `RESOURCE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_POLICY` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`POLICY_ID`),
  KEY `IDX_RES_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRPOS53XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPP213XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_POLICY`
--

LOCK TABLES `RESOURCE_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SCOPE` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`SCOPE_ID`),
  KEY `IDX_RES_SCOPE_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_FRSRPOS13XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPS213XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SCOPE`
--

LOCK TABLES `RESOURCE_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER` (
  `ID` varchar(36) NOT NULL,
  `ALLOW_RS_REMOTE_MGMT` tinyint NOT NULL DEFAULT '0',
  `POLICY_ENFORCE_MODE` tinyint DEFAULT NULL,
  `DECISION_STRATEGY` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER`
--

LOCK TABLES `RESOURCE_SERVER` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_PERM_TICKET`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_PERM_TICKET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_PERM_TICKET` (
  `ID` varchar(36) NOT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `REQUESTER` varchar(255) DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint NOT NULL,
  `GRANTED_TIMESTAMP` bigint DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5PMT` (`OWNER`,`REQUESTER`,`RESOURCE_SERVER_ID`,`RESOURCE_ID`,`SCOPE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG82SSPMT` (`RESOURCE_SERVER_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG83SSPMT` (`RESOURCE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG84SSPMT` (`SCOPE_ID`),
  KEY `FK_FRSRPO2128CX4WNKOG82SSRFY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSPMT` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG83SSPMT` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG84SSPMT` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`),
  CONSTRAINT `FK_FRSRPO2128CX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_PERM_TICKET`
--

LOCK TABLES `RESOURCE_SERVER_PERM_TICKET` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_POLICY` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `TYPE` varchar(255) NOT NULL,
  `DECISION_STRATEGY` tinyint DEFAULT NULL,
  `LOGIC` tinyint DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRPT700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SERV_POL_RES_SERV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRPO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_POLICY`
--

LOCK TABLES `RESOURCE_SERVER_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_RESOURCE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_RESOURCE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER_MANAGED_ACCESS` tinyint NOT NULL DEFAULT '0',
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5HA6` (`NAME`,`OWNER`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_RES_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_RESOURCE`
--

LOCK TABLES `RESOURCE_SERVER_RESOURCE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRST700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_SCOPE_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRSO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_SCOPE`
--

LOCK TABLES `RESOURCE_SERVER_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_URIS`
--

DROP TABLE IF EXISTS `RESOURCE_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_URIS` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`VALUE`),
  CONSTRAINT `FK_RESOURCE_SERVER_URIS` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_URIS`
--

LOCK TABLES `RESOURCE_URIS` WRITE;
/*!40000 ALTER TABLE `RESOURCE_URIS` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROLE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `ROLE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ROLE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ROLE_ATTRIBUTE` (`ROLE_ID`),
  CONSTRAINT `FK_ROLE_ATTRIBUTE_ID` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLE_ATTRIBUTE`
--

LOCK TABLES `ROLE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_MAPPING`
--

DROP TABLE IF EXISTS `SCOPE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCOPE_MAPPING` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
  KEY `IDX_SCOPE_MAPPING_ROLE` (`ROLE_ID`),
  CONSTRAINT `FK_OUSE064PLMLR732LXJCN1Q5F1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_MAPPING`
--

LOCK TABLES `SCOPE_MAPPING` WRITE;
/*!40000 ALTER TABLE `SCOPE_MAPPING` DISABLE KEYS */;
INSERT INTO `SCOPE_MAPPING` VALUES ('f1cb4880-047a-4261-89bf-3395b94119a1','4f41224a-a0b5-4657-8d70-b1ccbac385f8'),('5e1b5a88-3651-4dc7-aadf-c382e372bc8d','6d9b1dd8-d139-48e2-af8e-7ba8a072f6e6'),('5e1b5a88-3651-4dc7-aadf-c382e372bc8d','9e1fe19a-8fdd-42b7-a119-377217d7d321'),('f1cb4880-047a-4261-89bf-3395b94119a1','daebd200-b3d3-4db2-b97b-32db0c2856ca');
/*!40000 ALTER TABLE `SCOPE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_POLICY`
--

DROP TABLE IF EXISTS `SCOPE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCOPE_POLICY` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`POLICY_ID`),
  KEY `IDX_SCOPE_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRASP13XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPASS3XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_POLICY`
--

LOCK TABLES `SCOPE_POLICY` WRITE;
/*!40000 ALTER TABLE `SCOPE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `SCOPE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERNAME_LOGIN_FAILURE`
--

DROP TABLE IF EXISTS `USERNAME_LOGIN_FAILURE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USERNAME_LOGIN_FAILURE` (
  `REALM_ID` varchar(36) NOT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `FAILED_LOGIN_NOT_BEFORE` int DEFAULT NULL,
  `LAST_FAILURE` bigint DEFAULT NULL,
  `LAST_IP_FAILURE` varchar(255) DEFAULT NULL,
  `NUM_FAILURES` int DEFAULT NULL,
  PRIMARY KEY (`REALM_ID`,`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERNAME_LOGIN_FAILURE`
--

LOCK TABLES `USERNAME_LOGIN_FAILURE` WRITE;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `LONG_VALUE_HASH` binary(64) DEFAULT NULL,
  `LONG_VALUE_HASH_LOWER_CASE` binary(64) DEFAULT NULL,
  `LONG_VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_ATTRIBUTE` (`USER_ID`),
  KEY `IDX_USER_ATTRIBUTE_NAME` (`NAME`,`VALUE`),
  KEY `USER_ATTR_LONG_VALUES` (`LONG_VALUE_HASH`,`NAME`),
  KEY `USER_ATTR_LONG_VALUES_LOWER_CASE` (`LONG_VALUE_HASH_LOWER_CASE`,`NAME`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU043KQEPOVBR` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ATTRIBUTE`
--

LOCK TABLES `USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT`
--

DROP TABLE IF EXISTS `USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_JKUWUVD56ONTGSUHOGM8UEWRT` (`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`USER_ID`),
  KEY `IDX_USER_CONSENT` (`USER_ID`),
  CONSTRAINT `FK_GRNTCSNT_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT`
--

LOCK TABLES `USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `USER_CONSENT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_CONSENT_CLIENT_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`),
  KEY `IDX_USCONSENT_CLSCOPE` (`USER_CONSENT_ID`),
  CONSTRAINT `FK_GRNTCSNT_CLSC_USC` FOREIGN KEY (`USER_CONSENT_ID`) REFERENCES `USER_CONSENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT_CLIENT_SCOPE`
--

LOCK TABLES `USER_CONSENT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ENTITY`
--

DROP TABLE IF EXISTS `USER_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `EMAIL_CONSTRAINT` varchar(255) DEFAULT NULL,
  `EMAIL_VERIFIED` tinyint NOT NULL DEFAULT '0',
  `ENABLED` tinyint NOT NULL DEFAULT '0',
  `FEDERATION_LINK` varchar(255) DEFAULT NULL,
  `FIRST_NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `LAST_NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint DEFAULT NULL,
  `SERVICE_ACCOUNT_CLIENT_LINK` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_DYKN684SL8UP1CRFEI6ECKHD7` (`REALM_ID`,`EMAIL_CONSTRAINT`),
  UNIQUE KEY `UK_RU8TT6T700S9V50BU18WS5HA6` (`REALM_ID`,`USERNAME`),
  KEY `IDX_USER_EMAIL` (`EMAIL`),
  KEY `IDX_USER_SERVICE_ACCOUNT` (`REALM_ID`,`SERVICE_ACCOUNT_CLIENT_LINK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ENTITY`
--

LOCK TABLES `USER_ENTITY` WRITE;
/*!40000 ALTER TABLE `USER_ENTITY` DISABLE KEYS */;
INSERT INTO `USER_ENTITY` VALUES ('053434a0-fba3-4204-839a-de90561cf9d3',NULL,'c58bc300-936b-492e-bff7-28771c9bf365',1,1,NULL,NULL,NULL,'fc56c3ca-a729-402b-aa66-232ad730f09b','admin_user',1747643890070,NULL,0),('75c083ed-0e38-4a37-9044-06b47ec9d88e',NULL,'ba866d88-f603-4f59-9cff-23276a62cc70',0,1,NULL,NULL,NULL,'d3a5ffa1-1601-43fe-aefc-247196ccd2b6','admin',1747825369629,NULL,0);
/*!40000 ALTER TABLE `USER_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_CONFIG` (
  `USER_FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FK_T13HPU1J94R2EBPEKR39X5EU5` FOREIGN KEY (`USER_FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_CONFIG`
--

LOCK TABLES `USER_FEDERATION_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `FEDERATION_MAPPER_TYPE` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_MAP_FED_PRV` (`FEDERATION_PROVIDER_ID`),
  KEY `IDX_USR_FED_MAP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_FEDMAPPERPM_FEDPRV` FOREIGN KEY (`FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`),
  CONSTRAINT `FK_FEDMAPPERPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER`
--

LOCK TABLES `USER_FEDERATION_MAPPER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_MAPPER_CONFIG` (
  `USER_FEDERATION_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_FEDMAPPER_CFG` FOREIGN KEY (`USER_FEDERATION_MAPPER_ID`) REFERENCES `USER_FEDERATION_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER_CONFIG`
--

LOCK TABLES `USER_FEDERATION_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_PROVIDER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `CHANGED_SYNC_PERIOD` int DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `FULL_SYNC_PERIOD` int DEFAULT NULL,
  `LAST_SYNC` int DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `PROVIDER_NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_PRV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_1FJ32F6PTOLW2QY60CD8N01E8` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_PROVIDER`
--

LOCK TABLES `USER_FEDERATION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_USER_GROUP_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_USER_GROUP_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_REQUIRED_ACTION` (
  `USER_ID` varchar(36) NOT NULL,
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_USER_REQACTIONS` (`USER_ID`),
  CONSTRAINT `FK_6QJ3W1JW9CVAFHE19BWSIUVMD` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_REQUIRED_ACTION`
--

LOCK TABLES `USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(255) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_USER_ROLE_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_C4FQV34P1MBYLLOXANG7B1Q3L` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ROLE_MAPPING`
--

LOCK TABLES `USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `USER_ROLE_MAPPING` VALUES ('3bd15bad-6b90-4c40-a6d8-e479cf9b41b1','053434a0-fba3-4204-839a-de90561cf9d3'),('cfb03abc-7a89-4359-a8ce-0888d69079a1','053434a0-fba3-4204-839a-de90561cf9d3'),('ffcd9e1e-a28e-4fd5-8e32-c8c51e313e3c','053434a0-fba3-4204-839a-de90561cf9d3'),('184a5a2a-ee8b-432e-9c5c-7d3cc48c35dc','75c083ed-0e38-4a37-9044-06b47ec9d88e'),('ac34a50c-0c2e-4fcc-bf21-94fd0453241a','75c083ed-0e38-4a37-9044-06b47ec9d88e');
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION`
--

DROP TABLE IF EXISTS `USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_SESSION` (
  `ID` varchar(36) NOT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `LAST_SESSION_REFRESH` int DEFAULT NULL,
  `LOGIN_USERNAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `REMEMBER_ME` tinyint NOT NULL DEFAULT '0',
  `STARTED` int DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `USER_SESSION_STATE` int DEFAULT NULL,
  `BROKER_SESSION_ID` varchar(255) DEFAULT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION`
--

LOCK TABLES `USER_SESSION` WRITE;
/*!40000 ALTER TABLE `USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_SESSION_NOTE` (
  `USER_SESSION` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` text,
  PRIMARY KEY (`USER_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51D3472` FOREIGN KEY (`USER_SESSION`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION_NOTE`
--

LOCK TABLES `USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WEB_ORIGINS`
--

DROP TABLE IF EXISTS `WEB_ORIGINS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WEB_ORIGINS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_WEB_ORIG_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_LOJPHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WEB_ORIGINS`
--

LOCK TABLES `WEB_ORIGINS` WRITE;
/*!40000 ALTER TABLE `WEB_ORIGINS` DISABLE KEYS */;
INSERT INTO `WEB_ORIGINS` VALUES ('2f673c36-13c2-4277-bda6-844afeecef61','+'),('350eae82-5e5e-4e8f-99e2-ffd9b1ec77b8','+'),('a59aa05e-4d3d-4653-9a74-49457b0200e4','/*');
/*!40000 ALTER TABLE `WEB_ORIGINS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-21 11:15:24
