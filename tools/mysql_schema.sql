CREATE DATABASE IF NOT EXISTS `test` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `test`;

CREATE TABLE IF NOT EXISTS `info_A` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `cycle_id` VARCHAR(80) NOT NULL,
  `Time` DATETIME(6) NOT NULL,
  `Serial No.` VARCHAR(80) NOT NULL,
  `2D Code` VARCHAR(255) NOT NULL,
  `1 Pressure` DECIMAL(18,6) NULL,
  `1 Pressure Unit` VARCHAR(32) NOT NULL DEFAULT '',
  `1 Leakage` DECIMAL(18,6) NULL,
  `1 Leakage Unit` VARCHAR(32) NOT NULL DEFAULT '',
  `2 Pressure` DECIMAL(18,6) NULL,
  `2 Pressure Unit` VARCHAR(32) NOT NULL DEFAULT '',
  `2 Leakage` DECIMAL(18,6) NULL,
  `2 Leakage Unit` VARCHAR(32) NOT NULL DEFAULT '',
  `Result` VARCHAR(16) NOT NULL,
  `Part No.` VARCHAR(80) NOT NULL,
  `Person` VARCHAR(80) NOT NULL,
  `labeled` TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_info_A_cycle_id` (`cycle_id`),
  KEY `idx_info_A_time` (`Time`),
  KEY `idx_info_A_qr` (`2D Code`),
  KEY `idx_info_A_serial` (`Serial No.`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `info_B` LIKE `info_A`;
ALTER TABLE `info_B` RENAME INDEX `uq_info_A_cycle_id` TO `uq_info_B_cycle_id`;
ALTER TABLE `info_B` RENAME INDEX `idx_info_A_time` TO `idx_info_B_time`;
ALTER TABLE `info_B` RENAME INDEX `idx_info_A_qr` TO `idx_info_B_qr`;
ALTER TABLE `info_B` RENAME INDEX `idx_info_A_serial` TO `idx_info_B_serial`;
