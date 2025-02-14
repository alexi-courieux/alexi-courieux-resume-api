-- Revert alexicourieux-resume-db:001-init-data from mysql

START TRANSACTION;

-- Revert EDUCATION
DELETE FROM huno7463_resume.EDUCATION WHERE START_DATE IN ('2018-01-01 00:00:00', '2016-01-01 00:00:00');

-- Revert EDUCATION_I18N
DELETE FROM huno7463_resume.EDUCATION_I18N WHERE EDUCATION_ID IN (1, 2);

-- Revert EXPERIENCE
DELETE FROM huno7463_resume.EXPERIENCE WHERE ID IN ('csm', 'exco', 'flo', 'koedia', 'nbc');

-- Revert EXPERIENCE_I18N
DELETE FROM huno7463_resume.EXPERIENCE_I18N WHERE EXPERIENCE_ID IN ('csm', 'exco', 'flo', 'koedia', 'nbc');

-- Revert SKILL
DELETE FROM huno7463_resume.SKILL WHERE ID IN (
    'agile', 'android', 'angular', 'aws', 'aws_api_gw', 'aws_cf', 'aws_cw', 'aws_dynamodb', 'aws_ec2', 'aws_iot',
    'aws_lambda', 'aws_rds', 'aws_s3', 'aws_sam', 'aws_sqs', 'bash', 'bitbucket', 'blender', 'ci_cd', 'confluence',
    'csharp', 'css', 'cucumber', 'cypress', 'docker', 'git', 'github', 'github_actions', 'gitlab', 'golang',
    'hibernate', 'html', 'ibm_db2', 'jasper_reports', 'java', 'javascript', 'jenkins', 'jira', 'jpa', 'junit',
    'kanban', 'kubernetes', 'linux', 'mockito', 'mongodb', 'mysql', 'postgresql', 'react', 'react_native', 'responsive_design',
    'scrum', 'solid', 'spring', 'sql', 'tdd', 'typescript', 'ui_ux', 'unity', 'vba', 'windev', 'windows'
);

-- Revert SKILL_CATEGORY
DELETE FROM huno7463_resume.SKILL_CATEGORY WHERE ID IN (
    'backend', 'cloud', 'db', 'design', 'devops', 'frontend', 'game_dev', 'methodology', 'mobile', 'reporting', 'testing'
);

-- Revert SKILL_CATEGORY_I18N
DELETE FROM huno7463_resume.SKILL_CATEGORY_I18N WHERE SKILL_CATEGORY_ID IN (
    'backend', 'cloud', 'db', 'design', 'devops', 'frontend', 'game_dev', 'methodology', 'mobile', 'reporting', 'testing'
);

-- Revert SKILL_I18N
DELETE FROM huno7463_resume.SKILL_I18N WHERE SKILL_ID IN (
    'agile', 'android', 'angular', 'aws', 'aws_api_gw', 'aws_cf', 'aws_cw', 'aws_dynamodb', 'aws_ec2', 'aws_iot',
    'aws_lambda', 'aws_rds', 'aws_s3', 'aws_sam', 'aws_sqs', 'bash', 'bitbucket', 'blender', 'ci_cd', 'confluence',
    'csharp', 'css', 'cucumber', 'cypress', 'docker', 'git', 'github', 'github_actions', 'gitlab', 'golang',
    'hibernate', 'html', 'ibm_db2', 'jasper_reports', 'java', 'javascript', 'jenkins', 'jira', 'jpa', 'junit',
    'kanban', 'kubernetes', 'linux', 'mockito', 'mongodb', 'mysql', 'postgresql', 'react', 'react_native', 'responsive_design',
    'scrum', 'solid', 'spring', 'sql', 'tdd', 'typescript', 'ui_ux', 'unity', 'vba', 'windev', 'windows'
);

-- Revert SKILL_SKILL_CATEGORY (association table)
DELETE FROM huno7463_resume.SKILL_SKILL_CATEGORY WHERE SKILL_ID IN (
    'agile', 'android', 'angular', 'aws', 'aws_api_gw', 'aws_cf', 'aws_cw', 'aws_dynamodb', 'aws_ec2', 'aws_iot',
    'aws_lambda', 'aws_rds', 'aws_s3', 'aws_sam', 'aws_sqs', 'bash', 'bitbucket', 'blender', 'ci_cd', 'confluence',
    'csharp', 'css', 'cucumber', 'cypress', 'docker', 'git', 'github', 'github_actions', 'gitlab', 'golang',
    'hibernate', 'html', 'ibm_db2', 'jasper_reports', 'java', 'javascript', 'jenkins', 'jira', 'jpa', 'junit',
    'kanban', 'kubernetes', 'linux', 'mockito', 'mongodb', 'mysql', 'postgresql', 'react', 'react_native', 'responsive_design',
    'scrum', 'solid', 'spring', 'sql', 'tdd', 'typescript', 'ui_ux', 'unity', 'vba', 'windev', 'windows'
);

-- Revert EXPERIENCE_SKILL (association table)
DELETE FROM huno7463_resume.EXPERIENCE_SKILL WHERE EXPERIENCE_ID IN ('csm', 'exco', 'flo', 'koedia', 'nbc');

COMMIT;
