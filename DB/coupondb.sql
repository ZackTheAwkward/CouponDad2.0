-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema coupondb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `coupondb` ;

-- -----------------------------------------------------
-- Schema coupondb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `coupondb` DEFAULT CHARACTER SET utf8 ;
USE `coupondb` ;

-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(500) NULL,
  `city` VARCHAR(100) NULL,
  `state` VARCHAR(2) NULL,
  `zip_code` VARCHAR(100) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `address_id` INT NOT NULL,
  `username` VARCHAR(100) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `active` TINYINT NULL DEFAULT 1,
  `first_name` VARCHAR(100) NULL,
  `last_name` VARCHAR(100) NULL,
  `email` VARCHAR(1000) NOT NULL,
  `image_url` VARCHAR(5000) NULL,
  `role` VARCHAR(100) NULL,
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  INDEX `fk_user_address1_idx` (`address_id` ASC),
  CONSTRAINT `fk_user_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `topic`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `topic` ;

CREATE TABLE IF NOT EXISTS `topic` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `description` TEXT NULL,
  `image_url` VARCHAR(5000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `post`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `post` ;

CREATE TABLE IF NOT EXISTS `post` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `topic_id` INT NOT NULL,
  `title` VARCHAR(100) NOT NULL,
  `content` TEXT NOT NULL,
  `image_url` VARCHAR(5000) NULL,
  `active` TINYINT NOT NULL DEFAULT 1,
  `create_date` DATETIME NOT NULL,
  `update_date` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_post_user1_idx` (`user_id` ASC),
  INDEX `fk_post_topic1_idx` (`topic_id` ASC),
  CONSTRAINT `fk_post_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_post_topic1`
    FOREIGN KEY (`topic_id`)
    REFERENCES `topic` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comment` ;

CREATE TABLE IF NOT EXISTS `comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `post_id` INT NOT NULL,
  `in_reply_to` INT NULL,
  `content` TEXT NOT NULL,
  `create_date` DATETIME NOT NULL,
  `active` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  INDEX `fk_comment_post1_idx` (`post_id` ASC),
  INDEX `fk_comment_comment1_idx` (`in_reply_to` ASC),
  INDEX `fk_comment_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_comment_post1`
    FOREIGN KEY (`post_id`)
    REFERENCES `post` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_comment1`
    FOREIGN KEY (`in_reply_to`)
    REFERENCES `comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coupons`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `coupons` ;

CREATE TABLE IF NOT EXISTS `coupons` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `title` VARCHAR(500) NOT NULL,
  `description` TEXT NULL,
  `create_date` DATETIME NOT NULL,
  `update_date` DATETIME NULL,
  `expiration_date` DATETIME NOT NULL,
  `rating` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_coupons_user_idx` (`user_id` ASC),
  CONSTRAINT `fk_coupons_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `category` ;

CREATE TABLE IF NOT EXISTS `category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `store`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `store` ;

CREATE TABLE IF NOT EXISTS `store` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `address_id` INT NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `image_url` VARCHAR(5000) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_store_address1_idx` (`address_id` ASC),
  CONSTRAINT `fk_store_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coupons_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `coupons_category` ;

CREATE TABLE IF NOT EXISTS `coupons_category` (
  `coupons_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`coupons_id`, `category_id`),
  INDEX `fk_coupons_has_category_category1_idx` (`category_id` ASC),
  INDEX `fk_coupons_has_category_coupons1_idx` (`coupons_id` ASC),
  CONSTRAINT `fk_coupons_has_category_coupons1`
    FOREIGN KEY (`coupons_id`)
    REFERENCES `coupons` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_coupons_has_category_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS coupon;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'coupon' IDENTIFIED BY 'coupon';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'coupon';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `coupondb`;
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip_code`) VALUES (1, '1234 Fake Street', 'Fake ', 'CO', '80503');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `coupondb`;
INSERT INTO `user` (`id`, `address_id`, `username`, `password`, `active`, `first_name`, `last_name`, `email`, `image_url`, `role`) VALUES (1, 1, 'ZackTheAwkward', 'Drp3pp3r$', 1, 'Zack', 'Gaddy', 'zack.e.gaddy@gmail.com', 'https://media-exp2.licdn.com/dms/image/D5635AQH9eugr8aVsjw/profile-framedphoto-shrink_400_400/0/1654789494528?e=1655751600&v=beta&t=Euv2j5SPlfJ_YbyD-MmMz9w1K7_ME5jqHYfLbVJJsUE', 'ADMIN');

COMMIT;


-- -----------------------------------------------------
-- Data for table `topic`
-- -----------------------------------------------------
START TRANSACTION;
USE `coupondb`;
INSERT INTO `topic` (`id`, `name`, `description`, `image_url`) VALUES (1, 'Grocery', 'Coupon to save on groceries', 'https://media-cldnry.s-nbcnews.com/image/upload/t_fit-760w,f_auto,q_auto:best/newscms/2017_30/2053951/170627-better-grocery-store-man-carrying-produce-se-539p.jpg');

COMMIT;


-- -----------------------------------------------------
-- Data for table `post`
-- -----------------------------------------------------
START TRANSACTION;
USE `coupondb`;
INSERT INTO `post` (`id`, `user_id`, `topic_id`, `title`, `content`, `image_url`, `active`, `create_date`, `update_date`) VALUES (1, 1, 1, 'Test', 'Test', 'Test', 1, '2022-06-28', '2022-06-29');

COMMIT;


-- -----------------------------------------------------
-- Data for table `coupons`
-- -----------------------------------------------------
START TRANSACTION;
USE `coupondb`;
INSERT INTO `coupons` (`id`, `user_id`, `title`, `description`, `create_date`, `update_date`, `expiration_date`, `rating`) VALUES (1, 1, 'Test', 'Test', '2022-06-13', NULL, '2022-06-15', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `category`
-- -----------------------------------------------------
START TRANSACTION;
USE `coupondb`;
INSERT INTO `category` (`id`, `name`) VALUES (1, 'Food');

COMMIT;


-- -----------------------------------------------------
-- Data for table `store`
-- -----------------------------------------------------
START TRANSACTION;
USE `coupondb`;
INSERT INTO `store` (`id`, `address_id`, `name`, `image_url`) VALUES (1, 1, 'Target', 'https://assets.targetimg1.com/webui/store-locator/targetlogo-6.jpeg');

COMMIT;


-- -----------------------------------------------------
-- Data for table `coupons_category`
-- -----------------------------------------------------
START TRANSACTION;
USE `coupondb`;
INSERT INTO `coupons_category` (`coupons_id`, `category_id`) VALUES (1, 1);

COMMIT;

