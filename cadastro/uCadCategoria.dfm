inherited frmCadCategoria: TfrmCadCategoria
  Caption = 'Cadastro de Categorias'
  OnCreate = FormCreate
  ExplicitTop = -59
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    ActivePage = tabManutencao
    inherited TabListagem: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 817
      ExplicitHeight = 363
      inherited grdListagem: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'categoria'
            Width = 108
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao'
            Width = 321
            Visible = True
          end>
      end
    end
    inherited tabManutencao: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 817
      ExplicitHeight = 363
      object edtCodigo: TLabeledEdit
        Tag = 1
        Left = 11
        Top = 32
        Width = 121
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'C'#243'digo'
        MaxLength = 10
        NumbersOnly = True
        TabOrder = 0
      end
      object edtDescricao: TLabeledEdit
        Tag = 2
        Left = 11
        Top = 88
        Width = 462
        Height = 21
        EditLabel.Width = 46
        EditLabel.Height = 13
        EditLabel.Caption = 'Descri'#231#227'o'
        MaxLength = 30
        TabOrder = 1
      end
    end
  end
  inherited pnlRodape: TPanel
    inherited btnNavigator: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited QryListagem: TZQuery
    Active = True
    SQL.Strings = (
      'select categoria, descricao from categorias')
    object QryListagemcategoria: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'categoria'
      ReadOnly = True
    end
    object QryListagemdescricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 0
    end
  end
end
