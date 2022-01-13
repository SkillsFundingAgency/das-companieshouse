﻿CREATE TABLE [Stg].[CompaniesHouseData](
	[CompanyName]					[nvarchar](200) NULL,
	[CompanyNumber]					[nvarchar](50)	NULL,
	[RegAddressAddressLine1]		[nvarchar](200) NULL,
	[RegAddressAddressLine2]		[nvarchar](200) NULL,
	[RegAddressPostTown]			[nvarchar](100) NULL,
	[RegAddressCounty]				[nvarchar](50)	NULL,
	[RegAddressCountry]				[nvarchar](50)	NULL,
	[RegAddressPostCode]			[nvarchar](50)	NULL,
	[CompanyCategory]				[nvarchar](100) NULL,
	[CompanyStatus]					[nvarchar](100) NULL,
	[CountryOfOrigin]				[nvarchar](50)	NULL,
	[DissolutionDate]				[nvarchar](50)	NULL,
	[IncorporationDate]				[nvarchar](50)	NULL,
	[AccountsAccountRefDay]			[nvarchar](50)	NULL,
	[AccountsAccountRefMonth]		[nvarchar](50)	NULL,
	[AccountsNextDueDate]			[nvarchar](50)	NULL,
	[AccountsLastMadeUpDate]		[nvarchar](50)	NULL,
	[AccountsAccountCategory]		[nvarchar](200) NULL,
	[ReturnsNextDueDate]			[nvarchar](50)	NULL,
	[ReturnsLastMadeUpDate]			[nvarchar](50)	NULL,
	[MortgagesNumMortCharges]		[nvarchar](100) NULL,
	[MortgagesNumMortOutstanding]	[nvarchar](100) NULL,
	[MortgagesNumMortPartSatisfied] [nvarchar](100) NULL,
	[MortgagesNumMortSatisfied]		[nvarchar](100) NULL,
	[SICCodeSicText_1]				[nvarchar](250) NULL,
	[SICCodeSicText_2]				[nvarchar](250) NULL,
	[SICCodeSicText_3]				[nvarchar](250) NULL,
	[SICCodeSicText_4]				[nvarchar](250) NULL,
	[NumGenPartners]				[nvarchar](50)	NULL,
	[NumLimPartners]				[nvarchar](50)	NULL,
	[URI]							[nvarchar](200) NULL,
	[PreviousNameCONDATE]			[nvarchar](100) NULL,
	[PreviousNameCompanyName]		[nvarchar](200) NULL,
	[ConfStmtNextDueDate]			[nvarchar](50)	NULL,
	[ConfStmtLastMadeUpDate]		[nvarchar](50)	NULL,
	[ImportDateTime]				[datetime]		NULL
) ON [PRIMARY]
GO