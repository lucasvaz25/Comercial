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
  uCadCategoria,
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
    procedure Categoria1Click(Sender: TObject);
  private
    { Private declarations }
    procedure ConexaoDB;
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.Categoria1Click(Sender: TObject);
begin
  frmCadCategoria := TFrmCadCategoria.Create(Self);
  frmCadCategoria.ShowModal;
  frmCadCategoria.Release;
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

procedure TfrmPrincipal.FormCreate( Sender: TObject );
begin
  Self.ConexaoDB;
end;

end.