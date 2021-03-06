unit UProduto;

interface

uses
  System.Classes,
  System.SysUtils,
  Vcl.Controls,
  Vcl.ExtCtrls,
  ZAbstractConnection,
  ZConnection,
  ZAbstractRODataset,
  ZAbstractDataset,
  ZDataset,
  Vcl.Dialogs;

type
  TProduto = Class
  private
    ConnectionDB: TZConnection;
    FValor: Double;
    FDescricao: string;
    FCodigo: Integer;
    FQuantidade: Double;
    FNome: string;
    FCategoriaId: Integer;
    procedure SetCategoriaId( const Value: Integer );
    procedure SetCodigo( const Value: Integer );
    procedure SetDescricao( const Value: string );
    procedure SetNome( const Value: string );
    procedure SetQuantidade( const Value: Double );
    procedure SetValor( const Value: Double );
    procedure FieldToObj( Qry: TZQuery );
    procedure ObjToField( Qry: TZQuery );
  public
    IsInserir: Boolean;
    constructor Create( _ConnectionDB: TZConnection );
    destructor Destroy; Override;

    function Inserir: Boolean;
    function Atualizar: Boolean;
    function Excluir: Boolean;
    function Selecionar( ID: Integer ): Boolean;
  published
    property Codigo: Integer read FCodigo write SetCodigo;
    property Nome: string read FNome write SetNome;
    property Descricao: string read FDescricao write SetDescricao;
    property Valor: Double read FValor write SetValor;
    property Quantidade: Double read FQuantidade write SetQuantidade;
    property CategoriaId: Integer read FCategoriaId write SetCategoriaId;
  End;

implementation

{ TProduto }

{$REGION 'CONSTRUCTOR and DESTRUCTOR'}

constructor TProduto.Create( _ConnectionDB: TZConnection );
begin
  ConnectionDB := _ConnectionDB;
end;

destructor TProduto.Destroy;
begin

  inherited;
end;
{$ENDREGION}
{$REGION 'CRUD'}

function TProduto.Atualizar: Boolean;
var
  Qry: TZQuery;
begin
  try
    Result         := True;
    IsInserir      := False;
    Qry            := TZQuery.Create( nil );
    Qry.Connection := ConnectionDB;
    Qry.SQL.Clear;
    Qry.SQL.Add( 'UPDATE produtos SET nome = :nome, descricao = :descricao, ' );
    Qry.SQL.Add
      ( 'valor = :valor, quantidade = :quantidade, categoriaId = :categoriaId ' );
    Qry.SQL.Add( ' WHERE produtoId = :produtoId' );
    Self.ObjToField( Qry );
    try
      Qry.ExecSQL;
    Except
      Result := False;
    end;
  finally
    if Assigned( Qry ) then
      FreeAndNil( Qry );
  end;
end;

function TProduto.Excluir: Boolean;
var
  Qry: TZQuery;
begin
  if MessageDlg( 'Apagar o Registro: ' + #13 + #13 + 'C�digo: ' +
    IntToStr( Self.FCodigo ) + #13 + 'Nome: ' + Self.FNome, MtConfirmation,
    [ MbYes, MbNo ], 0 ) = MrNo then
  begin
    Result := False;
    Abort;
  end;

  try
    Result         := True;
    Qry            := TZQuery.Create( nil );
    Qry.Connection := ConnectionDB;
    Qry.SQL.Clear;
    Qry.SQL.Add( 'DELETE FROM produtos ' );
    Qry.SQL.Add( 'WHERE produtoId = :produtoId' );
    Qry.ParamByName( 'produtoId' ).AsInteger := Self.FCodigo;
    try
      Qry.ExecSQL;
    Except
      Result := False;
    end;
  finally
    if Assigned( Qry ) then
      FreeAndNil( Qry );
  end;
end;

procedure TProduto.FieldToObj( Qry: TZQuery );
begin
  with Qry do
  begin
    Self.FCodigo      := FieldByName( 'produtoId' ).AsInteger;
    Self.FNome        := FieldByName( 'nome' ).AsString;
    Self.FDescricao   := FieldByName( 'descricao' ).AsString;
    Self.FValor       := FieldByName( 'valor' ).AsFloat;
    Self.FQuantidade  := FieldByName( 'quantidade' ).AsFloat;
    Self.FCategoriaId := FieldByName( 'categoriaId' ).AsInteger;
  end;
end;

function TProduto.Inserir: Boolean;
var
  Qry: TZQuery;
begin
  try
    Result         := True;
    IsInserir      := True;
    Qry            := TZQuery.Create( nil );
    Qry.Connection := ConnectionDB;
    Qry.SQL.Clear;
    Qry.SQL.Add( 'INSERT INTO produtos (nome, descricao, valor,' );
    Qry.SQL.Add( ' quantidade, categoriaId)' );
    Qry.SQL.Add( ' values ' );
    Qry.SQL.Add( '( :nome, :descricao, :valor,' );
    Qry.SQL.Add( ' :quantidade, :categoriaId)' );
    Self.ObjToField( Qry );
    try
      Qry.ExecSQL;
    Except
      Result := False;
    end;
  finally
    if Assigned( Qry ) then
      FreeAndNil( Qry );
  end;
end;

procedure TProduto.ObjToField( Qry: TZQuery );
begin
  with Qry do
  begin
    if not IsInserir then
      ParamByName( 'produtoId' ).AsInteger := Self.FCodigo;

    ParamByName( 'nome' ).AsString         := Self.FNome;
    ParamByName( 'descricao' ).AsString    := Self.FDescricao;
    ParamByName( 'valor' ).AsFloat         := Self.FValor;
    ParamByName( 'quantidade' ).AsFloat    := Self.FQuantidade;
    ParamByName( 'categoriaId' ).AsInteger := Self.FCategoriaId;
  end;
end;

function TProduto.Selecionar( ID: Integer ): Boolean;
var
  Qry: TZQuery;
begin
  try
    Result         := True;
    Qry            := TZQuery.Create( nil );
    Qry.Connection := ConnectionDB;
    Qry.SQL.Clear;
    Qry.SQL.Add( 'SELECT * FROM produtos' );
    Qry.SQL.Add( 'WHERE produtoId = :produtoId' );
    Qry.ParamByName( 'produtoId' ).AsInteger := ID;
    try
      Qry.Open;
      Self.FieldToObj( Qry );
    Except
      Result := False;
    end;
  finally
    if Assigned( Qry ) then
      FreeAndNil( Qry );
  end;
end;
{$ENDREGION}
{$REGION 'GETs and SETs'}

procedure TProduto.SetCategoriaId( const Value: Integer );
begin
  FCategoriaId := Value;
end;

procedure TProduto.SetCodigo( const Value: Integer );
begin
  FCodigo := Value;
end;

procedure TProduto.SetDescricao( const Value: string );
begin
  FDescricao := Value;
end;

procedure TProduto.SetNome( const Value: string );
begin
  FNome := Value;
end;

procedure TProduto.SetQuantidade( const Value: Double );
begin
  FQuantidade := Value;
end;

procedure TProduto.SetValor( const Value: Double );
begin
  FValor := Value;
end;
{$ENDREGION}

end.
