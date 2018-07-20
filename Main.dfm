object ManagingTypesPersonsMain: TManagingTypesPersonsMain
  Left = 312
  Top = 130
  Width = 575
  Height = 201
  Caption = 'Managing various types of persons.'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 559
    Height = 162
    Align = alClient
    TabOrder = 0
    object pnl2: TPanel
      Left = 1
      Top = 1
      Width = 557
      Height = 48
      Align = alTop
      TabOrder = 0
      object lbConect: TLabel
        Left = 231
        Top = 17
        Width = 58
        Height = 17
        Caption = 'lbConect'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
    object btn1: TButton
      Left = 8
      Top = 78
      Width = 129
      Height = 49
      Caption = 'Client'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btn1Click
    end
    object btn2: TButton
      Left = 144
      Top = 78
      Width = 129
      Height = 49
      Caption = 'Supplier '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btn2Click
    end
    object btn3: TButton
      Left = 280
      Top = 78
      Width = 129
      Height = 49
      Caption = 'Employee'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = btn3Click
    end
    object btn4: TButton
      Left = 416
      Top = 78
      Width = 129
      Height = 49
      Caption = 'Traveler'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = btn4Click
    end
  end
end
