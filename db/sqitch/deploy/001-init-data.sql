-- Deploy alexicourieux-resume-db:001-init-data to mysql
START TRANSACTION;

-- EDUCATION
INSERT INTO `EDUCATION` (ID, START_DATE,END_DATE) VALUES
	 (1, '2018-01-01 00:00:00','2019-01-01 00:00:00'),
	 (2, '2016-01-01 00:00:00','2018-01-01 00:00:00');

-- EDUCATION_I18N
INSERT INTO `EDUCATION_I18N` (EDUCATION_ID,SCHOOL,`DEGREE`,`LANGUAGE`,LOCATION,IMAGE_URI) VALUES
	 (1,'Université Côte d''Azur','Licence professionnelle - Développement d''applications web/mobile','FR','Sophia-Antipolis, France','./images/universite_cote_azur.png'),
	 (1,'Université Côte d''Azur','Bachelor''s Degree - Web/Mobile Application Development','EN','Sophia-Antipolis, France','./images/universite_cote_azur.png'),
	 (2,'Université Côte d''Azur','Diplôme Universitaire en Technologie - Informatique','FR','Sophia-Antipolis, France','./images/universite_cote_azur.png'),
	 (2,'Université Côte d''Azur','University Diploma in Technology - Computer Science','EN','Sophia-Antipolis, France','./images/universite_cote_azur.png');

-- EXPERIENCE
INSERT INTO `EXPERIENCE` (ID,START_DATE,END_DATE) VALUES
	 ('csm','2019-08-02','2022-06-01'),
	 ('exco','2016-12-01','2018-09-01'),
	 ('flo','2023-06-01',NULL),
	 ('koedia','2018-09-02','2019-08-01'),
	 ('nbc','2022-09-01','2023-05-01');

-- EXPERIENCE_I18N
INSERT INTO `EXPERIENCE_I18N` (EXPERIENCE_ID,`POSITION`,SHORT_DESCRIPTION,DESCRIPTION,COMPANY_NAME,`LANGUAGE`) VALUES
	 ('csm','Full Stack Web developper','Application development in the public services domain','In a team of 20 peoples in the public services domain, I developped and maintained web applications, working on both front-end and back-end technologies.

Collaborated in cross-functional teams to deliver high-quality application in aagile environment.','Caisses Sociales de Monaco','EN'),
	 ('csm','Développeur Full-Stack','Développement d''applications web full-stack dans le domaine du service public','In a team of 20 peoples in the public services domain, I developped and maintained web applications, working on both front-end and back-end technologies.

Leveraged technologies such as Zk Framework, Java 8, Spring, IBM DB2,  PostgreSQL and JasperReports.

Collaborated in cross-functional teams to deliver high-quality application in aagile environment.','Caisses Sociales de Monaco','FR'),
	 ('exco','Software Engineer','Software conception and development in the accounting domain','As the sole developer within an accounting team, I designed and developed software solutions for task planning, IT asset management, and other internal operations. 

I built user-friendly applications that enhanced team efficiency and streamlined processes. 

I managed the entire development lifecycle, from design to maintenance and updates, ensuring smooth and reliable performance.','Exco FSE','EN'),
	 ('exco','Développeur logiciel','Développement et conception d''applications dans le domaine de la comptabilité.','En tant que développeur unique au sein d''une équipe de comptabilité, j''ai conçu et développé des applications facilitant la planification des tâches, la gestion du parc informatique et d''autres opérations internes.

J''ai mis en place des solutions optimisées pour la gestion des accès utilisateurs, améliorant ainsi l''efficacité des équipes et des processus.

J''étais responsable de l''ensemble du cycle de vie de ces applications, de leur conception à leur développement, en passant par leur maintenance et leurs mises à jour, tout en veillant à répondre aux besoins des utilisateurs.','Exco FSE','FR'),
	 ('flo','Full Stack Web developper','Architecture and developement of a management and monitoring solution for EV recharge stations.','In a 8 members team, I develop and maintain a management and monitoring solution for
electric vehicle recharge stations.
- Define and create a cloud infrastructure to manage an IoT park (AWS, Lambda, CloudFormation, ...)
- Development of serverlesss functions to perform actions on the various entities of the solution (Golang)
- Development of a front-end portal to monitor and manage the park (React, PingIdentity, Netlify)
- Continuous analysis of the solution to give the best solutions adapted to the technical and cost needs.
- Pipeline and scripts creation to improve CI/CD and developpers life quality (Github Action, Bash)','Flo','EN'),
	 ('flo','Développeur Full Stack','Développement et conception d''une solution dans le domaine de l''IoT','Dans une équipe de 8 personnes, j''ai développé et maitenu une solution de gestion et de surveillance de stations de recharge pour voiture éléctriques.
- Définition et création d''infrastructure cloud pour gérer le parc IoT.
- Développement de fonctions serverless pour effectuer des actions sur les différentes entités de la solution.
- Analyse continue afin de fournir les meilleurs solutions adaptés aux besoins techniques et financiers.
- Création de pipelines et de scripts pour améliorer le CI/CD et la qualité de vie des développeurs.
','Flo','FR'),
	 ('koedia','Web Integrator','Implementation of mockups in the domain of tourism','In a small team of five in the tourism industry, I implemented and integrated various mockups into fully functional web pages. I worked on both B2B and B2C websites, enabling cost comparisons for flights, hotels, car rentals, and more. The focus was on delivering the best possible user experience.','Koedia','EN'),
	 ('koedia','Intégrateur Web','Implémentation de maquettes dans le domaine du tourisme','Dans une équipe de cinq personnes dans le secteur du tourisme, j''ai implémenté et integré diverses maquettes en sites web entièrement fonctionnels. 

J''ai travaillé sur des sites B2B et B2C permettant la comparaison de vols, hôtels, locations de voiture et plus encore.

L''accent a été mis sur l''offre de la meilleure expérience utilisateur possible.','Koedia','FR'),
	 ('nbc','Java Developper','Development of backend solution in the finance domain','In a crew of 6 peoples, I developped and maintained backend solutions assuring the
financial transactions.
- Migration of a cloud solution from Google GCP towards Amazon AWS (AWS, Github Action)
- Development of functionnalities in a microservice environment (Java 18, Kotlin, Docker)
- Solution testing using a BDD approach (Cucumber, Kotlin)','National Bank of Canada','EN'),
	 ('nbc','Développeur Java','Développement d''applications dans le domaine bancaire','Dans une équipe de 6 personnes, J''ai développé et maintenu des applications backend assurant les transactions financières.

- Migration d''une solution cloud de GCP vers AWS
- Développement de fonctionnalités dans une architecture microservices
- Développement avec une approche orienté tests (TDD)','Banque Nationale du Canada','FR');

-- SKILL
INSERT INTO `SKILL` (ID) VALUES
	 ('agile'),
	 ('android'),
	 ('angular'),
	 ('aws'),
	 ('aws_api_gw'),
	 ('aws_cf'),
	 ('aws_cw'),
	 ('aws_dynamodb'),
	 ('aws_ec2'),
	 ('aws_iot');
INSERT INTO `SKILL` (ID) VALUES
	 ('aws_lambda'),
	 ('aws_rds'),
	 ('aws_s3'),
	 ('aws_sam'),
	 ('aws_sqs'),
	 ('bash'),
	 ('bitbucket'),
	 ('blender'),
	 ('ci_cd'),
	 ('confluence');
INSERT INTO `SKILL` (ID) VALUES
	 ('csharp'),
	 ('css'),
	 ('cucumber'),
	 ('cypress'),
	 ('docker'),
	 ('git'),
	 ('github'),
	 ('github_actions'),
	 ('gitlab'),
	 ('golang');
INSERT INTO `SKILL` (ID) VALUES
	 ('hibernate'),
	 ('html'),
	 ('ibm_db2'),
	 ('jasper_reports'),
	 ('java'),
	 ('javascript'),
	 ('jenkins'),
	 ('jira'),
	 ('jpa'),
	 ('junit');
INSERT INTO `SKILL` (ID) VALUES
	 ('kanban'),
	 ('kubernetes'),
	 ('linux'),
	 ('mockito'),
	 ('mongodb'),
	 ('mysql'),
	 ('postgresql'),
	 ('react'),
	 ('react_native'),
	 ('responsive_design');
INSERT INTO `SKILL` (ID) VALUES
	 ('scrum'),
	 ('solid'),
	 ('spring'),
	 ('sql'),
	 ('tdd'),
	 ('typescript'),
	 ('ui_ux'),
	 ('unity'),
	 ('vba'),
	 ('windev');
INSERT INTO `SKILL` (ID) VALUES
	 ('windows');

-- SKILL_CATEGORY
INSERT INTO `SKILL_CATEGORY` (ID) VALUES
	 ('backend'),
	 ('cloud'),
	 ('db'),
	 ('design'),
	 ('devops'),
	 ('frontend'),
	 ('game_dev'),
	 ('methodology'),
	 ('mobile'),
	 ('reporting');
INSERT INTO `SKILL_CATEGORY` (ID) VALUES
	 ('testing');

-- SKILL_CATEGORY_I18N
INSERT INTO `SKILL_CATEGORY_I18N` (SKILL_CATEGORY_ID,NAME,`LANGUAGE`) VALUES
	 ('backend','Backend','EN'),
	 ('backend','Back-end','FR'),
	 ('cloud','Cloud','FR'),
	 ('cloud','Cloud','EN'),
	 ('db','Database','EN'),
	 ('db','Base de données','FR'),
	 ('design','Design','EN'),
	 ('design','Design','FR'),
	 ('devops','DevOps','FR'),
	 ('devops','DevOps','EN');
INSERT INTO `SKILL_CATEGORY_I18N` (SKILL_CATEGORY_ID,NAME,`LANGUAGE`) VALUES
	 ('frontend','Frontend','EN'),
	 ('frontend','Front-end','FR'),
	 ('game_dev','Game Developement','EN'),
	 ('game_dev','Développement de jeux','FR'),
	 ('methodology','Méthodologie','FR'),
	 ('methodology','Methodology','EN'),
	 ('mobile','Mobile','EN'),
	 ('mobile','Mobile','FR'),
	 ('reporting','Reporting','EN'),
	 ('reporting','Rapports','FR');
INSERT INTO `SKILL_CATEGORY_I18N` (SKILL_CATEGORY_ID,NAME,`LANGUAGE`) VALUES
	 ('testing','Testing','EN'),
	 ('testing','Tests','FR');

INSERT INTO `SKILL_I18N` (SKILL_ID,`LANGUAGE`,NAME) VALUES
	 ('agile','EN','Agile'),
	 ('android','EN','Android'),
	 ('angular','EN','Angular'),
	 ('aws','EN','AWS'),
	 ('aws_api_gw','EN','AWS API Gateway'),
	 ('aws_cf','EN','AWS CloudFormation'),
	 ('aws_cw','EN','AWS CloudWatch'),
	 ('aws_dynamodb','EN','AWS DynamoDB'),
	 ('aws_ec2','EN','AWS EC2'),
	 ('aws_iot','EN','AWS IoT');
INSERT INTO `SKILL_I18N` (SKILL_ID,`LANGUAGE`,NAME) VALUES
	 ('aws_lambda','EN','AWS Lambda'),
	 ('aws_rds','EN','AWS RDS'),
	 ('aws_s3','EN','AWS S3'),
	 ('aws_sam','EN','AWS SAM'),
	 ('aws_sqs','EN','AWS SQS'),
	 ('bash','EN','Bash'),
	 ('bitbucket','EN','BitBucket'),
	 ('blender','EN','Blender'),
	 ('csharp','EN','C#'),
	 ('ci_cd','EN','CI/CD');
INSERT INTO `SKILL_I18N` (SKILL_ID,`LANGUAGE`,NAME) VALUES
	 ('confluence','EN','Confluence'),
	 ('css','EN','CSS'),
	 ('cucumber','EN','Cucumber'),
	 ('cypress','EN','Cypress'),
	 ('docker','EN','Docker'),
	 ('git','EN','Git'),
	 ('github','EN','GitHub'),
	 ('github_actions','EN','GitHub Actions'),
	 ('gitlab','EN','GitLab'),
	 ('golang','EN','Golang');
INSERT INTO `SKILL_I18N` (SKILL_ID,`LANGUAGE`,NAME) VALUES
	 ('hibernate','EN','Hibernate'),
	 ('html','EN','HTML'),
	 ('ibm_db2','EN','IBM DB2'),
	 ('jasper_reports','EN','JasperReports'),
	 ('java','EN','Java'),
	 ('javascript','EN','JavaScript'),
	 ('jenkins','EN','Jenkins'),
	 ('jira','EN','Jira'),
	 ('jpa','EN','JPA'),
	 ('junit','EN','Junit');
INSERT INTO `SKILL_I18N` (SKILL_ID,`LANGUAGE`,NAME) VALUES
	 ('kanban','EN','Kanban'),
	 ('kubernetes','EN','Kubernetes'),
	 ('linux','EN','Linux'),
	 ('mockito','EN','Mockito'),
	 ('mongodb','EN','MongoDB'),
	 ('mysql','EN','MySQL'),
	 ('postgresql','EN','PostgreSQL'),
	 ('react','EN','React'),
	 ('react_native','EN','React Native'),
	 ('responsive_design','EN','Responsive Design');
INSERT INTO `SKILL_I18N` (SKILL_ID,`LANGUAGE`,NAME) VALUES
	 ('scrum','EN','Scrum'),
	 ('solid','EN','SOLID Principles'),
	 ('spring','EN','Spring'),
	 ('sql','EN','SQL'),
	 ('tdd','EN','TDD'),
	 ('typescript','EN','TypeScript'),
	 ('ui_ux','EN','UI/UX'),
	 ('unity','EN','Unity'),
	 ('vba','EN','VBA'),
	 ('windev','EN','WinDev');
INSERT INTO `SKILL_I18N` (SKILL_ID,`LANGUAGE`,NAME) VALUES
	 ('windows','EN','Windows'),
	 ('agile','FR','Agile'),
	 ('android','FR','Android'),
	 ('angular','FR','Angular'),
	 ('aws','FR','AWS'),
	 ('aws_api_gw','FR','AWS API Gateway'),
	 ('aws_cf','FR','AWS CloudFormation'),
	 ('aws_cw','FR','AWS CloudWatch'),
	 ('aws_dynamodb','FR','AWS DynamoDB'),
	 ('aws_ec2','FR','AWS EC2');
INSERT INTO `SKILL_I18N` (SKILL_ID,`LANGUAGE`,NAME) VALUES
	 ('aws_iot','FR','AWS IoT'),
	 ('aws_lambda','FR','AWS Lambda'),
	 ('aws_rds','FR','AWS RDS'),
	 ('aws_s3','FR','AWS S3'),
	 ('aws_sam','FR','AWS SAM'),
	 ('aws_sqs','FR','AWS SQS'),
	 ('bash','FR','Bash'),
	 ('bitbucket','FR','BitBucket'),
	 ('blender','FR','Blender'),
	 ('csharp','FR','C#');
INSERT INTO `SKILL_I18N` (SKILL_ID,`LANGUAGE`,NAME) VALUES
	 ('ci_cd','FR','CI/CD'),
	 ('confluence','FR','Confluence'),
	 ('css','FR','CSS'),
	 ('cucumber','FR','Cucumber'),
	 ('cypress','FR','Cypress'),
	 ('docker','FR','Docker'),
	 ('git','FR','Git'),
	 ('github','FR','GitHub'),
	 ('github_actions','FR','GitHub Actions'),
	 ('gitlab','FR','GitLab');
INSERT INTO `SKILL_I18N` (SKILL_ID,`LANGUAGE`,NAME) VALUES
	 ('golang','FR','Golang'),
	 ('hibernate','FR','Hibernate'),
	 ('html','FR','HTML'),
	 ('ibm_db2','FR','IBM DB2'),
	 ('jasper_reports','FR','JasperReports'),
	 ('java','FR','Java'),
	 ('javascript','FR','JavaScript'),
	 ('jenkins','FR','Jenkins'),
	 ('jira','FR','Jira'),
	 ('jpa','FR','JPA');
INSERT INTO `SKILL_I18N` (SKILL_ID,`LANGUAGE`,NAME) VALUES
	 ('junit','FR','Junit'),
	 ('kanban','FR','Kanban'),
	 ('kubernetes','FR','Kubernetes'),
	 ('linux','FR','Linux'),
	 ('mockito','FR','Mockito'),
	 ('mongodb','FR','MongoDB'),
	 ('mysql','FR','MySQL'),
	 ('postgresql','FR','PostgreSQL'),
	 ('react','FR','React'),
	 ('react_native','FR','React Native');
INSERT INTO `SKILL_I18N` (SKILL_ID,`LANGUAGE`,NAME) VALUES
	 ('responsive_design','FR','Conception Responsive'),
	 ('scrum','FR','Scrum'),
	 ('solid','FR','Principes SOLID'),
	 ('spring','FR','Spring'),
	 ('sql','FR','SQL'),
	 ('tdd','FR','TDD'),
	 ('typescript','FR','TypeScript'),
	 ('ui_ux','FR','UI/UX'),
	 ('unity','FR','Unity'),
	 ('vba','FR','VBA');
INSERT INTO `SKILL_I18N` (SKILL_ID,`LANGUAGE`,NAME) VALUES
	 ('windev','FR','WinDev'),
	 ('windows','FR','Windows');

-- SKILL_SKILL_CATEGORY (association table)
INSERT INTO `SKILL_SKILL_CATEGORY` (SKILL_ID,SKILL_CATEGORY_ID) VALUES
	 ('agile','methodology'),
	 ('android','mobile'),
	 ('angular','frontend'),
	 ('aws','cloud'),
	 ('aws_api_gw','cloud'),
	 ('aws_cf','cloud'),
	 ('aws_cf','devops'),
	 ('aws_cw','cloud'),
	 ('aws_dynamodb','cloud'),
	 ('aws_dynamodb','db');
INSERT INTO `SKILL_SKILL_CATEGORY` (SKILL_ID,SKILL_CATEGORY_ID) VALUES
	 ('aws_ec2','cloud'),
	 ('aws_iot','cloud'),
	 ('aws_lambda','backend'),
	 ('aws_lambda','cloud'),
	 ('aws_rds','cloud'),
	 ('aws_rds','db'),
	 ('aws_s3','cloud'),
	 ('aws_sam','cloud'),
	 ('aws_sqs','cloud'),
	 ('bash','devops');
INSERT INTO `SKILL_SKILL_CATEGORY` (SKILL_ID,SKILL_CATEGORY_ID) VALUES
	 ('bitbucket','devops'),
	 ('blender','design'),
	 ('blender','game_dev'),
	 ('ci_cd','devops'),
	 ('confluence','methodology'),
	 ('csharp','backend'),
	 ('css','frontend'),
	 ('cucumber','testing'),
	 ('cypress','testing'),
	 ('docker','devops');
INSERT INTO `SKILL_SKILL_CATEGORY` (SKILL_ID,SKILL_CATEGORY_ID) VALUES
	 ('git','devops'),
	 ('github','devops'),
	 ('github_actions','devops'),
	 ('gitlab','devops'),
	 ('golang','backend'),
	 ('hibernate','backend'),
	 ('hibernate','db'),
	 ('html','frontend'),
	 ('ibm_db2','db'),
	 ('jasper_reports','reporting');
INSERT INTO `SKILL_SKILL_CATEGORY` (SKILL_ID,SKILL_CATEGORY_ID) VALUES
	 ('java','backend'),
	 ('javascript','frontend'),
	 ('jenkins','devops'),
	 ('jira','methodology'),
	 ('jpa','backend'),
	 ('jpa','db'),
	 ('junit','testing'),
	 ('kanban','methodology'),
	 ('kubernetes','devops'),
	 ('linux','devops');
INSERT INTO `SKILL_SKILL_CATEGORY` (SKILL_ID,SKILL_CATEGORY_ID) VALUES
	 ('mockito','testing'),
	 ('mongodb','db'),
	 ('mysql','db'),
	 ('postgresql','db'),
	 ('react','frontend'),
	 ('react_native','mobile'),
	 ('responsive_design','design'),
	 ('scrum','methodology'),
	 ('solid','design'),
	 ('spring','backend');
INSERT INTO `SKILL_SKILL_CATEGORY` (SKILL_ID,SKILL_CATEGORY_ID) VALUES
	 ('sql','backend'),
	 ('sql','db'),
	 ('tdd','testing'),
	 ('typescript','frontend'),
	 ('ui_ux','design'),
	 ('unity','game_dev'),
	 ('vba','backend'),
	 ('windev','backend'),
	 ('windows','devops');

-- EXPERIENCE_SKILL (association table)
INSERT INTO `EXPERIENCE_SKILL` (EXPERIENCE_ID,SKILL_ID) VALUES
	 ('csm','agile'),
	 ('csm','ci_cd'),
	 ('csm','confluence'),
	 ('csm','css'),
	 ('csm','git'),
	 ('csm','gitlab'),
	 ('csm','html'),
	 ('csm','ibm_db2'),
	 ('csm','jasper_reports'),
	 ('csm','java');
INSERT INTO `EXPERIENCE_SKILL` (EXPERIENCE_ID,SKILL_ID) VALUES
	 ('csm','jenkins'),
	 ('csm','jira'),
	 ('csm','junit'),
	 ('csm','kubernetes'),
	 ('csm','mockito'),
	 ('csm','mysql'),
	 ('csm','scrum'),
	 ('csm','solid'),
	 ('csm','spring'),
	 ('csm','sql');
INSERT INTO `EXPERIENCE_SKILL` (EXPERIENCE_ID,SKILL_ID) VALUES
	 ('csm','windows'),
	 ('exco','css'),
	 ('exco','html'),
	 ('exco','sql'),
	 ('exco','vba'),
	 ('exco','windev'),
	 ('exco','windows'),
	 ('flo','agile'),
	 ('flo','aws_cf'),
	 ('flo','aws_cw');
INSERT INTO `EXPERIENCE_SKILL` (EXPERIENCE_ID,SKILL_ID) VALUES
	 ('flo','aws_dynamodb'),
	 ('flo','aws_ec2'),
	 ('flo','aws_iot'),
	 ('flo','aws_lambda'),
	 ('flo','aws_rds'),
	 ('flo','aws_s3'),
	 ('flo','aws_sam'),
	 ('flo','aws_sqs'),
	 ('flo','bash'),
	 ('flo','ci_cd');
INSERT INTO `EXPERIENCE_SKILL` (EXPERIENCE_ID,SKILL_ID) VALUES
	 ('flo','confluence'),
	 ('flo','csharp'),
	 ('flo','css'),
	 ('flo','cypress'),
	 ('flo','docker'),
	 ('flo','git'),
	 ('flo','github'),
	 ('flo','github_actions'),
	 ('flo','golang'),
	 ('flo','html');
INSERT INTO `EXPERIENCE_SKILL` (EXPERIENCE_ID,SKILL_ID) VALUES
	 ('flo','jira'),
	 ('flo','linux'),
	 ('flo','mongodb'),
	 ('flo','postgresql'),
	 ('flo','react'),
	 ('flo','scrum'),
	 ('flo','solid'),
	 ('flo','sql'),
	 ('flo','typescript'),
	 ('flo','ui_ux');
INSERT INTO `EXPERIENCE_SKILL` (EXPERIENCE_ID,SKILL_ID) VALUES
	 ('flo','windows'),
	 ('koedia','agile'),
	 ('koedia','angular'),
	 ('koedia','css'),
	 ('koedia','git'),
	 ('koedia','gitlab'),
	 ('koedia','hibernate'),
	 ('koedia','html'),
	 ('koedia','java'),
	 ('koedia','javascript');
INSERT INTO `EXPERIENCE_SKILL` (EXPERIENCE_ID,SKILL_ID) VALUES
	 ('koedia','jpa'),
	 ('koedia','mysql'),
	 ('koedia','responsive_design'),
	 ('koedia','scrum'),
	 ('koedia','ui_ux'),
	 ('nbc','agile'),
	 ('nbc','aws'),
	 ('nbc','aws_ec2'),
	 ('nbc','ci_cd'),
	 ('nbc','confluence');
INSERT INTO `EXPERIENCE_SKILL` (EXPERIENCE_ID,SKILL_ID) VALUES
	 ('nbc','cucumber'),
	 ('nbc','docker'),
	 ('nbc','git'),
	 ('nbc','github'),
	 ('nbc','github_actions'),
	 ('nbc','java'),
	 ('nbc','junit'),
	 ('nbc','kubernetes'),
	 ('nbc','linux'),
	 ('nbc','mockito');
INSERT INTO `EXPERIENCE_SKILL` (EXPERIENCE_ID,SKILL_ID) VALUES
	 ('nbc','postgresql'),
	 ('nbc','scrum'),
	 ('nbc','solid'),
	 ('nbc','spring'),
	 ('nbc','sql'),
	 ('nbc','tdd');

COMMIT;
