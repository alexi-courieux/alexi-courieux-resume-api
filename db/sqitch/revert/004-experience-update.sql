-- Revert alexicourieux-resume-db:004-experience-update from mysql

START TRANSACTION;

DELETE FROM EXPERIENCE where ID = 'antaes';
DELETE FROM SKILL where ID = 'tomcat';
DELETE FROM SKILL where ID = 'magnolia';
DELETE FROM SKILL where ID = 'wiremock';
DELETE FROM SKILL where ID = 'rest';
DELETE FROM SKILL where ID = 'maven';
DELETE FROM SKILL where ID = 'activeMQ';

UPDATE resume.EXPERIENCE SET END_DATE=NULL WHERE ID='flo';

SET FOREIGN_KEY_CHECKS = 1;

COMMIT;
