-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: crtvu
-- ------------------------------------------------------
-- Server version	5.7.17-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_admin`
--

DROP TABLE IF EXISTS `tb_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_admin` (
  `admin_id` int(10) NOT NULL COMMENT '用户id',
  `password` varchar(32) NOT NULL COMMENT '用户密码',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_admin`
--

LOCK TABLES `tb_admin` WRITE;
/*!40000 ALTER TABLE `tb_admin` DISABLE KEYS */;
INSERT INTO `tb_admin` VALUES (2014000000,'123456');
/*!40000 ALTER TABLE `tb_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_arrange_subject`
--

DROP TABLE IF EXISTS `tb_arrange_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_arrange_subject` (
  `subject_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '题目id',
  `open_id` int(10) NOT NULL COMMENT '开设id',
  `teacher_id` int(10) NOT NULL COMMENT '教师工号',
  `name` varchar(50) NOT NULL COMMENT '课题名称',
  `requirement` text NOT NULL COMMENT '课题要求',
  PRIMARY KEY (`subject_id`),
  KEY `open_id` (`open_id`),
  KEY `teacher_id` (`teacher_id`),
  CONSTRAINT `tb_arrange_subject_ibfk_1` FOREIGN KEY (`open_id`) REFERENCES `tb_open` (`open_id`) ON DELETE CASCADE,
  CONSTRAINT `tb_arrange_subject_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `tb_teacher` (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='毕设题目发布表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_arrange_subject`
--

LOCK TABLES `tb_arrange_subject` WRITE;
/*!40000 ALTER TABLE `tb_arrange_subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_arrange_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_arrangement`
--

DROP TABLE IF EXISTS `tb_arrangement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_arrangement` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `open_id` int(10) NOT NULL COMMENT '开设id',
  `teacher_id` int(10) NOT NULL COMMENT '教师工号',
  `classroom` varchar(10) NOT NULL COMMENT '教室名',
  `class_name` varchar(10) NOT NULL COMMENT '班级名',
  `day` int(1) NOT NULL COMMENT '星期',
  `start_week` int(2) NOT NULL COMMENT '开始周',
  `end_week` int(2) NOT NULL COMMENT '结束周',
  `start_time` int(2) NOT NULL COMMENT '开始节次',
  `end_time` int(2) NOT NULL COMMENT '结束节次',
  PRIMARY KEY (`id`),
  KEY `open_id` (`open_id`),
  KEY `teacher_id` (`teacher_id`),
  KEY `classroom` (`classroom`),
  CONSTRAINT `tb_arrangement_ibfk_1` FOREIGN KEY (`open_id`) REFERENCES `tb_open` (`open_id`) ON DELETE CASCADE,
  CONSTRAINT `tb_arrangement_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `tb_teacher` (`teacher_id`),
  CONSTRAINT `tb_arrangement_ibfk_3` FOREIGN KEY (`classroom`) REFERENCES `tb_classroom` (`classroom`)
) ENGINE=InnoDB AUTO_INCREMENT=2248 DEFAULT CHARSET=utf8 COMMENT='安排表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_arrangement`
--

LOCK TABLES `tb_arrangement` WRITE;
/*!40000 ALTER TABLE `tb_arrangement` DISABLE KEYS */;
INSERT INTO `tb_arrangement` VALUES (222,20170222,1999002,'科303','计科1404',4,1,18,3,5),(224,20170224,1999011,'电201','计科1404',4,2,14,11,13),(225,20170225,1999015,'电301','计科1404',3,1,18,6,7),(226,20170226,1999012,'科302','计科1404',1,1,18,1,13),(228,20170229,1999010,'科303','计科1404',5,2,12,8,10),(229,20170228,1999001,'科302','计科1404',1,2,9,3,5);
/*!40000 ALTER TABLE `tb_arrangement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_classroom`
--

DROP TABLE IF EXISTS `tb_classroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_classroom` (
  `classroom` varchar(10) NOT NULL COMMENT '教室名',
  `people_num` int(3) NOT NULL COMMENT '教室容量',
  PRIMARY KEY (`classroom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教室表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_classroom`
--

LOCK TABLES `tb_classroom` WRITE;
/*!40000 ALTER TABLE `tb_classroom` DISABLE KEYS */;
INSERT INTO `tb_classroom` VALUES ('信息楼401',80),('电201',218),('电301',218),('科110',218),('科301',160),('科302',160),('科303',160);
/*!40000 ALTER TABLE `tb_classroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_confirm_subject`
--

DROP TABLE IF EXISTS `tb_confirm_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_confirm_subject` (
  `student_id` int(10) NOT NULL COMMENT '学号',
  `subject_id` int(10) NOT NULL COMMENT '题目id',
  `grade` float(3,1) DEFAULT NULL COMMENT '成绩',
  `document` text COMMENT '文档',
  PRIMARY KEY (`student_id`,`subject_id`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `tb_confirm_subject_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `tb_student` (`student_id`),
  CONSTRAINT `tb_confirm_subject_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `tb_arrange_subject` (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生定题表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_confirm_subject`
--

LOCK TABLES `tb_confirm_subject` WRITE;
/*!40000 ALTER TABLE `tb_confirm_subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_confirm_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_course`
--

DROP TABLE IF EXISTS `tb_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_course` (
  `course_id` varchar(10) NOT NULL COMMENT '课程id',
  `course_name` varchar(100) NOT NULL COMMENT '课程名称',
  `credit` float(2,1) DEFAULT NULL COMMENT '课程学分',
  `nature` varchar(10) NOT NULL COMMENT '课程性质',
  `department` varchar(20) NOT NULL COMMENT '开设院系',
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课程表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_course`
--

LOCK TABLES `tb_course` WRITE;
/*!40000 ALTER TABLE `tb_course` DISABLE KEYS */;
INSERT INTO `tb_course` VALUES ('2017014200','高数',2.0,'选修','计算机科学与技术学院'),('201702214','形势与政策',1.0,'必修','学生工作办公室'),('20170222','计算机系统结构',3.5,'必修','材料科学与工程学院'),('20170223','软件工程',2.5,'必修','信息科学与技术学院'),('20170224','技术经济与企业管理',2.5,'选修','经济管理学院'),('20170225','微机接口技术',3.5,'选修','信息科学与技术学院'),('20170226','数字媒体技术',2.5,'选修','信息科学与技术学院'),('20170227','信息与网络安全',2.0,'选修','信息科学与技术学院'),('20170228','软件开发工具',2.0,'选修','信息科学与技术学院'),('20170229','人工智能导论',2.5,'选修','信息科学与技术学院'),('E4DXF13','英语',6.0,'必修','文法学院'),('E85ZVDW','高数',9.0,'必修','理学院'),('qwer','测试测试',3.5,'选修','理学院'),('TTTT','测测测测',NULL,'选修','理学院');
/*!40000 ALTER TABLE `tb_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_exam`
--

DROP TABLE IF EXISTS `tb_exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_exam` (
  `open_id` int(10) NOT NULL COMMENT '开设id',
  `time` datetime DEFAULT NULL COMMENT '考试时间',
  `classroom` varchar(10) DEFAULT NULL COMMENT '考试地点',
  `class` varchar(10) DEFAULT NULL COMMENT '班级',
  PRIMARY KEY (`open_id`),
  CONSTRAINT `tb_exam_ibfk_1` FOREIGN KEY (`open_id`) REFERENCES `tb_open` (`open_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='考试安排表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_exam`
--

LOCK TABLES `tb_exam` WRITE;
/*!40000 ALTER TABLE `tb_exam` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_info`
--

DROP TABLE IF EXISTS `tb_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_info` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '通知id',
  `title` text NOT NULL COMMENT '通知标题',
  `context` text NOT NULL COMMENT '通知正文',
  `time` datetime NOT NULL COMMENT '通知时间',
  `sender` varchar(50) NOT NULL COMMENT '通知发布者',
  `student_id` int(10) DEFAULT NULL,
  `has_read` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_student_id` (`student_id`),
  CONSTRAINT `fk_student_id` FOREIGN KEY (`student_id`) REFERENCES `tb_student` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='通知表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_info`
--

LOCK TABLES `tb_info` WRITE;
/*!40000 ALTER TABLE `tb_info` DISABLE KEYS */;
INSERT INTO `tb_info` VALUES (1,'第一粒','sss','2017-05-02 22:52:05','sss',2014014361,0),(2,'aa','ss','2017-05-02 23:13:16','aa',2014014361,0);
/*!40000 ALTER TABLE `tb_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_open`
--

DROP TABLE IF EXISTS `tb_open`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_open` (
  `open_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '开设id',
  `course_id` varchar(10) NOT NULL COMMENT '课程id',
  `school_year` varchar(10) NOT NULL COMMENT '学年',
  `term` tinyint(1) NOT NULL COMMENT '学期',
  `people_num` int(3) NOT NULL COMMENT '开设人数',
  `start_select_time` datetime DEFAULT NULL COMMENT '开选时间',
  `end_select_time` datetime DEFAULT NULL COMMENT '结选时间',
  PRIMARY KEY (`open_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `tb_open_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `tb_course` (`course_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20170232 DEFAULT CHARSET=utf8 COMMENT='开设表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_open`
--

LOCK TABLES `tb_open` WRITE;
/*!40000 ALTER TABLE `tb_open` DISABLE KEYS */;
INSERT INTO `tb_open` VALUES (20170222,'20170222','2017',2,180,'2017-05-01 00:00:00','2017-05-30 00:00:00'),(20170223,'20170223','2017',2,180,'2017-03-30 00:00:00','2017-07-05 00:00:00'),(20170224,'20170224','2017',2,218,'2017-03-30 00:00:00','2017-07-05 00:00:00'),(20170225,'20170225','2017',2,180,'2017-03-30 00:00:00','2017-07-05 00:00:00'),(20170226,'20170226','2017',2,180,'2017-03-30 00:00:00','2017-07-05 00:00:00'),(20170227,'20170227','2017',2,180,'2017-03-30 00:00:00','2017-07-05 00:00:00'),(20170228,'20170228','2017',2,180,'2017-03-30 00:00:00','2017-07-05 00:00:00'),(20170229,'20170229','2017',2,180,'2017-03-30 00:00:00','2017-07-05 00:00:00');
/*!40000 ALTER TABLE `tb_open` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_select_course`
--

DROP TABLE IF EXISTS `tb_select_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_select_course` (
  `student_id` int(10) NOT NULL COMMENT '学生学号',
  `open_id` int(10) NOT NULL COMMENT '开设id',
  `grade` float(3,1) DEFAULT NULL COMMENT '成绩',
  `evaluate` text COMMENT '评价',
  PRIMARY KEY (`student_id`,`open_id`),
  KEY `open_id` (`open_id`),
  CONSTRAINT `tb_select_course_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `tb_student` (`student_id`),
  CONSTRAINT `tb_select_course_ibfk_2` FOREIGN KEY (`open_id`) REFERENCES `tb_open` (`open_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生选课表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_select_course`
--

LOCK TABLES `tb_select_course` WRITE;
/*!40000 ALTER TABLE `tb_select_course` DISABLE KEYS */;
INSERT INTO `tb_select_course` VALUES (2014014361,20170223,NULL,'xueshu:3,jiaoxuue:4,taidu:4,other:'),(2014014361,20170225,NULL,NULL),(2014014361,20170226,NULL,NULL),(2014014361,20170228,99.0,NULL),(2014014362,20170223,NULL,NULL),(2014014362,20170224,NULL,NULL),(2014014362,20170225,NULL,NULL),(2014014362,20170226,NULL,NULL);
/*!40000 ALTER TABLE `tb_select_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_select_subject`
--

DROP TABLE IF EXISTS `tb_select_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_select_subject` (
  `student_id` int(10) NOT NULL COMMENT '学号',
  `subject_id` int(10) NOT NULL COMMENT '题目id',
  `status` int(1) NOT NULL COMMENT '状态',
  PRIMARY KEY (`student_id`,`subject_id`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `tb_select_subject_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `tb_student` (`student_id`),
  CONSTRAINT `tb_select_subject_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `tb_arrange_subject` (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生候选表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_select_subject`
--

LOCK TABLES `tb_select_subject` WRITE;
/*!40000 ALTER TABLE `tb_select_subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_select_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_student`
--

DROP TABLE IF EXISTS `tb_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_student` (
  `student_id` int(10) NOT NULL COMMENT '学生学号',
  `student_name` varchar(50) NOT NULL COMMENT '学生姓名',
  `class_name` varchar(10) NOT NULL COMMENT '学生班级',
  `major` varchar(20) NOT NULL COMMENT '学生专业',
  `password` varchar(32) NOT NULL COMMENT '学生密码',
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_student`
--

LOCK TABLES `tb_student` WRITE;
/*!40000 ALTER TABLE `tb_student` DISABLE KEYS */;
INSERT INTO `tb_student` VALUES (2014014361,'纪小伟','计科1404','计科','123456'),(2014014362,'杨明','计科1404','计科','2014014362'),(2014014363,'杨京晖','计科1404','计科','2014014363'),(2014014364,'杨健','计科1404','计科','2014014364'),(2014014365,'杨颖明','计科1404','计科','2014014365'),(2014014366,'宋佳帅','计科1404','计科','2014014366'),(2014014367,'张永罡','计科1404','计科','2014014367'),(2014014666,'刘超凡','计科1404','计科','2b2be32c3a0352927ac78d29d018ec66'),(2014123100,'郑hh','1404','自动化','000000'),(2014123101,'钱ii','1404','自动化','000000'),(2014123102,'冯jj','1404','自动化','000000'),(2014123103,'李aa','1405','自动化','000000'),(2014123104,'张bb','1405','自动化','000000'),(2014123105,'王cc','1405','自动化','000000'),(2014123106,'赵dd','1406','自动化','000000'),(2014123107,'孙ee','1406','自动化','000000'),(2014123108,'周ff','1406','自动化','000000'),(2014123109,'吴gg','1406','自动化','000000'),(2014123110,'郑h','1404','信管','000000'),(2014123111,'钱i','1404','信管','000000'),(2014123112,'冯j','1404','信管','000000'),(2014123113,'李a','1405','信管','000000'),(2014123114,'张b','1405','信管','000000'),(2014123115,'王c','1405','信管','000000'),(2014123116,'赵d','1406','信管','000000'),(2014123117,'孙e','1406','信管','000000'),(2014123118,'周f','1406','信管','000000'),(2014123119,'吴g','1406','信管','000000'),(2014123120,'郑H','1404','计科','000000'),(2014123121,'钱I','1404','计科','000000'),(2014123122,'冯J','1404','计科','000000'),(2014123123,'李A','1405','计科','000000'),(2014123124,'张B','1405','计科','000000'),(2014123125,'王C','1405','计科','000000'),(2014123126,'赵D','1406','计科','000000'),(2014123127,'孙E','1406','计科','000000'),(2014123128,'周F','1406','计科','000000'),(2014123129,'吴G','1406','计科','000000'),(2016001001,'吴cc','1601','自动化','000000'),(2016001002,'张zz','1601','自动化','000000'),(2016001003,'周xf','1601','自动化','000000'),(2016001004,'黄vx','1602','自动化','000000'),(2016001005,'杨ww','1602','自动化','000000'),(2016001006,'刘zf','1602','自动化','000000'),(2016001007,'朱tg','1602','自动化','000000'),(2016002001,'吴Gv','1601','计科','000000'),(2016002002,'吴Gc','1601','计科','000000'),(2016002003,'吴Gz','1602','计科','000000'),(2016002004,'吴Gx','1602','计科','000000'),(2016002005,'吴Gf','1602','计科','000000'),(2016002006,'吴Ge','1603','计科','000000'),(2016002007,'吴Ge','1603','计科','000000');
/*!40000 ALTER TABLE `tb_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_target_major`
--

DROP TABLE IF EXISTS `tb_target_major`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_target_major` (
  `open_id` int(10) NOT NULL COMMENT '开设id',
  `major` varchar(20) NOT NULL COMMENT '专业',
  PRIMARY KEY (`open_id`,`major`),
  CONSTRAINT `tb_target_major_ibfk_1` FOREIGN KEY (`open_id`) REFERENCES `tb_open` (`open_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='面向专业表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_target_major`
--

LOCK TABLES `tb_target_major` WRITE;
/*!40000 ALTER TABLE `tb_target_major` DISABLE KEYS */;
INSERT INTO `tb_target_major` VALUES (20170222,'计科1404'),(20170223,'计科'),(20170224,'计科'),(20170225,'计科'),(20170226,'计科'),(20170227,'计科'),(20170228,'计科'),(20170229,'计科');
/*!40000 ALTER TABLE `tb_target_major` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_teach_course`
--

DROP TABLE IF EXISTS `tb_teach_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_teach_course` (
  `teacher_id` int(10) NOT NULL COMMENT '教师id',
  `open_id` int(10) NOT NULL COMMENT '开设id',
  PRIMARY KEY (`teacher_id`,`open_id`),
  KEY `open_id` (`open_id`),
  CONSTRAINT `tb_teach_course_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `tb_teacher` (`teacher_id`),
  CONSTRAINT `tb_teach_course_ibfk_2` FOREIGN KEY (`open_id`) REFERENCES `tb_open` (`open_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教师授课表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_teach_course`
--

LOCK TABLES `tb_teach_course` WRITE;
/*!40000 ALTER TABLE `tb_teach_course` DISABLE KEYS */;
INSERT INTO `tb_teach_course` VALUES (1999002,20170222),(1999003,20170223),(1999011,20170224),(1999015,20170225),(1999012,20170226),(1999007,20170227),(1999001,20170228),(1999010,20170229);
/*!40000 ALTER TABLE `tb_teach_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_teacher`
--

DROP TABLE IF EXISTS `tb_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_teacher` (
  `teacher_id` int(10) NOT NULL COMMENT '教师工号',
  `teacher_name` varchar(50) NOT NULL COMMENT '教师姓名',
  `title` varchar(20) NOT NULL COMMENT '教师职称',
  `password` varchar(32) NOT NULL COMMENT '教师密码',
  PRIMARY KEY (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教师表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_teacher`
--

LOCK TABLES `tb_teacher` WRITE;
/*!40000 ALTER TABLE `tb_teacher` DISABLE KEYS */;
INSERT INTO `tb_teacher` VALUES (1999001,'徐小明','副教授','123456'),(1999002,'裴颂伟','副教授','123456'),(1999003,'万静','副教授','123456'),(1999004,'卢罡','副教授','123456'),(1999005,'李瑞瑞','副教授','123456'),(1999006,'李征','副教授','123456'),(1999007,'李辉','副教授','123456'),(1999008,'魏昭','副教授','123456'),(1999009,'于洋','副教授','123456'),(1999010,'耿志强','教授','123456'),(1999011,'王璞','副教授','123456'),(1999012,'胡伟','副教授','123456'),(1999013,'刑臧菊','副教授','123456'),(1999014,'王雪琴','党委副书记','123456'),(1999015,'张杰','副教授','123456');
/*!40000 ALTER TABLE `tb_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_term`
--

DROP TABLE IF EXISTS `tb_term`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_term` (
  `school_year` varchar(10) NOT NULL COMMENT '学年',
  `term` tinyint(1) NOT NULL COMMENT '学期',
  `begin_time` datetime NOT NULL COMMENT '开学时间',
  `over_time` datetime NOT NULL COMMENT '放假时间',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='学期表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_term`
--

LOCK TABLES `tb_term` WRITE;
/*!40000 ALTER TABLE `tb_term` DISABLE KEYS */;
INSERT INTO `tb_term` VALUES ('2017',2,'2017-04-18 08:00:00','2017-05-16 08:00:00',2);
/*!40000 ALTER TABLE `tb_term` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_major_schedule`
--

DROP TABLE IF EXISTS `vw_major_schedule`;
/*!50001 DROP VIEW IF EXISTS `vw_major_schedule`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_major_schedule` AS SELECT 
 1 AS `open_id`,
 1 AS `major`,
 1 AS `id`,
 1 AS `teacher_id`,
 1 AS `classroom`,
 1 AS `class_name`,
 1 AS `day`,
 1 AS `start_week`,
 1 AS `end_week`,
 1 AS `start_time`,
 1 AS `end_time`,
 1 AS `course_id`,
 1 AS `school_year`,
 1 AS `term`,
 1 AS `people_num`,
 1 AS `start_select_time`,
 1 AS `end_select_time`,
 1 AS `course_name`,
 1 AS `credit`,
 1 AS `nature`,
 1 AS `department`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_open`
--

DROP TABLE IF EXISTS `vw_open`;
/*!50001 DROP VIEW IF EXISTS `vw_open`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_open` AS SELECT 
 1 AS `course_id`,
 1 AS `open_id`,
 1 AS `school_year`,
 1 AS `term`,
 1 AS `people_num`,
 1 AS `start_select_time`,
 1 AS `end_select_time`,
 1 AS `course_name`,
 1 AS `credit`,
 1 AS `nature`,
 1 AS `department`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_schedule`
--

DROP TABLE IF EXISTS `vw_schedule`;
/*!50001 DROP VIEW IF EXISTS `vw_schedule`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_schedule` AS SELECT 
 1 AS `open_id`,
 1 AS `id`,
 1 AS `teacher_id`,
 1 AS `classroom`,
 1 AS `class_name`,
 1 AS `day`,
 1 AS `start_week`,
 1 AS `end_week`,
 1 AS `start_time`,
 1 AS `end_time`,
 1 AS `course_id`,
 1 AS `school_year`,
 1 AS `term`,
 1 AS `people_num`,
 1 AS `start_select_time`,
 1 AS `end_select_time`,
 1 AS `course_name`,
 1 AS `credit`,
 1 AS `nature`,
 1 AS `department`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_student_schedule`
--

DROP TABLE IF EXISTS `vw_student_schedule`;
/*!50001 DROP VIEW IF EXISTS `vw_student_schedule`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_student_schedule` AS SELECT 
 1 AS `class_name`,
 1 AS `student_id`,
 1 AS `student_name`,
 1 AS `major`,
 1 AS `password`,
 1 AS `open_id`,
 1 AS `id`,
 1 AS `teacher_id`,
 1 AS `classroom`,
 1 AS `day`,
 1 AS `start_week`,
 1 AS `end_week`,
 1 AS `start_time`,
 1 AS `end_time`,
 1 AS `course_id`,
 1 AS `school_year`,
 1 AS `term`,
 1 AS `people_num`,
 1 AS `start_select_time`,
 1 AS `end_select_time`,
 1 AS `course_name`,
 1 AS `credit`,
 1 AS `nature`,
 1 AS `department`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_teacher_schedule`
--

DROP TABLE IF EXISTS `vw_teacher_schedule`;
/*!50001 DROP VIEW IF EXISTS `vw_teacher_schedule`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_teacher_schedule` AS SELECT 
 1 AS `teacher_id`,
 1 AS `teacher_name`,
 1 AS `title`,
 1 AS `password`,
 1 AS `open_id`,
 1 AS `id`,
 1 AS `classroom`,
 1 AS `class_name`,
 1 AS `day`,
 1 AS `start_week`,
 1 AS `end_week`,
 1 AS `start_time`,
 1 AS `end_time`,
 1 AS `course_id`,
 1 AS `school_year`,
 1 AS `term`,
 1 AS `people_num`,
 1 AS `start_select_time`,
 1 AS `end_select_time`,
 1 AS `course_name`,
 1 AS `credit`,
 1 AS `nature`,
 1 AS `department`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_major_schedule`
--

/*!50001 DROP VIEW IF EXISTS `vw_major_schedule`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_major_schedule` AS select `tb_target_major`.`open_id` AS `open_id`,`tb_target_major`.`major` AS `major`,`vw_schedule`.`id` AS `id`,`vw_schedule`.`teacher_id` AS `teacher_id`,`vw_schedule`.`classroom` AS `classroom`,`vw_schedule`.`class_name` AS `class_name`,`vw_schedule`.`day` AS `day`,`vw_schedule`.`start_week` AS `start_week`,`vw_schedule`.`end_week` AS `end_week`,`vw_schedule`.`start_time` AS `start_time`,`vw_schedule`.`end_time` AS `end_time`,`vw_schedule`.`course_id` AS `course_id`,`vw_schedule`.`school_year` AS `school_year`,`vw_schedule`.`term` AS `term`,`vw_schedule`.`people_num` AS `people_num`,`vw_schedule`.`start_select_time` AS `start_select_time`,`vw_schedule`.`end_select_time` AS `end_select_time`,`vw_schedule`.`course_name` AS `course_name`,`vw_schedule`.`credit` AS `credit`,`vw_schedule`.`nature` AS `nature`,`vw_schedule`.`department` AS `department` from (`tb_target_major` join `vw_schedule` on((`tb_target_major`.`open_id` = `vw_schedule`.`open_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_open`
--

/*!50001 DROP VIEW IF EXISTS `vw_open`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_open` AS select `tb_open`.`course_id` AS `course_id`,`tb_open`.`open_id` AS `open_id`,`tb_open`.`school_year` AS `school_year`,`tb_open`.`term` AS `term`,`tb_open`.`people_num` AS `people_num`,`tb_open`.`start_select_time` AS `start_select_time`,`tb_open`.`end_select_time` AS `end_select_time`,`tb_course`.`course_name` AS `course_name`,`tb_course`.`credit` AS `credit`,`tb_course`.`nature` AS `nature`,`tb_course`.`department` AS `department` from (`tb_open` join `tb_course` on((`tb_open`.`course_id` = `tb_course`.`course_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_schedule`
--

/*!50001 DROP VIEW IF EXISTS `vw_schedule`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_schedule` AS select `tb_arrangement`.`open_id` AS `open_id`,`tb_arrangement`.`id` AS `id`,`tb_arrangement`.`teacher_id` AS `teacher_id`,`tb_arrangement`.`classroom` AS `classroom`,`tb_arrangement`.`class_name` AS `class_name`,`tb_arrangement`.`day` AS `day`,`tb_arrangement`.`start_week` AS `start_week`,`tb_arrangement`.`end_week` AS `end_week`,`tb_arrangement`.`start_time` AS `start_time`,`tb_arrangement`.`end_time` AS `end_time`,`vw_open`.`course_id` AS `course_id`,`vw_open`.`school_year` AS `school_year`,`vw_open`.`term` AS `term`,`vw_open`.`people_num` AS `people_num`,`vw_open`.`start_select_time` AS `start_select_time`,`vw_open`.`end_select_time` AS `end_select_time`,`vw_open`.`course_name` AS `course_name`,`vw_open`.`credit` AS `credit`,`vw_open`.`nature` AS `nature`,`vw_open`.`department` AS `department` from (`tb_arrangement` join `vw_open` on((`tb_arrangement`.`open_id` = `vw_open`.`open_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_student_schedule`
--

/*!50001 DROP VIEW IF EXISTS `vw_student_schedule`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_student_schedule` AS select `tb_student`.`class_name` AS `class_name`,`tb_student`.`student_id` AS `student_id`,`tb_student`.`student_name` AS `student_name`,`tb_student`.`major` AS `major`,`tb_student`.`password` AS `password`,`vw_schedule`.`open_id` AS `open_id`,`vw_schedule`.`id` AS `id`,`vw_schedule`.`teacher_id` AS `teacher_id`,`vw_schedule`.`classroom` AS `classroom`,`vw_schedule`.`day` AS `day`,`vw_schedule`.`start_week` AS `start_week`,`vw_schedule`.`end_week` AS `end_week`,`vw_schedule`.`start_time` AS `start_time`,`vw_schedule`.`end_time` AS `end_time`,`vw_schedule`.`course_id` AS `course_id`,`vw_schedule`.`school_year` AS `school_year`,`vw_schedule`.`term` AS `term`,`vw_schedule`.`people_num` AS `people_num`,`vw_schedule`.`start_select_time` AS `start_select_time`,`vw_schedule`.`end_select_time` AS `end_select_time`,`vw_schedule`.`course_name` AS `course_name`,`vw_schedule`.`credit` AS `credit`,`vw_schedule`.`nature` AS `nature`,`vw_schedule`.`department` AS `department` from (`tb_student` join `vw_schedule` on((`tb_student`.`class_name` = `vw_schedule`.`class_name`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_teacher_schedule`
--

/*!50001 DROP VIEW IF EXISTS `vw_teacher_schedule`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_teacher_schedule` AS select `tb_teacher`.`teacher_id` AS `teacher_id`,`tb_teacher`.`teacher_name` AS `teacher_name`,`tb_teacher`.`title` AS `title`,`tb_teacher`.`password` AS `password`,`vw_schedule`.`open_id` AS `open_id`,`vw_schedule`.`id` AS `id`,`vw_schedule`.`classroom` AS `classroom`,`vw_schedule`.`class_name` AS `class_name`,`vw_schedule`.`day` AS `day`,`vw_schedule`.`start_week` AS `start_week`,`vw_schedule`.`end_week` AS `end_week`,`vw_schedule`.`start_time` AS `start_time`,`vw_schedule`.`end_time` AS `end_time`,`vw_schedule`.`course_id` AS `course_id`,`vw_schedule`.`school_year` AS `school_year`,`vw_schedule`.`term` AS `term`,`vw_schedule`.`people_num` AS `people_num`,`vw_schedule`.`start_select_time` AS `start_select_time`,`vw_schedule`.`end_select_time` AS `end_select_time`,`vw_schedule`.`course_name` AS `course_name`,`vw_schedule`.`credit` AS `credit`,`vw_schedule`.`nature` AS `nature`,`vw_schedule`.`department` AS `department` from (`tb_teacher` join `vw_schedule` on((`tb_teacher`.`teacher_id` = `vw_schedule`.`teacher_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-05 22:04:23
