-- Deploy alexicourieux-resume-db:004-experience-update to mysql

START TRANSACTION;

# Add new skills
INSERT INTO resume.SKILL (ID) VALUES 
    ('tomcat'),
	('magnolia'),
	('wiremock'),
    ('rest'),
    ('maven'),
    ('activeMQ');

INSERT INTO resume.SKILL_I18N (SKILL_ID, `LANGUAGE`, NAME) VALUES 
    ('tomcat','EN','Tomcat'),
	('tomcat','FR','Tomcat'),
	('wiremock','EN','Wiremock'),
	('wiremock','FR','Wiremock'),
	('magnolia','EN','Magnolia CMS'),
	('magnolia','FR','Magnolia CMS'),
    ('rest','EN','REST'),
    ('rest','FR','REST'),
    ('maven','EN','Maven'),
    ('maven','FR','Maven'),
    ('activeMQ','EN','ActiveMQ'),
    ('activeMQ','FR','ActiveMQ');

INSERT INTO resume.SKILL_SKILL_CATEGORY (SKILL_ID,SKILL_CATEGORY_ID) VALUES 
    ('tomcat','backend'),
	('tomcat','devops'),
	('magnolia','frontend'),
	('magnolia','backend'),
	('wiremock','testing'),
    ('rest','backend'),
    ('maven','devops'),
    ('activeMQ','backend');

# Add new experience 'antaes' and update 'flo' end date
INSERT INTO resume.EXPERIENCE (ID,START_DATE) VALUES ('antaes','2025-06-02');
UPDATE resume.EXPERIENCE SET END_DATE='2025-06-01' WHERE ID='flo';

INSERT INTO resume.EXPERIENCE_I18N (EXPERIENCE_ID,`POSITION`,SHORT_DESCRIPTION,DESCRIPTION,COMPANY_NAME,IMAGE_URI,IMAGE_URI_DARK,IMAGE_ALT)
	VALUES ('antaes','Java Developper','Consulting assignment with a Swiss telecom operator, contributing to the optimization of digital sales channels and the development of key network management components, working within a 10-person team and in close collaboration with external partners.','During a consulting engagement with a major telecommunications provider in Switzerland, I contributed to the evolution of digital sales channels (e-shop, corporate website), helping to optimize the customer journey and improve commercial performance. The delivered features reduced user friction and streamlined the rollout of new commercial offerings.

I also took part in the development of strategic components for the operator’s network management and monitoring systems, strengthening the reliability and maintainability of internal tools. Working within a 10-person team and in close coordination with multiple external partners, I contributed to on-time deliveries while meeting high quality standards in a complex, multi-stakeholder, and operationally demanding environment.','Antaes','images/experience-antaes.svg','images/experience-antaes-dark.svg','Antaes Logo');
INSERT INTO resume.EXPERIENCE_I18N (EXPERIENCE_ID,`POSITION`,SHORT_DESCRIPTION,DESCRIPTION,COMPANY_NAME,`LANGUAGE`,IMAGE_URI,IMAGE_URI_DARK,IMAGE_ALT)
	VALUES ('antaes','Développeur Java','Mission de consultation chez un opérateur télécom en Suisse, gestion des canaux de vente digitaux et au développement de gestion du réseau.','En mission de consultation chez un acteur majeur des télécommunications en Suisse, j’ai contribué à l’évolution des canaux de vente digitaux (e-shop, site vitrine), participant à l’optimisation du parcours client et à l’amélioration de la performance commerciale. Les fonctionnalités livrées ont permis de réduire les frictions côté utilisateur et de faciliter la mise en production de nouvelles offres.

J’ai également participé au développement de composants stratégiques pour la gestion et le pilotage du réseau de l’opérateur, renforçant la fiabilité et la maintenabilité des outils internes. Au sein d’une équipe de 10 personnes et en coordination avec plusieurs partenaires externes, j’ai contribué à des livraisons respectant les délais et les exigences de qualité, dans un contexte multi-acteurs et à forte contrainte opérationnelle.','Antaes','FR','images/experience-antaes.svg','images/experience-antaes-dark.svg','Logo Antaes');

# Disable foreign key checks because 'antaes' experience is not committed yet
SET FOREIGN_KEY_CHECKS = 0; 
INSERT INTO resume.EXPERIENCE_SKILL (EXPERIENCE_ID,SKILL_ID) VALUES 
    ('antaes','java'),
	('antaes','confluence'),
	('antaes','jira'),
	('antaes','git'),
	('antaes','gitlab'),
	('antaes','tomcat'),
	('antaes','magnolia'),
	('antaes','mariadb'),
	('antaes','sql'),
	('antaes','html'),
	('antaes','css'),
	('antaes','javascript'),
	('antaes','solid'),
	('antaes','spring'),
	('antaes','windows'),
	('antaes','bash'),
	('antaes','hibernate'),
	('antaes','jenkins'),
	('antaes','jpa'),
	('antaes','junit'),
	('antaes','mockito'),
	('antaes','wiremock'),
    ('antaes','rest'),
    ('antaes','maven'),
    ('csm', 'tomcat'),
    ('csm', 'maven'),
    ('csm', 'activeMQ'),
    ('flo', 'rest');
SET FOREIGN_KEY_CHECKS = 1;
COMMIT;
