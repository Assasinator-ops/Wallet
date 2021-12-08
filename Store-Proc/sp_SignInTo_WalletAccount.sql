CREATE PROCEDURE dbo.sp_SignInTo_WalletAccount
	@wuname nvarchar(25),
	@passwd nvarchar(50)
AS
BEGIN
	SELECT * FROM users FULL Join wallet on wallet.Wallet_Status_Code=users.User_Status_Code -- WHERE Wallet_User_Name = @wuname and Wallet_Password = @passwd
END
GO

-- w.User_Type, w.User_Status_Code, w.User_Type_Description