object DMAuxiliar: TDMAuxiliar
  OldCreateOrder = False
  Height = 286
  Width = 426
  object ds_ListaPedidos: TDataSource
    DataSet = mem_Produtos
    Left = 168
    Top = 104
  end
  object mem_Produtos: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'iditens'
        DataType = ftAutoInc
      end
      item
        Name = 'cod_produto'
        DataType = ftInteger
      end
      item
        Name = 'PRODUTO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'qtd_produtos'
        DataType = ftFloat
      end
      item
        Name = 'val_unitario'
        DataType = ftFloat
      end
      item
        Name = 'val_total'
        DataType = ftFloat
      end>
    IndexDefs = <>
    IndexFieldNames = 'iditens'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 56
    Top = 24
    object mem_ProdutosORDEM: TAutoIncField
      FieldName = 'iditens'
    end
    object mem_ProdutosCODIGO: TIntegerField
      DisplayLabel = 'COD. PROD'
      FieldName = 'cod_produto'
    end
    object mem_ProdutosPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Size = 60
    end
    object mem_ProdutosQUANTIDADE: TFloatField
      FieldName = 'qtd_produtos'
    end
    object mem_ProdutosVALOR: TFloatField
      FieldName = 'val_unitario'
    end
    object mem_ProdutosTOTAL: TFloatField
      FieldName = 'val_total'
    end
  end
end
