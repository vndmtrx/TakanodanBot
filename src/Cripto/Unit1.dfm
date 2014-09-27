object Form1: TForm1
  Left = 192
  Top = 114
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cripto'
  ClientHeight = 106
  ClientWidth = 133
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 27
    Top = 24
    Width = 81
    Height = 25
    Caption = 'Criptografar'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 27
    Top = 64
    Width = 81
    Height = 25
    Caption = 'Descriptografar'
    TabOrder = 1
    OnClick = Button2Click
  end
  object OpenDialog1: TOpenDialog
    Filter = '*.txt|*.txt'
    Title = 'Arquivo a Criptografar/Descriptografar'
  end
end
