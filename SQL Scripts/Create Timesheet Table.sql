
GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "deltatimeMS"
:setvar DefaultFilePrefix "deltatimeMS"
:setvar DefaultDataPath "E:\MSSQL.MSSQLSERVER\DATA\"
:setvar DefaultLogPath "D:\MSSQL.MSSQLSERVER\DATA\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Rename refactoring operation with key  is skipped, element [dbo].[Table].[Id] (SqlSimpleColumn) will not be renamed to ProjectID';


GO

IF (SELECT OBJECT_ID('tempdb..#tmpErrors')) IS NOT NULL DROP TABLE #tmpErrors
GO
CREATE TABLE #tmpErrors (Error int)
GO
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
GO
BEGIN TRANSACTION
GO
PRINT N'Creating [dbo].[Timesheethrs]...';


GO
CREATE TABLE [dbo].[Timesheethrs] (
    [ProjectID]        INT       NOT NULL,
    [monday_hrs]       INT       NULL,
    [tuesday_hrs]      INT       NULL,
    [wednesday_hrs]    INT       NULL,
    [thursday_hrs]     INT       NULL,
    [friday_hrs]       INT       NULL,
    [saturday_hrs]     INT       NULL,
    [sunday_hrs]       INT       NULL,
    [change_timestamp] TIMESTAMP NULL,
    PRIMARY KEY CLUSTERED ([ProjectID] ASC)
);


GO
IF @@ERROR <> 0
   AND @@TRANCOUNT > 0
    BEGIN
        ROLLBACK;
    END

IF @@TRANCOUNT = 0
    BEGIN
        INSERT  INTO #tmpErrors (Error)
        VALUES                 (1);
        BEGIN TRANSACTION;
    END


GO

IF EXISTS (SELECT * FROM #tmpErrors) ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT>0 BEGIN
PRINT N'The transacted portion of the database update succeeded.'
COMMIT TRANSACTION
END
ELSE PRINT N'The transacted portion of the database update failed.'
GO
DROP TABLE #tmpErrors
GO
PRINT N'Update complete.';


GO
