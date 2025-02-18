-- Revert alexicourieux-resume-db:003-education-logo-dark from mysql

START TRANSACTION;

-- Drop columns from EDUCATION_I18N
ALTER TABLE `EDUCATION_I18N` DROP COLUMN `IMAGE_URI_DARK`;
COMMIT;
