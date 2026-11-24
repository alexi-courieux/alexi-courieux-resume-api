from sqlalchemy.orm import Session
from models.projectModel import ProjectI18nModel, ProjectModel
from schemas.projectSchema import ProjectSchema, ProjectSummarySchema
from crud.skillCrud import get_project_skills

def _common_fields(db: Session, project: ProjectModel, i18n: ProjectI18nModel, language: str) -> dict:
    return dict(
        id=project.id,
        title=i18n.title,
        shortDescription=i18n.shortDescription,
        thumbnailUri=i18n.thumbnailUri,
        thumbnailAlt=i18n.thumbnailAlt,
        linkUrl=project.linkUrl,
        linkLabel=i18n.linkLabel,
        projectDate=project.projectDate,
        featured=bool(project.featured),
        skills=get_project_skills(db, project.id, language)
    )

def get_project(db: Session, project_id: str, language: str) -> ProjectSchema | None:
    result = db.query(ProjectModel, ProjectI18nModel).\
        join(ProjectI18nModel, ProjectI18nModel.projectId == ProjectModel.id).\
        filter(ProjectModel.id == project_id, ProjectI18nModel.language == language).\
        first()

    if result:
        project, i18n = result
        return ProjectSchema(
            **_common_fields(db, project, i18n, language),
            description=i18n.description,
            repositoryUrl=project.repositoryUrl
        )
    return None

def get_projects(db: Session, language: str) -> list[ProjectSummarySchema]:
    results = db.query(ProjectModel, ProjectI18nModel).\
        join(ProjectI18nModel, ProjectI18nModel.projectId == ProjectModel.id).\
        filter(ProjectI18nModel.language == language).\
        order_by(ProjectModel.displayOrder.asc(), ProjectModel.projectDate.desc()).\
        all()

    return [ProjectSummarySchema(**_common_fields(db, project, i18n, language)) for project, i18n in results]
