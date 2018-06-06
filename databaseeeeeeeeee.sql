USE [scheduleInterview]
GO
/****** Object:  Table [dbo].[CandidateDetails]    Script Date: 06-06-2018 20:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CandidateDetails](
	[CandidateId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](31) NULL,
	[LastName] [varchar](31) NULL,
	[Email] [varchar](31) NULL,
	[DesignationId] [int] NOT NULL,
	[AppliedFor] [int] NOT NULL,
	[ContactNumber] [varchar](15) NULL,
	[Address] [varchar](255) NULL,
	[Experience] [varchar](50) NULL,
	[CurrentCtc] [varchar](20) NULL,
	[ExpectedCtc] [varchar](20) NULL,
	[CurrentCompany] [varchar](31) NULL,
	[NoticePeriod] [varchar](50) NULL,
	[ResumePath] [varchar](31) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NOT NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_CandidateDetails] PRIMARY KEY CLUSTERED 
(
	[CandidateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CandidateSkills]    Script Date: 06-06-2018 20:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CandidateSkills](
	[CandidateSkillId] [int] IDENTITY(1,1) NOT NULL,
	[CandidateId] [int] NOT NULL,
	[SkillId] [int] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NOT NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_CandidateSkills] PRIMARY KEY CLUSTERED 
(
	[CandidateSkillId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ControlFields]    Script Date: 06-06-2018 20:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ControlFields](
	[ControlId] [int] IDENTITY(1,1) NOT NULL,
	[LabelName] [varchar](15) NULL,
	[ControlTypeId] [int] NOT NULL,
	[ClassName] [varchar](15) NULL,
	[CreateDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[PageId] [int] NOT NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_ControlFields] PRIMARY KEY CLUSTERED 
(
	[ControlId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DefaultValues]    Script Date: 06-06-2018 20:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DefaultValues](
	[DefaultValueId] [int] IDENTITY(1,1) NOT NULL,
	[DefaultValue] [varchar](31) NULL,
	[OptionalLabel] [varchar](15) NULL,
	[FieldId] [int] NOT NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_DefaultValues] PRIMARY KEY CLUSTERED 
(
	[DefaultValueId] ASC,
	[FieldId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Designation]    Script Date: 06-06-2018 20:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Designation](
	[DesignationId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](31) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Designation] PRIMARY KEY CLUSTERED 
(
	[DesignationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FieldControlTypes]    Script Date: 06-06-2018 20:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FieldControlTypes](
	[ControlTypeId] [int] IDENTITY(1,1) NOT NULL,
	[ControlType] [varchar](15) NULL,
	[Createddate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_FieldControlTypes] PRIMARY KEY CLUSTERED 
(
	[ControlTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fields]    Script Date: 06-06-2018 20:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fields](
	[FieldId] [int] IDENTITY(1,1) NOT NULL,
	[ControlId] [int] NOT NULL,
	[TypeId] [int] NOT NULL,
	[ExpId] [int] NOT NULL,
	[FieldName] [varchar](15) NOT NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Fields] PRIMARY KEY CLUSTERED 
(
	[FieldId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FieldTypes]    Script Date: 06-06-2018 20:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FieldTypes](
	[TypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](15) NULL,
	[MultiValue] [bit] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_FieldTypes] PRIMARY KEY CLUSTERED 
(
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FieldValues]    Script Date: 06-06-2018 20:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FieldValues](
	[ValueId] [int] IDENTITY(1,1) NOT NULL,
	[DefaultValueId] [int] NOT NULL,
	[Values] [varchar](255) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[FieldId] [int] NOT NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_FieldValues] PRIMARY KEY CLUSTERED 
(
	[ValueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Filter]    Script Date: 06-06-2018 20:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Filter](
	[FilterId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](31) NULL,
	[PageId] [int] NOT NULL,
	[Active] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[Modifieddate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Filter] PRIMARY KEY CLUSTERED 
(
	[FilterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InterviewRounds]    Script Date: 06-06-2018 20:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InterviewRounds](
	[InterviewRoundId] [int] IDENTITY(1,1) NOT NULL,
	[JobId] [int] NOT NULL,
	[InterviewTypeId] [int] NOT NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_InterviewRounds] PRIMARY KEY CLUSTERED 
(
	[InterviewRoundId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InterviewSkills]    Script Date: 06-06-2018 20:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InterviewSkills](
	[InterviewSkillsId] [int] IDENTITY(1,1) NOT NULL,
	[InterviewRoundId] [int] NOT NULL,
	[SkillId] [int] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_InterviewSkills] PRIMARY KEY CLUSTERED 
(
	[InterviewSkillsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InterviewTypes]    Script Date: 06-06-2018 20:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InterviewTypes](
	[InterviewTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](31) NULL,
	[Description] [varchar](127) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_InterviewTypes] PRIMARY KEY CLUSTERED 
(
	[InterviewTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobVacancy]    Script Date: 06-06-2018 20:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobVacancy](
	[JobVacancyId] [int] IDENTITY(1,1) NOT NULL,
	[JobPosition] [varchar](31) NULL,
	[JobCode] [varchar](7) NULL,
	[JobDescription] [varchar](255) NULL,
	[JobResponsibilty] [varchar](255) NULL,
	[Vacancy] [varchar](2) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_JobVacancy] PRIMARY KEY CLUSTERED 
(
	[JobVacancyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pages]    Script Date: 06-06-2018 20:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pages](
	[PageId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](15) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Pages] PRIMARY KEY CLUSTERED 
(
	[PageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Panel]    Script Date: 06-06-2018 20:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Panel](
	[PanelId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](31) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Panel] PRIMARY KEY CLUSTERED 
(
	[PanelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PanelMembers]    Script Date: 06-06-2018 20:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PanelMembers](
	[PanelMemberId] [int] IDENTITY(1,1) NOT NULL,
	[PanelId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_PanelMembers] PRIMARY KEY CLUSTERED 
(
	[PanelMemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RateSkills]    Script Date: 06-06-2018 20:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RateSkills](
	[RateId] [int] IDENTITY(1,1) NOT NULL,
	[ReviewId] [int] NOT NULL,
	[SkillId] [int] NOT NULL,
	[Score] [varchar](2) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_RateSkills] PRIMARY KEY CLUSTERED 
(
	[RateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegularExpressions]    Script Date: 06-06-2018 20:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegularExpressions](
	[ExpId] [int] IDENTITY(1,1) NOT NULL,
	[ControlId] [int] NULL,
	[Expression] [varchar](63) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_RegularExpressions] PRIMARY KEY CLUSTERED 
(
	[ExpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 06-06-2018 20:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[ReviewId] [int] IDENTITY(1,1) NOT NULL,
	[ScheduleId] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
	[ReviewedBy] [int] NOT NULL,
	[Comments] [varchar](255) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Review] PRIMARY KEY CLUSTERED 
(
	[ReviewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 06-06-2018 20:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](15) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 06-06-2018 20:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[ScheduleId] [int] IDENTITY(1,1) NOT NULL,
	[CandidateId] [int] NOT NULL,
	[InterviewRoundId] [int] NOT NULL,
	[ScheduleDate] [date] NULL,
	[ScheduleTime] [time](7) NULL,
	[PanelId] [int] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Schedule] PRIMARY KEY CLUSTERED 
(
	[ScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skills]    Script Date: 06-06-2018 20:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skills](
	[SkillId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](31) NULL,
	[CreateDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Skills] PRIMARY KEY CLUSTERED 
(
	[SkillId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 06-06-2018 20:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[StatusId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](15) NULL,
	[CreateDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[Active] [int] NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TAccount]    Script Date: 06-06-2018 20:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TAccount](
	[Account_Id] [int] IDENTITY(1,1) NOT NULL,
	[Account_Name] [varchar](1) NULL,
	[Account_Address1] [varchar](1) NULL,
 CONSTRAINT [PK_TAccount] PRIMARY KEY CLUSTERED 
(
	[Account_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 06-06-2018 20:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDetails](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](31) NULL,
	[LastName] [varchar](31) NULL,
	[Email] [varchar](31) NULL,
	[DesignationId] [int] NOT NULL,
	[ContactNumber] [varchar](15) NULL,
	[UserName] [varchar](31) NULL,
	[Password] [varchar](100) NULL,
	[RoleId] [int] NOT NULL,
	[CreateDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CandidateDetails]  WITH CHECK ADD  CONSTRAINT [Designation_CandidateDetails] FOREIGN KEY([DesignationId])
REFERENCES [dbo].[Designation] ([DesignationId])
GO
ALTER TABLE [dbo].[CandidateDetails] CHECK CONSTRAINT [Designation_CandidateDetails]
GO
ALTER TABLE [dbo].[CandidateDetails]  WITH CHECK ADD  CONSTRAINT [JobVacancy_CandidateDetails] FOREIGN KEY([AppliedFor])
REFERENCES [dbo].[JobVacancy] ([JobVacancyId])
GO
ALTER TABLE [dbo].[CandidateDetails] CHECK CONSTRAINT [JobVacancy_CandidateDetails]
GO
ALTER TABLE [dbo].[CandidateDetails]  WITH CHECK ADD  CONSTRAINT [UserDetails_CandidateDetails] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[UserDetails] ([UserId])
GO
ALTER TABLE [dbo].[CandidateDetails] CHECK CONSTRAINT [UserDetails_CandidateDetails]
GO
ALTER TABLE [dbo].[CandidateSkills]  WITH CHECK ADD  CONSTRAINT [CandidateDetails_CandidateSkills] FOREIGN KEY([CandidateId])
REFERENCES [dbo].[CandidateDetails] ([CandidateId])
GO
ALTER TABLE [dbo].[CandidateSkills] CHECK CONSTRAINT [CandidateDetails_CandidateSkills]
GO
ALTER TABLE [dbo].[CandidateSkills]  WITH CHECK ADD  CONSTRAINT [Skills_CandidateSkills] FOREIGN KEY([SkillId])
REFERENCES [dbo].[Skills] ([SkillId])
GO
ALTER TABLE [dbo].[CandidateSkills] CHECK CONSTRAINT [Skills_CandidateSkills]
GO
ALTER TABLE [dbo].[CandidateSkills]  WITH CHECK ADD  CONSTRAINT [UserDetails_CandidateSkills] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[UserDetails] ([UserId])
GO
ALTER TABLE [dbo].[CandidateSkills] CHECK CONSTRAINT [UserDetails_CandidateSkills]
GO
ALTER TABLE [dbo].[ControlFields]  WITH CHECK ADD  CONSTRAINT [FieldControlTypes_ControlFields] FOREIGN KEY([ControlTypeId])
REFERENCES [dbo].[FieldControlTypes] ([ControlTypeId])
GO
ALTER TABLE [dbo].[ControlFields] CHECK CONSTRAINT [FieldControlTypes_ControlFields]
GO
ALTER TABLE [dbo].[ControlFields]  WITH CHECK ADD  CONSTRAINT [Pages_ControlFields] FOREIGN KEY([PageId])
REFERENCES [dbo].[Pages] ([PageId])
GO
ALTER TABLE [dbo].[ControlFields] CHECK CONSTRAINT [Pages_ControlFields]
GO
ALTER TABLE [dbo].[DefaultValues]  WITH CHECK ADD  CONSTRAINT [Fields_DefaultValues] FOREIGN KEY([FieldId])
REFERENCES [dbo].[Fields] ([FieldId])
GO
ALTER TABLE [dbo].[DefaultValues] CHECK CONSTRAINT [Fields_DefaultValues]
GO
ALTER TABLE [dbo].[Fields]  WITH CHECK ADD  CONSTRAINT [ControlFields_Fields] FOREIGN KEY([ControlId])
REFERENCES [dbo].[ControlFields] ([ControlId])
GO
ALTER TABLE [dbo].[Fields] CHECK CONSTRAINT [ControlFields_Fields]
GO
ALTER TABLE [dbo].[Fields]  WITH CHECK ADD  CONSTRAINT [FieldTypes_Fields] FOREIGN KEY([TypeId])
REFERENCES [dbo].[FieldTypes] ([TypeId])
GO
ALTER TABLE [dbo].[Fields] CHECK CONSTRAINT [FieldTypes_Fields]
GO
ALTER TABLE [dbo].[Fields]  WITH CHECK ADD  CONSTRAINT [RegularExpressions_Fields] FOREIGN KEY([ExpId])
REFERENCES [dbo].[RegularExpressions] ([ExpId])
GO
ALTER TABLE [dbo].[Fields] CHECK CONSTRAINT [RegularExpressions_Fields]
GO
ALTER TABLE [dbo].[FieldValues]  WITH CHECK ADD  CONSTRAINT [DefaultValues_FieldValues] FOREIGN KEY([DefaultValueId], [FieldId])
REFERENCES [dbo].[DefaultValues] ([DefaultValueId], [FieldId])
GO
ALTER TABLE [dbo].[FieldValues] CHECK CONSTRAINT [DefaultValues_FieldValues]
GO
ALTER TABLE [dbo].[Filter]  WITH CHECK ADD  CONSTRAINT [Pages_Filter] FOREIGN KEY([PageId])
REFERENCES [dbo].[Pages] ([PageId])
GO
ALTER TABLE [dbo].[Filter] CHECK CONSTRAINT [Pages_Filter]
GO
ALTER TABLE [dbo].[InterviewRounds]  WITH CHECK ADD  CONSTRAINT [InterviewTypes_InterviewRounds] FOREIGN KEY([InterviewTypeId])
REFERENCES [dbo].[InterviewTypes] ([InterviewTypeId])
GO
ALTER TABLE [dbo].[InterviewRounds] CHECK CONSTRAINT [InterviewTypes_InterviewRounds]
GO
ALTER TABLE [dbo].[InterviewRounds]  WITH CHECK ADD  CONSTRAINT [JobVacancy_InterviewRounds] FOREIGN KEY([JobId])
REFERENCES [dbo].[JobVacancy] ([JobVacancyId])
GO
ALTER TABLE [dbo].[InterviewRounds] CHECK CONSTRAINT [JobVacancy_InterviewRounds]
GO
ALTER TABLE [dbo].[InterviewSkills]  WITH CHECK ADD  CONSTRAINT [InterviewRounds_InterviewSkills] FOREIGN KEY([InterviewRoundId])
REFERENCES [dbo].[InterviewRounds] ([InterviewRoundId])
GO
ALTER TABLE [dbo].[InterviewSkills] CHECK CONSTRAINT [InterviewRounds_InterviewSkills]
GO
ALTER TABLE [dbo].[InterviewSkills]  WITH CHECK ADD  CONSTRAINT [Skills_InterviewSkills] FOREIGN KEY([SkillId])
REFERENCES [dbo].[Skills] ([SkillId])
GO
ALTER TABLE [dbo].[InterviewSkills] CHECK CONSTRAINT [Skills_InterviewSkills]
GO
ALTER TABLE [dbo].[PanelMembers]  WITH CHECK ADD  CONSTRAINT [Panel_PanelMembers] FOREIGN KEY([PanelId])
REFERENCES [dbo].[Panel] ([PanelId])
GO
ALTER TABLE [dbo].[PanelMembers] CHECK CONSTRAINT [Panel_PanelMembers]
GO
ALTER TABLE [dbo].[PanelMembers]  WITH CHECK ADD  CONSTRAINT [UserDetails_PanelMembers] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserDetails] ([UserId])
GO
ALTER TABLE [dbo].[PanelMembers] CHECK CONSTRAINT [UserDetails_PanelMembers]
GO
ALTER TABLE [dbo].[RateSkills]  WITH CHECK ADD  CONSTRAINT [Review_RateSkills] FOREIGN KEY([ReviewId])
REFERENCES [dbo].[Review] ([ReviewId])
GO
ALTER TABLE [dbo].[RateSkills] CHECK CONSTRAINT [Review_RateSkills]
GO
ALTER TABLE [dbo].[RateSkills]  WITH CHECK ADD  CONSTRAINT [Skills_RateSkills] FOREIGN KEY([SkillId])
REFERENCES [dbo].[Skills] ([SkillId])
GO
ALTER TABLE [dbo].[RateSkills] CHECK CONSTRAINT [Skills_RateSkills]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [Schedule_Review] FOREIGN KEY([ScheduleId])
REFERENCES [dbo].[Schedule] ([ScheduleId])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [Schedule_Review]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [Status_Review] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [Status_Review]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [UserDetails_Review] FOREIGN KEY([ReviewedBy])
REFERENCES [dbo].[UserDetails] ([UserId])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [UserDetails_Review]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [CandidateDetails_Schedule] FOREIGN KEY([CandidateId])
REFERENCES [dbo].[CandidateDetails] ([CandidateId])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [CandidateDetails_Schedule]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [InterviewRounds_Schedule] FOREIGN KEY([InterviewRoundId])
REFERENCES [dbo].[InterviewRounds] ([InterviewRoundId])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [InterviewRounds_Schedule]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [Panel_Schedule] FOREIGN KEY([PanelId])
REFERENCES [dbo].[Panel] ([PanelId])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [Panel_Schedule]
GO
ALTER TABLE [dbo].[UserDetails]  WITH CHECK ADD  CONSTRAINT [Designation_UserDetails] FOREIGN KEY([DesignationId])
REFERENCES [dbo].[Designation] ([DesignationId])
GO
ALTER TABLE [dbo].[UserDetails] CHECK CONSTRAINT [Designation_UserDetails]
GO
ALTER TABLE [dbo].[UserDetails]  WITH CHECK ADD  CONSTRAINT [Roles_UserDetails] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[UserDetails] CHECK CONSTRAINT [Roles_UserDetails]
GO
