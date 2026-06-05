-- Verify alexicourieux-resume-db:005-freelance-experience on mysql

START TRANSACTION;

# Verify that freelance experience exists
SELECT ID, START_DATE, END_DATE FROM resume.EXPERIENCE WHERE ID = 'freelance';

# Verify that antaes experience has an end date
SELECT ID, START_DATE, END_DATE FROM resume.EXPERIENCE WHERE ID = 'antaes' AND END_DATE = '2026-01-31';

# Verify that freelance experience has i18n entries
SELECT EXPERIENCE_ID, LANGUAGE FROM resume.EXPERIENCE_I18N WHERE EXPERIENCE_ID = 'freelance';

# Verify that freelance experience has skills
SELECT EXPERIENCE_ID FROM resume.EXPERIENCE_SKILL WHERE EXPERIENCE_ID = 'freelance';

ROLLBACK;
