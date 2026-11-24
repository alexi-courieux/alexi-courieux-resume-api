-- Revert alexicourieux-resume-db:005-portfolio from mysql

START TRANSACTION;

DROP TABLE `PROJECT_SKILL`;
DROP TABLE `PROJECT_I18N`;
DROP TABLE `PROJECT`;

COMMIT;
