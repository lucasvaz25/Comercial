object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Menu Principal'
  ClientHeight = 398
  ClientWidth = 667
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mainPrincipal
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 667
    Height = 398
    Align = alClient
    Color = clGradientInactiveCaption
    ParentBackground = False
    TabOrder = 0
  end
  object mainPrincipal: TMainMenu
    Left = 24
    Top = 16
    object Cadastro1: TMenuItem
      Caption = 'Cadastro'
      object Clientes1: TMenuItem
        Caption = 'Clientes'
        OnClick = Clientes1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Categoria1: TMenuItem
        Caption = 'Categorias'
        OnClick = Categoria1Click
      end
      object Produtos1: TMenuItem
        Caption = 'Produtos'
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Fechar1: TMenuItem
        Caption = 'Fechar'
        OnClick = Fechar1Click
      end
    end
    object Movimentao1: TMenuItem
      Caption = 'Movimenta'#231#227'o'
      object Vendas1: TMenuItem
        Caption = 'Vendas'
      end
    end
    object Relatrio1: TMenuItem
      Caption = 'Relat'#243'rios'
      object Clientes2: TMenuItem
        Caption = 'Clientes'
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object produtos2: TMenuItem
        Caption = 'Produtos'
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object VendaporDAta1: TMenuItem
        Caption = 'Venda por data'
      end
    end
  end
end
