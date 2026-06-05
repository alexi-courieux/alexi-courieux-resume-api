-- Revert alexicourieux-resume-db:005-freelance-experience from mysql

START TRANSACTION;

# Remove freelance experience
DELETE FROM resume.EXPERIENCE_SKILL WHERE EXPERIENCE_ID = 'freelance';
DELETE FROM resume.EXPERIENCE_I18N WHERE EXPERIENCE_ID = 'freelance';
DELETE FROM resume.EXPERIENCE WHERE ID = 'freelance';

# Revert 'antaes' experience end date back to NULL
UPDATE resume.EXPERIENCE SET END_DATE = NULL WHERE ID = 'antaes';

COMMIT;
