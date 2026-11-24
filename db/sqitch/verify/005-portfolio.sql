-- Verify alexicourieux-resume-db:005-portfolio on mysql

START TRANSACTION;

-- Fails (division by zero) if one of the three tables is missing
SELECT 1/(COUNT(*) = 3) FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME IN ('PROJECT', 'PROJECT_I18N', 'PROJECT_SKILL');

SELECT ID, LINK_URL, REPOSITORY_URL, PROJECT_DATE, DISPLAY_ORDER, FEATURED FROM `PROJECT` WHERE 1 = 0;
SELECT ID, PROJECT_ID, `LANGUAGE`, TITLE, SHORT_DESCRIPTION, DESCRIPTION, LINK_LABEL, THUMBNAIL_URI, THUMBNAIL_ALT FROM `PROJECT_I18N` WHERE 1 = 0;
SELECT ID, PROJECT_ID, SKILL_ID FROM `PROJECT_SKILL` WHERE 1 = 0;

-- Seed data: the 'skymap' project exists with its EN and FR translations and 6 skills (fails if counts are wrong)
SELECT 1/(COUNT(*) = 1) FROM `PROJECT` WHERE ID = 'skymap';
SELECT 1/(COUNT(*) = 2) FROM `PROJECT_I18N` WHERE PROJECT_ID = 'skymap' AND `LANGUAGE` IN ('EN', 'FR');
SELECT 1/(COUNT(*) = 6) FROM `PROJECT_SKILL` WHERE PROJECT_ID = 'skymap';

-- The 4 new skills exist, with a name in both languages and the frontend category
SELECT 1/(COUNT(*) = 4) FROM `SKILL` WHERE ID IN ('vite', 'mui', 'leaflet', 'pixijs');
SELECT 1/(COUNT(*) = 8) FROM `SKILL_I18N` WHERE SKILL_ID IN ('vite', 'mui', 'leaflet', 'pixijs');
SELECT 1/(COUNT(*) = 4) FROM `SKILL_SKILL_CATEGORY`
WHERE SKILL_ID IN ('vite', 'mui', 'leaflet', 'pixijs') AND SKILL_CATEGORY_ID = 'frontend';

-- Every skill used by a project exists, has a name in both languages and a category (fails if not)
SELECT 1/(COUNT(*) = 0) FROM `PROJECT_SKILL` ps
WHERE NOT EXISTS (SELECT 1 FROM `SKILL` s WHERE s.ID = ps.SKILL_ID)
   OR (SELECT COUNT(*) FROM `SKILL_I18N` si WHERE si.SKILL_ID = ps.SKILL_ID AND si.`LANGUAGE` IN ('EN', 'FR')) < 2
   OR NOT EXISTS (SELECT 1 FROM `SKILL_SKILL_CATEGORY` ssc WHERE ssc.SKILL_ID = ps.SKILL_ID);

ROLLBACK;
