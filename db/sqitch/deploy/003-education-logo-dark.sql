-- Deploy alexicourieux-resume-db:003-education-logo-dark to mysql

START TRANSACTION;

-- Add columns to EDUCATION_I18N
ALTER TABLE `EDUCATION_I18N` ADD COLUMN `IMAGE_URI_DARK` VARCHAR(255) NULL;

-- Set IMAGE_URI_DARK where necessary
UPDATE `EDUCATION_I18N`
SET `IMAGE_URI_DARK` = 'images/universite_cote_azur_dark.png';

COMMIT;
