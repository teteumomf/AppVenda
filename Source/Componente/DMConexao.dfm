object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 378
  Width = 329
  object FDConexao: TFDConnection
    Params.Strings = (
      'Database=wkvenda'
      'User_Name=root'
      'Password=1234'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 184
    Top = 144
  end
  object FDTransaction: TFDTransaction
    Connection = FDConexao
    Left = 144
    Top = 280
  end
  object DriverMySQl: TFDPhysMySQLDriverLink
    VendorLib = 
      'C:\Users\mathe\Documents\Embarcadero\Studio\Projects\WKVenda\lib' +
      'mysql.dll'
    Left = 64
    Top = 152
  end
end
