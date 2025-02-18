-- Verify alexicourieux-resume-db:002-experience-logo-uri on mysql

START TRANSACTION;

-- Check that the columns exist
SELECT CASE 
    WHEN (SELECT COUNT(*) 
          FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_NAME = 'EXPERIENCE_I18N' 
          AND COLUMN_NAME IN ('IMAGE_URI', 'IMAGE_URI_DARK', 'IMAGE_ALT')) < 3 THEN
        'One or more columns (IMAGE_URI, IMAGE_URI_DARK, IMAGE_ALT) do not exist'
    ELSE
        NULL
END AS error_message;

-- Check that IMAGE_URI is not NULL
SELECT CASE 
    WHEN (SELECT COUNT(*) 
          FROM `EXPERIENCE_I18N` 
          WHERE `IMAGE_URI` IS NULL) > 0 THEN
        'Some rows have a NULL IMAGE_URI'
    ELSE
        NULL
END AS error_message;

-- Check that IMAGE_ALT is not NULL
SELECT CASE 
    WHEN (SELECT COUNT(*) 
          FROM `EXPERIENCE_I18N` 
          WHERE `IMAGE_ALT` IS NULL) > 0 THEN
        'Some rows have a NULL IMAGE_ALT'
    ELSE
        NULL
END AS error_message;

-- Check that IMAGE_URI for non-'en' languages is set to the one from the 'en' language if it was NULL
SELECT CASE 
    WHEN (SELECT COUNT(*) 
          FROM `EXPERIENCE_I18N` ei
          LEFT JOIN `EXPERIENCE_I18N` ei_en 
          ON ei.`EXPERIENCE_ID` = ei_en.`EXPERIENCE_ID` 
          AND ei_en.`LANGUAGE` = 'en'
          WHERE ei.`LANGUAGE` != 'en' 
          AND ei.`IMAGE_URI` IS NOT NULL 
          AND ei.`IMAGE_URI` != ei_en.`IMAGE_URI`) > 0 THEN
        'Some rows have mismatched IMAGE_URI for non-en languages'
    ELSE
        NULL
END AS error_message;

-- Check that IMAGE_ALT values are set
SELECT CASE 
    WHEN (SELECT COUNT(*) 
          FROM `EXPERIENCE_I18N`
          WHERE `IMAGE_ALT` IS NULL
          OR `IMAGE_ALT` NOT IN (
              'Caisse Sociales de Monaco logo',
              'Exco FSE logo',
              'Flo logo',
              'Koedia logo',
              'National Bank of Canada logo',
              'Logo Caisse Sociales de Monaco',
              'Logo Exco FSE',
              'Logo Flo',
              'Logo Koedia',
              'Logo Banque Nationale du Canada')) > 0 THEN
        'Some rows have incorrect IMAGE_ALT values'
    ELSE
        NULL
END AS error_message;

ROLLBACK;