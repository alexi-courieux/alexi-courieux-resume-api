-- Verify alexicourieux-resume-db:004-experience-update on mysql

START TRANSACTION;

-- Verify new skills exist (will fail if count is wrong - division by zero)
SELECT 1/(COUNT(*) = 6) FROM resume.SKILL WHERE ID IN 
    ('tomcat', 'magnolia', 'wiremock', 'rest', 'maven', 'activeMQ');

-- Verify skill translations exist (will fail if count is wrong)
SELECT 1/(COUNT(*) = 12) FROM resume.SKILL_I18N WHERE SKILL_ID IN 
    ('tomcat', 'magnolia', 'wiremock', 'rest', 'maven', 'activeMQ');

-- Verify skill categories exist (will fail if count is wrong)
SELECT 1/(COUNT(*) = 8) FROM resume.SKILL_SKILL_CATEGORY WHERE SKILL_ID IN 
    ('tomcat', 'magnolia', 'wiremock', 'rest', 'maven', 'activeMQ');

-- Verify new experience 'antaes' exists
SELECT ID FROM resume.EXPERIENCE WHERE ID = 'antaes';

-- Verify 'flo' end date was updated
SELECT ID FROM resume.EXPERIENCE WHERE ID = 'flo' AND END_DATE = '2025-06-01';

-- Verify experience translations for 'antaes' exist (will fail if count is wrong)
SELECT 1/(COUNT(*) = 2) FROM resume.EXPERIENCE_I18N WHERE EXPERIENCE_ID = 'antaes';

-- Verify experience skills for 'antaes' exist (will fail if count is wrong)
SELECT 1/(COUNT(*) = 24) FROM resume.EXPERIENCE_SKILL WHERE EXPERIENCE_ID = 'antaes';

-- Verify experience skills for 'csm' were added (will fail if count is wrong)
SELECT 1/(COUNT(*) = 3) FROM resume.EXPERIENCE_SKILL 
WHERE EXPERIENCE_ID = 'csm' AND SKILL_ID IN ('tomcat', 'maven', 'activeMQ');

-- Verify experience skill for 'flo' was added
SELECT EXPERIENCE_ID FROM resume.EXPERIENCE_SKILL 
WHERE EXPERIENCE_ID = 'flo' AND SKILL_ID = 'rest';

ROLLBACK;