﻿CREATE TABLE dbo.CompaniesHouseData
(
        CompanyName								varchar(200), 
		CompanyNumber							varchar(50),
		RegAddressAddressLine1					varchar(200), 
		RegAddressAddressLine2					varchar(200), 
		RegAddressPostTown						varchar(100),
		RegAddressCounty						varchar(50),
		RegAddressCountry						varchar(50),
		RegAddressPostCode						varchar(50),
		CompanyCategory							varchar(100),
		CompanyStatus							varchar(100),
		CountryOfOrigin							varchar(50),
		DissolutionDate							Date,
		IncorporationDate						Date, 
		AccountsAccountRefDay					SmallInt, 
		AccountsAccountRefMonth					SmallInt,
		AccountsNextDueDate						Date,
		AccountsLastMadeUpDate					Date,
		AccountsAccountCategory					varchar(200),
		ReturnsNextDueDate						Date, 
		ReturnsLastMadeUpDate					Date,
		MortgagesNumMortCharges					SmallInt,
		MortgagesNumMortOutstanding				SmallInt,
		MortgagesNumMortPartSatisfied			SmallInt,
		MortgagesNumMortSatisfied				SmallInt,
		SICCodeSicText_1						varchar(250),
		SICCodeSicText_2						varchar(250),
		SICCodeSicText_3						varchar(250),
		SICCodeSicText_4						varchar(250),
		NumGenPartners							SmallInt,
		NumLimPartners							SmallInt,
		URI										varchar(200),
		PreviousNameCONDATE						Date,
		PreviousNameCompanyName					varchar(200),
		ConfStmtNextDueDate						Date,
		ConfStmtLastMadeUpDate					Date,
		ImportDateTime							DateTime ,
		ID                                      bigint,
		SourceFileName                          nvarchar(100)
);