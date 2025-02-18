-- Verify alexicourieux-resume-db:003-education-logo-dark on mysql

START TRANSACTION;

-- Verify resume.EDUCATION_I18N
SELECT 1 FROM `EDUCATION_I18N` WHERE `IMAGE_URI_DARK` is NOT NULL LIMIT 1;

ROLLBACK;
