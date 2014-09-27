object FormTakanodanPrincipal: TFormTakanodanPrincipal
  Left = 192
  Top = 107
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsNone
  Caption = 'TakanodanBot'
  ClientHeight = 364
  ClientWidth = 570
  Color = 12545088
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 570
    Height = 364
    Align = alClient
    Style = bsRaised
  end
  object Label7: TLabel
    Left = 424
    Top = 7
    Width = 36
    Height = 15
    Caption = 'Canal:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label5: TLabel
    Left = 299
    Top = 3
    Width = 91
    Height = 13
    Caption = '[Desconectado]'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object Shape1: TShape
    Left = 480
    Top = 8
    Width = 13
    Height = 13
    Brush.Color = clNavy
    Pen.Style = psClear
    Shape = stEllipse
  end
  object Shape4: TShape
    Left = 496
    Top = 8
    Width = 13
    Height = 13
    Brush.Color = clNavy
    Pen.Style = psClear
    Shape = stEllipse
  end
  object Shape7: TShape
    Left = 512
    Top = 8
    Width = 13
    Height = 13
    Brush.Color = clNavy
    Pen.Style = psClear
    Shape = stEllipse
  end
  object Shape10: TShape
    Left = 528
    Top = 8
    Width = 13
    Height = 13
    Brush.Color = clNavy
    Pen.Style = psClear
    Shape = stEllipse
  end
  object Label8: TLabel
    Left = 274
    Top = 246
    Width = 44
    Height = 13
    Caption = 'Admins:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label9: TLabel
    Left = 274
    Top = 124
    Width = 115
    Height = 13
    Caption = 'Executar ao Conectar:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label10: TLabel
    Left = 290
    Top = 95
    Width = 98
    Height = 14
    Caption = 'Abrir log ao conectar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    Transparent = True
    OnClick = Label10Click
  end
  object Label11: TLabel
    Left = 289
    Top = 111
    Width = 128
    Height = 14
    Caption = 'Reconectar se desconectado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    Transparent = True
    OnClick = Label11Click
  end
  object Label12: TLabel
    Left = 289
    Top = 79
    Width = 78
    Height = 14
    Caption = 'Mostrar no Tray'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    Transparent = True
    OnClick = Label12Click
  end
  object Label13: TLabel
    Left = 289
    Top = 63
    Width = 81
    Height = 14
    Caption = 'Ocultar ao Iniciar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    Transparent = True
    OnClick = Label13Click
  end
  object Label14: TLabel
    Left = 289
    Top = 47
    Width = 98
    Height = 14
    Caption = 'Iniciar com Windows'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    Transparent = True
    OnClick = Label14Click
  end
  object CheckListBox1: TCheckListBox
    Left = 274
    Top = 262
    Width = 145
    Height = 96
    Hint = 'Marque para permitir deletar.'
    ItemHeight = 13
    Items.Strings = (
      'Zero_Col')
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
  end
  object GroupBox2: TGroupBox
    Left = 4
    Top = 203
    Width = 266
    Height = 155
    Caption = 'Auto-Join'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object Shape3: TShape
      Left = 165
      Top = 136
      Width = 13
      Height = 13
      Brush.Color = clNavy
      Pen.Style = psClear
      Shape = stEllipse
    end
    object Shape6: TShape
      Left = 181
      Top = 136
      Width = 13
      Height = 13
      Brush.Color = clNavy
      Pen.Style = psClear
      Shape = stEllipse
    end
    object Shape9: TShape
      Left = 197
      Top = 136
      Width = 13
      Height = 13
      Brush.Color = clNavy
      Pen.Style = psClear
      Shape = stEllipse
    end
    object Shape12: TShape
      Left = 213
      Top = 136
      Width = 13
      Height = 13
      Brush.Color = clNavy
      Pen.Style = psClear
      Shape = stEllipse
    end
    object Button5: TButton
      Left = 168
      Top = 33
      Width = 75
      Height = 25
      Caption = 'Adicionar'
      TabOrder = 2
      OnClick = Button5Click
    end
    object Button6: TButton
      Left = 168
      Top = 57
      Width = 75
      Height = 25
      Caption = 'Remover'
      TabOrder = 3
      OnClick = Button6Click
    end
    object Button3: TButton
      Left = 168
      Top = 81
      Width = 75
      Height = 25
      Caption = 'Entrar'
      TabOrder = 0
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 168
      Top = 105
      Width = 75
      Height = 25
      Caption = 'Sair'
      TabOrder = 1
      OnClick = Button4Click
    end
    object ListBox1: TListBox
      Left = 25
      Top = 16
      Width = 121
      Height = 128
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Fixedsys'
      Font.Style = []
      ItemHeight = 15
      ParentFont = False
      TabOrder = 4
    end
  end
  object GroupBox1: TGroupBox
    Left = 4
    Top = 3
    Width = 266
    Height = 198
    Caption = 'Conectar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 31
      Top = 39
      Width = 44
      Height = 13
      Caption = 'Servidor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 31
      Top = 63
      Width = 28
      Height = 13
      Caption = 'Porta'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 31
      Top = 87
      Width = 24
      Height = 13
      Caption = 'Nick'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 31
      Top = 111
      Width = 27
      Height = 13
      Caption = 'Ident'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 31
      Top = 135
      Width = 30
      Height = 13
      Caption = 'Nome'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Shape2: TShape
      Left = 164
      Top = 180
      Width = 13
      Height = 13
      Brush.Color = clNavy
      Pen.Style = psClear
      Shape = stEllipse
    end
    object Shape5: TShape
      Left = 180
      Top = 180
      Width = 13
      Height = 13
      Brush.Color = clNavy
      Pen.Style = psClear
      Shape = stEllipse
    end
    object Shape8: TShape
      Left = 196
      Top = 180
      Width = 13
      Height = 13
      Brush.Color = clNavy
      Pen.Style = psClear
      Shape = stEllipse
    end
    object Shape11: TShape
      Left = 212
      Top = 180
      Width = 13
      Height = 13
      Brush.Color = clNavy
      Pen.Style = psClear
      Shape = stEllipse
    end
    object Edit1: TEdit
      Left = 79
      Top = 31
      Width = 121
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Fixedsys'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = '127.0.0.1'
    end
    object Edit2: TEdit
      Left = 79
      Top = 55
      Width = 121
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Fixedsys'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = '6667'
    end
    object Button1: TButton
      Left = 10
      Top = 153
      Width = 75
      Height = 25
      Caption = 'Conectar'
      TabOrder = 2
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 84
      Top = 153
      Width = 75
      Height = 25
      Caption = 'Desconectar'
      TabOrder = 3
      OnClick = Button2Click
    end
    object Edit3: TEdit
      Left = 79
      Top = 79
      Width = 121
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Fixedsys'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Text = 'TakanodanBot'
    end
    object Edit4: TEdit
      Left = 79
      Top = 103
      Width = 121
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Fixedsys'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      Text = 'DelphiX'
    end
    object Edit5: TEdit
      Left = 79
      Top = 127
      Width = 121
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Fixedsys'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      Text = 'DelphiX'#169#174
    end
    object Button7: TButton
      Left = 158
      Top = 153
      Width = 75
      Height = 25
      Caption = 'Configurar'
      TabOrder = 7
      OnClick = Button7Click
    end
  end
  object ListBox2: TListBox
    Left = 423
    Top = 24
    Width = 142
    Height = 334
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Fixedsys'
    Font.Style = []
    ItemHeight = 15
    ParentFont = False
    Sorted = True
    TabOrder = 2
    OnClick = ListBox2Click
  end
  object Memo1: TMemo
    Left = 274
    Top = 140
    Width = 145
    Height = 97
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Fixedsys'
    Font.Style = []
    Lines.Strings = (
      'MODE TakanodanBot +p')
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 3
    WantReturns = False
    WordWrap = False
  end
  object CheckBox1: TCheckBox
    Left = 273
    Top = 93
    Width = 14
    Height = 17
    TabOrder = 4
  end
  object CheckBox2: TCheckBox
    Left = 273
    Top = 109
    Width = 14
    Height = 17
    Checked = True
    State = cbChecked
    TabOrder = 5
  end
  object CheckBox3: TCheckBox
    Left = 273
    Top = 77
    Width = 14
    Height = 17
    TabOrder = 6
  end
  object CheckBox4: TCheckBox
    Left = 273
    Top = 61
    Width = 14
    Height = 17
    TabOrder = 7
  end
  object CheckBox5: TCheckBox
    Left = 273
    Top = 45
    Width = 14
    Height = 17
    TabOrder = 8
  end
  object Panel1: TPanel
    Left = 277
    Top = 17
    Width = 135
    Height = 29
    BevelInner = bvLowered
    TabOrder = 9
    object SpeedButton1: TSpeedButton
      Left = 3
      Top = 2
      Width = 57
      Height = 25
      Caption = 'Log'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
        00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
        F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
        0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
        FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
        FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
        0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
        00333377737FFFFF773333303300000003333337337777777333}
      NumGlyphs = 2
      ParentFont = False
      Transparent = False
      OnClick = SpeedButton1Click
    end
    object SpeedButton4: TSpeedButton
      Left = 59
      Top = 2
      Width = 74
      Height = 25
      Caption = 'Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
        03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
        0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
        0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
        0333337F777FFFFF7F3333000000000003333377777777777333}
      NumGlyphs = 2
      ParentFont = False
      Transparent = False
      OnClick = SpeedButton4Click
    end
  end
  object Panel2: TPanel
    Left = 372
    Top = 243
    Width = 47
    Height = 20
    BevelInner = bvLowered
    TabOrder = 10
    object SpeedButton2: TSpeedButton
      Left = 2
      Top = 2
      Width = 22
      Height = 16
      Caption = 'Add'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      OnClick = SpeedButton2Click
    end
    object SpeedButton3: TSpeedButton
      Left = 23
      Top = 2
      Width = 22
      Height = 16
      Caption = 'Del'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      OnClick = SpeedButton3Click
    end
  end
  object ClientS: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 0
    OnConnecting = ClientSConnecting
    OnConnect = ClientSConnect
    OnDisconnect = ClientSDisconnect
    OnRead = ClientSRead
    OnError = ClientSError
    Left = 40
    Top = 152
  end
  object Timer2: TTimer
    Interval = 20
    OnTimer = Timer2Timer
    Left = 224
    Top = 56
  end
  object Timer1: TTimer
    Interval = 18000
    OnTimer = Timer1Timer
    Left = 224
    Top = 24
  end
  object Timer3: TTimer
    Interval = 5001
    OnTimer = Timer3Timer
    Left = 224
    Top = 88
  end
  object Timer4: TTimer
    Interval = 300001
    OnTimer = Timer4Timer
    Left = 224
    Top = 120
  end
  object PopupMenu1: TPopupMenu
    Left = 8
    Top = 152
    object Opo11: TMenuItem
      Caption = 'Mostrar'
      OnClick = Opo11Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Sair1: TMenuItem
      Caption = 'Sair'
      OnClick = Sair1Click
    end
  end
  object Timer5: TTimer
    Interval = 5001
    OnTimer = Timer5Timer
    Left = 224
    Top = 152
  end
  object Timer6: TTimer
    Interval = 20000
    OnTimer = Timer6Timer
    Left = 224
    Top = 184
  end
end
