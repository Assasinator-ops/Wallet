CREATE DATABASE Wallet; 

use Wallet;

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

CREATE TABLE banks (
  Bank_ID UNIQUEIDENTIFIER PRIMARY KEY NOT NULL default NEWID(),
  Bank_Details varchar(128) NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table `ref_device_status`
--

CREATE TABLE ref_device_status (
  Device_Status_Code int PRIMARY KEY NOT NULL, -- 'Values are 0 or 1'
  Device_Status_Description varchar(128) NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table `ref_device_type`
--

CREATE TABLE ref_device_type (
  Device_Type_Code int PRIMARY KEY NOT NULL, -- 'Values are 0 or 1'
  Device_Type_Description varchar(128) NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table `ref_installer_status`
--

CREATE TABLE ref_installer_status (
  Installer_Status_Code int PRIMARY KEY NOT NULL, -- 'Values are 0 or 1'
  Installer_Status_Description varchar(128) NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table `ref_transaction_status`
--

CREATE TABLE ref_transaction_status (
  Transaction_Status_Code int PRIMARY KEY NOT NULL, -- 'Values are 0 or 1'
  Transaction_Status_Description varchar(128) NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table `ref_transaction_type`
--

CREATE TABLE ref_transaction_type (
  Transaction_Type_Code int PRIMARY KEY NOT NULL, -- 'Values are 0 or 1'
  Transaction_Type_Description varchar(128) NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table `ref_user_status`
--

CREATE TABLE ref_user_status (
  User_Status_Code int PRIMARY KEY NOT NULL, -- 'Values are either 0 or 1'
  User_Status_Description varchar(128) NOT NULL
);
-- --------------------------------------------------------

--
-- Table structure for table `user_type_app_programmer` & 'Individual user data packet.'
--

CREATE TABLE user_type_app_programmer (
  APU_Ref_Number int PRIMARY KEY NOT NULL IDENTITY(1,1),
  APU_First_Name varchar(25) NOT NULL,
  APU_Middle_Name varchar(25) NOT NULL,
  APU_Last_Name varchar(25) NOT NULL,
  APU_Age int NOT NULL,
  APU_Sex char(1) NOT NULL, -- 'M or F only'
  APU_Permissions int NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table `user_type_sophisticated`
--

CREATE TABLE user_type_sophisticated (
  SoU_Ref_Number int PRIMARY KEY NOT NULL IDENTITY(1,1),
  SoU_First_Name varchar(25) NOT NULL,
  SoU_Middle_Name varchar(25) NOT NULL,
  SoU_Last_Name varchar(25) NOT NULL,
  SoU_Age int NOT NULL,
  SoU_Sex char(1) NOT NULL, -- 'M or F only'
  SoU_Permissions int NOT NULL
);
-- --------------------------------------------------------

--
-- Table structure for table `user_type_specialized` & 'Individual user data packet.'
--

CREATE TABLE user_type_specialized (
  SpU_Ref_Number int PRIMARY KEY NOT NULL IDENTITY(1,1),
  SpU_First_Name varchar(25) NOT NULL,
  SpU_Middle_Name varchar(25) NOT NULL,
  SpU_Last_Name varchar(25) NOT NULL,
  SpU_Age int NOT NULL,
  SpU_Sex char(1) NOT NULL, -- 'M or F only'
  SpU_Permissions int NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table `user_type_stand_alone`
--

CREATE TABLE user_type_stand_alone (
  SAU_Ref_Number int PRIMARY KEY NOT NULL IDENTITY(1,1),
  SAU_First_Name varchar(25) NOT NULL,
  SAU_Middle_Name varchar(25) NOT NULL,
  SAU_Last_Name varchar(25) NOT NULL,
  SAU_Age int NOT NULL,
  SAU_Sex char(1) NOT NULL, -- 'M or F only'
  SAU_Permissions int NOT NULL
);
-- --------------------------------------------------------

--
-- Table structure for table `user_type_native`
--

CREATE TABLE user_type_native (
  NU_Ref_ID int PRIMARY KEY NOT NULL IDENTITY(1,1),
  NU_SubType int DEFAULT '0' NOT NULL, -- 'Values = 0 or 1'
  NU_Permissions int NOT NULL
);
-- --------------------------------------------------------

--
-- Table structure for table `user_type_native_0`
--

CREATE TABLE user_type_native_0 (
  NU0_SubRef_Number int PRIMARY KEY NOT NULL IDENTITY(1,1),
  NU0_First_Name varchar(25) NOT NULL,
  NU0_Middle_Name varchar(25) NOT NULL,
  NU0_Last_Name varchar(25) NOT NULL,
  NU0_Age int NOT NULL,
  NU0_Sex char(1) NOT NULL -- 'M or F only'
);

-- --------------------------------------------------------

--
-- Table structure for table `user_type_native_1`
--

CREATE TABLE user_type_native_1 (
  NU1_SubRef_Number int PRIMARY KEY NOT NULL IDENTITY(1,1),
  NU1_Name varchar(25) NOT NULL,
  NU1_Other_Details varchar(128) NOT NULL
);


-- --------------------------------------------------------

--
-- Table structure for table `ref_wallet_status`
--

CREATE TABLE ref_wallet_status (
  Wallet_Status_Code int PRIMARY KEY NOT NULL, -- 'Values are 0 or 1'
  Wallet_Status_Description varchar(128) NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table `ref_wallet_type`
--

CREATE TABLE ref_wallet_type (
  Wallet_Type_Code int PRIMARY KEY NOT NULL, -- 'Values are 0 or 1'
  Wallet_Type_Description varchar(128) NOT NULL
);


-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE users (
  User_ID UNIQUEIDENTIFIER PRIMARY KEY NOT NULL default NEWID(),
  User_Type int DEFAULT 'native0' NOT NULL, -- 'Values = 0 or 1' 
  User_Status_Code int FOREIGN KEY REFERENCES ref_user_status(User_Status_Code) NULL, -- 'Values = 0 or 1' FK
  User_Type_Description varchar(128) NOT NULL,
  User_Email varchar(32) NOT NULL,
  User_Reg_TimeStamp datetime NOT NULL DEFAULT(CURRENT_TIMESTAMP),
  User_Documentation_Path varchar(256) NOT NULL, -- 'Path of the Non individual user documentations',
  Signiture char(32) NOT NULL -- 'QR or auto generated signiture in the form of date + ID id formation encoding
);

-- --------------------------------------------------------

--
-- Table structure for table `user_profile_pic`
--

CREATE TABLE users_profile_pic (
  Pic_Number int PRIMARY KEY NOT NULL IDENTITY(1,1),
  User_ID UNIQUEIDENTIFIER FOREIGN KEY REFERENCES users(User_ID) NULL,
  Pic_Path varchar(128) NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table `user_profile_log`
--

CREATE TABLE users_profile_log (
  Log_Number int PRIMARY KEY NOT NULL IDENTITY(1,1),
  User_ID UNIQUEIDENTIFIER FOREIGN KEY REFERENCES users(User_ID) NULL,
  Last_Login datetime NOT NULL DEFAULT(CURRENT_TIMESTAMP),
  MAC_Address decimal(10,0) NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE ref_sessions (
  S_ID varchar(128) PRIMARY KEY NOT NULL,
  Host_Name varchar(128) NOT NULL,
  Time_Stamp datetime NOT NULL DEFAULT(CURRENT_TIMESTAMP),
  Session varchar(128) NOT NULL,
  User_ID UNIQUEIDENTIFIER FOREIGN KEY REFERENCES users(User_ID) NULL
);

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE addresses (
  DUNS_Number UNIQUEIDENTIFIER PRIMARY KEY NOT NULL default NEWID(),
  Cage_Code UNIQUEIDENTIFIER NOT NULL default NEWID(),
  User_ID UNIQUEIDENTIFIER FOREIGN KEY REFERENCES users(User_ID) NULL, -- FK
  Physical_Address varchar(25) NOT NULL DEFAULT 'Ethiopia', 
  Mailing_Address varchar(25) NOT NULL,
  Cellphone_1 int NOT NULL,
  Cellphone_2 int DEFAULT NULL,
  Land_line_phone int NULL,
  Other_Details varchar(128) NOT NULL -- 'Geo(absolute) location or other comparative location'
);


CREATE TABLE wallet_validity (
  Wallet_Validity_Number int PRIMARY KEY NOT NULL,
  Wallet_Registration_Purpose varchar(50) NOT NULL,
  Wallet_Record_Status char(1) NOT NULL,
  Wallet_Business_Start_Date datetime NOT NULL,
  Wallet_Registration_Date datetime NOT NULL DEFAULT(CURRENT_TIMESTAMP),
  Wallet_Expiration_Date datetime NOT NULL,
  Wallet_Update_Date datetime NOT NULL,
  Wallet_Activation_Date datetime NOT NULL,
  Wallet_Fiscal_Year_End datetime NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table `wallet`
--

CREATE TABLE wallet (
  Wallet_ID UNIQUEIDENTIFIER PRIMARY KEY NOT NULL default NEWID(),
  Wallet_User_Name varchar(25) NOT NULL,
  Wallet_Password varchar(128) NOT NULL,
  Wallet_Signiture UNIQUEIDENTIFIER NOT NULL,
  Wallet_Reg_TimeStamp datetime NOT NULL DEFAULT(CURRENT_TIMESTAMP),
  Wallet_Validity_Number int FOREIGN KEY REFERENCES wallet_validity(Wallet_Validity_Number) NULL,
  Wallet_Type_Code int FOREIGN KEY REFERENCES ref_wallet_type(Wallet_Type_Code) NULL, -- FK
  Wallet_Status_Code int FOREIGN KEY REFERENCES ref_wallet_status(Wallet_Status_Code) NULL, --FK
  Bank_ID UNIQUEIDENTIFIER FOREIGN KEY REFERENCES banks(Bank_ID) NULL, -- FK
  DUNS_Number UNIQUEIDENTIFIER FOREIGN KEY REFERENCES addresses(DUNS_Number) NULL -- FK
);

-- --------------------------------------------------------

--
-- Table structure for table `authentification`
--

CREATE TABLE authentification (
  Authentification_ID UNIQUEIDENTIFIER PRIMARY KEY NOT NULL default NEWID(),
  Wallet_ID UNIQUEIDENTIFIER FOREIGN KEY REFERENCES wallet(Wallet_ID) NULL, -- FK
  Authentification_Code int NOT NULL
);

-----------------------------------------------------------
-----------------------------------------------------------

--  Start from here!

-----------------------------------------------------------
-----------------------------------------------------------


-- --------------------------------------------------------

--
-- Table structure for table `installer`
--

CREATE TABLE installer (
  Installer_ID UNIQUEIDENTIFIER PRIMARY KEY NOT NULL default NEWID(),
  Installer_FName varchar(25) NOT NULL,
  Installer_MName varchar(25) NOT NULL,
  Installer_LName varchar(25) NOT NULL,
  Installer_Age int NOT NULL,
  Installer_Sex char(1) NOT NULL, -- 'F or M'
  Installer_Salary decimal(10,0) NOT NULL,
  Installer_Qualification_Documentation varchar(128) NOT NULL, -- 'Path of the installer documentation'
  Installer_Position varchar(25) NOT NULL,
  Installer_Cellphone_1 int NOT NULL,
  Installer_Cellphone_2 int DEFAULT NULL,
  Installer_Status_Code int FOREIGN KEY REFERENCES ref_installer_status(Installer_Status_Code) NULL -- FK
);

CREATE TABLE installer_profile_pic (
  Pic_Number int PRIMARY KEY NOT NULL IDENTITY(1,1),
  Installer_ID UNIQUEIDENTIFIER FOREIGN KEY REFERENCES installer(Installer_ID) NULL,
  Pic_Path varchar(128) NOT NULL
);

CREATE TABLE installer_log (
  Log_Number int PRIMARY KEY NOT NULL IDENTITY(1,1),
  Installer_ID UNIQUEIDENTIFIER FOREIGN KEY REFERENCES installer(Installer_ID) NULL,
  Last_Login datetime NOT NULL DEFAULT(CURRENT_TIMESTAMP),
  MAC_Address decimal(10,0) NOT NULL,
  Log_Success int NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table `merchant`
--

CREATE TABLE merchant (
  Merchant_ID UNIQUEIDENTIFIER PRIMARY KEY NOT NULL default NEWID(),
  User_ID UNIQUEIDENTIFIER FOREIGN KEY REFERENCES users(User_ID) NULL, -- FK
  Merchant_UserName varchar(25) NOT NULL,
  Merchant_Description varchar(128) NOT NULL
);

CREATE TABLE merchant_log (
  Log_Number int PRIMARY KEY NOT NULL IDENTITY(1,1),
  Merchant_ID UNIQUEIDENTIFIER FOREIGN KEY REFERENCES merchant(Merchant_ID) NULL,
  Wallet_ID UNIQUEIDENTIFIER FOREIGN KEY REFERENCES wallet(Wallet_ID) NULL,
  Last_Login datetime NOT NULL DEFAULT(CURRENT_TIMESTAMP),
  MAC_Address decimal(10,0) NOT NULL,
  Log_Success int NOT NULL DEFAULT '0'
);

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE transactions (
  Transaction_Number int PRIMARY KEY NOT NULL IDENTITY(1,1),
  Wallet_ID UNIQUEIDENTIFIER FOREIGN KEY REFERENCES wallet(Wallet_ID) NULL, -- FK
  Merchant_ID UNIQUEIDENTIFIER FOREIGN KEY REFERENCES merchant(Merchant_ID) NULL, -- FK
  Transaction_Type_Code int FOREIGN KEY REFERENCES ref_transaction_type(Transaction_Type_Code) NULL, -- FK
  Transaction_Status_Code int FOREIGN KEY REFERENCES ref_transaction_status(Transaction_Status_Code) NULL, -- FK
  Transaction_Amount decimal(10,0) NOT NULL,
  Transaction_TimeStamp datetime NOT NULL DEFAULT(CURRENT_TIMESTAMP),
  Transaction_QR_Gen UNIQUEIDENTIFIER NOT NULL,
  Transaction_Success int NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table `wallet_history`
--

CREATE TABLE wallet_history (
  Wallet_History_Number int PRIMARY KEY NOT NULL IDENTITY(1,1),
  Wallet_ID UNIQUEIDENTIFIER FOREIGN KEY REFERENCES wallet(Wallet_ID) NULL,
  Wallet_Ballance decimal(10,0) NOT NULL,
  Transaction_Number int FOREIGN KEY REFERENCES transactions(Transaction_Number) NULL
);

-- --------------------------------------------------------

--
-- Table structure for table `device`
--

CREATE TABLE device (
  Device_ID UNIQUEIDENTIFIER PRIMARY KEY NOT NULL default NEWID(),
  DUNS_Number UNIQUEIDENTIFIER FOREIGN KEY REFERENCES addresses(DUNS_Number) NULL,
  Device_Type_Code int FOREIGN KEY REFERENCES ref_device_type(Device_Type_Code) NULL, -- 'Values are 0 or 1' FK
  Device_Status_Code int FOREIGN KEY REFERENCES ref_device_status(Device_Status_Code) NULL, -- 'Values are 0 or 1' FK
  Installer_ID UNIQUEIDENTIFIER FOREIGN KEY REFERENCES installer(Installer_ID) NULL, --FK
  Merchant_ID UNIQUEIDENTIFIER FOREIGN KEY REFERENCES merchant(Merchant_ID) NULL, -- FK
  Transaction_Number int FOREIGN KEY REFERENCES transactions(Transaction_Number) NULL, -- FK
  Wallet_ID UNIQUEIDENTIFIER FOREIGN KEY REFERENCES wallet(Wallet_ID) DEFAULT NULL, -- FK
  QR_Code UNIQUEIDENTIFIER NOT NULL,
  Device_Serial_Key UNIQUEIDENTIFIER NOT NULL,
  Device_Warranty_Expire_Date datetime NOT NULL,
  Device_Purchased datetime NOT NULL,
  Device_Description varchar(100) NOT NULL
);

CREATE TABLE device_history (
  Log_Number int PRIMARY KEY NOT NULL IDENTITY(1,1),
  Device_ID UNIQUEIDENTIFIER FOREIGN KEY REFERENCES device(Device_ID) NULL,
  DUNS_Number UNIQUEIDENTIFIER FOREIGN KEY REFERENCES addresses(DUNS_Number) NULL,
  Device_Type_Code int FOREIGN KEY REFERENCES ref_device_type(Device_Type_Code) NULL,
  Device_Status_Code int FOREIGN KEY REFERENCES ref_device_status(Device_Status_Code) NULL,
  Installer_ID UNIQUEIDENTIFIER FOREIGN KEY REFERENCES installer(Installer_ID) NULL,
  Merchant_ID UNIQUEIDENTIFIER FOREIGN KEY REFERENCES merchant(Merchant_ID) NULL,
  Transaction_Number int FOREIGN KEY REFERENCES transactions(Transaction_Number) NULL,
  Wallet_ID UNIQUEIDENTIFIER FOREIGN KEY REFERENCES wallet(Wallet_ID) NULL,
  Log_Success int NOT NULL DEFAULT '0'
);

CREATE TABLE item (
  Item_ID UNIQUEIDENTIFIER PRIMARY KEY NOT NULL default NEWID(),
  Item_Description varchar(50) NOT NULL,
  Item_Characterstics varchar(50) NOT NULL,
  Item_Price decimal(10,0) NOT NULL,
  Item_QR_Code UNIQUEIDENTIFIER NOT NULL,
  Item_Image_0 varchar(128) NOT NULL,
  Item_Image_1 varchar(128) NOT NULL,
  Item_Image_2 varchar(128) NOT NULL
);

CREATE TABLE item_log (
  Log_Number int PRIMARY KEY NOT NULL IDENTITY(1,1),
  Item_ID UNIQUEIDENTIFIER FOREIGN KEY REFERENCES item(Item_ID) NULL,
  Wallet_ID UNIQUEIDENTIFIER FOREIGN KEY REFERENCES wallet(Wallet_ID) NULL,
  Merchant_ID UNIQUEIDENTIFIER FOREIGN KEY REFERENCES merchant(Merchant_ID) NULL,
  Transaction_Number int FOREIGN KEY REFERENCES transactions(Transaction_Number) NULL,
  Device_ID UNIQUEIDENTIFIER FOREIGN KEY REFERENCES device(Device_ID) NULL,
  Log_Success int NOT NULL DEFAULT '0'
);

--	-----------------------------------------------------------------
--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE addresses
  ADD Address_Number int IDENTITY(1,1);
--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE transactions
  ADD Transaction_Number int IDENTITY(1,1);
--
-- AUTO_INCREMENT for table `user_type_0`
--
ALTER TABLE user_type_0
  ADD IU_Ref_Number int IDENTITY(1,1);
--
-- AUTO_INCREMENT for table `user_type_1`
--
ALTER TABLE user_type_1
  ADD NIU_Ref_Number int IDENTITY(1,1);
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
