object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 688
  ClientWidth = 1051
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 105
    Width = 1051
    Height = 216
    Align = alTop
    TabOrder = 0
    object lblNomeCliente: TLabel
      Left = 200
      Top = 8
      Width = 61
      Height = 13
      Caption = 'Nome cliente'
    end
    object Label2: TLabel
      Left = 368
      Top = 8
      Width = 33
      Height = 13
      Caption = 'Cidade'
    end
    object Label3: TLabel
      Left = 536
      Top = 8
      Width = 33
      Height = 13
      Caption = 'Estado'
    end
    object Label4: TLabel
      Left = 48
      Top = 99
      Width = 74
      Height = 13
      Caption = 'C'#243'digo produto'
    end
    object Label5: TLabel
      Left = 192
      Top = 99
      Width = 87
      Height = 13
      Caption = 'Descri'#231#227'o produto'
    end
    object Label6: TLabel
      Left = 360
      Top = 99
      Width = 56
      Height = 13
      Caption = 'Quantidade'
    end
    object Label7: TLabel
      Left = 520
      Top = 99
      Width = 64
      Height = 13
      Caption = 'Valor Unit'#225'rio'
    end
    object lblCodCliente: TLabel
      Left = 56
      Top = 8
      Width = 69
      Height = 13
      Caption = 'C'#243'digo Cliente'
    end
    object edCodCliente: TEdit
      Left = 40
      Top = 27
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object Edit1: TEdit
      Left = 184
      Top = 27
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'Edit1'
    end
    object Edit2: TEdit
      Left = 336
      Top = 27
      Width = 121
      Height = 21
      TabOrder = 2
      Text = 'Edit2'
    end
    object Edit3: TEdit
      Left = 504
      Top = 27
      Width = 121
      Height = 21
      TabOrder = 3
      Text = 'Edit2'
    end
    object Edit4: TEdit
      Left = 40
      Top = 119
      Width = 121
      Height = 21
      TabOrder = 4
    end
    object Edit5: TEdit
      Left = 184
      Top = 119
      Width = 121
      Height = 21
      TabOrder = 5
      Text = 'Edit1'
    end
    object Edit6: TEdit
      Left = 336
      Top = 119
      Width = 121
      Height = 21
      TabOrder = 6
      Text = 'Edit2'
    end
    object Edit7: TEdit
      Left = 504
      Top = 119
      Width = 121
      Height = 21
      TabOrder = 7
      Text = 'Edit2'
    end
    object Button1: TButton
      Left = 200
      Top = 168
      Width = 75
      Height = 25
      Caption = 'Inserir'
      TabOrder = 8
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1051
    Height = 105
    Align = alTop
    Caption = 'Panel2'
    TabOrder = 1
  end
  object Panel3: TPanel
    Left = 0
    Top = 321
    Width = 1051
    Height = 367
    Align = alClient
    Caption = 'Panel3'
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 1049
      Height = 365
      Align = alClient
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
end
