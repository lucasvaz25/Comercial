unit UCategoria;

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
  TCategoria = Class
  private
    ConnectionDB: TZConnection;
    FDescricao: String;
    FCodigo: Integer;
    procedure SetCodigo( const Value: Integer );
    procedure SetDescricao( const Value: String );
  public
    constructor Create( _ConnectionDB: TZConnection );
    destructor Destroy; Override;

    function Inserir: Boolean;
    function Atualizar: Boolean;
    function Excluir: Boolean;
    function Selecionar( ID: Integer ): Boolean;

  published
    property Codigo: Integer read FCodigo write SetCodigo;
    property Descricao: String read FDescricao write SetDescricao;
  End;

implementation

{ TCategoria }

{$REGION 'Contructor and destructor'}

constructor TCategoria.Create( _ConnectionDB: TZConnection );
begin
  ConnectionDB := _ConnectionDB;
end;

destructor TCategoria.Destroy;
begin

  inherited;
end;
{$ENDREGION}
{$REGION 'CRUD'}

function TCategoria.Atualizar: Boolean;
var
  Qry: TZQuery;
begin
  try
    Result         := True;
    Qry            := TZQuery.Create( nil );
    Qry.Connection := ConnectionDB;
    Qry.SQL.Clear;
    Qry.SQL.Add( 'UPDATE categorias SET descricao = :descricao' );
    Qry.SQL.Add( ' WHERE categoria = :categoria' );
    Qry.ParamByName( 'categoria' ).AsInteger := Self.FCodigo;
    Qry.ParamByName( 'descricao' ).AsString  := Self.FDescricao;
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

function TCategoria.Excluir: Boolean;
var
  Qry: TZQuery;
begin
  if MessageDlg( 'Apagar o Registro: ' + #13 + #13 + 'Código: ' +
    IntToStr( Self.FCodigo ) + #13 + 'Descrição: ' + Self.FDescricao,
    MtConfirmation, [ MbYes, MbNo ], 0 ) = MrNo then
  begin
    Result := False;
    Abort;
  end;

  try
    Result         := True;
    Qry            := TZQuery.Create( nil );
    Qry.Connection := ConnectionDB;
    Qry.SQL.Clear;
    Qry.SQL.Add( 'DELETE FROM categorias ' );
    Qry.SQL.Add( 'WHERE categoria = :categoria' );
    Qry.ParamByName( 'categoria' ).AsInteger := Self.FCodigo;
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

function TCategoria.Inserir: Boolean;
var
  Qry: TZQuery;
begin
  try
    Result         := True;
    Qry            := TZQuery.Create( nil );
    Qry.Connection := ConnectionDB;
    Qry.SQL.Clear;
    Qry.SQL.Add( 'INSERT INTO categorias (descricao) values (:descricao)' );
    Qry.ParamByName( 'descricao' ).AsString := Self.FDescricao;
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

function TCategoria.Selecionar( ID: Integer ): Boolean;
var
  Qry: TZQuery;
begin
  try
    Result         := True;
    Qry            := TZQuery.Create( nil );
    Qry.Connection := ConnectionDB;
    Qry.SQL.Clear;
    Qry.SQL.Add( 'SELECT categoria, descricao FROM categorias' );
    Qry.SQL.Add( 'WHERE categoria = :categoria' );
    Qry.ParamByName( 'categoria' ).AsInteger := ID;
    try
      Qry.Open;
      Self.FCodigo    := Qry.FieldByName( 'categoria' ).AsInteger;
      Self.FDescricao := Qry.FieldByName( 'descricao' ).AsString;
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

procedure TCategoria.SetCodigo( const Value: Integer );
begin
  FCodigo := Value;
end;

procedure TCategoria.SetDescricao( const Value: String );
begin
  FDescricao := Value;
end;
{$ENDREGION}

end.
