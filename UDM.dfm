object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 196
  Width = 310
  object Con_SAF: TADOConnection
    ConnectionString = 
      'Provider=SQLNCLI10.1;Integrated Security="";Persist Security Inf' +
      'o=False;User ID=sa;Initial Catalog=SAF_SOLIDARITE;Data Source=12' +
      '7.0.0.1;Initial File Name="";Server SPN="";'
    LoginPrompt = False
    Provider = 'SQLNCLI10.1'
    Left = 32
    Top = 24
  end
  object Con_Radie: TADOConnection
    ConnectionString = 
      'Provider=SQLNCLI10.1;Integrated Security="";Persist Security Inf' +
      'o=False;User ID=sa;Initial Catalog=RADIE_PLUS;Data Source=127.0.' +
      '0.1;Initial File Name="";Server SPN="";'
    LoginPrompt = False
    Provider = 'SQLNCLI10.1'
    Left = 168
    Top = 24
  end
  object SQLConnection1: TSQLConnection
    DriverName = 'MySQL'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXMySQL'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver190.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=19.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXMySqlMetaDataCommandFactory,DbxMySQLDr' +
        'iver190.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXMySqlMetaDataCommandFact' +
        'ory,Borland.Data.DbxMySQLDriver,Version=19.0.0.0,Culture=neutral' +
        ',PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverMYSQL'
      'LibraryName=dbxmys.dll'
      'LibraryNameOsx=libsqlmys.dylib'
      'VendorLib=LIBMYSQL.dll'
      'VendorLibWin64=libmysql.dll'
      'VendorLibOsx=libmysqlclient.dylib'
      'HostName=127.0.0.1'
      'Database=radie_plus'
      'User_Name=root'
      'Password='
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'Compressed=False'
      'Encrypted=False'
      'BlobSize=-1'
      'ErrorResourceFile=')
    Left = 104
    Top = 88
  end
end
