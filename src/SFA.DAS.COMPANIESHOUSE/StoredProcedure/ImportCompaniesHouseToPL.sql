CREATE PROCEDURE [dbo].[ImportCompaniesHouseToPL]
(
   @RunId int
)
AS
-- ==========================================================================================================
-- Author:      Sarma Evani
-- Description: Import to [dbo].[CompaniesHouseData] PL table 
-- ==========================================================================================================
BEGIN TRY
		DECLARE @LogID int	    
		/* Start Logging Execution */

			  INSERT INTO Mgmt.Log_Execution_Results
				  (
					RunId
				   ,StepNo
				   ,StoredProcedureName
				   ,StartDateTime
				   ,Execution_Status
				  )
			  SELECT 
					@RunId
				   ,'Step-2'
				   ,'ImportCompaniesHouseDataToPL'
				   ,getdate()
				   ,0

			  SELECT @LogID=MAX(LogId) FROM Mgmt.Log_Execution_Results
			  WHERE StoredProcedureName='ImportCompaniesHouseDataToPL'
			  AND RunId=@RunID

		BEGIN TRANSACTION

		DELETE FROM [dbo].[CompaniesHouseData]
		INSERT INTO [dbo].[CompaniesHouseData]
						   ([CompanyName]
						   ,[CompanyNumber]
						   ,[RegAddressAddressLine1]
						   ,[RegAddressAddressLine2]
						   ,[RegAddressPostTown]
						   ,[RegAddressCounty]
						   ,[RegAddressCountry]
						   ,[RegAddressPostCode]
						   ,[CompanyCategory]
						   ,[CompanyStatus]
						   ,[CountryOfOrigin]
						   ,[DissolutionDate]
						   ,[IncorporationDate]
						   ,[AccountsAccountRefDay]
						   ,[AccountsAccountRefMonth]
						   ,[AccountsNextDueDate]
						   ,[AccountsLastMadeUpDate]
						   ,[AccountsAccountCategory]
						   ,[ReturnsNextDueDate]
						   ,[ReturnsLastMadeUpDate]
						   ,[MortgagesNumMortCharges]
						   ,[MortgagesNumMortOutstanding]
						   ,[MortgagesNumMortPartSatisfied]
						   ,[MortgagesNumMortSatisfied]
						   ,[SICCodeSicText_1]
						   ,[SICCodeSicText_2]
						   ,[SICCodeSicText_3]
						   ,[SICCodeSicText_4]
						   ,[NumGenPartners]
						   ,[NumLimPartners]
						   ,[URI]
						   ,[PreviousNameCONDATE]
						   ,[PreviousNameCompanyName]
						   ,[ConfStmtNextDueDate]
						   ,[ConfStmtLastMadeUpDate])
				SELECT [CompanyName]
					  ,[CompanyNumber]
					  ,[RegAddressAddressLine1]
					  ,[RegAddressAddressLine2]
					  ,[RegAddressPostTown]
					  ,[RegAddressCounty]
					  ,[RegAddressCountry]
					  ,[RegAddressPostCode]
					  ,[CompanyCategory]
					  ,[CompanyStatus]
					  ,[CountryOfOrigin]
					  ,try_convert(date,[DissolutionDate],105) As [DissolutionDate]
					  ,try_convert(date,[IncorporationDate],105) As [IncorporationDate]
					  ,try_convert(smallint,[AccountsAccountRefDay]) As [AccountsAccountRefDay]
					  ,try_convert(smallint,[AccountsAccountRefMonth]) As [AccountsAccountRefMonth]
					  ,try_convert(date,[AccountsNextDueDate],105) As [AccountsNextDueDate]
					  ,try_convert(date,[AccountsLastMadeUpDate],105) As [AccountsLastMadeUpDate] 
					  ,[AccountsAccountCategory]
					  ,try_convert(date,[ReturnsNextDueDate],105) As [ReturnsNextDueDate]  
					  ,try_convert(date,[ReturnsLastMadeUpDate],105) As [ReturnsLastMadeUpDate]
					  ,try_convert(smallint,[MortgagesNumMortCharges]) As [MortgagesNumMortCharges]
					  ,try_convert(smallint,[MortgagesNumMortOutstanding]) As [MortgagesNumMortOutstanding]
					  ,try_convert(smallint,[MortgagesNumMortPartSatisfied]) As [MortgagesNumMortPartSatisfied]
					  ,try_convert(smallint,[MortgagesNumMortSatisfied]) As [MortgagesNumMortSatisfied]
					  ,[SICCodeSicText_1]
					  ,[SICCodeSicText_2]
					  ,[SICCodeSicText_3]
					  ,[SICCodeSicText_4]
					  ,try_convert(smallint,[NumGenPartners]) As [NumGenPartners]
					  ,try_convert(smallint,[NumLimPartners]) As [NumLimPartners]
					  ,[URI]
					  ,try_convert(date,[PreviousNameCONDATE],105) As [PreviousNameCONDATE]
					  ,[PreviousNameCompanyName]
					  ,try_convert(date,[ConfStmtNextDueDate],105) As [ConfStmtNextDueDate]
					  ,try_convert(date,[ConfStmtLastMadeUpDate],105) As [ConfStmtLastMadeUpDate]					  
				  FROM [Stg].[CompaniesHouseData]

				  IF  EXISTS (select * from INFORMATION_SCHEMA.TABLES  where table_name ='CompaniesHouseData' AND TABLE_SCHEMA='Stg' AND TABLE_TYPE='BASE TABLE')
				  TRUNCATE TABLE [Stg].[CompaniesHouseData]
				
			COMMIT TRANSACTION

					UPDATE Mgmt.Log_Execution_Results
					   SET Execution_Status=1
						  ,EndDateTime=getdate()
						  ,FullJobStatus='Finish'
					 WHERE LogId=@LogID
					   AND RunId=@RunId
				 				  
END TRY
BEGIN CATCH
			IF @@TRANCOUNT>0
			ROLLBACK TRANSACTION;

			DECLARE @ErrorId int

		  INSERT INTO Mgmt.Log_Error_Details
			  (UserName
			  ,ErrorNumber
			  ,ErrorState
			  ,ErrorSeverity
			  ,ErrorLine
			  ,ErrorProcedure
			  ,ErrorMessage
			  ,ErrorDateTime
			  ,RunId
			  )
		  SELECT 
				SUSER_SNAME(),
				ERROR_NUMBER(),
				ERROR_STATE(),
				ERROR_SEVERITY(),
				ERROR_LINE(),
				'ImportCompaniesHouseDataToPL',
				ERROR_MESSAGE(),
				GETDATE(),
				@RunId as RunId; 

		  SELECT @ErrorId=MAX(ErrorId) FROM Mgmt.Log_Error_Details

		/* Update Log Execution Results as Fail if there is an Error*/

		UPDATE Mgmt.Log_Execution_Results
		   SET Execution_Status=0
			  ,EndDateTime=getdate()
			  ,ErrorId=@ErrorId
		 WHERE LogId=@LogID
		   AND RunID=@RunId
END CATCH