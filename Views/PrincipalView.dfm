object FPrincipalView: TFPrincipalView
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Softplan Downloads'
  ClientHeight = 411
  ClientWidth = 701
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PanelBottom: TPanel
    Left = 0
    Top = 370
    Width = 701
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object btnExibirHistoricoDownloads: TButton
      Left = 8
      Top = 8
      Width = 153
      Height = 25
      Caption = 'Exibir hist'#243'rico de downloads'
      TabOrder = 0
      OnClick = btnExibirHistoricoDownloadsClick
    end
  end
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 701
    Height = 81
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 12
      Width = 92
      Height = 13
      Caption = 'Link para download'
    end
    object edURLDownload: TEdit
      Left = 8
      Top = 31
      Width = 570
      Height = 21
      TabOrder = 0
    end
    object btnIniciarDownload: TButton
      Left = 584
      Top = 29
      Width = 97
      Height = 25
      Caption = 'Iniciar Download'
      TabOrder = 1
      OnClick = btnIniciarDownloadClick
    end
  end
  object ScrollBoxDonwnloads: TScrollBox
    Left = 0
    Top = 81
    Width = 701
    Height = 289
    Align = alClient
    BorderStyle = bsNone
    TabOrder = 1
  end
end
