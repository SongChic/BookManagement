데이터베이스 SQL

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`book` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `book`;

/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
`idx` INT NOT NULL AUTO_INCREMENT,
`title` VARCHAR(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
`content` LONGTEXT COLLATE utf8mb4_general_ci,
`creator` VARCHAR(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
`created` DATETIME DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (`idx`)
) ENGINE=INNODB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `book` */

INSERT  INTO `book`(`idx`,`title`,`content`,`creator`,`created`) VALUES (1,'test1','test','test','2025-03-08 03:17:28'),(2,'test2','test','test','2025-03-08 03:17:28'),(3,'test3','test','test','2025-03-08 03:17:28'),(4,'test4','test','test','2025-03-08 03:17:28'),(5,'test5','test','test','2025-03-08 03:17:28'),(6,'test6','test','test','2025-03-08 03:17:28'),(7,'test7','test','test','2025-03-08 03:17:28'),(8,'test8111','test','test','2025-03-08 03:17:28'),(9,'test9','test','test','2025-03-08 03:17:28'),(10,'test10','test','test','2025-03-08 03:17:28'),(12,'test12','test','test','2025-03-08 03:17:28'),(13,'test13','test','test','2025-03-08 03:17:28'),(14,'test14','test','test','2025-03-08 03:17:28'),(15,'test15','test','test','2025-03-08 03:17:28'),(16,'test16','test','test','2025-03-08 03:17:28'),(17,'test17','test','test','2025-03-08 03:17:28'),(18,'test18','test','test','2025-03-08 03:17:28'),(19,'test','test','test','2025-03-08 03:17:28'),(20,'test','test','test','2025-03-08 03:17:28'),(21,'test','test','test','2025-03-08 03:17:28'),(22,'test','test','test','2025-03-08 03:17:28'),(23,'test','test','test','2025-03-08 03:17:28'),(24,'test','test','test','2025-03-08 03:17:28'),(25,'test','test','test','2025-03-08 03:17:28'),(26,'qwe','qwe','qwe','2025-03-09 00:46:11'),(27,'qwe','qwe','qwe','2025-03-09 00:47:44'),(28,'zxc','zxc','zxc','2025-03-09 00:50:09');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
