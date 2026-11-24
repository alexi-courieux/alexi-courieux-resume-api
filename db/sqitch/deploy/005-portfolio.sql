-- Deploy alexicourieux-resume-db:005-portfolio to mysql

START TRANSACTION;

CREATE TABLE `PROJECT` (
  `ID` varchar(100) NOT NULL,
  `LINK_URL` varchar(255) DEFAULT NULL,
  `REPOSITORY_URL` varchar(255) DEFAULT NULL,
  `PROJECT_DATE` date NOT NULL,
  `DISPLAY_ORDER` int NOT NULL DEFAULT 0,
  `FEATURED` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `PROJECT_I18N` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `PROJECT_ID` varchar(100) NOT NULL,
  `LANGUAGE` varchar(2) NOT NULL DEFAULT 'EN',
  `TITLE` varchar(100) NOT NULL,
  `SHORT_DESCRIPTION` varchar(255) NOT NULL,
  `DESCRIPTION` text NOT NULL,
  `LINK_LABEL` varchar(50) DEFAULT NULL,
  `THUMBNAIL_URI` varchar(255) NOT NULL,
  `THUMBNAIL_ALT` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PROJECT_I18N_UNIQUE` (`PROJECT_ID`,`LANGUAGE`),
  CONSTRAINT `PROJECT_I18N_PROJECT_fk` FOREIGN KEY (`PROJECT_ID`) REFERENCES `PROJECT` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- SKILL_ID is latin1 to match SKILL.ID (foreign keys require identical charsets)
CREATE TABLE `PROJECT_SKILL` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `PROJECT_ID` varchar(100) NOT NULL,
  `SKILL_ID` varchar(100) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PROJECT_SKILL_UNIQUE` (`PROJECT_ID`,`SKILL_ID`),
  KEY `PROJECT_SKILL_SKILL_fk` (`SKILL_ID`),
  CONSTRAINT `PROJECT_SKILL_PROJECT_fk` FOREIGN KEY (`PROJECT_ID`) REFERENCES `PROJECT` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PROJECT_SKILL_SKILL_fk` FOREIGN KEY (`SKILL_ID`) REFERENCES `SKILL` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `PROJECT` (`ID`, `LINK_URL`, `REPOSITORY_URL`, `PROJECT_DATE`, `DISPLAY_ORDER`, `FEATURED`) VALUES
('skymap', 'https://skymap.alexicourieux.com', 'https://github.com/alexi-courieux/sky-live-traffic', '2026-11-24', 1, 0);

INSERT INTO `PROJECT_I18N` (`PROJECT_ID`, `LANGUAGE`, `TITLE`, `SHORT_DESCRIPTION`, `DESCRIPTION`, `LINK_LABEL`, `THUMBNAIL_URI`, `THUMBNAIL_ALT`) VALUES
('skymap', 'EN', 'Sky Map', 'A live map of the sky with real-time flight tracking.', 'Sky Map is a web application that provides a live map of the sky, allowing users to track flights in real-time. It offers detailed information about each flight, including its current position, altitude, speed, and more.', 'Visit Sky Map', '/images/portfolio/skypmap-thumbnail.png', 'Sky Map Thumbnail'),
('skymap', 'FR', 'Sky Map', 'Une carte en direct du ciel avec suivi des vols en temps réel.', 'Carte du Ciel est une application web qui fournit une carte en direct du ciel, permettant aux utilisateurs de suivre les vols en temps réel. Elle offre des informations détaillées sur chaque vol, y compris sa position actuelle, son altitude, sa vitesse et plus encore.', 'Visiter Sky Map', '/images/portfolio/skymap-thumbnail.png', 'Vignette de Sky Map');

-- Skills used by the projects but not yet in the catalog ('typescript' and 'react' already exist, with a category)
INSERT INTO `SKILL` (`ID`) VALUES
('vite'),
('mui'),
('leaflet'),
('pixijs');

INSERT INTO `SKILL_I18N` (`SKILL_ID`, `LANGUAGE`, `NAME`) VALUES
('vite', 'EN', 'Vite'),
('vite', 'FR', 'Vite'),
('mui', 'EN', 'MUI'),
('mui', 'FR', 'MUI'),
('leaflet', 'EN', 'Leaflet'),
('leaflet', 'FR', 'Leaflet'),
('pixijs', 'EN', 'PixiJS'),
('pixijs', 'FR', 'PixiJS');

INSERT INTO `SKILL_SKILL_CATEGORY` (`SKILL_ID`, `SKILL_CATEGORY_ID`) VALUES
('vite', 'frontend'),
('mui', 'frontend'),
('leaflet', 'frontend'),
('pixijs', 'frontend');

INSERT INTO `PROJECT_SKILL` (`PROJECT_ID`, `SKILL_ID`) VALUES
('skymap', 'typescript'),
('skymap', 'react'),
('skymap', 'vite'),
('skymap', 'mui'),
('skymap', 'leaflet'),
('skymap', 'pixijs');

COMMIT;
