-- Revert alexicourieux-resume-db:005-portfolio from mysql

START TRANSACTION;

DROP TABLE `PROJECT_SKILL`;
DROP TABLE `PROJECT_I18N`;
DROP TABLE `PROJECT`;

-- Skills added by this migration (SKILL_I18N and SKILL_SKILL_CATEGORY rows cascade)
DELETE FROM `SKILL` WHERE `ID` IN ('vite', 'mui', 'leaflet', 'pixijs');

COMMIT;
