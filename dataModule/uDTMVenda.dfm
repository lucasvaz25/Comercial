object DtmVenda: TDtmVenda
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 213
  Width = 360
  object QryCliente: TZQuery
    Connection = dtmConexao.ConexaoDB
    SQL.Strings = (
      'select clienteId, nome from clientes')
    Params = <>
    Left = 56
    Top = 32
    object QryClienteclienteId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'clienteId'
      ReadOnly = True
    end
    object QryClientenome: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 60
    end
  end
  object QryProdutos: TZQuery
    Connection = dtmConexao.ConexaoDB
    SQL.Strings = (
      'select produtoId, nome, valor, quantidade from produtos')
    Params = <>
    Left = 144
    Top = 32
    object QryProdutosprodutoId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'produtoId'
      ReadOnly = True
    end
    object WideStringField1: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 60
    end
    object QryProdutosvalor: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'valor'
    end
    object QryProdutosquantidade: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'quantidade'
    end
  end
  object CdsItensVenda: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 248
    Top = 32
    object CdsItensVendaprodutoId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'produtoId'
    end
    object CdsItensVendanomeProduto: TStringField
      DisplayLabel = 'Nome de Produto'
      FieldName = 'nomeProduto'
    end
    object CdsItensVendaquantidade: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'quantidade'
    end
    object CdsItensVendavalorUnitario: TFloatField
      DisplayLabel = 'Valor Unit'#225'rio'
      FieldName = 'valorUnitario'
    end
    object CdsItensVendavalorTotalProduto: TFloatField
      DisplayLabel = 'Total do Produto'
      FieldName = 'valorTotalProduto'
    end
    object CdsItensVendavalorTotalVenda: TAggregateField
      FieldName = 'valorTotalVenda'
      DisplayName = ''
      Expression = 'SUM(valorTotalProduto)'
    end
  end
  object DtsCliente: TDataSource
    DataSet = QryCliente
    Left = 56
    Top = 96
  end
  object DtsProdutos: TDataSource
    DataSet = QryProdutos
    Left = 144
    Top = 104
  end
  object DtsItensVenda: TDataSource
    DataSet = CdsItensVenda
    Left = 248
    Top = 104
  end
end
