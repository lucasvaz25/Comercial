unit uTelaHeranca;

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
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.StdCtrls,
  Vcl.Mask,
  Vcl.ComCtrls,
  Vcl.ExtCtrls,
  Vcl.DBCtrls,
  Vcl.Buttons,
  ZAbstractRODataset,
  ZAbstractDataset,
  UDTMConexao,
  UEnum,
  ZDataset;

type
  TfrmTelaHeranca = class( TForm )
    PgcPrincipal: TPageControl;
    PnlRodape: TPanel;
    TabListagem: TTabSheet;
    TabManutencao: TTabSheet;
    PnlListagemTopo: TPanel;
    MskPesquisar: TMaskEdit;
    GrdListagem: TDBGrid;
    BtnNovo: TBitBtn;
    BtnPesquisar: TBitBtn;
    BtnAlterar: TBitBtn;
    BtnCancelar: TBitBtn;
    BtnGravar: TBitBtn;
    BtnApagar: TBitBtn;
    BtnFechar: TBitBtn;
    BtnNavigator: TDBNavigator;
    QryListagem: TZQuery;
    DTSListagem: TDataSource;
    LblIndice: TLabel;
    procedure BtnFecharClick( Sender: TObject );
    procedure BtnNovoClick( Sender: TObject );
    procedure BtnCancelarClick( Sender: TObject );
    procedure BtnGravarClick( Sender: TObject );
    procedure BtnApagarClick( Sender: TObject );
    procedure BtnAlterarClick( Sender: TObject );
    procedure FormShow( Sender: TObject );
    procedure FormClose( Sender: TObject; var Action: TCloseAction );
    procedure GrdListagemTitleClick( Column: TColumn );
  private
    { Private declarations }
    Status: TEstadoCadastro;
  protected
    procedure CtrlBtn( BtnNovo, BtnAlterar, BtnCancelar, BtnGravar,
      BtnApagar: TBitBtn; Navegador: TDBNavigator; PgcPrincipal: TPageControl;
      Flag: Boolean );
    procedure CtrlIndTab( PgcPrincipal: TPageControl; Index: Integer );

    function ReturnField( Field: string ): string;
  public
    { Public declarations }
    IndexAtual: String;
  end;

var
  FrmTelaHeranca: TfrmTelaHeranca;

implementation

{$R *.dfm}

// controles de tela
procedure TfrmTelaHeranca.CtrlBtn( BtnNovo, BtnAlterar, BtnCancelar, BtnGravar,
  BtnApagar: TBitBtn; Navegador: TDBNavigator; PgcPrincipal: TPageControl;
  Flag: Boolean );
begin
  BtnNovo.Enabled                    := Flag;
  BtnApagar.Enabled                  := Flag;
  BtnAlterar.Enabled                 := Flag;
  Navegador.Enabled                  := Flag;
  PgcPrincipal.Pages[ 0 ].TabVisible := Flag;
  BtnCancelar.Enabled                := not( Flag );
  BtnGravar.Enabled                  := not( Flag );
end;

procedure TfrmTelaHeranca.CtrlIndTab( PgcPrincipal: TPageControl;
  Index: Integer );
begin
  if ( PgcPrincipal.Pages[ Index ].TabVisible ) then
    PgcPrincipal.TabIndex := Index;
end;

procedure TfrmTelaHeranca.FormClose( Sender: TObject;
  var Action: TCloseAction );
begin
  QryListagem.Close;
end;

procedure TfrmTelaHeranca.FormShow( Sender: TObject );
begin
  if ( QryListagem.SQL.Text <> EmptyStr ) then
  begin

  end;

  QryListagem.Open;
end;

procedure TfrmTelaHeranca.GrdListagemTitleClick( Column: TColumn );
begin
  IndexAtual                  := Column.FieldName;
  QryListagem.IndexFieldNames := IndexAtual;
  LblIndice.Caption           := Self.ReturnField( IndexAtual );
end;

function TfrmTelaHeranca.ReturnField( Field: string ): string;
var
  I: Integer;
begin
  for I := 0 to QryListagem.Fields.Count - 1 do
  begin
    if QryListagem.Fields[ I ].FieldName = Field then
    begin
      Result := QryListagem.Fields[ I ].DisplayLabel;
      Break;
    end;
  end;

end;

procedure TfrmTelaHeranca.BtnAlterarClick( Sender: TObject );
begin
  Self.CtrlBtn( BtnNovo, BtnAlterar, BtnCancelar, BtnGravar, BtnApagar,
    BtnNavigator, PgcPrincipal, False );
  Status := EcAlterar;
end;

procedure TfrmTelaHeranca.BtnApagarClick( Sender: TObject );
begin
  Self.CtrlBtn( BtnNovo, BtnAlterar, BtnCancelar, BtnGravar, BtnApagar,
    BtnNavigator, PgcPrincipal, True );
  Status := EcNenhum;
end;

procedure TfrmTelaHeranca.BtnCancelarClick( Sender: TObject );
begin
  Self.CtrlBtn( BtnNovo, BtnAlterar, BtnCancelar, BtnGravar, BtnApagar,
    BtnNavigator, PgcPrincipal, True );

  Self.CtrlIndTab( PgcPrincipal, 0 );
end;

procedure TfrmTelaHeranca.BtnFecharClick( Sender: TObject );
begin
  Close;
end;

procedure TfrmTelaHeranca.BtnGravarClick( Sender: TObject );
begin
  try
    Self.CtrlBtn( BtnNovo, BtnAlterar, BtnCancelar, BtnGravar, BtnApagar,
      BtnNavigator, PgcPrincipal, True );
    if Status = EcInserir then
      ShowMessage( 'Registro Gravado' )
    else if Status = EcAlterar then
      ShowMessage( 'Registro Alterado' );
  finally
    Status := EcNenhum;
  end;

end;

procedure TfrmTelaHeranca.BtnNovoClick( Sender: TObject );
begin
  Self.CtrlBtn( BtnNovo, BtnAlterar, BtnCancelar, BtnGravar, BtnApagar,
    BtnNavigator, PgcPrincipal, False );
  Status := EcInserir;
end;

end.
