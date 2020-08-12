unit uProVenda;

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
  UDTMConexao,
  UDTMVenda,
  RxCurrEdit,
  RxToolEdit;

type
  TfrmProVenda = class( TfrmTelaHeranca )
    QryListagemvendaId: TIntegerField;
    QryListagemclienteId: TIntegerField;
    QryListagemnome: TWideStringField;
    QryListagemdataVenda: TDateTimeField;
    QryListagemtotalVenda: TFloatField;
    EdtVendaId: TLabeledEdit;
    LookUpCliente: TDBLookupComboBox;
    LblNomeCliente: TLabel;
    EdtDataVenda: TDateEdit;
    LblDataVenda: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    EdtValor: TCurrencyEdit;
    LblValorVenda: TLabel;
    DBGridItensVenda: TDBGrid;
    LookUpProduto: TDBLookupComboBox;
    LblProdutos: TLabel;
    EdtQuantidade: TCurrencyEdit;
    LblQuantidade: TLabel;
    EdtValorUnitario: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    LblVlrUnitario: TLabel;
    LblVlrTotalProduto: TLabel;
    BtnAdicionar: TBitBtn;
    BtnRemover: TBitBtn;
    procedure FormCreate( Sender: TObject );
    procedure FormClose( Sender: TObject; var Action: TCloseAction );
    procedure DBGridItensVendaKeyDown( Sender: TObject; var Key: Word;
      Shift: TShiftState );
  private
    { Private declarations }
    DtmVenda: TDTMVenda;
  public
    { Public declarations }
  end;

var
  FrmProVenda: TfrmProVenda;

implementation

{$R *.dfm}

procedure TfrmProVenda.DBGridItensVendaKeyDown( Sender: TObject; var Key: Word;
  Shift: TShiftState );
begin
  inherited;
  BloqueiaCTRL_DEL_DBGrid( Key, Shift );
end;

procedure TfrmProVenda.FormClose( Sender: TObject; var Action: TCloseAction );
begin
  inherited;
  if Assigned( DtmVenda ) then
    FreeAndNil( DtmVenda );
end;

procedure TfrmProVenda.FormCreate( Sender: TObject );
begin
  inherited;
  DtmVenda := TDtmVenda.Create( Self );
end;

end.
