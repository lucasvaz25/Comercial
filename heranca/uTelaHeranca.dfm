object frmTelaHeranca: TfrmTelaHeranca
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'INFORME TITULO'
  ClientHeight = 432
  ClientWidth = 825
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pgcPrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 825
    Height = 391
    ActivePage = TabListagem
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 734
    ExplicitHeight = 357
    object TabListagem: TTabSheet
      Caption = 'Listagem'
      ExplicitLeft = 8
      ExplicitTop = 22
      ExplicitWidth = 726
      ExplicitHeight = 329
      object pnlListagemTopo: TPanel
        Left = 0
        Top = 0
        Width = 817
        Height = 57
        Align = alTop
        Color = clGradientInactiveCaption
        ParentBackground = False
        TabOrder = 0
        ExplicitLeft = 24
        ExplicitTop = 3
        object mskPesquisar: TMaskEdit
          Left = 8
          Top = 16
          Width = 369
          Height = 21
          TabOrder = 0
          Text = ''
          TextHint = 'Digite sua pesquisa'
        end
        object btnPesquisar: TBitBtn
          Left = 392
          Top = 14
          Width = 75
          Height = 25
          Caption = '&Pesquisar'
          TabOrder = 1
        end
      end
      object grdListagem: TDBGrid
        Left = 0
        Top = 57
        Width = 817
        Height = 306
        Align = alClient
        DataSource = DTSListagem
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object tabManutencao: TTabSheet
      Caption = 'Manuten'#231#227'o'
      ImageIndex = 1
      ExplicitWidth = 726
      ExplicitHeight = 329
    end
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 391
    Width = 825
    Height = 41
    Align = alBottom
    Color = clGradientInactiveCaption
    ParentBackground = False
    TabOrder = 1
    ExplicitLeft = 272
    ExplicitTop = 288
    ExplicitWidth = 185
    object btnNovo: TBitBtn
      Left = 4
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Novo'
      TabOrder = 0
    end
    object btnAlterar: TBitBtn
      Left = 85
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Alterar'
      TabOrder = 1
    end
    object btnCancelar: TBitBtn
      Left = 166
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 2
    end
    object btnGravar: TBitBtn
      Left = 247
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Gravar'
      TabOrder = 3
    end
    object btnApagar: TBitBtn
      Left = 328
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Apaga&r'
      TabOrder = 4
    end
    object btnFechar: TBitBtn
      Left = 736
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Fechar'
      TabOrder = 5
      OnClick = btnFecharClick
    end
    object btnNavigator: TDBNavigator
      Left = 409
      Top = 6
      Width = 224
      Height = 25
      DataSource = DTSListagem
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 6
    end
  end
  object QryListagem: TZQuery
    Connection = dtmConexao.ConexaoDB
    Params = <>
    Left = 500
    Top = 24
  end
  object DTSListagem: TDataSource
    DataSet = QryListagem
    Left = 580
    Top = 16
  end
end