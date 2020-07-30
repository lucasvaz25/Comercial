unit uCadProduto;

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
  UProduto,
  UEnum,
  UDTMConexao,
  Vcl.ComCtrls,
  RxToolEdit,
  RxCurrEdit;

type
  TFrmCadProduto = class( TfrmTelaHeranca )
    QryListagemprodutoId: TIntegerField;
    QryListagemnome: TWideStringField;
    QryListagemdescricao: TWideStringField;
    QryListagemvalor: TFloatField;
    QryListagemquantidade: TFloatField;
    QryListagemcategoriaId: TIntegerField;
    QryListagemDescricaoCategoria: TWideStringField;
    EdtCodigo: TLabeledEdit;
    EdtNome: TLabeledEdit;
    EdtDescricao: TMemo;
    LblDescricao: TLabel;
    EdtValor: TCurrencyEdit;
    EdtQuantidade: TCurrencyEdit;
    LblValor: TLabel;
    LbQuantidade: TLabel;
    LookUpCategoria: TDBLookupComboBox;
    QryCategoria: TZQuery;
    DTSCatagoria: TDataSource;
    QryCategoriacategoria: TIntegerField;
    QryCategoriadescricao: TWideStringField;
    lblCategoria: TLabel;
    procedure FormCreate( Sender: TObject );
    procedure FormClose( Sender: TObject; var Action: TCloseAction );
    procedure BtnAlterarClick( Sender: TObject );
  private
    { Private declarations }
    Produto: TProduto;
    function Excluir: Boolean; Override;
    function Gravar( Status: TEstadoCadastro ): Boolean; Override;
  public
    { Public declarations }
  end;

var
  FrmCadProduto: TFrmCadProduto;

implementation

{$R *.dfm}
{ TFrmCadProduto }

procedure TFrmCadProduto.BtnAlterarClick( Sender: TObject );
begin
  if Produto.Selecionar( QryListagem.FieldByName( 'produtoId' ).AsInteger ) then
  begin
    EdtCodigo.Text           := IntToStr( Produto.Codigo );
    EdtNome.Text             := Produto.Nome;
    EdtDescricao.Text        := Produto.Descricao;
    EdtValor.Value           := Produto.Valor;
    EdtQuantidade.Value      := Produto.Quantidade;
    LookUpCategoria.KeyValue := Produto.CategoriaId;
  end
  else
  begin
    BtnCancelar.Click;
    Abort;
  end;
  inherited;
end;

function TFrmCadProduto.Excluir: Boolean;
begin
  if Produto.Selecionar( QryListagem.FieldByName( 'produtoId' ).AsInteger ) then
  begin
    Result := Produto.Excluir;
  end;
end;

procedure TFrmCadProduto.FormClose( Sender: TObject; var Action: TCloseAction );
begin
  inherited;
  QryCategoria.Close;
  if Assigned( Produto ) then
    FreeAndNil( Produto );
end;

procedure TFrmCadProduto.FormCreate( Sender: TObject );
begin
  inherited;
  Produto := TProduto.Create( DtmConexao.ConexaoDB );
  QryCategoria.Open;
  IndexAtual := 'nome';
end;

function TFrmCadProduto.Gravar( Status: TEstadoCadastro ): Boolean;
begin
  if EdtCodigo.Text <> EmptyStr then
    Produto.Codigo := StrToInt( EdtCodigo.Text )
  else
    Produto.Codigo := 0;

  // popula produto
  Produto.Nome        := EdtNome.Text;
  Produto.Descricao   := EdtDescricao.Text;
  Produto.Valor       := EdtValor.Value;
  Produto.Quantidade  := EdtQuantidade.Value;
  Produto.CategoriaId := LookUpCategoria.KeyValue;

  if Status = EcInserir then
    Result := Produto.Inserir
  else if Status = EcAlterar then
    Result := Produto.Atualizar;
end;

end.
