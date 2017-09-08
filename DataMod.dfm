object DMod: TDMod
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 174
  Width = 261
  object FDConn: TFDConnection
    ConnectionName = 'DBAgenda'
    Params.Strings = (
      'DriverID=FB'
      
        'Database=D:\Users\Programaci'#243'n\Documents\Embarcadero\Studio\Proj' +
        'ects\Agenda personal\DBAGENDA.FDB'
      'User_Name=SYSDBA'
      'CharacterSet=ISO8859_1'
      'Password=masterkey')
    LoginPrompt = False
    Left = 24
    Top = 24
  end
  object Query: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'select * from config')
    Left = 88
    Top = 24
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 168
    Top = 24
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    VendorLib = 
      'D:\Users\Programaci'#243'n\Documents\Embarcadero\Studio\Projects\Agen' +
      'da personal\fbclient.dll'
    Left = 24
    Top = 96
  end
end
