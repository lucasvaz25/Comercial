object dtmConexao: TdtmConexao
  OldCreateOrder = False
  Height = 352
  Width = 529
  object ConexaoDB: TZConnection
    ControlsCodePage = cCP_UTF16
    AutoEncodeStrings = True
    Catalog = ''
    Connected = True
    SQLHourGlass = True
    HostName = '.\SERVERCURSO'
    Port = 0
    Database = 'vendas'
    User = 'sa'
    Password = 'mudar@123'
    Protocol = 'mssql'
    LibraryLocation = 'C:\Users\ll\OneDrive\Documentos\ProjetoComercial\ntwdblib.dll'
    Left = 216
    Top = 88
  end
  object QryScriptCategorias: TZQuery
    Connection = ConexaoDB
    SQL.Strings = (
      'if object_id ('#39'categorias'#39') is null'
      'begin'
      '  create table categorias('
      '   categoria int identity(1,1) not null,'
      '   descricao varchar(30) null,'
      '   primary key (categoria)'
      '  )'
      'end')
    Params = <>
    Left = 392
    Top = 104
  end
  object QryScriptClientes: TZQuery
    Connection = ConexaoDB
    SQL.Strings = (
      'if object_id ('#39'clientes'#39') is null'
      'begin'
      '   create table clientes('
      '    clienteId int identity(1,1) not null,'
      '    nome varchar(60) null,'
      '    endereco varchar(60) null,'
      '    cidade varchar(50) null,'
      '    bairro varchar(40) null,'
      '    estado varchar(2) null,'
      '    cep varchar(10) null,'
      '    telefone varchar(14) null,'
      '    email varchar(100) null,'
      '    dataNascimento datetime null'
      ''
      '    primary key (clienteId)'
      '   )'
      'end')
    Params = <>
    Left = 200
    Top = 216
  end
  object QryScriptProdutos: TZQuery
    Connection = ConexaoDB
    SQL.Strings = (
      'if object_id ('#39'produtos'#39') is null'
      'begin'
      '  create table produtos('
      '   produtoId int identity(1,1) not null,'
      '   nome varchar(60) null,'
      '   descricao varchar(255) null,'
      '   valor decimal(18,5) default 0.00000 null,'
      '   quantidade decimal(18,5) default 0.00000 null,'
      '   categoriaId int null,'
      ''
      '   primary key (produtoId),'
      '   constraint Fk_ProdutosCategorias'
      '   Foreign key (categoriaId) references categorias(categoria)'
      '  )'
      'end')
    Params = <>
    Left = 360
    Top = 208
  end
  object QryScriptVendas: TZQuery
    Connection = ConexaoDB
    SQL.Strings = (
      'if object_id ('#39'vendas'#39') is null'
      'begin'
      ' create table vendas('
      ' vendaId int identity(1,1) not null,'
      ' clienteId int not null,'
      ' dataVenda datetime default getdate(),'
      ' totalVenda decimal(18,5) default 0.00000,'
      ''
      ' primary key (vendaId),'
      ' constraint Fk_VendasClientes foreign key (clienteId)'
      ' references clientes(clienteId)'
      ')'
      'end')
    Params = <>
    Left = 80
    Top = 120
  end
  object QryScriptItensVendas: TZQuery
    Connection = ConexaoDB
    SQL.Strings = (
      'if object_id ('#39'vendasItens'#39') is null'
      'begin'
      'create table vendasItens('
      'vendaId int not null,'
      'produtoId int not null,'
      'valorUnitario decimal (18,5) default 0.00000,'
      'quantidade decimal (18,5) default 0.00000,'
      'totalProduto decimal (18,5) default 0.00000,'
      ''
      'primary key (vendaId, produtoId),'
      'constraint Fk_VendasItensProdutos foreign key (produtoId)'
      ' references Produtos(ProdutoId)'
      ''
      ')'
      'end')
    Params = <>
    Left = 80
    Top = 224
  end
end
