unit uDTMVenda;

interface

uses
  System.SysUtils,
  System.Classes,
  UDTMConexao,
  Data.DB,
  ZAbstractRODataset,
  ZAbstractDataset,
  ZDataset,
  Datasnap.DBClient;

type
  TDtmVenda = class( TDataModule )
    QryCliente: TZQuery;
    QryClienteclienteId: TIntegerField;
    QryClientenome: TWideStringField;
    QryProdutos: TZQuery;
    WideStringField1: TWideStringField;
    QryProdutosprodutoId: TIntegerField;
    QryProdutosvalor: TFloatField;
    QryProdutosquantidade: TFloatField;
    CdsItensVenda: TClientDataSet;
    DtsCliente: TDataSource;
    DtsProdutos: TDataSource;
    DtsItensVenda: TDataSource;
    CdsItensVendaprodutoId: TIntegerField;
    CdsItensVendanomeProduto: TStringField;
    CdsItensVendaquantidade: TFloatField;
    CdsItensVendavalorUnitario: TFloatField;
    CdsItensVendavalorTotalProduto: TFloatField;
    CdsItensVendavalorTotalVenda: TAggregateField;
    procedure DataModuleCreate( Sender: TObject );
    procedure DataModuleDestroy( Sender: TObject );
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DtmVenda: TDtmVenda;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

procedure TDtmVenda.DataModuleCreate( Sender: TObject );
begin
  CdsItensVenda.CreateDataSet;
  QryCliente.Open;
  QryProdutos.Open;

end;

procedure TDtmVenda.DataModuleDestroy( Sender: TObject );
begin
  CdsItensVenda.Close;
  QryCliente.Close;
  QryProdutos.Close;
end;

end.
