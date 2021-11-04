object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Test LDAP'
  ClientHeight = 373
  ClientWidth = 1047
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
  object StringGrid1: TStringGrid
    Left = 0
    Top = 89
    Width = 1047
    Height = 284
    Align = alClient
    ColCount = 2
    DefaultColWidth = 200
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
    TabOrder = 0
    ExplicitTop = 169
    ExplicitWidth = 1007
    ExplicitHeight = 215
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1047
    Height = 89
    Align = alTop
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 1
    ExplicitWidth = 1007
    object Button1: TButton
      AlignWithMargins = True
      Left = 718
      Top = 4
      Width = 325
      Height = 81
      Align = alRight
      Caption = 'Get user list'
      TabOrder = 0
      OnClick = Button1Click
      ExplicitLeft = 678
      ExplicitHeight = 161
    end
    object Memo1: TMemo
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 708
      Height = 81
      Align = alClient
      Lines.Strings = (
        
          'SELECT CN,msExchHomeServerName FROM '#39'LDAP://OU=Users,OU=NetGenIT' +
          ',DC=netgenit,DC=local'#39' WHERE objectClass='#39'User'#39' AND '
        'UserAccountControl <> 514')
      TabOrder = 1
      ExplicitWidth = 668
      ExplicitHeight = 161
    end
  end
end
