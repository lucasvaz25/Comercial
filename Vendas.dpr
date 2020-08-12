program Vendas;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uDTMConexao in 'dataModule\uDTMConexao.pas' {dtmConexao: TDataModule},
  uTelaHeranca in 'heranca\uTelaHeranca.pas' {frmTelaHeranca},
  uCadCategoria in 'cadastro\uCadCategoria.pas' {frmCadCategoria},
  Enter in 'Enter.pas',
  uEnum in 'heranca\uEnum.pas',
  UCategoria in 'Classes\UCategoria.pas',
  UCadCliente in 'cadastro\UCadCliente.pas' {FrmCadCliente},
  UCliente in 'Classes\UCliente.pas',
  uCadProduto in 'cadastro\uCadProduto.pas' {FrmCadProduto},
  UProduto in 'Classes\UProduto.pas',
  uFrmAtualizaDB in 'dataModule\uFrmAtualizaDB.pas' {FrmAtualizaDB},
  uDTMVenda in 'dataModule\uDTMVenda.pas' {DtmVenda: TDataModule},
  uProVenda in 'Processo\uProVenda.pas' {frmProVenda};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
