-- Revert alexicourieux-resume-db:001-init-data from mysql

START TRANSACTION;

-- Temporarily disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Truncate tables to remove all data
TRUNCATE TABLE `EDUCATION_I18N`;
TRUNCATE TABLE `EDUCATION`;
TRUNCATE TABLE `EXPERIENCE_I18N`;
TRUNCATE TABLE `EXPERIENCE`;
TRUNCATE TABLE `SKILL_I18N`;
TRUNCATE TABLE `SKILL`;
TRUNCATE TABLE `SKILL_CATEGORY_I18N`;
TRUNCATE TABLE `SKILL_CATEGORY`;
TRUNCATE TABLE `SKILL_SKILL_CATEGORY`;
TRUNCATE TABLE `EXPERIENCE_SKILL`;

-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;

COMMIT;
