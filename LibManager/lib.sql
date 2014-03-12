;CREATE  TABLE IF NOT EXISTS `lib`.`admin` (  `id` INT NOT NULL ,  `user` VARCHAR(45) NOT NULL ,  `passwd` VARCHAR(45) NULL ,  PRIMARY KEY (`id`) );

;CREATE  TABLE IF NOT EXISTS `lib`.`books` (  `id` INT NOT NULL ,  `title` VARCHAR(45) NOT NULL ,  `author` VARCHAR(45) NOT NULL ,  `state` BIT NULL DEFAULT 1 ,  PRIMARY KEY (`id`) );