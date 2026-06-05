-- Deploy alexicourieux-resume-db:005-freelance-experience to mysql

START TRANSACTION;

# Update 'antaes' experience end date to January 2026
UPDATE resume.EXPERIENCE SET END_DATE='2026-01-31' WHERE ID='antaes';

# Add new freelance experience starting February 2026
INSERT INTO resume.EXPERIENCE (ID, START_DATE, END_DATE) VALUES ('freelance', '2026-02-01', NULL);

INSERT INTO resume.EXPERIENCE_I18N (EXPERIENCE_ID, `POSITION`, SHORT_DESCRIPTION, DESCRIPTION, COMPANY_NAME, `LANGUAGE`, IMAGE_URI, IMAGE_URI_DARK, IMAGE_ALT)
VALUES 
    ('freelance', 'Freelance Software Engineer', 'Independent software development consultant', 'As a freelance software engineer, I provide expert consulting services in software development, architecture design, and technical solutions. I specialize in full-stack development, cloud infrastructure, and DevOps practices.

Working independently allows me to deliver tailored solutions that meet specific client needs while maintaining high standards of quality and professionalism.

My freelance work focuses on helping businesses build robust, scalable applications and optimize their development processes.', 'Self-Employed', 'EN', 'images/experience-freelance.svg', 'images/experience-freelance-dark.svg', 'Freelance Logo'),
    ('freelance', 'Ingénieur Logiciel Freelance', 'Consultant indépendant en développement logiciel', 'En tant qu''ingénieur logiciel freelance, je fournis des services de conseil expert en développement logiciel, conception d''architecture et solutions techniques. Je me spécialise dans le développement full-stack, l''infrastructure cloud et les pratiques DevOps.

Travailler de manière indépendante me permet de fournir des solutions sur mesure qui répondent aux besoins spécifiques des clients tout en maintenant des normes élevées de qualité et de professionnalisme.

Mon travail freelance se concentre sur l''aide aux entreprises pour construire des applications robustes et évolutives et optimiser leurs processus de développement.', 'Indépendant', 'FR', 'images/experience-freelance.svg', 'images/experience-freelance-dark.svg', 'Logo Freelance');

# Add skills to freelance experience
# All skills used here were created in previous migrations (001-init-data and 004-experience-update)
# We disable foreign key checks temporarily because the experience 'freelance' is being inserted in this same transaction
# This is a standard pattern used in previous migrations (see 004-experience-update.sql line 52)
SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO resume.EXPERIENCE_SKILL (EXPERIENCE_ID, SKILL_ID) VALUES 
    ('freelance', 'java'),
    ('freelance', 'golang'),
    ('freelance', 'javascript'),
    ('freelance', 'typescript'),
    ('freelance', 'react'),
    ('freelance', 'angular'),
    ('freelance', 'spring'),
    ('freelance', 'aws'),
    ('freelance', 'aws_lambda'),
    ('freelance', 'aws_s3'),
    ('freelance', 'aws_dynamodb'),
    ('freelance', 'aws_ec2'),
    ('freelance', 'aws_rds'),
    ('freelance', 'docker'),
    ('freelance', 'kubernetes'),
    ('freelance', 'git'),
    ('freelance', 'github'),
    ('freelance', 'github_actions'),
    ('freelance', 'gitlab'),
    ('freelance', 'ci_cd'),
    ('freelance', 'postgresql'),
    ('freelance', 'mysql'),
    ('freelance', 'mongodb'),
    ('freelance', 'sql'),
    ('freelance', 'html'),
    ('freelance', 'css'),
    ('freelance', 'bash'),
    ('freelance', 'linux'),
    ('freelance', 'windows'),
    ('freelance', 'agile'),
    ('freelance', 'scrum'),
    ('freelance', 'solid'),
    ('freelance', 'tdd'),
    ('freelance', 'rest');
SET FOREIGN_KEY_CHECKS = 1;

COMMIT;
