inherited frmCadCategoria: TfrmCadCategoria
  Caption = 'Cadastro de Categorias'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    inherited TabListagem: TTabSheet
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
            FieldName = 'Descricao'
            Width = 321
            Visible = True
          end>
      end
    end
  end
  inherited pnlRodape: TPanel
    inherited btnNavigator: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited QryListagem: TZQuery
    SQL.Strings = (
      'select categoria, Descricao from categorias')
    object QryListagemcategoria: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'categoria'
      ReadOnly = True
    end
    object QryListagemDescricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'Descricao'
      Size = 30
    end
  end
end
