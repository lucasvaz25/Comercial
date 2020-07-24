unit uCadCategoria;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  UTelaHeranca,
  Data.DB,
  ZAbstractRODataset,
  ZAbstractDataset,
  ZDataset,
  Vcl.DBCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.Mask,
  Vcl.ExtCtrls,
  UCategoria,
  UDTMConexao,
  UEnum,
  Vcl.ComCtrls;

type
  TfrmCadCategoria = class( TfrmTelaHeranca )
    QryListagemcategoria: TIntegerField;
    QryListagemdescricao: TWideStringField;
    EdtCodigo: TLabeledEdit;
    EdtDescricao: TLabeledEdit;
    procedure FormCreate( Sender: TObject );
    procedure FormClose( Sender: TObject; var Action: TCloseAction );
    procedure BtnAlterarClick( Sender: TObject );
  private
    { Private declarations }
    Categoria: TCategoria;
  public
    { Public declarations }
    function Excluir: Boolean; Override;
    function Gravar( Status: TEstadoCadastro ): Boolean; Override;
  end;

var
  FrmCadCategoria: TfrmCadCategoria;

implementation

{$R *.dfm}

procedure TfrmCadCategoria.BtnAlterarClick( Sender: TObject );
begin
  if Categoria.Selecionar( QryListagem.FieldByName( 'categoria' ).AsInteger )
  then
  begin
    EdtCodigo.Text    := IntToStr( Categoria.Codigo );
    EdtDescricao.Text := Categoria.Descricao;
  end
  else
  begin
    BtnCancelar.Click;
    Abort;
  end;
  inherited;
end;

function TfrmCadCategoria.Excluir: Boolean;
begin
  if Categoria.Selecionar( QryListagem.FieldByName( 'categoria' ).AsInteger )
  then
    Result := Categoria.Excluir;
end;

procedure TfrmCadCategoria.FormClose( Sender: TObject;
  var Action: TCloseAction );
begin
  inherited;
  if Assigned( Categoria ) then
    FreeAndNil( Categoria );
end;

procedure TfrmCadCategoria.FormCreate( Sender: TObject );
begin
  inherited;
  Categoria  := TCategoria.Create( DtmConexao.ConexaoDB );
  IndexAtual := 'descricao';
end;

function TfrmCadCategoria.Gravar( Status: TEstadoCadastro ): Boolean;
begin
  if EdtCodigo.Text <> EmptyStr then
    Categoria.Codigo := StrToInt( EdtCodigo.Text )
  else
    Categoria.Codigo  := 0;
  Categoria.Descricao := EdtDescricao.Text;
  if Status = EcInserir then
    Result := Categoria.Inserir
  else if Status = EcAlterar then
    Result := Categoria.Atualizar;
end;

end.
