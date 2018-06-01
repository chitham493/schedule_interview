/* ---------------------------------------------------------------------- */
/* Script generated with: DeZign for Databases V10.0.2                    */
/* Target DBMS:           MS SQL Server 2016                              */
/* Project file:          InterviewManagementSystem.dez                   */
/* Project name:                                                          */
/* Author:                                                                */
/* Script type:           Database creation script                        */
/* Created on:            2018-05-29 17:28                                */
/* ---------------------------------------------------------------------- */


/* ---------------------------------------------------------------------- */
/* Add tables                                                             */
/* ---------------------------------------------------------------------- */

GO


/* ---------------------------------------------------------------------- */
/* Add table "Roles"                                                      */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [Roles] (
    [RoleId] INTEGER IDENTITY(1,1) NOT NULL,
    [RoleName] VARCHAR(15),
    [CreatedDate] DATETIME,
    [ModifiedDate] DATETIME,
    [Status] INTEGER,
    CONSTRAINT [PK_Roles] PRIMARY KEY ([RoleId])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "Designation"                                                */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [Designation] (
    [DesignationId] INTEGER IDENTITY(1,1) NOT NULL,
    [Name] VARCHAR(31),
    [CreatedDate] DATETIME,
    [CreatedBy] INTEGER,
    [ModifiedDate] DATETIME,
    [ModifiedBy] INTEGER,
    [Status] INTEGER,
    CONSTRAINT [PK_Designation] PRIMARY KEY ([DesignationId])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "Skills"                                                     */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [Skills] (
    [SkillId] INTEGER IDENTITY(1,1) NOT NULL,
    [Name] VARCHAR(31),
    [CreateDate] DATETIME,
    [ModifiedDate] DATETIME,
    [Status] INTEGER,
    CONSTRAINT [PK_Skills] PRIMARY KEY ([SkillId])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "InterviewTypes"                                             */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [InterviewTypes] (
    [InterviewTypeId] INTEGER IDENTITY(1,1) NOT NULL,
    [Name] VARCHAR(31),
    [Description] VARCHAR(127),
    [CreatedDate] DATETIME,
    [ModifiedDate] DATETIME,
    [CreatedBy] INTEGER,
    [ModifiedBy] INTEGER,
    [Status] INTEGER,
    CONSTRAINT [PK_InterviewTypes] PRIMARY KEY ([InterviewTypeId])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "JobVacancy"                                                 */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [JobVacancy] (
    [JobVacancyId] INTEGER IDENTITY(1,1) NOT NULL,
    [JobPosition] VARCHAR(31),
    [JobCode] VARCHAR(7),
    [JobDescription] VARCHAR(255),
    [JobResponsibilty] VARCHAR(255),
    [Vacancy] VARCHAR(2),
    [StartDate] DATETIME,
    [EndDate] DATETIME,
    [CreatedDate] DATETIME,
    [ModifiedDate] DATETIME,
    [CreatedBy] INTEGER,
    [ModifiedBy] INTEGER,
    [Status] INTEGER,
    CONSTRAINT [PK_JobVacancy] PRIMARY KEY ([JobVacancyId])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "InterviewRounds"                                            */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [InterviewRounds] (
    [InterviewRoundId] INTEGER IDENTITY(1,1) NOT NULL,
    [JobId] INTEGER NOT NULL,
    [InterviewTypeId] INTEGER NOT NULL,
    [Status] INTEGER,
    CONSTRAINT [PK_InterviewRounds] PRIMARY KEY ([InterviewRoundId])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "InterviewSkills"                                            */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [InterviewSkills] (
    [InterviewSkillsId] INTEGER IDENTITY(1,1) NOT NULL,
    [InterviewRoundId] INTEGER NOT NULL,
    [SkillId] INTEGER NOT NULL,
    [CreatedDate] DATETIME,
    [ModifiedDate] DATETIME,
    [Status] INTEGER,
    CONSTRAINT [PK_InterviewSkills] PRIMARY KEY ([InterviewSkillsId])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "Panel"                                                      */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [Panel] (
    [PanelId] INTEGER IDENTITY(1,1) NOT NULL,
    [Name] VARCHAR(31),
    [CreatedDate] DATETIME,
    [ModifiedDate] DATETIME,
    [Status] INTEGER,
    CONSTRAINT [PK_Panel] PRIMARY KEY ([PanelId])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "Status"                                                     */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [Status] (
    [StatusId] INTEGER IDENTITY(1,1) NOT NULL,
    [Title] VARCHAR(15),
    [CreateDate] DATETIME,
    [ModifiedDate] DATETIME,
    [Active] INTEGER,
    CONSTRAINT [PK_Status] PRIMARY KEY ([StatusId])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "Pages"                                                      */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [Pages] (
    [PageId] INTEGER IDENTITY(1,1) NOT NULL,
    [Name] VARCHAR(15) NOT NULL,
    [CreatedDate] DATETIME,
    [ModifiedDate] DATETIME,
    [Status] INTEGER,
    CONSTRAINT [PK_Pages] PRIMARY KEY ([PageId])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "Filter"                                                     */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [Filter] (
    [FilterId] INTEGER IDENTITY(1,1) NOT NULL,
    [Name] VARCHAR(31),
    [PageId] INTEGER NOT NULL,
    [Active] BIT,
    [CreatedDate] DATETIME,
    [Modifieddate] DATETIME,
    [CreatedBy] INTEGER,
    [ModifiedBy] INTEGER,
    [Status] INTEGER,
    CONSTRAINT [PK_Filter] PRIMARY KEY ([FilterId])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "FieldControlTypes"                                          */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [FieldControlTypes] (
    [ControlTypeId] INTEGER IDENTITY(1,1) NOT NULL,
    [ControlType] VARCHAR(15),
    [Createddate] DATETIME,
    [ModifiedDate] DATETIME,
    [Status] INTEGER,
    CONSTRAINT [PK_FieldControlTypes] PRIMARY KEY ([ControlTypeId])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "FieldTypes"                                                 */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [FieldTypes] (
    [TypeId] INTEGER IDENTITY(1,1) NOT NULL,
    [Name] VARCHAR(15),
    [MultiValue] BIT,
    [Status] INTEGER,
    CONSTRAINT [PK_FieldTypes] PRIMARY KEY ([TypeId])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "RegularExpressions"                                         */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [RegularExpressions] (
    [ExpId] INTEGER IDENTITY(1,1) NOT NULL,
    [ControlId] INTEGER,
    [Expression] VARCHAR(63),
    [Status] INTEGER,
    CONSTRAINT [PK_RegularExpressions] PRIMARY KEY ([ExpId])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "ControlFields"                                              */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [ControlFields] (
    [ControlId] INTEGER IDENTITY(1,1) NOT NULL,
    [LabelName] VARCHAR(15),
    [ControlTypeId] INTEGER NOT NULL,
    [ClassName] VARCHAR(15),
    [CreateDate] DATETIME,
    [ModifiedDate] DATETIME,
    [PageId] INTEGER NOT NULL,
    [Status] INTEGER,
    CONSTRAINT [PK_ControlFields] PRIMARY KEY ([ControlId])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "Fields"                                                     */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [Fields] (
    [FieldId] INTEGER IDENTITY(1,1) NOT NULL,
    [ControlId] INTEGER NOT NULL,
    [TypeId] INTEGER NOT NULL,
    [ExpId] INTEGER NOT NULL,
    [FieldName] VARCHAR(15) NOT NULL,
    [Status] INTEGER,
    CONSTRAINT [PK_Fields] PRIMARY KEY ([FieldId])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "DefaultValues"                                              */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [DefaultValues] (
    [DefaultValueId] INTEGER IDENTITY(1,1) NOT NULL,
    [DefaultValue] VARCHAR(31),
    [OptionalLabel] VARCHAR(15),
    [FieldId] INTEGER NOT NULL,
    [Status] INTEGER,
    CONSTRAINT [PK_DefaultValues] PRIMARY KEY ([DefaultValueId], [FieldId])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "FieldValues"                                                */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [FieldValues] (
    [ValueId] INTEGER IDENTITY(1,1) NOT NULL,
    [DefaultValueId] INTEGER NOT NULL,
    [Values] VARCHAR(255),
    [CreatedDate] DATETIME,
    [ModifiedDate] DATETIME,
    [FieldId] INTEGER NOT NULL,
    [Status] INTEGER,
    CONSTRAINT [PK_FieldValues] PRIMARY KEY ([ValueId])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "UserDetails"                                                */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [UserDetails] (
    [UserId] INTEGER IDENTITY(1,1) NOT NULL,
    [FirstName] VARCHAR(31),
    [LastName] VARCHAR(31),
    [Email] VARCHAR(31),
    [DesignationId] INTEGER NOT NULL,
    [ContactNumber] VARCHAR(15),
    [UserName] VARCHAR(31),
    [Password] VARCHAR(15),
    [RoleId] INTEGER NOT NULL,
    [CreateDate] DATETIME,
    [CreatedBy] INTEGER,
    [ModifiedDate] DATETIME,
    [ModifiedBy] INTEGER,
    [Status] INTEGER,
    CONSTRAINT [PK_UserDetails] PRIMARY KEY ([UserId])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "CandidateDetails"                                           */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [CandidateDetails] (
    [CandidateId] INTEGER IDENTITY(1,1) NOT NULL,
    [FirstName] VARCHAR(31),
    [LastName] VARCHAR(31),
    [Email] VARCHAR(31),
    [DesignationId] INTEGER NOT NULL,
    [AppliedFor] INTEGER NOT NULL,
    [ContactNumber] VARCHAR(15),
    [Address] VARCHAR(255),
    [UserName] VARCHAR(31),
    [Experience] FLOAT,
    [Location] VARCHAR(31),
    [CurrentCtc] VARCHAR(7),
    [ExpectedCtc] VARCHAR(7),
    [CurrentCompany] VARCHAR(31),
    [NoticePeriod] FLOAT,
    [ResumePath] VARCHAR(31),
    [CreatedDate] DATETIME,
    [CreatedBy] INTEGER NOT NULL,
    [ModifiedDate] DATETIME,
    [ModifiedBy] INTEGER NOT NULL,
    [Status] INTEGER,
    CONSTRAINT [PK_CandidateDetails] PRIMARY KEY ([CandidateId])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "CandidateSkills"                                            */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [CandidateSkills] (
    [CandidateSkillId] INTEGER IDENTITY(1,1) NOT NULL,
    [CandidateId] INTEGER NOT NULL,
    [SkillId] INTEGER NOT NULL,
    [CreatedDate] DATETIME,
    [CreatedBy] INTEGER NOT NULL,
    [ModifiedDate] DATETIME,
    [ModifiedBy] INTEGER NOT NULL,
    [Status] INTEGER,
    CONSTRAINT [PK_CandidateSkills] PRIMARY KEY ([CandidateSkillId])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "Schedule"                                                   */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [Schedule] (
    [ScheduleId] INTEGER IDENTITY(1,1) NOT NULL,
    [CandidateId] INTEGER NOT NULL,
    [InterviewRoundId] INTEGER NOT NULL,
    [ScheduleDate] DATE,
    [ScheduleTime] TIME,
    [PanelId] INTEGER NOT NULL,
    [CreatedDate] DATETIME,
    [ModifiedDate] DATETIME,
    [Status] INTEGER,
    CONSTRAINT [PK_Schedule] PRIMARY KEY ([ScheduleId])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "PanelMembers"                                               */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [PanelMembers] (
    [PanelMemberId] INTEGER IDENTITY(1,1) NOT NULL,
    [PanelId] INTEGER NOT NULL,
    [UserId] INTEGER NOT NULL,
    [CreatedDate] DATETIME,
    [ModifiedDate] DATETIME,
    [Status] INTEGER,
    CONSTRAINT [PK_PanelMembers] PRIMARY KEY ([PanelMemberId])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "Review"                                                     */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [Review] (
    [ReviewId] INTEGER IDENTITY(1,1) NOT NULL,
    [ScheduleId] INTEGER NOT NULL,
    [StatusId] INTEGER NOT NULL,
    [ReviewedBy] INTEGER NOT NULL,
    [Comments] VARCHAR(255),
    [CreatedDate] DATETIME,
    [CreatedBy] INTEGER,
    [ModifiedDate] DATETIME,
    [ModifiedBy] INTEGER,
    [Status] INTEGER,
    CONSTRAINT [PK_Review] PRIMARY KEY ([ReviewId])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "RateSkills"                                                 */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [RateSkills] (
    [RateId] INTEGER IDENTITY(1,1) NOT NULL,
    [ReviewId] INTEGER NOT NULL,
    [SkillId] INTEGER NOT NULL,
    [Score] VARCHAR(2),
    [CreatedDate] DATETIME,
    [ModifiedDate] DATETIME,
    [Status] INTEGER,
    CONSTRAINT [PK_RateSkills] PRIMARY KEY ([RateId])
)
GO


/* ---------------------------------------------------------------------- */
/* Add foreign key constraints                                            */
/* ---------------------------------------------------------------------- */

GO


ALTER TABLE [UserDetails] ADD CONSTRAINT [Roles_UserDetails] 
    FOREIGN KEY ([RoleId]) REFERENCES [Roles] ([RoleId])
GO


ALTER TABLE [UserDetails] ADD CONSTRAINT [Designation_UserDetails] 
    FOREIGN KEY ([DesignationId]) REFERENCES [Designation] ([DesignationId])
GO


ALTER TABLE [CandidateDetails] ADD CONSTRAINT [Designation_CandidateDetails] 
    FOREIGN KEY ([DesignationId]) REFERENCES [Designation] ([DesignationId])
GO


ALTER TABLE [CandidateDetails] ADD CONSTRAINT [UserDetails_CandidateDetails] 
    FOREIGN KEY ([CreatedBy]) REFERENCES [UserDetails] ([UserId])
GO


ALTER TABLE [CandidateDetails] ADD CONSTRAINT [UserDetails_CandidateDetails] 
    FOREIGN KEY ([ModifiedBy]) REFERENCES [UserDetails] ([UserId])
GO


ALTER TABLE [CandidateDetails] ADD CONSTRAINT [JobVacancy_CandidateDetails] 
    FOREIGN KEY ([AppliedFor]) REFERENCES [JobVacancy] ([JobVacancyId])
GO


ALTER TABLE [CandidateSkills] ADD CONSTRAINT [CandidateDetails_CandidateSkills] 
    FOREIGN KEY ([CandidateId]) REFERENCES [CandidateDetails] ([CandidateId])
GO


ALTER TABLE [CandidateSkills] ADD CONSTRAINT [Skills_CandidateSkills] 
    FOREIGN KEY ([SkillId]) REFERENCES [Skills] ([SkillId])
GO


ALTER TABLE [CandidateSkills] ADD CONSTRAINT [UserDetails_CandidateSkills] 
    FOREIGN KEY ([CreatedBy]) REFERENCES [UserDetails] ([UserId])
GO


ALTER TABLE [CandidateSkills] ADD CONSTRAINT [UserDetails_CandidateSkills] 
    FOREIGN KEY ([ModifiedBy]) REFERENCES [UserDetails] ([UserId])
GO


ALTER TABLE [InterviewRounds] ADD CONSTRAINT [InterviewTypes_InterviewRounds] 
    FOREIGN KEY ([InterviewTypeId]) REFERENCES [InterviewTypes] ([InterviewTypeId])
GO


ALTER TABLE [InterviewRounds] ADD CONSTRAINT [JobVacancy_InterviewRounds] 
    FOREIGN KEY ([JobId]) REFERENCES [JobVacancy] ([JobVacancyId])
GO


ALTER TABLE [InterviewSkills] ADD CONSTRAINT [InterviewRounds_InterviewSkills] 
    FOREIGN KEY ([InterviewRoundId]) REFERENCES [InterviewRounds] ([InterviewRoundId])
GO


ALTER TABLE [InterviewSkills] ADD CONSTRAINT [Skills_InterviewSkills] 
    FOREIGN KEY ([SkillId]) REFERENCES [Skills] ([SkillId])
GO


ALTER TABLE [Schedule] ADD CONSTRAINT [Panel_Schedule] 
    FOREIGN KEY ([PanelId]) REFERENCES [Panel] ([PanelId])
GO


ALTER TABLE [Schedule] ADD CONSTRAINT [CandidateDetails_Schedule] 
    FOREIGN KEY ([CandidateId]) REFERENCES [CandidateDetails] ([CandidateId])
GO


ALTER TABLE [Schedule] ADD CONSTRAINT [InterviewRounds_Schedule] 
    FOREIGN KEY ([InterviewRoundId]) REFERENCES [InterviewRounds] ([InterviewRoundId])
GO


ALTER TABLE [PanelMembers] ADD CONSTRAINT [UserDetails_PanelMembers] 
    FOREIGN KEY ([UserId]) REFERENCES [UserDetails] ([UserId])
GO


ALTER TABLE [PanelMembers] ADD CONSTRAINT [Panel_PanelMembers] 
    FOREIGN KEY ([PanelId]) REFERENCES [Panel] ([PanelId])
GO


ALTER TABLE [Review] ADD CONSTRAINT [Schedule_Review] 
    FOREIGN KEY ([ScheduleId]) REFERENCES [Schedule] ([ScheduleId])
GO


ALTER TABLE [Review] ADD CONSTRAINT [Status_Review] 
    FOREIGN KEY ([StatusId]) REFERENCES [Status] ([StatusId])
GO


ALTER TABLE [Review] ADD CONSTRAINT [UserDetails_Review] 
    FOREIGN KEY ([ReviewedBy]) REFERENCES [UserDetails] ([UserId])
GO


ALTER TABLE [RateSkills] ADD CONSTRAINT [Review_RateSkills] 
    FOREIGN KEY ([ReviewId]) REFERENCES [Review] ([ReviewId])
GO


ALTER TABLE [RateSkills] ADD CONSTRAINT [Skills_RateSkills] 
    FOREIGN KEY ([SkillId]) REFERENCES [Skills] ([SkillId])
GO


ALTER TABLE [Filter] ADD CONSTRAINT [Pages_Filter] 
    FOREIGN KEY ([PageId]) REFERENCES [Pages] ([PageId])
GO


ALTER TABLE [ControlFields] ADD CONSTRAINT [FieldControlTypes_ControlFields] 
    FOREIGN KEY ([ControlTypeId]) REFERENCES [FieldControlTypes] ([ControlTypeId])
GO


ALTER TABLE [ControlFields] ADD CONSTRAINT [Pages_ControlFields] 
    FOREIGN KEY ([PageId]) REFERENCES [Pages] ([PageId])
GO


ALTER TABLE [Fields] ADD CONSTRAINT [ControlFields_Fields] 
    FOREIGN KEY ([ControlId]) REFERENCES [ControlFields] ([ControlId])
GO


ALTER TABLE [Fields] ADD CONSTRAINT [FieldTypes_Fields] 
    FOREIGN KEY ([TypeId]) REFERENCES [FieldTypes] ([TypeId])
GO


ALTER TABLE [Fields] ADD CONSTRAINT [RegularExpressions_Fields] 
    FOREIGN KEY ([ExpId]) REFERENCES [RegularExpressions] ([ExpId])
GO


ALTER TABLE [DefaultValues] ADD CONSTRAINT [Fields_DefaultValues] 
    FOREIGN KEY ([FieldId]) REFERENCES [Fields] ([FieldId])
GO


ALTER TABLE [FieldValues] ADD CONSTRAINT [DefaultValues_FieldValues] 
    FOREIGN KEY ([DefaultValueId], [FieldId]) REFERENCES [DefaultValues] ([DefaultValueId],[FieldId])
GO

