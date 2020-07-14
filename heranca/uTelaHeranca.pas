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
    procedure BtnFecharClick( Sender: TObject );
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaHeranca: TfrmTelaHeranca;

implementation

{$R *.dfm}

procedure TfrmTelaHeranca.BtnFecharClick( Sender: TObject );
begin
  Close;
end;

end.
