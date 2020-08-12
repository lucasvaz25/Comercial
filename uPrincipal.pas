unit uPrincipal;

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
  Vcl.Menus,
  Vcl.ExtCtrls,
  UCadCategoria,
  UCadProduto,
  UCadCliente,
  UFrmAtualizaDB,
  Enter,
  UDTMConexao;

type
  TfrmPrincipal = class( TForm )
    MainPrincipal: TMainMenu;
    Cadastro1: TMenuItem;
    Movimentao1: TMenuItem;
    Relatrio1: TMenuItem;
    Clientes1: TMenuItem;
    N1: TMenuItem;
    Categoria1: TMenuItem;
    Produtos1: TMenuItem;
    N2: TMenuItem;
    Fechar1: TMenuItem;
    Vendas1: TMenuItem;
    Clientes2: TMenuItem;
    N3: TMenuItem;
    Produtos2: TMenuItem;
    N4: TMenuItem;
    VendaporDAta1: TMenuItem;
    PnlFundo: TPanel;
    procedure Fechar1Click( Sender: TObject );
    procedure FormCreate( Sender: TObject );
    procedure Categoria1Click( Sender: TObject );
    procedure FormClose( Sender: TObject; var Action: TCloseAction );
    procedure Clientes1Click( Sender: TObject );
    procedure Produtos1Click( Sender: TObject );
    procedure Vendas1Click( Sender: TObject );
  private
    { Private declarations }
    TeclaEnter: TMREnter;
    procedure ConexaoDB;
    procedure AtualizacaoBD( Frm: TFrmAtualizaDB );
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses UProVenda;

procedure TfrmPrincipal.AtualizacaoBD( Frm: TFrmAtualizaDB );
begin
  Frm.ChkConexao.Checked := True;
  Frm.Refresh;
  Sleep( 200 );
  DtmConexao.QryScriptCategorias.ExecSQL;
  Frm.ChkCategoria.Checked := True;
  Frm.Refresh;
  Sleep( 200 );
  DtmConexao.QryScriptProdutos.ExecSQL;
  Frm.ChkProduto.Checked := True;
  Frm.Refresh;
  Sleep( 200 );
  DtmConexao.QryScriptClientes.ExecSQL;
  Frm.ChkCliente.Checked := True;
  Frm.Refresh;
  Sleep( 200 );
  DtmConexao.QryScriptVendas.ExecSQL;
  Frm.ChkVendas.Checked := True;
  Frm.Refresh;
  Sleep( 200 );
  DtmConexao.QryScriptItensVendas.ExecSQL;
  Frm.ChkItensVendas.Checked := True;
  Frm.Refresh;
  Sleep( 200 );
end;

procedure TfrmPrincipal.Categoria1Click( Sender: TObject );
begin
  FrmCadCategoria := TFrmCadCategoria.Create( Self );
  FrmCadCategoria.ShowModal;
  FrmCadCategoria.Release;
end;

procedure TfrmPrincipal.Clientes1Click( Sender: TObject );
begin
  FrmCadCliente := TFrmCadCliente.Create( Self );
  FrmCadCliente.ShowModal;
  FrmCadCliente.Release;
end;

procedure TfrmPrincipal.ConexaoDB;
begin
  DtmConexao := TdtmConexao.Create( Self );
  with DtmConexao.ConexaoDB do
  begin
    SQLHourGlass    := True;
    Protocol        := 'mssql';
    LibraryLocation :=
      'C:\Users\ll\OneDrive\Documentos\ProjetoComercial\ntwdblib.dll';
    HostName  := '.\SERVERCURSO';
    Port      := 1433;
    User      := 'sa';
    Password  := 'mudar@123';
    Database  := 'vendas';
    Connected := True;
  end;
end;

procedure TfrmPrincipal.Fechar1Click( Sender: TObject );
begin
  Close;
end;

procedure TfrmPrincipal.FormClose( Sender: TObject; var Action: TCloseAction );
begin
  FreeandNil( TeclaEnter );
  FreeAndNil( DtmConexao );
end;

procedure TfrmPrincipal.FormCreate( Sender: TObject );
begin

  FrmAtualizaDB := TFrmAtualizaDB.Create( Self );
  FrmAtualizaDB.Show;
  FrmAtualizaDB.Refresh;

  Self.ConexaoDB;

  Self.AtualizacaoBD( FrmAtualizaDB );
  FrmAtualizaDB.Free;

  TeclaEnter              := TMREnter.Create( Self );
  TeclaEnter.FocusEnabled := True;
  TeclaEnter.FocusColor   := ClinfoBk;
end;

procedure TfrmPrincipal.Produtos1Click( Sender: TObject );
begin
  FrmCadProduto := TFrmCadProduto.Create( Self );
  FrmCadProduto.ShowModal;
  FrmCadProduto.Release;
end;

procedure TfrmPrincipal.Vendas1Click( Sender: TObject );
begin
  FrmProVenda := TFrmProVenda.Create( Self );
  FrmProVenda.ShowModal;
  FrmProVenda.Release;
end;

end.
