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
  object PanelB: TPanel
    Left = 0
    Top = 107
    Width = 1051
    Height = 216
    Align = alTop
    TabOrder = 0
    object lblNomeCliente: TLabel
      Left = 200
      Top = 40
      Width = 61
      Height = 13
      Caption = 'Nome cliente'
    end
    object lblCidade: TLabel
      Left = 368
      Top = 40
      Width = 33
      Height = 13
      Caption = 'Cidade'
    end
    object lblEstado: TLabel
      Left = 536
      Top = 40
      Width = 33
      Height = 13
      Caption = 'Estado'
    end
    object lblCodProduto: TLabel
      Left = 48
      Top = 99
      Width = 74
      Height = 13
      Caption = 'C'#243'digo produto'
    end
    object lblDescProduto: TLabel
      Left = 192
      Top = 99
      Width = 87
      Height = 13
      Caption = 'Descri'#231#227'o produto'
    end
    object lblQtd: TLabel
      Left = 360
      Top = 99
      Width = 56
      Height = 13
      Caption = 'Quantidade'
    end
    object lblValor: TLabel
      Left = 520
      Top = 99
      Width = 64
      Height = 13
      Caption = 'Valor Unit'#225'rio'
    end
    object lblCodCliente: TLabel
      Left = 56
      Top = 40
      Width = 69
      Height = 13
      Caption = 'C'#243'digo Cliente'
    end
    object lblPedido: TLabel
      Left = 472
      Top = 6
      Width = 140
      Height = 23
      Caption = 'Efetuar Pedido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblValorT: TLabel
      Left = 664
      Top = 99
      Width = 51
      Height = 13
      Caption = 'Valor Total'
    end
    object edCodCliente: TEdit
      Left = 40
      Top = 59
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = edCodClienteChange
    end
    object edNome: TEdit
      Left = 184
      Top = 59
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object edCidade: TEdit
      Left = 336
      Top = 59
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object edEstado: TEdit
      Left = 504
      Top = 59
      Width = 121
      Height = 21
      TabOrder = 3
    end
    object edCodProduto: TEdit
      Left = 40
      Top = 118
      Width = 121
      Height = 21
      TabOrder = 4
      OnChange = edCodProdutoChange
    end
    object edDescProduto: TEdit
      Left = 184
      Top = 119
      Width = 121
      Height = 21
      TabOrder = 5
    end
    object edQtd: TEdit
      Left = 336
      Top = 119
      Width = 121
      Height = 21
      TabOrder = 6
      OnChange = edQtdChange
    end
    object edValor: TEdit
      Left = 504
      Top = 119
      Width = 121
      Height = 21
      TabOrder = 7
      OnChange = edValorChange
    end
    object btnInserir: TButton
      Left = 208
      Top = 160
      Width = 216
      Height = 26
      Caption = 'Inserir/Atualizar'
      TabOrder = 8
      OnClick = btnInserirClick
    end
    object edValorT: TEdit
      Left = 648
      Top = 119
      Width = 121
      Height = 21
      TabOrder = 9
    end
  end
  object PanelA: TPanel
    Left = 0
    Top = 0
    Width = 1051
    Height = 107
    Align = alTop
    TabOrder = 1
    object lblNumeroPedido: TLabel
      Left = 56
      Top = 25
      Width = 47
      Height = 13
      Caption = 'N'#186' Pedido'
    end
    object Label1: TLabel
      Left = 369
      Top = 0
      Width = 256
      Height = 23
      Caption = 'Pesquisar/Cancelar pedido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edNumeroPedido: TEdit
      Left = 40
      Top = 44
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object btnCarregar: TButton
      Left = 184
      Top = 42
      Width = 75
      Height = 25
      Caption = 'Carregar'
      TabOrder = 1
      OnClick = btnCarregarClick
    end
    object btnCancelar: TButton
      Left = 280
      Top = 42
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 2
      OnClick = btnCancelarClick
    end
  end
  object PanelC: TPanel
    Left = 0
    Top = 323
    Width = 1051
    Height = 262
    Align = alTop
    TabOrder = 2
    object db_Produtos: TDBGrid
      Left = 1
      Top = 91
      Width = 1049
      Height = 170
      Align = alBottom
      DataSource = DMAuxiliar.ds_ListaPedidos
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = db_ProdutosCellClick
      OnKeyDown = db_ProdutosKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'iditens'
          Title.Caption = 'Id'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cod_produto'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRODUTO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'qtd_produtos'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'val_unitario'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'val_total'
          Visible = True
        end>
    end
  end
  object PanelD: TPanel
    Left = 0
    Top = 585
    Width = 1051
    Height = 214
    Align = alTop
    TabOrder = 3
    ExplicitLeft = 80
    ExplicitTop = 401
    object lblValorTotal: TLabel
      Left = 840
      Top = 56
      Width = 6
      Height = 23
      Align = alCustom
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnGravar: TButton
      Left = 424
      Top = 40
      Width = 169
      Height = 33
      Align = alCustom
      Caption = 'Gravar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnGravarClick
    end
  end
end
