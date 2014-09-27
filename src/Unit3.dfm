object FormConfig: TFormConfig
  Left = 192
  Top = 110
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Configura'#231#227'o'
  ClientHeight = 125
  ClientWidth = 314
  Color = 12545088
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 145
    Height = 75
    Caption = 'Adicionar Dicas/Frases'
    TabOrder = 0
    object CheckBox1: TCheckBox
      Left = 8
      Top = 24
      Width = 75
      Height = 17
      Caption = 'Operadores'
      TabOrder = 0
      OnClick = CheckBox1Click
    end
    object CheckBox2: TCheckBox
      Left = 8
      Top = 48
      Width = 52
      Height = 17
      Caption = 'Voices'
      TabOrder = 1
      OnClick = CheckBox2Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 160
    Top = 8
    Width = 145
    Height = 75
    Caption = 'Remover Dicas/Frases/IA'
    TabOrder = 1
    object CheckBox4: TCheckBox
      Left = 8
      Top = 24
      Width = 75
      Height = 17
      Caption = 'Operadores'
      TabOrder = 0
      OnClick = CheckBox4Click
    end
    object CheckBox5: TCheckBox
      Left = 8
      Top = 48
      Width = 52
      Height = 17
      Caption = 'Voices'
      TabOrder = 1
      OnClick = CheckBox5Click
    end
  end
  object Button1: TButton
    Left = 119
    Top = 93
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 2
    OnClick = Button1Click
  end
end
