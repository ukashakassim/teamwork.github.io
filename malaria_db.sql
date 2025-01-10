-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 09, 2025 at 09:59 AM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `malaria_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `epidemiological_data`
--

DROP TABLE IF EXISTS `epidemiological_data`;
CREATE TABLE IF NOT EXISTS `epidemiological_data` (
  `Data_ID` int NOT NULL,
  `Location_ID` int DEFAULT NULL,
  `Recorded_Date` date DEFAULT NULL,
  `Cases_Per_Thousand_People` int DEFAULT NULL,
  `Rainfall` int DEFAULT NULL,
  `Average_Temperature` decimal(5,2) DEFAULT NULL,
  `Update_Date` date DEFAULT NULL,
  `Added_By` int DEFAULT NULL,
  PRIMARY KEY (`Data_ID`),
  KEY `Location_ID` (`Location_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `facility_type`
--

DROP TABLE IF EXISTS `facility_type`;
CREATE TABLE IF NOT EXISTS `facility_type` (
  `Facility_Type_ID` int NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Description` text,
  `Date_Added` date DEFAULT NULL,
  `Date_Updated` date DEFAULT NULL,
  PRIMARY KEY (`Facility_Type_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `geographical_location`
--

DROP TABLE IF EXISTS `geographical_location`;
CREATE TABLE IF NOT EXISTS `geographical_location` (
  `Location_ID` int NOT NULL,
  `Village` varchar(100) DEFAULT NULL,
  `Parish` varchar(100) DEFAULT NULL,
  `Sub_County` varchar(100) DEFAULT NULL,
  `County` varchar(100) DEFAULT NULL,
  `Region` varchar(50) DEFAULT NULL,
  `Population` int DEFAULT NULL,
  `Coordinates` varchar(100) DEFAULT NULL,
  `Malaria_Risk_Level` varchar(50) DEFAULT NULL,
  `Health_Facilities_Count` int DEFAULT NULL,
  `ITN_Coverage` decimal(5,2) DEFAULT NULL,
  `Recorded_Cases` int DEFAULT NULL,
  PRIMARY KEY (`Location_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `health_facility`
--

DROP TABLE IF EXISTS `health_facility`;
CREATE TABLE IF NOT EXISTS `health_facility` (
  `Facility_ID` int NOT NULL,
  `Facility_Name` varchar(100) DEFAULT NULL,
  `Location_ID` int DEFAULT NULL,
  `Facility_Type` int DEFAULT NULL,
  `Capacity` int DEFAULT NULL,
  `Contact_Details` varchar(100) DEFAULT NULL,
  `Date_Added` date DEFAULT NULL,
  `Facility_Head` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Facility_ID`),
  KEY `Location_ID` (`Location_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `interventions`
--

DROP TABLE IF EXISTS `interventions`;
CREATE TABLE IF NOT EXISTS `interventions` (
  `Intervention_ID` int NOT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `Location_ID` int DEFAULT NULL,
  `Start_Date` date DEFAULT NULL,
  `End_Date` date DEFAULT NULL,
  `Outcome` varchar(50) DEFAULT NULL,
  `Date_Added` date DEFAULT NULL,
  `Update_Date` date DEFAULT NULL,
  PRIMARY KEY (`Intervention_ID`),
  KEY `Location_ID` (`Location_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `laboratory_tests`
--

DROP TABLE IF EXISTS `laboratory_tests`;
CREATE TABLE IF NOT EXISTS `laboratory_tests` (
  `Test_ID` int NOT NULL,
  `Case_ID` int DEFAULT NULL,
  `Test_Type` varchar(50) DEFAULT NULL,
  `Test_Date` date DEFAULT NULL,
  `Test_Result` varchar(50) DEFAULT NULL,
  `Technician_ID` int DEFAULT NULL,
  `Date_Added` date DEFAULT NULL,
  `Added_By` int DEFAULT NULL,
  `Update_Date` date DEFAULT NULL,
  PRIMARY KEY (`Test_ID`),
  KEY `Case_ID` (`Case_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `malaria_cases`
--

DROP TABLE IF EXISTS `malaria_cases`;
CREATE TABLE IF NOT EXISTS `malaria_cases` (
  `Case_ID` int NOT NULL,
  `Facility_ID` int DEFAULT NULL,
  `Type_of_Malaria` varchar(50) DEFAULT NULL,
  `Treatment_ID` int DEFAULT NULL,
  `Outcome_ID` int DEFAULT NULL,
  PRIMARY KEY (`Case_ID`),
  KEY `Facility_ID` (`Facility_ID`),
  KEY `Treatment_ID` (`Treatment_ID`),
  KEY `Outcome_ID` (`Outcome_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `malaria_type`
--

DROP TABLE IF EXISTS `malaria_type`;
CREATE TABLE IF NOT EXISTS `malaria_type` (
  `Type_ID` int NOT NULL,
  `Type_Name` varchar(50) DEFAULT NULL,
  `Description` text,
  `Date_Added` date DEFAULT NULL,
  `Added_By` int DEFAULT NULL,
  `Date_Updated` date DEFAULT NULL,
  PRIMARY KEY (`Type_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patient_data`
--

DROP TABLE IF EXISTS `patient_data`;
CREATE TABLE IF NOT EXISTS `patient_data` (
  `Patient_ID` int NOT NULL,
  `First_Name` varchar(50) DEFAULT NULL,
  `Last_Name` varchar(50) DEFAULT NULL,
  `Date_of_Birth` date DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `Phone_Number` varchar(15) DEFAULT NULL,
  `Next_of_Kin` varchar(100) DEFAULT NULL,
  `Location_ID` int DEFAULT NULL,
  `Date_Added` date DEFAULT NULL,
  `Update_Date` date DEFAULT NULL,
  PRIMARY KEY (`Patient_ID`),
  KEY `Location_ID` (`Location_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `referral`
--

DROP TABLE IF EXISTS `referral`;
CREATE TABLE IF NOT EXISTS `referral` (
  `Referral_ID` int NOT NULL,
  `Case_ID` int DEFAULT NULL,
  `Referred_From` int DEFAULT NULL,
  `Referred_To` int DEFAULT NULL,
  `Referral_Date` date DEFAULT NULL,
  `Reason` text,
  `Outcome_ID` int DEFAULT NULL,
  `Update_Date` date DEFAULT NULL,
  `Referred_By` int DEFAULT NULL,
  PRIMARY KEY (`Referral_ID`),
  KEY `Case_ID` (`Case_ID`),
  KEY `Outcome_ID` (`Outcome_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resource`
--

DROP TABLE IF EXISTS `resource`;
CREATE TABLE IF NOT EXISTS `resource` (
  `Resource_ID` int NOT NULL,
  `Facility_ID` int DEFAULT NULL,
  `Resource_Type` varchar(50) DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `Last_Updated_Date` date DEFAULT NULL,
  `Description` text,
  `Date_Added` date DEFAULT NULL,
  `Update_Date` date DEFAULT NULL,
  PRIMARY KEY (`Resource_ID`),
  KEY `Facility_ID` (`Facility_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `Role_ID` int NOT NULL,
  `Role_Name` varchar(50) DEFAULT NULL,
  `Role_Description` text,
  `Date_Added` date DEFAULT NULL,
  `Update_Date` date DEFAULT NULL,
  PRIMARY KEY (`Role_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supply_chain`
--

DROP TABLE IF EXISTS `supply_chain`;
CREATE TABLE IF NOT EXISTS `supply_chain` (
  `Supply_ID` int NOT NULL,
  `Resource_ID` int DEFAULT NULL,
  `Facility_ID` int DEFAULT NULL,
  `Quantity_Shipped` int DEFAULT NULL,
  `Shipment_Date` date DEFAULT NULL,
  `Expected_Arrival_Date` date DEFAULT NULL,
  `Shipped_By` int DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `Update_Date` date DEFAULT NULL,
  PRIMARY KEY (`Supply_ID`),
  KEY `Resource_ID` (`Resource_ID`),
  KEY `Facility_ID` (`Facility_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_log`
--

DROP TABLE IF EXISTS `system_log`;
CREATE TABLE IF NOT EXISTS `system_log` (
  `Log_ID` int NOT NULL,
  `User_ID` int DEFAULT NULL,
  `Activity` text,
  `Timestamp` datetime DEFAULT NULL,
  `IP_Address` varchar(100) DEFAULT NULL,
  `Location` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Log_ID`),
  KEY `User_ID` (`User_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `training`
--

DROP TABLE IF EXISTS `training`;
CREATE TABLE IF NOT EXISTS `training` (
  `Training_ID` int NOT NULL,
  `User_ID` int DEFAULT NULL,
  `Training_Type` varchar(100) DEFAULT NULL,
  `Training_Date` date DEFAULT NULL,
  `Completion_Status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Training_ID`),
  KEY `User_ID` (`User_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `treatment`
--

DROP TABLE IF EXISTS `treatment`;
CREATE TABLE IF NOT EXISTS `treatment` (
  `Treatment_ID` int NOT NULL,
  `Treatment_Name` varchar(50) DEFAULT NULL,
  `Treatment_Description` text,
  `Dosage` varchar(50) DEFAULT NULL,
  `Side_Effects` text,
  `Date_Added` date DEFAULT NULL,
  `Update_Date` date DEFAULT NULL,
  PRIMARY KEY (`Treatment_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `treatment_outcomes`
--

DROP TABLE IF EXISTS `treatment_outcomes`;
CREATE TABLE IF NOT EXISTS `treatment_outcomes` (
  `Outcome_ID` int NOT NULL,
  `Outcome_Name` varchar(50) DEFAULT NULL,
  `Outcome_Description` text,
  `Date_Added` date DEFAULT NULL,
  `Added_By` int DEFAULT NULL,
  `Update_Date` date DEFAULT NULL,
  PRIMARY KEY (`Outcome_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `User_ID` int NOT NULL,
  `First_Name` varchar(50) DEFAULT NULL,
  `Last_Name` varchar(50) DEFAULT NULL,
  `Preferred_Name` varchar(50) DEFAULT NULL,
  `Role_ID` int DEFAULT NULL,
  `Username` varchar(50) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `Facility_ID` int DEFAULT NULL,
  PRIMARY KEY (`User_ID`),
  KEY `Role_ID` (`Role_ID`),
  KEY `Facility_ID` (`Facility_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visit_records`
--

DROP TABLE IF EXISTS `visit_records`;
CREATE TABLE IF NOT EXISTS `visit_records` (
  `Visit_ID` int NOT NULL,
  `Patient_ID` int DEFAULT NULL,
  `Visit_Number` int DEFAULT NULL,
  `Visit_Date` date DEFAULT NULL,
  `Date_Added` date DEFAULT NULL,
  `Update_Date` date DEFAULT NULL,
  `Facility_ID` int DEFAULT NULL,
  PRIMARY KEY (`Visit_ID`),
  KEY `Patient_ID` (`Patient_ID`),
  KEY `Facility_ID` (`Facility_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
