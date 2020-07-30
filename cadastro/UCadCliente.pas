unit UCadCliente;

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
  Vcl.ComCtrls,
  UCliente,
  UEnum,
  UDTMConexao,
  RxToolEdit;

type
  TFrmCadCliente = class( TfrmTelaHeranca )
    EdtNome: TLabeledEdit;
    EdtCodigo: TLabeledEdit;
    EdtCEP: TMaskEdit;
    LblCEP: TLabel;
    EdtEndereco: TLabeledEdit;
    EdtBairro: TLabeledEdit;
    EdtCidade: TLabeledEdit;
    EdtTelefone: TMaskEdit;
    Label1: TLabel;
    EdtEmail: TLabeledEdit;
    EdtDataNascimento: TDateEdit;
    LblDataNascimento: TLabel;
    QryListagemclienteId: TIntegerField;
    QryListagemnome: TWideStringField;
    QryListagemendereco: TWideStringField;
    QryListagemcidade: TWideStringField;
    QryListagembairro: TWideStringField;
    QryListagemestado: TWideStringField;
    QryListagemcep: TWideStringField;
    QryListagemtelefone: TWideStringField;
    QryListagememail: TWideStringField;
    QryListagemdataNascimento: TDateTimeField;
    procedure FormCreate( Sender: TObject );
    procedure FormClose( Sender: TObject; var Action: TCloseAction );
    procedure BtnAlterarClick( Sender: TObject );
    procedure BtnNovoClick( Sender: TObject );
  private
    { Private declarations }
    Cliente: TCliente;
  public
    { Public declarations }
    function Excluir: Boolean; Override;
    function Gravar( Status: TEstadoCadastro ): Boolean; Override;
  end;

var
  FrmCadCliente: TFrmCadCliente;

implementation

{$R *.dfm}
{ TFrmCadCliente }

procedure TFrmCadCliente.BtnAlterarClick( Sender: TObject );
begin
  if Cliente.Selecionar( QryListagem.FieldByName( 'clienteId' ).AsInteger ) then
  begin
    EdtCodigo.Text         := IntToStr( Cliente.Codigo );
    EdtNome.Text           := Cliente.Nome;
    EdtCidade.Text         := Cliente.Cidade;
    EdtCEP.Text            := Cliente.CEP;
    EdtTelefone.Text       := Cliente.Telefone;
    EdtEmail.Text          := Cliente.Email;
    EdtDataNascimento.Date := Cliente.DataNascimento;
    EdtEndereco.Text       := Cliente.Endereco;
    EdtBairro.Text         := Cliente.Bairro;

  end
  else
  begin
    BtnCancelar.Click;
    Abort;
  end;
  inherited;
end;

procedure TFrmCadCliente.BtnNovoClick( Sender: TObject );
begin
  inherited;
  EdtDataNascimento.Date := Date;
  EdtNome.SetFocus;
end;

function TFrmCadCliente.Excluir: Boolean;
begin
  if Cliente.Selecionar( QryListagem.FieldByName( 'clienteId' ).AsInteger ) then
    Result := Cliente.Excluir;
end;

procedure TFrmCadCliente.FormClose( Sender: TObject; var Action: TCloseAction );
begin
  inherited;
  if Assigned( Cliente ) then
    FreeAndNil( Cliente );
end;

procedure TFrmCadCliente.FormCreate( Sender: TObject );
begin
  inherited;
  Cliente    := TCliente.Create( DtmConexao.ConexaoDB );
  IndexAtual := 'nome';
end;

function TFrmCadCliente.Gravar( Status: TEstadoCadastro ): Boolean;
begin
  if EdtCodigo.Text <> EmptyStr then
    Cliente.Codigo := StrToInt( EdtCodigo.Text )
  else
    Cliente.Codigo := 0;

  // popula cliente
  Cliente.Nome           := EdtNome.Text;
  Cliente.CEP            := EdtCEP.Text;
  Cliente.Endereco       := EdtEndereco.Text;
  Cliente.Bairro         := EdtBairro.Text;
  Cliente.Cidade         := EdtCidade.Text;
  Cliente.Telefone       := EdtTelefone.Text;
  Cliente.Email          := EdtEmail.Text;
  Cliente.DataNascimento := EdtDataNascimento.Date;

  if Status = EcInserir then
    Result := Cliente.Inserir
  else if Status = EcAlterar then
    Result := Cliente.Atualizar;
end;

end.
