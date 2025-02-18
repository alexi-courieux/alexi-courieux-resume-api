-- Deploy alexicourieux-resume-db:002-experience-logo-uri to mysql

START TRANSACTION;

-- Add columns to EXPERIENCE_I18N
ALTER TABLE `EXPERIENCE_I18N` ADD COLUMN `IMAGE_URI` VARCHAR(255) NULL;
ALTER TABLE `EXPERIENCE_I18N` ADD COLUMN `IMAGE_URI_DARK` VARCHAR(255) NULL;
ALTER TABLE `EXPERIENCE_I18N` ADD COLUMN `IMAGE_ALT` VARCHAR(255) NULL;

-- Set IMAGE_URI for each experience
UPDATE `EXPERIENCE_I18N` 
SET `IMAGE_URI` = CASE 
    WHEN `EXPERIENCE_ID` = 'csm' AND `LANGUAGE` = 'en' THEN 'images/experience-csm.svg'
    WHEN `EXPERIENCE_ID` = 'exco' AND `LANGUAGE` = 'en' THEN 'images/experience-exco.png'
    WHEN `EXPERIENCE_ID` = 'flo' AND `LANGUAGE` = 'en' THEN 'images/experience-flo.svg'
    WHEN `EXPERIENCE_ID` = 'koedia' AND `LANGUAGE` = 'en' THEN 'images/experience-koedia.png'
    WHEN `EXPERIENCE_ID` = 'nbc' AND `LANGUAGE` = 'en' THEN 'images/en/experience-nbc.svg'
    WHEN `EXPERIENCE_ID` = 'nbc' AND `LANGUAGE` = 'fr' THEN 'images/fr/experience-nbc.svg'
    ELSE NULL
END;

-- Set IMAGE_URI to the one from the 'en' language if it is NULL
UPDATE `EXPERIENCE_I18N` ei
JOIN `EXPERIENCE_I18N` ei_en ON ei.`EXPERIENCE_ID` = ei_en.`EXPERIENCE_ID` AND ei_en.`LANGUAGE` = 'en'
SET ei.`IMAGE_URI` = ei_en.`IMAGE_URI`
WHERE ei.`IMAGE_URI` IS NULL AND ei.`LANGUAGE` != 'en';

-- Set IMAGE_ALT for each experience
UPDATE `EXPERIENCE_I18N`
SET `IMAGE_ALT` = CASE
    WHEN `EXPERIENCE_ID` = 'csm' AND `LANGUAGE` = 'en' THEN 'Caisse Sociales de Monaco logo'
    WHEN `EXPERIENCE_ID` = 'exco' AND `LANGUAGE` = 'en' THEN 'Exco FSE logo'
    WHEN `EXPERIENCE_ID` = 'flo' AND `LANGUAGE` = 'en' THEN 'Flo logo'
    WHEN `EXPERIENCE_ID` = 'koedia' AND `LANGUAGE` = 'en' THEN 'Koedia logo'
    WHEN `EXPERIENCE_ID` = 'nbc' AND `LANGUAGE` = 'en' THEN 'National Bank of Canada logo'
    WHEN `EXPERIENCE_ID` = 'csm' AND `LANGUAGE` = 'fr' THEN 'Logo Caisse Sociales de Monaco'
    WHEN `EXPERIENCE_ID` = 'exco' AND `LANGUAGE` = 'fr' THEN 'Logo Exco FSE'
    WHEN `EXPERIENCE_ID` = 'flo' AND `LANGUAGE` = 'fr' THEN 'Logo Flo'
    WHEN `EXPERIENCE_ID` = 'koedia' AND `LANGUAGE` = 'fr' THEN 'Logo Koedia'
    WHEN `EXPERIENCE_ID` = 'nbc' AND `LANGUAGE` = 'fr' THEN 'Logo Banque Nationale du Canada'
    ELSE NULL
END;

ALTER TABLE `EXPERIENCE_I18N` MODIFY COLUMN `IMAGE_URI` VARCHAR(255) NOT NULL;
ALTER TABLE `EXPERIENCE_I18N` MODIFY COLUMN `IMAGE_ALT` VARCHAR(255) NOT NULL;

COMMIT;