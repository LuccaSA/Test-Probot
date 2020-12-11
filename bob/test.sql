				IF EXISTS(SELECT 1 FROM sys.fulltext_indexes WHERE OBJECT_ID = OBJECT_ID('OrganizationStructure.JobQualifications'))
					DROP FULLTEXT INDEX ON [OrganizationStructure].[JobQualifications]
				IF EXISTS(SELECT 1 FROM sys.fulltext_indexes WHERE OBJECT_ID = OBJECT_ID('OrganizationStructure.JobLevels'))
					DROP FULLTEXT INDEX ON [OrganizationStructure].[JobLevels]
				IF EXISTS(SELECT 1 FROM sys.fulltext_indexes WHERE OBJECT_ID = OBJECT_ID('OrganizationStructure.Jobs'))
					DROP FULLTEXT INDEX ON [OrganizationStructure].[Jobs]
				GO
				CREATE FULLTEXT INDEX ON [OrganizationStructure].[JobQualifications]([Name])
					KEY INDEX PK_JobQualifications
					WITH STOPLIST = OFF
				CREATE FULLTEXT INDEX ON [OrganizationStructure].[JobLevels]([Name])
					KEY INDEX PK_JobLevels
					WITH STOPLIST = OFF
				CREATE FULLTEXT INDEX ON [OrganizationStructure].[Jobs]([Name])
					KEY INDEX PK_Jobs
					WITH STOPLIST = OFF
				GO
EXEC dbo.WaitForFullTextIndexing
				CREATE FULLTEXT INDEX ON [OrganizationStructure].[Jobs]([Name])
					KEY INDEX PK_Jobs
					WITH STOPLIST = OFF
				GO
