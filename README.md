구현 내용
1. 등록된 책의 리스트를 표출
2. 등록된 책의 페이지네이션구현
3. 등록된 책의 제목, 저자 검색 기능 구현
4. 등록된 책의 삭제 기능 구현
5. 책 등록, 수정 기능 구현
6. 등록된 책의 디테일 페이지 구현

데이터베이스 SQL

/*
SQLyog Professional v12.09 (64 bit)
MySQL - 8.0.41 : Database - book
*********************************************************************
*/

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
`idx` int NOT NULL AUTO_INCREMENT,
`title` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
`content` longtext COLLATE utf8mb4_general_ci,
`creator` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
`created` datetime DEFAULT CURRENT_TIMESTAMP,
`quantity` int DEFAULT '0',
PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `book` */

insert  into `book`(`idx`,`title`,`content`,`creator`,`created`,`quantity`) values (1,'1984','','조지 오웰','2025-03-09 01:40:40',80),(2,'동물농장',NULL,'조지 오웰','2025-03-09 01:40:40',14),(3,'위대한 개츠비',NULL,'F. 스콧 피츠제럴드','2025-03-09 01:40:40',1),(4,'노인과 바다',NULL,'어니스트 헤밍웨이','2025-03-09 01:40:40',52),(5,'죄와 벌',NULL,'도스토옙스키','2025-03-09 01:40:40',2),(6,'데미안',NULL,'헤르만 헤세','2025-03-09 01:40:40',4),(7,'이방인',NULL,'알베르 카뮈','2025-03-09 01:40:40',7),(8,'어린 왕자',NULL,'앙투안 드 생텍쥐페리','2025-03-09 01:40:40',90),(9,'호밀밭의 파수꾼',NULL,'J.D. 샐린저','2025-03-09 01:40:40',8),(10,'달과 6펜스',NULL,'서머싯 몸','2025-03-09 01:40:40',9),(11,'태백산맥',NULL,'조정래','2025-03-09 01:40:40',0),(12,'난장이가 쏘아올린 작은 공',NULL,'조세희','2025-03-09 01:40:40',12),(13,'칼의 노래',NULL,'김훈','2025-03-09 01:40:40',1),(14,'봉순이 언니',NULL,'공지영','2025-03-09 01:40:40',11),(15,'삼국지',NULL,'나관중 (번역본)','2025-03-09 01:40:40',0),(16,'사피엔스',NULL,'유발 하라리','2025-03-09 01:40:40',0),(17,'총균쇠',NULL,'재러드 다이아몬드','2025-03-09 01:40:40',0),(18,'역사의 연구',NULL,'아놀드 토인비','2025-03-09 01:40:40',0),(19,'코스모스',NULL,'칼 세이건','2025-03-09 01:40:40',0),(20,'대항해 시대',NULL,'펠리페 페르난데스아르메스토','2025-03-09 01:40:40',0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

