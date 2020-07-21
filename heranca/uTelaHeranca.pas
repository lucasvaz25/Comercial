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
    procedure GrdListagemDrawColumnCell( Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState );
    procedure MskPesquisarChange( Sender: TObject );
  private
    { Private declarations }
    Status: TEstadoCadastro;
  protected
    procedure CtrlBtn( BtnNovo, BtnAlterar, BtnCancelar, BtnGravar,
      BtnApagar: TBitBtn; Navegador: TDBNavigator; PgcPrincipal: TPageControl;
      Flag: Boolean );
    procedure CtrlIndTab( PgcPrincipal: TPageControl; Index: Integer );
    procedure ExibirLabelIndex( Field: string; _Label: TLabel );

    function ReturnField( Field: string ): string;
  public
    { Public declarations }
    IndexAtual: String;
    function Excluir: Boolean; Virtual;
    function Gravar( Status: TEstadoCadastro ): Boolean; Virtual;
  end;

var
  FrmTelaHeranca: TfrmTelaHeranca;

implementation

{$R *.dfm}
// controles de tela

{$REGION 'METODOS VIRTUAIS'}

function TfrmTelaHeranca.Excluir: Boolean;
begin
  ShowMessage( 'Deletado' );
  Result := True;
end;

function TfrmTelaHeranca.Gravar( Status: TEstadoCadastro ): Boolean;
begin
  if Status = EcInserir then
    ShowMessage( 'Inserido' )
  else if Status = EcAlterar then
    ShowMessage( 'Alterado' );
  Result := True;
end;
{$ENDREGION}
{$REGION 'PROCEDURES E FUNCTIONS'}

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

procedure TfrmTelaHeranca.ExibirLabelIndex( Field: string; _Label: TLabel );
begin
  _Label.Caption := Self.ReturnField( Field );
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
    QryListagem.IndexFieldNames := IndexAtual;
    Self.ExibirLabelIndex( IndexAtual, LblIndice );
    QryListagem.Open;
  end;
  Self.CtrlBtn( BtnNovo, BtnAlterar, BtnCancelar, BtnGravar, BtnApagar,
    BtnNavigator, PgcPrincipal, True );
end;

procedure TfrmTelaHeranca.GrdListagemDrawColumnCell( Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState );
begin
  with GrdListagem do
  begin
    if Odd( DataSource.DataSet.RecNo ) then // zebrando grid
      Canvas.Brush.Color := ClGradientActiveCaption
    else
      Canvas.Brush.Color := ClWindow;
    Canvas.FillRect( Rect );

    if GdSelected in State then // mudando cor seleção
    begin
      Canvas.Brush.Color := ClAqua;
      Canvas.Font.Color  := ClMenuText;
      Canvas.Font.Style  := [ FsBold ];
    end;

    DefaultDrawColumnCell( Rect, DataCol, Column, State );

  end;
end;

procedure TfrmTelaHeranca.GrdListagemTitleClick( Column: TColumn );
begin
  IndexAtual                  := Column.FieldName;
  QryListagem.IndexFieldNames := IndexAtual;
  Self.ExibirLabelIndex( IndexAtual, LblIndice );
end;

procedure TfrmTelaHeranca.MskPesquisarChange( Sender: TObject );
begin
  QryListagem.Locate( IndexAtual, TMaskEdit( Sender ).Text,
    [ LoPartialKey, LoCaseInsensitive ] );
end;

function TfrmTelaHeranca.ReturnField( Field: string ): string;
var
  I: Integer;
begin
  for I := 0 to QryListagem.Fields.Count - 1 do
  begin
    if LowerCase( QryListagem.Fields[ I ].FieldName ) = LowerCase( Field ) then
    begin
      Result := QryListagem.Fields[ I ].DisplayLabel;
      Break;
    end;
  end;

end;
{$ENDREGION}
{$REGION 'EVENTOS BOTOES'}

procedure TfrmTelaHeranca.BtnAlterarClick( Sender: TObject );
begin
  Self.CtrlBtn( BtnNovo, BtnAlterar, BtnCancelar, BtnGravar, BtnApagar,
    BtnNavigator, PgcPrincipal, False );
  Status := EcAlterar;
end;

procedure TfrmTelaHeranca.BtnApagarClick( Sender: TObject );
begin
  if Self.Excluir then
  begin
    Self.CtrlBtn( BtnNovo, BtnAlterar, BtnCancelar, BtnGravar, BtnApagar,
      BtnNavigator, PgcPrincipal, True );
    Self.CtrlIndTab( PgcPrincipal, 0 );
    Status := EcNenhum;
  end;
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
    if Self.Gravar( Status ) then
    begin
      Self.CtrlBtn( BtnNovo, BtnAlterar, BtnCancelar, BtnGravar, BtnApagar,
        BtnNavigator, PgcPrincipal, True );
      if Status = EcInserir then
        ShowMessage( 'Registro Gravado' )
      else if Status = EcAlterar then
        ShowMessage( 'Registro Alterado' );
    end;
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
{$ENDREGION}

end.
