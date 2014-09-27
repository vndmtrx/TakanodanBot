{**************************************************}
{             c . A . N . A . L                    }
{        # D . E . L . P . H . I . X               }
{**************************************************}
unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ScktComp, StdCtrls, ExtCtrls, Buttons, IdHTTP, ShellApi, Menus, ComCtrls, Registry,
  CheckLst, Contnrs;

const
  WM_TRAYICON = WM_USER+1;

type
  TFormTakanodanPrincipal = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label3: TLabel;
    Label4: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    ClientS: TClientSocket;
    Edit5: TEdit;
    Label5: TLabel;
    GroupBox2: TGroupBox;
    Button3: TButton;
    Button4: TButton;
    Label6: TLabel;
    Button5: TButton;
    Button6: TButton;
    Timer2: TTimer;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    Shape10: TShape;
    Shape11: TShape;
    Shape12: TShape;
    ListBox2: TListBox;
    Label7: TLabel;
    Label8: TLabel;
    Timer1: TTimer;
    Label9: TLabel;
    Memo1: TMemo;
    CheckBox1: TCheckBox;
    Label10: TLabel;
    CheckBox2: TCheckBox;
    Label11: TLabel;
    Timer3: TTimer;
    Timer4: TTimer;
    PopupMenu1: TPopupMenu;
    Opo11: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    CheckBox3: TCheckBox;
    Label12: TLabel;
    CheckBox4: TCheckBox;
    Label13: TLabel;
    CheckBox5: TCheckBox;
    Label14: TLabel;
    Bevel1: TBevel;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Panel2: TPanel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Timer5: TTimer;
    ListBox1: TListBox;
    CheckListBox1: TCheckListBox;
    Timer6: TTimer;
    Button7: TButton;
    procedure ClientSConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ClientSDisconnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure ClientSRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button4Click(Sender: TObject);
    procedure ClientSConnecting(Sender: TObject; Socket: TCustomWinSocket);
    procedure Button5Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure ClientSError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure FormDestroy(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Label10Click(Sender: TObject);
    procedure Label11Click(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
    procedure Opo11Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Label12Click(Sender: TObject);
    procedure Label13Click(Sender: TObject);
    procedure Label14Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Timer5Timer(Sender: TObject);
    procedure Timer6Timer(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    { Private declarations }
    procedure WMNCHitTest(var Msg: TMessage); 
    message WM_NCHitTest;
    procedure WMMove(var Msg: TWMMove); message WM_MOVE;
    procedure EnviaTexto(Texto: String);
    procedure EnviaPrivMsg(Destino, Texto: String);
    procedure AtualizaLista(Nicks: String);
//    procedure EnviaNotice(Destino, Texto: String);
    procedure SetNick(sNick: String);
    procedure SetUsuario(Ident, Nome: String);
    procedure WMTrayIcon(var Msg : TMessage); message WM_TRAYICON;
    procedure WMHotKey(var Msg: TWMHotKey); message WM_HOTKEY;
    procedure ManipulaExcecoes(Sender: TObject; E: Exception);
  public
    { Public declarations }
    Function StripIRCColor(Text: String): String;
  end;

var
  FormTakanodanPrincipal: TFormTakanodanPrincipal;
  RecList : TStringList;
  Vermelho, Verde, Azul, vetor: Integer;
  ProxyIP, BUFFER: TStringList;
  Channel: String;
  DelDFAIOP,DelDFAIVOICE,ADDDFOP,ADDDFVOICE:Boolean;

implementation

uses Unit2, Math, Variants, Unit3;


{$R *.DFM}

{------------ Funções ---------------}

{$Warnings off}
function GetBuildInfo:string;
var
VerInfoSize: DWORD;
VerInfo: Pointer;
VerValueSize: DWORD;
VerValue: PVSFixedFileInfo;
Dummy: DWORD;
V1, V2, V3, V4: Word;
Prog : string;
begin
Prog := Application.Exename;
VerInfoSize := GetFileVersionInfoSize(PChar(prog), Dummy);
GetMem(VerInfo, VerInfoSize);
GetFileVersionInfo(PChar(prog), 0, VerInfoSize, VerInfo);
VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
with VerValue^ do
  begin
  V1 := dwFileVersionMS shr 16;
  V2 := dwFileVersionMS and $FFFF;
  V3 := dwFileVersionLS shr 16;
  V4 := dwFileVersionLS and $FFFF;
  end;
FreeMem(VerInfo, VerInfoSize);
result := Copy (IntToStr (100 + v1), 3, 2) + '.' + 
  Copy (IntToStr (100 + v2), 3, 2) + '.' + 
  Copy (IntToStr (100 + v3), 3, 2) + '.' + 
  Copy (IntToStr (100 + v4), 3, 2);
end;

{$Warnings on}

(*
  Função para retirar caracteres de cor de strings de IRC
  Eduardo Rolim(Vndmtrx) - Knal #DelphiX - [BrasNet]
  www.vindemiatrix.x-br.com
*)
function TFormTakanodanPrincipal.StripIRCColor(Text: String): String;

Type
  TUnitCor = packed Record
    Pos: Integer;
    Tam: Integer;
  end;

  PUnitCor = ^TUnitCor;

Var
 Str: String;
 UnitCor: PUnitCor;
 Pilha: TStack;

 I, LText: Integer; //Contador para o laço For
 Pos: Integer; //Armazenador para a posição do início do marcador de cor que iremos excluir
 Tam: Integer; //Armazenador para o tamanho do marcador de cor
 Estado: Integer; //Estado atual da máquina

begin
  //Inicialização das variáveis e objetos usados na execução do autômato
  Str := Text;
  Pos := -1;
  Tam := -1;
  Estado := 1;
  LText := Length(Str);
  Pilha := TStack.Create;

  //Início da execução do Autômato
  //For I := 1 to Length(Str) do begin
  I := 1;
  While (I <= LText) OR (Estado <> 1) do begin
    
    Case Estado of
      1: Begin //Estado atual: 1; Verifica caracter #3
        If Str[I] in [#3] then begin
          Pos := I;
          Tam := 1;
          Estado := 2;
          Inc(I);
        end else begin

          {
           http://www.sourcex.x-br.com/prog/artigos/ascii.html
           Todos os caracteres entre #1 e #31 são considerados caracteres de controle,
           por isto estes normalmente não aparecem em mensagens e podem ser excluídos
           sem risco à interpretação da mensagem.

           Os caracteres de 32 a 127 e os ASCII extendidos são os caracteres de input normais.
          }
          //Excluindo outros caracteres de controle simples.
          If Str[I] in [#1 .. #31] then begin
            Pos := I;
            Tam := 1;
            Inc(I);

            //Delete(Str, Pos, Tam);
            New(UnitCor);
            UnitCor^.Pos := Pos;
            UnitCor^.Tam := Tam;
            Pilha.Push(UnitCor);
          end else begin
            Inc(I);
          end;
        end;
      end; //Fim do Estado 1

      2: Begin //Estado atual: 2; Verifica caracter <Numerico>
        If Str[I] in ['0'..'9'] then begin
          Inc(Tam);
          Estado := 3;
          Inc(I);
        end else begin
          Estado := 1;
          //Inc(I);

          //Delete(Str, Pos, Tam);
          New(UnitCor);
          UnitCor^.Pos := Pos;
          UnitCor^.Tam := Tam;
          Pilha.Push(UnitCor);
        end;
      end; //Fim do Estado 2

      3: Begin //Estado atual: 3; Verifica caracteres <Numerico> ou ","
        If Str[I] in ['0'..'9'] then begin
          Inc(Tam);
          Estado := 4;
          Inc(I);
        end else begin
          If Str[I] in [','] then begin
            Inc(Tam);
            Estado := 5;
            Inc(I);
          end else begin
            Estado := 1;
            //Inc(I);

            //Delete(Str, Pos, Tam);
            New(UnitCor);
            UnitCor^.Pos := Pos;
            UnitCor^.Tam := Tam;
            Pilha.Push(UnitCor);
          end;
        end;
      end; //Fim do Estado 3

      4: Begin //Estado Atual: 4; Verifica caracter ","
        If Str[I] in [','] then begin
          Inc(Tam);
          Estado := 5;
          Inc(I);
        end else begin
          Estado := 1;
          //Inc(I);

          //Delete(Str, Pos, Tam);
          New(UnitCor);
          UnitCor^.Pos := Pos;
          UnitCor^.Tam := Tam;
          Pilha.Push(UnitCor);
        end;
      end; //Fim Estado 4

      5: Begin //Estado Atual 5; Verifica caracter <Numerico>
        If Str[I] in ['0'..'9'] then begin
          Inc(Tam);
          Estado := 6;
          Inc(I);
        end else begin
          Estado := 1;
          Dec(Tam); //Se não houver número depois da virgula, significa que é uma vírgula normal
          //Inc(I);

          //Delete(Str, Pos, Tam);
          New(UnitCor);
          UnitCor^.Pos := Pos;
          UnitCor^.Tam := Tam;
          Pilha.Push(UnitCor);
        end;
      end; //Fim do Estado 5

      6: Begin //Estado Atual 6; Verifica caracter <Numerico>
        If Str[I] in ['0'..'9'] then begin
          Inc(Tam);
          Estado := 1;
          //Inc(I);

          //Delete(Str, Pos, Tam);
          New(UnitCor);
          UnitCor^.Pos := Pos;
          UnitCor^.Tam := Tam;
          Pilha.Push(UnitCor);
        end else begin
          Estado := 1;
          //Inc(I);

          //Delete(Str, Pos, Tam);
          New(UnitCor);
          UnitCor^.Pos := Pos;
          UnitCor^.Tam := Tam;
          Pilha.Push(UnitCor);
        end;
      end; //Fim do Estado 6

    end; //Fim do Case
  end; //Fim do laço For
  //Fim da execução do autômato e início da execução da limpeza da string

  While Pilha.Count > 0 do begin // Aqui efetuamos a limpeza na string
    
    UnitCor := Pilha.Pop;
    Delete(Str, UnitCor^.Pos, UnitCor^.Tam);
    Dispose(UnitCor);
  end;
  FreeAndNil(Pilha);
  Result := Str;
end;

function Crypt(Action, Src: String): String;
Label Fim;
var KeyLen : Integer;
  KeyPos : Integer;
  OffSet : Integer;
  Dest, Key : String;  
  SrcPos : Integer;
  SrcAsc : Integer;
  TmpSrcAsc : Integer;
  Range : Integer;
begin
  if (Src = '') Then
  begin
    Result:= '';
    Goto Fim;
  end;
  Key :='8828';
  Dest := '';
  KeyLen := Length(Key);
  KeyPos := 0;
  Range := 256;
  if (Action = UpperCase('C')) then
  begin
    Randomize;
    OffSet := Random(Range);
    Dest := Format('%1.2x',[OffSet]);
    for SrcPos := 1 to Length(Src) do
    begin
      
      SrcAsc := (Ord(Src[SrcPos]) + OffSet) Mod 255;
      if KeyPos < KeyLen then KeyPos := KeyPos + 1 else KeyPos := 1;
      SrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
      Dest := Dest + Format('%1.2x',[SrcAsc]);
      OffSet := SrcAsc;
    end;
  end
  Else if (Action = UpperCase('D')) then
  begin
    OffSet := StrToInt('$'+ copy(Src,1,2));
    SrcPos := 3;
  repeat
    SrcAsc := StrToInt('$'+ copy(Src,SrcPos,2));
    if (KeyPos < KeyLen) Then KeyPos := KeyPos + 1 else KeyPos := 1;
    TmpSrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
    if TmpSrcAsc <= OffSet then TmpSrcAsc := 255 + TmpSrcAsc - OffSet
    else TmpSrcAsc := TmpSrcAsc - OffSet;
    Dest := Dest + Chr(TmpSrcAsc);
    OffSet := SrcAsc;
    SrcPos := SrcPos + 2;
  until (SrcPos >= Length(Src));
  end;
  Result:= Dest;
  Fim:
end;

function Procura(StrInicial,StrProcura : String) : Boolean;
var
  PosAtu : Integer;
begin
  PosAtu := Pos(AnsiUpperCase(StrProcura),AnsiUpperCase(StrInicial));
  if PosAtu <> 0 then
    Begin
      Result := True;
    end
  else
    begin
      Result := False;
    end;
end;

function ProcuraeSubstitui(StrInicial,StrProcura,StrSubstitui : String) :
   String;
var
  PosAtu : Integer;
begin
  PosAtu := Pos(AnsiUpperCase(StrProcura),AnsiUpperCase(StrInicial));
  while PosAtu <> 0 do begin
    
    Delete(StrInicial,PosAtu,Length(StrProcura));
    Insert(StrSubstitui,StrInicial,PosAtu);
    PosAtu := Pos(AnsiUpperCase(StrProcura),AnsiUpperCase(StrInicial));
  end;
  Result := StrInicial;
end;

function TestaNumero(Numero : String) : Boolean;
begin
  try
    StrToInt(Numero);
    Result := True;
  except
    On EConvertError do
      Result := False;
  end;
end;

function SepararTotalFraze(Total : Integer) : String;
var
  X: Integer;
  play,loadtxt: TStringList;
begin
  try
    loadtxt:=TStringList.Create;
    loadtxt.Duplicates:=dupIgnore;
    loadtxt.LoadFromFile(ExtractFilePath(Application.ExeName)+'bin\achadas.txt');
    loadtxt.Text:=Crypt('D',loadtxt[0]);
    play:=TStringList.Create;
    play.Duplicates:=dupIgnore;
    for X := Total to Total+4 do
      begin
        
        if loadtxt.Count-1>=X then
          begin
            play.Add(loadtxt[X]);
          end;
      end;
    play.Text:=Crypt('C',play.Text);
    play.SaveToFile(ExtractFilePath(Application.ExeName)+'bin\achadas.txt');
    FreeAndNil(loadtxt);
    FreeAndNil(play);
  except
    On EConvertError do
      Result := 'Foi Encontrado Erro!!!';
  end;
end;

function SepararTotalDica(Total : Integer) : String;
var
  X: Integer;
  loadtxt, play: TStringList;
begin
  try
    loadtxt:=TStringList.Create;
    loadtxt.Duplicates:=dupIgnore;
    loadtxt.LoadFromFile(ExtractFilePath(Application.ExeName)+'bin\achadas.txt');
    loadtxt.Text:=Crypt('D',loadtxt[0]);
    play:=TStringList.Create;
    play.Duplicates:=dupIgnore;
    for X := Total to Total+4 do
      begin
        
        if loadtxt.Count-1>=X then
          begin
            play.Add(loadtxt[X]);
          end;
      end;
    play.Text:=Crypt('C',play.Text);
    play.SaveToFile(ExtractFilePath(Application.ExeName)+'bin\achadas.txt');
    FreeAndNil(loadtxt);
    FreeAndNil(play);
  except
    On EConvertError do
      Result := 'Foi Encontrado Erro!!!';
  end;
end;

function dicaremove(dica:Integer):String;
var
  dicas: TStringList;
begin
  dicas:=TStringList.Create;
  dicas.Duplicates:=dupIgnore;
  dicas.LoadFromFile(ExtractFilePath(Application.ExeName)+'bin\dicas.txt');
  dicas.Text:=Crypt('D',dicas[0]);
  dicas.Delete(dica);
  dicas.Text:=Crypt('C',dicas.Text);
  dicas.SaveToFile(ExtractFilePath(Application.ExeName)+'bin\dicas.txt');
  Result:='Dica '+IntToStr(dica)+' Removida!!!';
  FreeAndNil(dicas);
end;

function dicaexibir(dica:String):String;
var
  lista, dicas, chave: TStringList;
  X, Y, ADD: integer;
begin
  dicas:=TStringList.Create;
  lista:=TStringList.Create;
  chave:=TStringList.Create;
  dicas.Duplicates:=dupIgnore;
  lista.Duplicates:=dupIgnore;
  chave.Duplicates:=dupIgnore;
  chave.Text:=ProcuraeSubstitui(dica,'+',#13);
  chave.Text:=ProcuraeSubstitui(chave.Text,' ',#13);
  dicas.LoadFromFile(ExtractFilePath(Application.ExeName)+'bin\dicas.txt');
  dicas.Text:=Crypt('D',dicas[0]);
  lista.Clear;
  for X := 0 to dicas.Count-1 do
    begin
      
      ADD:=1;
      For Y:= 0 to chave.Count-1 do
        begin
          
          if Pos(AnsiLowerCase(chave[Y]), AnsiLowerCase(dicas[X])) = 0 then
            begin
              ADD:=0;
            end;
        end;
      if ADD=1 then
        begin
          lista.Add('Dica '+IntToStr(X)+' - '+dicas[X]);
        end;
    end;
  if lista.Text='' then
    begin
      Result:='Nada Encontrado com '+dica+'!!!';
    end
  else
    begin
      Result:='14,0Achado '+IntToStr(lista.Count)+' Dica(s) com palavra chave 4,0"'+dica+'" 5,0Digite: '+ '!DICA+4,015,0ate4,0'+IntToStr(lista.Count)+'5,0+'+'4,0"'+dica+'" 5,0 para mais dicas '+' 14,0Enviando Primeiras Achadas!!!';
      lista.Text:=Crypt('C',lista.Text);
      lista.SaveToFile(ExtractFilePath(Application.ExeName)+'bin\achadas.txt');
    end;
  FreeAndNil(dicas);
  FreeAndNil(lista);
end;

function adddica(dica:String):String;
label fim;
var
  dicas: TStringList;
  NumDica, X: Integer;
begin
  dicas:=TStringList.Create;
  dicas.Duplicates:=dupIgnore;
  dicas.LoadFromFile(ExtractFilePath(Application.ExeName)+'bin\dicas.txt');
  dicas.Text:=Crypt('D',dicas[0]);
  for X:=0 to dicas.Count-1 do
    begin
      
      if Procura(dicas[X],dica)=True then
        begin
          Result:='Dica já cadastrada!!!';
          goto Fim;
        end;
    end;
  dicas.Add(dica);
  NumDica:=dicas.Count-1;
  dicas.Text:=Crypt('C',dicas.Text);
  dicas.SaveToFile(ExtractFilePath(Application.ExeName)+'bin\dicas.txt');
  Result:='Dica Nº: '+IntToStr(NumDica)+ ' Adicionada!!!';
  Fim:
  FreeAndNil(dicas);
end;

function PosCopyPalav(Msg: String; Index: Integer; const Separador: String = ' '): String;
var
  S : string;
  I : Integer;
begin
  S := Msg;
  I := 1;
  while I<Index do
  begin
    
    S := Copy(S, Pos(Separador,S) + Length(Separador), Length(S));
    Inc(I);
  end;
  S := S + Separador;
  Result := Copy(S, 1, Pos(Separador,S)-1);
end;

Function Occurs(T, S : ShortString) : Byte; 
Var 
  P : Byte;
Begin
  Result := 0;
  P:=Pos(T,S);
  while P > 0 do
    begin
      
      Inc(Result);
      S:=Copy(S,P+Length(T),255);
      P:=Pos(T,S);
    end;
End;

function PegaUsuarios(Texto : String) : String;
var
  Retorno:TStringList;
  Canal:String;
  Number,X:Integer;
begin
  Retorno:=TStringList.Create;
  Canal:='#'+PosCopyPalav(Texto,2,'#');
  Canal:=PosCopyPalav(Canal,1,' :');
  Texto:=PosCopyPalav(Texto,2,' :');
  Number:=Occurs(' ',Texto);
  for X:=1 to Number do
    begin
      
      Retorno.Add(Canal+'='+PosCopyPalav(Texto,X,' '));
    end;
  Result:=Retorno.Text;
  FreeAndNil(Retorno);
end;

function AI(valor: String; Retorno: TStringList) : String;
var
  banco, banco2: TStringList;
  separa: String;
  X: integer;
begin
  banco:=TStringList.Create;
  banco2:=TStringList.Create;
  banco.Duplicates:=dupIgnore;
  banco2.Duplicates:=dupIgnore;
  separa:=valor;
  while Pos(' ', separa) > 0 do
    begin
      
      banco.Add(PosCopyPalav(separa,1,' '));
      if Pos(' ', separa) > 0 then
        begin
          separa:=ProcuraeSubstitui(separa,PosCopyPalav(separa,1,' ')+' ','');
        end;
    end;
    banco.Add(separa);
    banco2.Clear;
    for X := 0 to banco.Count-1 do
      begin
        
        separa:=banco[X];
        if Pos(separa, Retorno.Text) > 0 then
          begin
            banco2.Add(banco[X]);
          end;
      end;
  if banco2.Text<>'' then
    begin
      banco:=banco2;
      randomize;
      separa:=banco[RANDOM(banco.Count)];
      banco.Clear;
      banco2.Clear;
      banco:=Retorno;
    end
  else
    begin
      randomize;
      Result:=Retorno[RANDOM(Retorno.Count)];
      Exit;
    end;
  for X := 0 to banco.Count-1 do
    begin
      
      if Pos(AnsiLowerCase(separa), AnsiLowerCase(banco[X])) > 0 then
        begin
          banco2.Add(banco[X]);
        end;
    end;
  randomize;
  Result:=banco2[RANDOM(banco2.Count)];
end;

function filtra(palavra:String):String;
var
  comentario, url, chave: String;
  IdHTTP1: TIdHTTP;
begin
  IdHTTP1:=TIdHTTP.Create(Application);
  ProxyIP:=TStringList.Create;
  ProxyIP.Duplicates:=dupIgnore;
  ProxyIP.LoadFromFile(ExtractFilePath(Application.ExeName)+'proxyip.cfg');
  IdHTTP1.Request.UserAgent:='Mozilla/4.6 [en] (Win98; I)';
  if ProxyIP.Text<>'' then
    begin
      IdHTTP1.ProxyParams.ProxyPort:=StrToInt(ProxyIP[1]);
      IdHTTP1.ProxyParams.ProxyServer:=ProxyIP[0];
    end;
  FreeAndNil(ProxyIP);
//  IdHTTP1.ProxyParams.BasicAuthentication:=True;
  chave:=ProcuraeSubstitui(palavra,' ','+');
  comentario:=IdHTTP1.Get('http://www.google.com.br/search?hl=pt-BR&ie=UTF-8&q='+chave+'&meta=');
  comentario:=PosCopyPalav(comentario,2,'<p><a href=');
  comentario:=PosCopyPalav(comentario,1,'</a>');
  comentario:=ProcuraeSubstitui(comentario,'<b>','');
  comentario:=ProcuraeSubstitui(comentario,'</b>','');
  comentario:=PosCopyPalav(comentario,2,'>');
  comentario:='['+comentario+']';
  url:=IdHTTP1.Get('http://www.google.com.br/search?hl=pt-BR&ie=UTF-8&q='+chave+'&meta=');
  url:=PosCopyPalav(url,2,'<p><a href=');
  url:=PosCopyPalav(url,1,'>');
  if Procura(AnsiUpperCase(url),AnsiUpperCase('HTTP://'))=True then
    begin
      Result:=url+' - '+comentario;
    end
  else
    begin
      Result:='Nada Encontrado!!!';
    end;
  FreeAndNil(IdHTTP1);
end;

function InfoPlayer(palavra:String):String;
var
  max, url, url2, final, Kill: String;
  IdHTTP1: TIdHTTP;
  X: Integer;
begin
  IdHTTP1:=TIdHTTP.Create(Application);
  ProxyIP:=TStringList.Create;
  ProxyIP.Duplicates:=dupIgnore;
  ProxyIP.LoadFromFile(ExtractFilePath(Application.ExeName)+'proxyip.cfg');
  IdHTTP1.Request.UserAgent:='Mozilla/4.6 [en] (Win98; I)';
  if ProxyIP.Text<>'' then
    begin
      IdHTTP1.ProxyParams.ProxyPort:=StrToInt(ProxyIP[1]);
      IdHTTP1.ProxyParams.ProxyServer:=ProxyIP[0];
    end;
  FreeAndNil(ProxyIP);
//  IdHTTP1.ProxyParams.BasicAuthentication:=True;
  url2:=IdHTTP1.Get('http://www.serverspy.net/site/search/server.html?a='+palavra+'&g=0');
  max:=url2;
  max:=PosCopyPalav(max,2,'ssmR[6] = new Array('+chr(39)+'Players'+chr(39)+','+chr(39));
  max:=PosCopyPalav(max,1,' / ');
  url:=url2;
  url:=PosCopyPalav(url,2,'var ssmP = new Array();');
  url:=PosCopyPalav(url,1,'var ssmPC = 0;');
  url2:=url;
  Kill:=url;
  if (max<>'0') and (max<>'') then
    begin
      for X:= 0 to StrToInt(max)-2 do
        begin
          
          url:=PosCopyPalav(url,2,'ssmP['+IntToStr(X)+'] = new Array('+chr(39));
          url:=PosCopyPalav(url,1,chr(39)+','+chr(39));
          Kill:=PosCopyPalav(Kill,2,url+chr(39)+','+chr(39));
          Kill:=PosCopyPalav(Kill,1,chr(39)+','+chr(39));
          url:=ProcuraeSubstitui(url,' ',chr(95));
          url:=ProcuraeSubstitui(url,'&#30;',chr(30));
          url:=ProcuraeSubstitui(url,'&#31;',chr(31));
          url:=ProcuraeSubstitui(url,'&#33;',chr(33));
          url:=ProcuraeSubstitui(url,'&#35;',chr(35));
          url:=ProcuraeSubstitui(url,'&#36;',chr(36));
          url:=ProcuraeSubstitui(url,'&#40;','');
          url:=ProcuraeSubstitui(url,'&#41;','');
          url:=ProcuraeSubstitui(url,'&#42;',chr(42));
          url:=ProcuraeSubstitui(url,'&#43;',chr(43));
          url:=ProcuraeSubstitui(url,'&#44;',chr(44));
          url:=ProcuraeSubstitui(url,'&#45;',chr(45));
          url:=ProcuraeSubstitui(url,'&#45;',chr(45));
          url:=ProcuraeSubstitui(url,'&#46;',chr(46));
          url:=ProcuraeSubstitui(url,'&#47;',chr(47));
          url:=ProcuraeSubstitui(url,'&#58;',chr(58));
          url:=ProcuraeSubstitui(url,'&#59;',chr(59));
          url:=ProcuraeSubstitui(url,'&#60;',chr(60));
          url:=ProcuraeSubstitui(url,'&#61;',chr(61));
          url:=ProcuraeSubstitui(url,'&#62;',chr(62));
          url:=ProcuraeSubstitui(url,'&#63;',chr(63));
          url:=ProcuraeSubstitui(url,'&#64;',chr(64));
          url:=ProcuraeSubstitui(url,'&#91;',chr(91));
          url:=ProcuraeSubstitui(url,'&#93;',chr(93));
          url:=ProcuraeSubstitui(url,'&#94;',chr(94));
          url:=ProcuraeSubstitui(url,'&#123;',chr(123));
          url:=ProcuraeSubstitui(url,'&#124;',chr(124));
          url:=ProcuraeSubstitui(url,'&#125;',chr(125));
          url:=ProcuraeSubstitui(url,'&#126;',chr(126));
          url:=ProcuraeSubstitui(url,'&#127;',chr(127));
          final:=final+'{'+url+'}'+'{'+Kill+'} ';
          url:=url2;
          Kill:=url2;
        end;
    end;
  palavra:=final;
  Result:=palavra;
  FreeAndNil(IdHTTP1);
end;

function Infoip(palavra:String):String;
var
  url, url2, final: String;
  IdHTTP1: TIdHTTP;
begin
  IdHTTP1:=TIdHTTP.Create(Application);
  ProxyIP:=TStringList.Create;
  ProxyIP.Duplicates:=dupIgnore;
  ProxyIP.LoadFromFile(ExtractFilePath(Application.ExeName)+'proxyip.cfg');
  IdHTTP1.Request.UserAgent:='Mozilla/4.6 [en] (Win98; I)';
  if ProxyIP.Text<>'' then
    begin
      IdHTTP1.ProxyParams.ProxyPort:=StrToInt(ProxyIP[1]);
      IdHTTP1.ProxyParams.ProxyServer:=ProxyIP[0];
    end;
  FreeAndNil(ProxyIP);
//  IdHTTP1.ProxyParams.BasicAuthentication:=True;
  url2:=IdHTTP1.Get('http://www.serverspy.net/site/search/server.html?a='+palavra+'&g=0');
  url:=url2;
  url:=PosCopyPalav(url,2,'ssmR[0] = new Array('+chr(39)+'Name'+chr(39)+','+chr(39));
  url:=PosCopyPalav(url,1,chr(39)+');');
  url:=ProcuraeSubstitui(url,'|','-');
  final:=final+'Nome:1,0[0,12'+url+'1,0] ';
  url:=url2;
  url:=PosCopyPalav(url,2,'ssmR[1] = new Array('+chr(39)+'IP'+chr(39)+','+chr(39));
  url:=PosCopyPalav(url,1,chr(39)+');');
  url:=ProcuraeSubstitui(url,'|','-');
  final:=final+'IP:1,0[0,12'+url+'1,0] ';
  url:=url2;
  url:=PosCopyPalav(url,2,'ssmR[2] = new Array('+chr(39)+'Game'+chr(39)+','+chr(39));
  url:=PosCopyPalav(url,1,chr(39)+');');
  url:=ProcuraeSubstitui(url,'|','-');
  final:=final+'Jogo:1,0[0,12'+url+'1,0] ';
  url:=url2;
  url:=PosCopyPalav(url,2,'ssmR[3] = new Array('+chr(39)+'Type'+chr(39)+','+chr(39));
  url:=PosCopyPalav(url,1,chr(39)+');');
  url:=ProcuraeSubstitui(url,'|','-');
  final:=final+'MOD:1,0[0,12'+url+'1,0] ';
  url:=url2;
  url:=PosCopyPalav(url,2,'ssmR[4] = new Array('+chr(39)+'Map'+chr(39)+','+chr(39));
  url:=PosCopyPalav(url,1,chr(39)+');');
  url:=ProcuraeSubstitui(url,'|','-');
  final:=final+'Mapa:1,0[0,12'+url+'1,0] ';
  url:=url2;
  url:=PosCopyPalav(url,2,'ssmR[5] = new Array('+chr(39)+'OS'+chr(39)+','+chr(39));
  url:=PosCopyPalav(url,1,chr(39)+');');
  url:=ProcuraeSubstitui(url,'|','-');
  final:=final+'SO:1,0[0,12'+url+'1,0] ';
  url:=url2;
  url:=PosCopyPalav(url,2,'ssmR[6] = new Array('+chr(39)+'Players'+chr(39)+','+chr(39));
  url:=PosCopyPalav(url,1,chr(39)+');');
  url:=ProcuraeSubstitui(url,'|','-');
  final:=final+'Jogadores:1,0[0,12'+url+'1,0] ';
  url:=url2;
  url:=PosCopyPalav(url,2,'ssmR[7] = new Array('+chr(39)+'Ranking'+chr(39)+','+chr(39));
  url:=PosCopyPalav(url,1,chr(39)+');');
  url:=ProcuraeSubstitui(url,'|','-');
  final:=final+'Ranking:1,0[0,12'+url+'1,0] ';
  url:=url2;
  url:=PosCopyPalav(url,2,'ssmR[8] = new Array('+chr(39)+'Location'+chr(39)+','+chr(39));
  url:=PosCopyPalav(url,1,'<img');
  url:=ProcuraeSubstitui(url,'|','-');
  final:=final+'Localização:1,0[0,12'+url+'1,0] ';
  palavra:=final;
  if palavra<>'' then
    begin
      Result:=palavra;
    end
  else
    begin
      Result:='Servidor OFF!!!';
    end;
  FreeAndNil(IdHTTP1);
end;

//Função padrão para enviar Texto com #13#10 no final
function infohost(palavra:String):String;
var
  url: String;
  IdHTTP1: TIdHTTP;
begin
  IdHTTP1:=TIdHTTP.Create(Application);
  ProxyIP:=TStringList.Create;
  ProxyIP.Duplicates:=dupIgnore;
  ProxyIP.LoadFromFile(ExtractFilePath(Application.ExeName)+'proxyip.cfg');
  IdHTTP1.Request.UserAgent:='Mozilla/4.6 [en] (Win98; I)';
  if ProxyIP.Text<>'' then
    begin
      IdHTTP1.ProxyParams.ProxyPort:=StrToInt(ProxyIP[1]);
      IdHTTP1.ProxyParams.ProxyServer:=ProxyIP[0];
    end;
  FreeAndNil(ProxyIP);
//  IdHTTP1.ProxyParams.BasicAuthentication:=True;
  url:=IdHTTP1.Get('http://uptime.netcraft.com/up/graph/?host='+palavra);
  url:=PosCopyPalav(url,2,'was running');
  url:=PosCopyPalav(url,1,'<span');
  url:=ProcuraeSubstitui(url,'on','em ');
  url:=ProcuraeSubstitui(url,'		    ','');
  url:=ProcuraeSubstitui(url,chr(10),'');
  if url<>'' then
    begin
      Result:=palavra+' está rodando '+url+'.';
    end
  else
    begin
      Result:=palavra+' Host Desconhecido!!!';
    end;
  FreeAndNil(IdHTTP1);
end;

function ExtensoMil(Numero : String) : String;
const
  Unidades : Array[1..19] of String = ('Um','Dois','Três','Quatro',
    'Cinco','Seis','Sete','Oito','Nove','Dez','Onze','Doze','Treze',
    'Quatorze','Quinze','Dezesseis','Dezessete','Dezoito','Dezenove');
  Dezenas : Array[2..9] of String = ('Vinte','Trinta','Quarenta',
    'Cincoenta','Sessenta','Setenta','Oitenta','Noventa');
  Centenas : Array[1..9] of String = ('Cem','Duzentos','Trezentos',
    'Quatrocentos','Quinhentos','Seiscentos','Setecentos','Oitocentos',
    'Novecentos');
begin
  Result := '';
  if Numero[1] <> '0' then
    Result := Centenas[Ord(Numero[1])-Ord('0')];
  if StrToInt(Copy(Numero,2,2)) > 0 then begin
    if Result <> '' then
      Result := Result + ' e ';
    if StrToInt(Copy(Numero,2,2)) <= 19 then
      Result := Result + Unidades[StrToInt(Copy(Numero,2,2))]
    else begin
      Result := Result + Dezenas[Ord(Numero[2])-Ord('0')];
      if Numero[3] <> '0' then
        Result := Result + ' e ' + Unidades[Ord(Numero[3])-Ord('0')];
    end;
  end;
end;

function Fraseremove(Frase:Integer):String;
var
  Frases: TStringList;
begin
  Frases:=TStringList.Create;
  Frases.Duplicates:=dupIgnore;
  Frases.LoadFromFile(ExtractFilePath(Application.ExeName)+'bin\botfrases.txt');
  Frases.Text:=Crypt('D',Frases[0]);
  Frases.Delete(Frase);
  Frases.Text:=Crypt('C',Frases.Text);
  Frases.SaveToFile(ExtractFilePath(Application.ExeName)+'bin\botfrases.txt');
  Result:='Frase '+ IntToStr(Frase) +' Removida!!!';
  FreeAndNil(Frases);
end;

function Fraseexibir(Frase:String):String;
var
  lista, Frases, chave: TStringList;
  X, Y, ADD: integer;
begin
  Frases:=TStringList.Create;
  lista:=TStringList.Create;
  chave:=TStringList.Create;
  Frases.Duplicates:=dupIgnore;
  lista.Duplicates:=dupIgnore;
  chave.Duplicates:=dupIgnore;
  chave.Text:=ProcuraeSubstitui(Frase,'+',#13);
  chave.Text:=ProcuraeSubstitui(chave.Text,' ',#13);
  Frases.LoadFromFile(ExtractFilePath(Application.ExeName)+'bin\botfrases.txt');
  Frases.Text:=Crypt('D',Frases[0]);
  lista.Clear;
  for X := 0 to Frases.Count-1 do
    begin
      
      ADD:=1;
      For Y:= 0 to chave.Count-1 do
        begin
          
          if Pos(AnsiLowerCase(chave[Y]), AnsiLowerCase(Frases[X])) = 0 then
            begin
              ADD:=0;
            end;
        end;
      if ADD=1 then
        begin
          lista.Add('Frase '+IntToStr(X)+' - '+Frases[X]);
        end;
    end;
  if lista.Text='' then
    begin
      Result:='Nada Encontrado com '+Frase+'!!!';
    end
  else
    begin
      Result:='14,0Achado '+IntToStr(lista.Count)+' Frase(s) com palavra chave 4,0"'+Frase+'" 5,0Digite: '+ '!FRASE+4,015,0ate4,0'+IntToStr(lista.Count)+'5,0+'+'4,0"'+Frase+'" 5,0 para mais Frases '+' 14,0Enviando Primeiras Achadas!!!';
      lista.Text:=Crypt('C',lista.Text);
      lista.SaveToFile(ExtractFilePath(Application.ExeName)+'bin\achadas.txt');
    end;
  FreeAndNil(Frases);
  FreeAndNil(lista);
end;

function addFrase(Frase:String):String;
Label Fim;
var
  Frases: TStringList;
  NumFrase, X: Integer;
begin
  Frases:=TStringList.Create;
  Frases.Duplicates:=dupIgnore;
  Frases.LoadFromFile(ExtractFilePath(Application.ExeName)+'bin\botfrases.txt');
  Frases.Text:=Crypt('D',Frases[0]);
  for X:=0 to Frases.Count-1 do
    begin
      
      if Procura(Frases[X],Frase)=True then
        begin
          Result:='Frase já cadastrada!!!';
          goto Fim;
        end;
    end;
  Frases.Add(Frase);
  NumFrase:=Frases.Count-1;
  Frases.Text:=Crypt('C',Frases.Text);
  Frases.SaveToFile(ExtractFilePath(Application.ExeName)+'bin\botfrases.txt');
  Result:='Frase '+ IntToStr(NumFrase) +' Adicionada!!!';
  Fim:
  FreeAndNil(Frases);
end;

function DELAI(PALAVRA:String):String;
var
  CHAVE, lista: TStringList;
  X: integer;
begin
  CHAVE:=TStringList.Create;
  lista:=TStringList.Create;
  CHAVE.Duplicates:=dupIgnore;
  lista.Duplicates:=dupIgnore;
  CHAVE.LoadFromFile(ExtractFilePath(Application.ExeName)+'bin\AI.txt');
  CHAVE.Text:=Crypt('D',CHAVE[0]);
  for X := 0 to CHAVE.Count-1 do
    begin
      
      if Procura(AnsiUpperCase(CHAVE[X]),AnsiUpperCase(PALAVRA)) = False then
        begin
          lista.Add(CHAVE[X]);
        end;
    end;
  lista.Text:=Crypt('C',lista.Text);
  lista.SaveToFile(ExtractFilePath(Application.ExeName)+'bin\AI.txt');
  Result:='Palavra Removida!!!';
  FreeAndNil(CHAVE);
  FreeAndNil(lista);
end;

function Extenso(Numero : String) : String;
const
  UnidSing : Array[0..5] of String = ('Centavo','Real','Mil','Milhão','Bilhão','Trilhão');
  UnidPlur : Array[0..5] of String = ('Centavos','Reais','Mil','Milhões','Bilhões','Trilhões');
var
  Lista : TStringList;
  NumStr : String;
  i : Integer;
  JaLigou : Boolean;
  Texto : String;
  PosDec : Integer;
begin
  Lista := TStringList.Create;
  Lista.Duplicates:=dupIgnore;
  PosDec := Pos(DecimalSeparator,Numero);
  if PosDec > 0 then begin
    Lista.Add('0'+Copy(Numero,PosDec+1,2));
    NumStr := Copy(Numero,1,PosDec-1);
  end
  else begin
    Lista.Add('000');
    NumStr := Numero;
  end;
  while NumStr <> '' do
    
    if Length(NumStr) > 3 then begin
      Lista.Add(Copy(NumStr,Length(NumStr)-2,3));
      NumStr := Copy(NumStr,1,Length(NumStr)-3);
    end
    else begin
      while Length(NumStr) < 3 do
        
        NumStr := '0'+NumStr;
      Lista.Add(NumStr);
      NumStr := '';
    end;
  Result := '';
  JaLigou := False;
  for i := 0 to Lista.Count - 1 do begin
    
    if Lista[i] <> '000' then begin
      Texto := ExtensoMil(Lista[i]);
      if (Lista[i] <> '001') or ((i = 1) and (Lista.Count > 2)) then
        Texto := Texto + ' ' + UnidPlur[i]
      else
        Texto := Texto + ' ' + UnidSing[i];
      if (i = 2) and (Lista[1] = '000') then
        Texto := Texto + ' Reais'
      else if (i > 2) and (Lista[2] = '000') and (Lista[1] = '000') then
        Texto := Texto + ' de Reais';
      if Result <> '' then begin
        if JaLigou then
          Result := Texto + ', ' + Result
        else begin
          Result := Texto + ' e ' + Result;
          JaLigou := True;
        end;  
      end
      else
        Result := Texto;
    end;
  end;
end;

procedure TFormTakanodanPrincipal.WMNCHitTest(var Msg: TMessage);
begin
  if GetAsyncKeyState(VK_LBUTTON) < 0 then
  Msg.Result := HTCAPTION
  else
  Msg.Result := HTCLIENT;
end;

procedure TFormTakanodanPrincipal.WMMove(var Msg: TWMMove);
begin
  if Left < 0 then
  Left := 0;
  if Top < 0 then
  Top := 0;
  if Screen.Width - (Left + Width) < 0 then
  Left := Screen.Width - Width;
  if Screen.Height - (Top + Height) < 0 then
  Top := Screen.Height - Height;
end;

procedure TFormTakanodanPrincipal.ManipulaExcecoes(Sender: TObject; E: Exception);
begin
  FormLog.RichEdit1.Lines.Add('Erro: em '+Sender.ClassName+' '+E.Message);
end;

procedure ExecutanaInicializacao(Titulo, Programa : String);
var
  Registry : TRegistry;
begin
  Registry := TRegistry.Create;
  try
    Registry.RootKey := HKEY_CURRENT_USER;
    Registry.OpenKey('\Software\Microsoft\Windows\'+
      'CurrentVersion\Run', False);
    Registry.WriteString(Titulo,Programa);
    Registry.CloseKey;
  finally
    FreeAndNil(Registry);
  end;
end;

procedure RemovedaInicializacao(Titulo : String);
var
  Registry : TRegistry;
begin
  Registry := TRegistry.Create;
  try
    Registry.RootKey := HKEY_CURRENT_USER;
    Registry.OpenKey('\Software\Microsoft\Windows\'+
      'CurrentVersion\Run', False);
    Registry.DeleteValue(Titulo);
    Registry.CloseKey;
  finally
    FreeAndNil(Registry);
  end;
end;

procedure TFormTakanodanPrincipal.WMHotKey (var Msg : TWMHotKey);
begin
  if Msg.HotKey = 500 then
    begin
      if FormTakanodanPrincipal.Visible=False then
        begin
          Opo11.Caption:='Ocultar';
          FormTakanodanPrincipal.Show;
        end
      else
        begin
          Opo11.Caption:='Mostrar';
          FormTakanodanPrincipal.Hide;
        end;
    end;
end;

procedure TFormTakanodanPrincipal.WMTrayIcon(var Msg: TMessage);
var
  Pt : TPoint;
begin
  if Msg.lParam = WM_LBUTTONDOWN then
    begin
      GetCursorPos(Pt);
      PopupMenu1.Popup(Pt.X,Pt.Y);
    end;
  if Msg.lParam = WM_RBUTTONDOWN then
    begin
      GetCursorPos(Pt);
      PopupMenu1.Popup(Pt.X,Pt.Y);
    end;
  if Msg.lParam = WM_LBUTTONDBLCLK then
    begin
      if FormTakanodanPrincipal.Visible= False then
        begin
          Opo11.Caption:='Ocultar';
          FormTakanodanPrincipal.Show;
        end
      else
        begin
          Opo11.Caption:='Mostrar';
          FormTakanodanPrincipal.Hide;
        end;
    end;
end;

procedure TFormTakanodanPrincipal.EnviaTexto(Texto: String);
begin
   ClientS.Socket.SendText(Texto + #13#10)
end;

//procedure TFormTakanodanPrincipal.EnviaNotice(Destino, Texto: String);
//begin
//  EnviaTexto( Format('NOTICE %s :%s' , [Destino, Texto]) );
//end;

procedure TFormTakanodanPrincipal.EnviaPrivMsg(Destino, Texto: String);
begin
  EnviaTexto( Format('PRIVMSG %s :%s', [Destino, Texto]));
end;

procedure TFormTakanodanPrincipal.AtualizaLista(Nicks: String);
var
  X:Integer;
  Canal:String;
  Lista:TStringList;
begin
  Canal:=PosCopyPalav(Nicks,1,'=');
  Lista:=TStringList.Create;
  for X:=0 to ListBox2.Items.Count-1 do
    begin
      
      if AnsiUpperCase(PosCopyPalav(ListBox2.Items[X],1,'='))<>AnsiUpperCase(Canal) then
        begin
          Lista.Add(ListBox2.Items[X]);
        end;
    end;
  Lista.Text:=Lista.Text+Nicks;
  ListBox2.Items.Text:=Lista.Text;
  FreeAndNil(Lista);
end;

procedure TFormTakanodanPrincipal.SetNick(sNick: String);
begin
  EnviaTexto( Format('NICK %s', [sNick]) );
end;

procedure TFormTakanodanPrincipal.SetUsuario(Ident, Nome: String);
begin
  EnviaTexto( Format('USER %s "%s" "%s" :%s',
   [Ident, ClientS.Socket.LocalAddress, ClientS.Socket.RemoteAddress, Nome]) );
end;

// Função para copiar uma palavra determinando o Indice
function CopyPalav(Msg: String; Index: Integer; const Separador: Char = #32): String;
var
  X, I, ContPalav : Integer;
  S, Palav : string;
  label Fim;//Label que direciona para o Fim (Result := Palav;)
begin
 if Length(Msg) > 0 then
 begin
    //Conta nº de palavras
    ContPalav := 0;
    for X := 1 to Length(Msg) do
    
    if Msg[X] <> Separador then
    begin
      //ultimo caracter
      if X = Length(Msg) then
       Inc(ContPalav);
    end
    else
     Inc(ContPalav);

    //Verifica se o Indice eh invalido
    if Index > ContPalav then
    begin
      Palav := '';
      goto Fim;
    end;

    //Retorna palavra do Indice
    I := 1;
    for X := 1 to Length(Msg) do
    begin
        
        if Msg[X] <> Separador then
        begin
          S := S + Msg[X];
          //ultimo caracter
          if X = Length(Msg) then
          begin
            Palav := S;
            Break;
          end;
        end
        else
        begin
          Palav := S;
          if I = Index then
           Break;
          S := '';
          Inc(I);
        end;
    end;

 end
 else
  Palav := '';

  //Label Fim
  Fim:
    Result := Palav;
end;

{------------------- Fim Funções ----------------------------------------------}

procedure TFormTakanodanPrincipal.ClientSConnect(Sender: TObject; Socket: TCustomWinSocket);
var
  X: Integer;
begin
  if CheckBox1.Checked then
    begin
      FormLog.Show;
    end;
  { Seta o Nick }
  SetNick(Edit3.Text);
  { Identifcia com o Servidor }
  SetUsuario(Edit4.Text, Edit5.Text);
  { Label fica conectado }
  Label5.Caption := '[Conectado]';
  { Muda a cor do Label }
  Label5.Font.Color := clGreen;
  for X:=0 to Memo1.Lines.Count-1 do
    begin
      
      EnviaTexto(Memo1.Lines[X]);
    end;
  for X:= 0 to ListBox1.Items.Count-1 do
    begin
      
      EnviaTexto('JOIN '+ ListBox1.Items[X]);
    end;
end;

procedure TFormTakanodanPrincipal.Button1Click(Sender: TObject);
begin
  //Define Host ou IP
  ClientS.Host := Edit1.Text;
  //Define Porta
  ClientS.Port := StrToInt(Edit2.Text);
  //Conecta
  ClientS.Open;
end;

procedure TFormTakanodanPrincipal.Button2Click(Sender: TObject);
begin
  //Fecha
  ClientS.Close;
end;

procedure TFormTakanodanPrincipal.ClientSDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  FormLog.Close;
  { Label fica DESconectado }
  Label5.Caption := '[Deconectado]';
  { Muda a cor do Label }
  Label5.Font.Color := clRed;
end;

procedure TFormTakanodanPrincipal.ClientSRead(Sender: TObject; Socket: TCustomWinSocket);
Label
  Resta1;
var
  Chave,KICK, Num, MSG, RecCanal, ErrorCode, RecText, RPing, RecNick, RecMsg, Comando: String;
  P, X, Y, Z, K: Integer;
  LMC,TXT, Lista: TStringList;
begin
  RecText := Socket.ReceiveText;//Texto recebido
  FormLog.RichEdit1.Lines.Add(RecText);
  //Coloca na StringList, isso evita erros se receber linhas juntas
  //Mensagem1#13#10Mensagem2#13#10, fica sendo 1 linha Mensagem1 e outra Mensagem2 =)
  RecList.Text := RecText;
  //Verifica linha por linha na RecList
  if RecList.Count > 0 then
  for X := 0 to RecList.Count -1 do
  begin
    { Verifica se a linha esta vazia }
    if RecList[X] <> '' then
      RecText := RecList[X]
    else
      Continue;
     //Responde pings
     if Pos('PING :', RecText) > 0 then
     begin
      P := Pos(':',RecText);
      RPing := Copy(RecText, P+1, Length(RecText)-P);
      EnviaTexto('PONG ' + RPing);
     end;
    //Verifica Mensagens
    //:Prodigy_-!~prodigy@01zsyQa9sgk.200.157.170.O PRIVMSG #SourceX :!teste
    //Zero_Col!~teste@localhost-32634 PRIVMSG TakanodanBot :aews
    if (Procura(AnsiUpperCase(RecText),AnsiUpperCase(' MODE #'))=True) or (Procura(AnsiUpperCase(RecText),AnsiUpperCase(' NICK :'))=True) or (Procura(AnsiUpperCase(RecText),AnsiUpperCase('JOIN :#'))=True) or (Procura(AnsiUpperCase(RecText),AnsiUpperCase(' QUIT :'))=True) or (Procura(AnsiUpperCase(RecText),AnsiUpperCase('PART #'))=True) then
      begin
        for K:=0 to ListBox1.Items.Count-1 do
          begin
            
            ClientS.Socket.SendText('NAMES '+ListBox1.Items[K]+#13#10);
          end;
      end;
    if Procura(AnsiUpperCase(RecText),AnsiUpperCase(' 353 '))=True then
      begin
        AtualizaLista(PegaUsuarios(RecText));
      end;
    if CopyPalav(RecText, 2) = 'PRIVMSG' then
    begin
       //Nick que enviou
      RecNick := Copy(RecText,2, Pos('!',RecText)-2);
       //Destino - CANAL ou NICK
      RecCanal := CopyPalav(RecText,3);
       //Mensagem recebida
      RecMsg  := Copy(RecText, Pos(RecCanal,RecText) + Length(RecCanal)+2,Length(RecText));
      LMC:=TStringList.Create;
      LMC.Duplicates:=dupIgnore;
      if FileExists(ExtractFilePath(Application.ExeName)+'logs\log_'+ProcuraeSubstitui(DateToStr(Date),'/','_')+'.txt') then
        begin
          LMC.LoadFromFile(ExtractFilePath(Application.ExeName)+'logs\log_'+ProcuraeSubstitui(DateToStr(Date),'/','_')+'.txt');
        end;
      LMC.Add(RecCanal+'<'+RecNick+'>'+RecMsg);
      LMC.SaveToFile(ExtractFilePath(Application.ExeName)+'logs\log_'+ProcuraeSubstitui(DateToStr(Date),'/','_')+'.txt');
      FreeAndNil(LMC);
      if RecCanal[1] <> '#' then//Se foi mensagem no CANAL
        begin
          Comando := AnsiUpperCase( CopyPalav(RecMsg,1) );//1ª palavra paar maiuscula
// Comando !RCON
           if Comando = '!RCON' then
            begin
              for Y:=0 to CheckListBox1.Count-1 do
                begin
                  
                  if AnsiUpperCase(RecNick) = AnsiUpperCase(CheckListBox1.Items[Y]) then
                    begin
                      EnviaTexto(PosCopyPalav(RecMsg,2,'!RCON  '));
                    end;
                end;
            end
          else
            begin
// Comando !Restart
              if Comando = '!RESTART' then
                begin
                  try
                    for Y:=0 to CheckListBox1.Count-1 do
                      begin
                        
                        if AnsiUpperCase(RecNick) = AnsiUpperCase(CheckListBox1.Items[Y]) then
                          begin
                            Button2.Click;
                            Button1.Click;
                          end;
                      end;
                    Abort;
                  except
                    Abort;
                  end;
                end;
// Comando !CHANGESTAT
              if Comando = '!CHANGESTAT' then
               begin
                 try
                   for Y:=0 to CheckListBox1.Count-1 do
                     begin
                       
                       if AnsiUpperCase(RecNick) = AnsiUpperCase(CheckListBox1.Items[Y]) then
                         begin
                           if PosCopyPalav(RecMsg,2,' ')='1' then
                             begin
                               if PosCopyPalav(RecMsg,3,' ')='1' then
                                 begin
                                   CheckBox1.Checked:=True;
                                   BUFFER.Add('NOTICE '+RecNick+' :Abrir Log ao Conectar: Ligado');
                                 end
                               else
                                 begin
                                   CheckBox1.Checked:=False;
                                   BUFFER.Add('NOTICE '+RecNick+' :Abrir Log ao Conectar: Desligado');
                                 end;
                             end;
                           if PosCopyPalav(RecMsg,2,' ')='2' then
                             begin
                               if PosCopyPalav(RecMsg,3,' ')='1' then
                                 begin
                                  CheckBox2.Checked:=True;
                                  BUFFER.Add('NOTICE '+RecNick+' :Reconectar se desconectado: Ligado');
                                 end
                               else
                                 begin
                                   CheckBox2.Checked:=False;
                                   BUFFER.Add('NOTICE '+RecNick+' :Reconectar se desconectado: Desligado');
                                 end;
                             end;
                           if PosCopyPalav(RecMsg,2,' ')='3' then
                             begin
                               if PosCopyPalav(RecMsg,3,' ')='1' then
                                 begin
                                   CheckBox3.Checked:=True;
                                   BUFFER.Add('NOTICE '+RecNick+' :Mostrar no Tray: Ligado');
                                 end
                               else
                                 begin
                                   CheckBox3.Checked:=False;
                                   BUFFER.Add('NOTICE '+RecNick+' :Mostrar no Tray: Desligado');
                                 end;
                             end;
                           if PosCopyPalav(RecMsg,2,' ')='4' then
                             begin
                               if PosCopyPalav(RecMsg,3,' ')='1' then
                                 begin
                                   CheckBox4.Checked:=True;
                                   BUFFER.Add('NOTICE '+RecNick+' :Ocultar ao Iniciar: Ligado');
                                 end
                               else
                                 begin
                                   CheckBox4.Checked:=False;
                                   BUFFER.Add('NOTICE '+RecNick+' :Ocultar ao Iniciar: Desligado');
                                 end;
                             end;
                           if PosCopyPalav(RecMsg,2,' ')='5' then
                             begin
                               if PosCopyPalav(RecMsg,3,' ')='1'then
                                 begin
                                   CheckBox5.Checked:=True;
                                   BUFFER.Add('NOTICE '+RecNick+' :Iniciar com Windows: Ligado');
                                 end
                               else
                                 begin
                                   CheckBox5.Checked:=False;
                                   BUFFER.Add('NOTICE '+RecNick+' :Iniciar com Windows: Desligado');
                                 end;
                             end;
                         end;
                     end;
                 except
                   Abort;
                 end;
               end;
// Comando !STAT
              if Comando = '!STAT' then
                begin
                  try
                    for Y:=0 to CheckListBox1.Count-1 do
                      begin
                        
                        if AnsiUpperCase(RecNick) = AnsiUpperCase(CheckListBox1.Items[Y]) then
                          begin
                            if CheckBox1.Checked then
                              begin
                                BUFFER.Add('NOTICE '+RecNick+' :Abrir Log ao Conectar: Ligado');
                              end
                            else
                              begin
                                BUFFER.Add('NOTICE '+RecNick+' :Abrir Log ao Conectar: Desligado');
                              end;
                            if CheckBox2.Checked then
                              begin
                                BUFFER.Add('NOTICE '+RecNick+' :Reconectar se desconectado: Ligado');
                              end
                            else
                              begin
                                BUFFER.Add('NOTICE '+RecNick+' :Reconectar se desconectado: Desligado');
                              end;
                            if CheckBox3.Checked then
                              begin
                                BUFFER.Add('NOTICE '+RecNick+' :Mostrar no Tray: Ligado');
                              end
                            else
                              begin
                                BUFFER.Add('NOTICE '+RecNick+' :Mostrar no Tray: Desligado');
                              end;
                            if CheckBox4.Checked then
                              begin
                                BUFFER.Add('NOTICE '+RecNick+' :Ocultar ao Iniciar: Ligado');
                              end
                            else
                              begin
                                BUFFER.Add('NOTICE '+RecNick+' :Ocultar ao Iniciar: Desligado');
                              end;
                            if CheckBox5.Checked then
                              begin
                                BUFFER.Add('NOTICE '+RecNick+' :Iniciar com Windows: Ligado');
                              end
                            else
                              begin
                                BUFFER.Add('NOTICE '+RecNick+' :Iniciar com Windows: Desligado');
                              end;
                          end;
                      end;
                  except
                    Abort;
                  end;
                end;
// Comando !DELEXEC
              if Comando = '!DELEXEC' then
                try
                  for Y:=0 to CheckListBox1.Count-1 do
                    begin
                      
                      if AnsiUpperCase(RecNick) = AnsiUpperCase(CheckListBox1.Items[Y]) then
                        begin
                          for Z:= 0 to Memo1.Lines.Count-1 do
                            begin
                              
                              if AnsiUpperCase(PosCopyPalav(RecMsg,2,'!DELEXEC  '))=AnsiUpperCase(Memo1.Lines[Z]) then
                                begin
                                  EnviaPrivMsg(RecNick,': Comando '+PosCopyPalav(RecMsg,2,'!DELEXEC  ')+' Removido da Lista de Auto-EXEC');
                                  Memo1.Lines.Delete(Z);
                                end;
                            end;
                        end;
                    end;
                  Abort;
                except
                  Abort;
                end;
// Comando !AEXEC
              if Comando = '!AEXEC' then
                begin
                  try
                    for Y:=0 to CheckListBox1.Count-1 do
                      begin
                        
                        if AnsiUpperCase(RecNick) = AnsiUpperCase(CheckListBox1.Items[Y]) then
                          begin
                            for Z:=0 to Memo1.Lines.Count-1 do
                              begin
                                
                                BUFFER.Add('NOTICE '+RecNick+' :'+Memo1.Lines[Z]);
                              end;
                            Abort;
                          end;
                      end;
                  except
                    Abort;
                  end;
                end;
// Comando !ADDEXEC
              if Comando = '!ADDEXEC' then
               begin
                 try
                  for Y:=0 to CheckListBox1.Count-1 do
                    begin
                      
                      if AnsiUpperCase(RecNick) = AnsiUpperCase(CheckListBox1.Items[Y]) then
                        begin
                          Memo1.Lines.Add(PosCopyPalav(RecMsg,2,'!ADDEXEC  '));
                          Abort;
                        end;
                    end;
                 except
                   Abort;
                 end;
               end;
            end;
        end;

      if RecCanal[1] = '#' then//Se foi mensagem no CANAL
      begin
        // ***** Comandos *****
       Comando := AnsiUpperCase( CopyPalav(RecMsg,1) );//1ª palavra paar maiuscula
// Comando !ERRO
       if Comando = '!ERRO' then
        try
          ErrorCode:=PosCopyPalav(AnsiUpperCase(RecMsg),2,AnsiUpperCase('!ERRO '));
          if not TestaNumero(ErrorCode) then
          begin
           abort;
          end;
          Lista:=TStringList.Create;
          Lista.Duplicates:=dupIgnore;
          Lista.LoadFromFile(ExtractFilePath(Application.ExeName)+'bin\'+'Erros.txt');
          Lista.Text:=Crypt('D',Lista[0]);
          for Z:=0 to Lista.Count-1 do
            begin
              if PosCopyPalav(Lista[Z],1,'=')=ErrorCode then
                begin
                  EnviaPrivMsg(RecCanal,RecNick+': Erro: '+ErrorCode+'= '+PosCopyPalav(Lista[Z],2,'='));
                end;
            end;
          FreeAndNil(Lista);
        except
          EnviaPrivMsg(RecCanal, RecNick +': Valor inválido ou Nulo');
        end;
// Comando !HELP
       if Comando = '!HELP' then
        try
          Lista:=TStringList.Create;
          Lista.Duplicates:=dupIgnore;
          Lista.LoadFromFile(ExtractFilePath(Application.ExeName)+'bin\'+'cmd.txt');
          for Y:=0 to CheckListBox1.Count-1 do
            begin
              
              if AnsiUpperCase(RecNick) = AnsiUpperCase(CheckListBox1.Items[Y]) then
                begin
                  for Z:=0 to Lista.Count-1 do
                    begin
                      
                      BUFFER.Add('NOTICE '+RecNick+' :'+Lista[Z]);
                    end;
                end;
            end;
          FreeAndNil(Lista);
        except
          EnviaPrivMsg(RecCanal, RecNick +': Valor inválido ou Nulo');
        end;
// Comando !BDEERRO
       if Comando = '!BDEERRO' then
         begin
           try
             ErrorCode:=PosCopyPalav(AnsiUpperCase(RecMsg),2,AnsiUpperCase('!BDEERRO '));
             if not TestaNumero(ErrorCode) then
             begin
              abort;
             end;
             Lista:=TStringList.Create;
             Lista.Duplicates:=dupIgnore;
             Lista.LoadFromFile(ExtractFilePath(Application.ExeName)+'bin\'+'BDEErros.txt');
             Lista.Text:=Crypt('D',Lista[0]);
             for Z:=0 to Lista.Count-1 do
               begin
                 if PosCopyPalav(Lista[Z],1,':')=ErrorCode then
                   begin
                     EnviaPrivMsg(RecCanal,RecNick+': Erro: '+ErrorCode+'= '+PosCopyPalav(Lista[Z],2,'='));
                   end;
               end;
             FreeAndNil(Lista);
           except
             EnviaPrivMsg(RecCanal, RecNick +': Valor inválido ou Nulo');
           end;
         end;
// Comando !ADMINS
       if Comando = '!ADMINS' then
         begin
           try
             for Y:=0 to CheckListBox1.Count-1 do
               begin
                 
                 if AnsiUpperCase(RecNick) = AnsiUpperCase(CheckListBox1.Items[Y]) then
                   begin
                     for Z:=0 to CheckListBox1.Items.Count-1 do
                       begin
                         
                         BUFFER.Add('NOTICE '+RecNick+' :'+CheckListBox1.Items[Z]);
                       end;
                   end;
               end;
           except
             Abort;
           end;
         end;
// Comando !CHANS
       if Comando = '!CHANS' then
         begin
           try
             for Y:=0 to CheckListBox1.Count-1 do
               begin
                 
                 if AnsiUpperCase(RecNick) = AnsiUpperCase(CheckListBox1.Items[Y]) then
                   begin
                     for Z:=0 to ListBox1.Items.Count-1 do
                       begin
                         
                         BUFFER.Add('NOTICE '+RecNick+' :'+ListBox1.Items[Z]);
                       end;
                   end;
               end;
           except
             Abort;
           end;
         end;
// Comando !DELCHAN
       if Comando = '!DELCHAN' then
        try
          for Y:=0 to CheckListBox1.Count-1 do
            begin
              
              if AnsiUpperCase(RecNick) = AnsiUpperCase(CheckListBox1.Items[Y]) then
                begin
                  for Z:= 0 to ListBox1.Items.Count-1 do
                    begin
                      
                      if (AnsiUpperCase(PosCopyPalav(RecMsg,2,'!DELCHAN  '))=AnsiUpperCase(ListBox1.Items[Z])) then
                        begin
                          EnviaPrivMsg(RecCanal,RecNick+': Canal '+PosCopyPalav(RecMsg,2,'!DELCHAN  ')+' Removido da Lista de Auto-Join');
                          ListBox1.Items.Delete(Z);
                        end;
                    end;
                end;
            end;
        except
          Abort;
        end;
// Comando !ADDCHAN
       if Comando = '!ADDCHAN' then
        try
          for Y:=0 to CheckListBox1.Count-1 do
            begin
              
              if AnsiUpperCase(RecNick) = AnsiUpperCase(CheckListBox1.Items[Y]) then
                begin
                  for Z:= 0 to ListBox1.Items.Count-1 do
                    begin
                      
                      if AnsiUpperCase(PosCopyPalav(RecMsg,2,'!ADDCHAN  '))=AnsiUpperCase(ListBox1.Items[Z]) then
                        begin
                          MessageBeep(16);
                          EnviaPrivMsg(RecCanal,RecNick+': Já exite na lista');
                          Abort;
                        end;
                    end;
                  if PosCopyPalav(RecMsg,2,'!ADDCHAN  ')[1]='#' then
                    begin
                      if ListBox1.Items.Count >= 10 then
                        begin
                          MessageBeep(16);
                          EnviaPrivMsg(RecCanal,RecNick+': Maximo de 10 Canais');
                          Abort;
                        end;
                      EnviaPrivMsg(RecCanal,RecNick+': Canal '+PosCopyPalav(RecMsg,2,'!ADDCHAN  ')+' Adcionado a Lista de Auto-Join');
                      ListBox1.Items.Add(PosCopyPalav(RecMsg,2,'!ADDCHAN  '));
                    end
                  else
                    begin
                      EnviaPrivMsg(RecCanal,RecNick+': Faltou colocar #');
                    end;
                end;
            end;
        except
          Abort;
        end;
// Comando !DELADMIN
       if Comando = '!DELADMIN' then
        try
          for Y:=0 to CheckListBox1.Count-1 do
            begin
              
              if AnsiUpperCase(RecNick) = AnsiUpperCase(CheckListBox1.Items[Y]) then
                begin
                  for Z:= 0 to CheckListBox1.Items.Count-1 do
                    begin
                      
                      if (AnsiUpperCase(PosCopyPalav(RecMsg,2,'!DELADMIN  '))=AnsiUpperCase(CheckListBox1.Items[Z])) and (CheckListBox1.Checked[Z]=False) then
                        begin
                          EnviaPrivMsg(RecCanal,RecNick+': Nick '+PosCopyPalav(RecMsg,2,'!DELADMIN  ')+' Removido da Lista de Administradores');
                          CheckListBox1.Items.Delete(Z);
                        end;
                    end;
                end;
            end;
        except
          Abort;
        end;
// Comando !ADDADMIN
       if Comando = '!ADDADMIN' then
        try
          for Y:=0 to CheckListBox1.Count-1 do
            begin
              
              if AnsiUpperCase(RecNick) = AnsiUpperCase(CheckListBox1.Items[Y]) then
                begin
                  for Z:= 0 to CheckListBox1.Items.Count-1 do
                    begin
                      
                      if AnsiUpperCase(PosCopyPalav(RecMsg,2,'!ADDADMIN  '))=AnsiUpperCase(CheckListBox1.Items[Z]) then
                        begin
                          MessageBeep(16);
                          EnviaPrivMsg(RecCanal,RecNick+': Já exite na lista');
                          Abort;
                        end;
                    end;
                  EnviaPrivMsg(RecCanal,RecNick+': Nick '+PosCopyPalav(RecMsg,2,'!ADDADMIN  ')+' Adcionado a Lista de Administradores');
                  CheckListBox1.Items.Add(PosCopyPalav(RecMsg,2,'!ADDADMIN  '));
                end;
            end;
        except
          Abort;
        end;
       if Comando = '!DELIA' then
        try
          for Y:=0 to CheckListBox1.Count-1 do
            begin
              if (AnsiUpperCase(RecNick) = AnsiUpperCase(CheckListBox1.Items[Y])) or ((AnsiUpperCase(RecCanal+'=@'+RecNick) = AnsiUpperCase(ListBox2.Items[Y])) and (ADDDFOP)) or ((AnsiUpperCase(RecCanal+'=+'+RecNick) = AnsiUpperCase(ListBox2.Items[Y])) and (ADDDFVOICE)) then
                begin
                  EnviaPrivMsg(RecCanal,RecNick+': '+DELAI(PosCopyPalav(RecMsg,2,'!DELIA  ')));
                end;
            end;
        except
          EnviaPrivMsg(RecCanal, RecNick +': Valor inválido ou Nulo');
        end;
// Comando !KICK
       if Comando = '!KICK' then
        try
          for Y:=0 to CheckListBox1.Count-1 do
            begin
              
              if AnsiUpperCase(RecNick) = AnsiUpperCase(CheckListBox1.Items[Y]) then
                begin
                  Lista:=TStringList.Create;
                  Lista.Duplicates:=dupIgnore;
                  Lista.LoadFromFile(ExtractFilePath(Application.ExeName)+'bin\kicks.txt');
                  Randomize;
                  KICK:=Lista[Random(Lista.Count)];
                  if AnsiUpperCase(PosCopyPalav(RecMsg,2,'!KICK  '))<>AnsiUpperCase(Edit3.Text) then
                    begin
                      if PosCopyPalav(RecMsg,2,'!KICK  ')<>'' then
                        begin
                          EnviaTexto('KICK '+RecCanal+' '+PosCopyPalav(RecMsg,2,'!KICK  ')+' :'+KICK);
                        end
                      else
                        begin
                          EnviaPrivMsg(RecCanal,RecNick+': Especifique um Nick');
                        end;
                    end;
                  FreeAndNil(Lista);
                end;
            end;
        except
          EnviaPrivMsg(RecCanal, RecNick +': Valor inválido ou Nulo');
        end;
// Comando !KB
       if Comando = '!KB' then
        try
          for Y:=0 to CheckListBox1.Count-1 do
            begin
              
              if AnsiUpperCase(RecNick) = AnsiUpperCase(CheckListBox1.Items[Y]) then
                begin
                  Lista:=TStringList.Create;
                  Lista.Duplicates:=dupIgnore;
                  Lista.LoadFromFile(ExtractFilePath(Application.ExeName)+'bin\kicks.txt');
                  Randomize;
                  KICK:=Lista[Random(Lista.Count)];
                  if AnsiUpperCase(PosCopyPalav(RecMsg,2,'!KB  '))<>AnsiUpperCase(Edit3.Text) then
                    begin
                      if PosCopyPalav(RecMsg,2,'!KB  ')<>'' then
                        begin
                          EnviaTexto('MODE '+RecCanal+' +b *'+RecNick+'*');
                          EnviaTexto('KICK '+RecCanal+' '+PosCopyPalav(RecMsg,2,'!KB  ')+' :'+KICK);
                        end
                      else
                        begin
                          EnviaPrivMsg(RecCanal,RecNick+': Especifique um Nick');
                        end;
                    end;
                  FreeAndNil(Lista);
                end;
            end;
        except
          EnviaPrivMsg(RecCanal, RecNick +': Valor inválido ou Nulo');
        end;
// Comando !OP
       if Comando = '!OP' then
        try
          for Y:=0 to CheckListBox1.Count-1 do
            begin
              
              if AnsiUpperCase(RecNick) = AnsiUpperCase(CheckListBox1.Items[Y]) then
                begin
                  if PosCopyPalav(RecMsg,2,'!OP  ')='' then
                    begin
                      EnviaTexto('MODE '+RecCanal+' +o '+RecNick);
                    end
                  else
                    begin
                      EnviaTexto('MODE '+RecCanal+' +o '+PosCopyPalav(RecMsg,2,'!OP  '));
                    end;
                end;
            end;
        except
          EnviaPrivMsg(RecCanal, RecNick +': Valor inválido ou Nulo');
        end;
// Comando !DEOP
       if Comando = '!DEOP' then
        try
          for Y:=0 to CheckListBox1.Count-1 do
            begin
              
              if AnsiUpperCase(RecNick) = AnsiUpperCase(CheckListBox1.Items[Y]) then
                begin
                  if PosCopyPalav(RecMsg,2,'!DEOP  ')='' then
                    begin
                      EnviaTexto('MODE '+RecCanal+' -o '+RecNick);
                    end
                  else
                    begin
                      EnviaTexto('MODE '+RecCanal+' -o '+PosCopyPalav(RecMsg,2,'!DEOP  '));
                    end;
                end;
            end;
        except
          EnviaPrivMsg(RecCanal, RecNick +': Valor inválido ou Nulo');
        end;
// Comando !VOICE
       if Comando = '!VOICE' then
        try
          for Y:=0 to CheckListBox1.Count-1 do
            begin
              
              if AnsiUpperCase(RecNick) = AnsiUpperCase(CheckListBox1.Items[Y]) then
                begin
                  if PosCopyPalav(RecMsg,2,'!VOICE  ')='' then
                    begin
                      EnviaTexto('MODE '+RecCanal+' +v '+RecNick);
                    end
                  else
                    begin
                      EnviaTexto('MODE '+RecCanal+' +v '+PosCopyPalav(RecMsg,2,'!VOICE  '));
                    end;
                end;
            end;
        except
          EnviaPrivMsg(RecCanal, RecNick +': Valor inválido ou Nulo');
        end;
// Comando !DEVOICE
       if Comando = '!DEVOICE' then
        try
          for Y:=0 to CheckListBox1.Count-1 do
            begin
              
              if AnsiUpperCase(RecNick) = AnsiUpperCase(CheckListBox1.Items[Y]) then
                begin
                  if PosCopyPalav(RecMsg,2,'!DEVOICE  ')='' then
                    begin
                      EnviaTexto('MODE '+RecCanal+' -v '+RecNick);
                    end
                  else
                    begin
                      EnviaTexto('MODE '+RecCanal+' -v '+PosCopyPalav(RecMsg,2,'!DEVOICE  '));
                    end;
                end;
            end;
        except
          EnviaPrivMsg(RecCanal, RecNick +': Valor inválido ou Nulo');
        end;
// Comando !FRASE
       if Comando = '!FRASE' then
        try
          Num:=PosCopyPalav(PosCopyPalav(RecMsg,2,'!FRASE  '),1,' ');
          if not TestaNumero(Num) then
            begin
              MSG:=Fraseexibir(PosCopyPalav(RecMsg,2,'!FRASE  '));
              Chave:=PosCopyPalav(RecMsg,2,'!FRASE  ');
              BUFFER.Add('NOTICE '+RecNick+' :'+MSG);
              SepararTotalFraze(0);
            end
          else
            begin
              MSG:=Fraseexibir(PosCopyPalav(RecMsg,2,'!FRASE  '+Num+' '));
              Chave:=PosCopyPalav(RecMsg,2,'!FRASE  '+Num+' ');
              BUFFER.Add('NOTICE '+RecNick+' :'+MSG);
              SepararTotalFraze(StrToInt(Num));
            end;
            Lista:=TStringList.Create;
            Lista.Duplicates:=dupIgnore;
            Lista.LoadFromFile(ExtractFilePath(Application.ExeName)+'bin\achadas.txt');
            Lista.Text:=Crypt('D',Lista[0]);
            if MSG<>'Nada Encontrado com '+Chave+'!!!' then
              begin
                for Y:= 0 to Lista.Count-1 do
                  begin
                    
                    BUFFER.Add('NOTICE '+RecNick+' :'+'6,0'+ Lista[Y]);
                  end;
              end;
            FreeAndNil(Lista);
        except
          EnviaPrivMsg(RecCanal, RecNick +': Valor inválido ou Nulo');
        end;
// Comando !DELFRASE
        if Comando = '!DELFRASE' then
        try
          for Y:=0 to ListBox2.Count-1 do
            begin
              if ((AnsiUpperCase(RecCanal+'=@'+RecNick) = AnsiUpperCase(ListBox2.Items[Y])) and (DelDFAIOP))  or ((AnsiUpperCase(RecCanal+'=+'+RecNick) = AnsiUpperCase(ListBox2.Items[Y])) and (DelDFAIVOICE)) then
                begin
                  Num:=PosCopyPalav(PosCopyPalav(RecMsg,2,'!DELFRASE  '),1,' ');
                  if TestaNumero(Num) then
                    begin
                      EnviaPrivMsg(RecCanal, RecNick +': '+ Fraseremove(StrToInt(PosCopyPalav(RecMsg,2,'!DELFRASE  '))));
                    end
                  else
                    begin
                      EnviaPrivMsg(RecCanal, RecNick +': Valor inválido ou Nulo');
                    end;
                end;
            end;
        except
          EnviaPrivMsg(RecCanal, RecNick +': Valor inválido ou Nulo');
        end;
// Comando !ADDFRASE
        if Comando = '!ADDFRASE' then
        try
          for Y:=0 to ListBox2.Count-1 do
            begin
              if ((AnsiUpperCase(RecCanal+'=@'+RecNick) = AnsiUpperCase(ListBox2.Items[Y])) and (ADDDFOP))  or ((AnsiUpperCase(RecCanal+'=+'+RecNick) = AnsiUpperCase(ListBox2.Items[Y])) and (ADDDFVOICE))  then
                begin
                  EnviaPrivMsg(RecCanal, RecNick +': '+ addFrase(PosCopyPalav(RecMsg,2,'!ADDFRASE  ')));
                end;
            end;
        except
          EnviaPrivMsg(RecCanal, RecNick +': Valor inválido ou Nulo');
        end;
// Comando !DICA
        if Comando = '!DICA' then
        try
          Num:=PosCopyPalav(PosCopyPalav(RecMsg,2,'!DICA  '),1,' ');
          if not TestaNumero(Num) then
            begin
              MSG:=dicaexibir(PosCopyPalav(RecMsg,2,'!DICA  '));
              Chave:=PosCopyPalav(RecMsg,2,'!DICA  ');
              BUFFER.Add('NOTICE '+RecNick+' :'+MSG);
              SepararTotalDica(0);
            end
          else
            begin
              MSG:=dicaexibir(PosCopyPalav(RecMsg,2,'!DICA  '+Num+' '));
              Chave:=PosCopyPalav(RecMsg,2,'!DICA  '+Num+' ');
              BUFFER.Add('NOTICE '+RecNick+' :'+MSG);
              SepararTotalDica(StrToInt(Num));
            end;
            Lista:=TStringList.Create;
            Lista.Duplicates:=dupIgnore;
            Lista.LoadFromFile(ExtractFilePath(Application.ExeName)+'bin\achadas.txt');
            Lista.Text:=Crypt('D',Lista[0]);
            if MSG<>'Nada Encontrado com '+Chave+'!!!' then
              begin
                for Y:= 0 to Lista.Count-1 do
                  begin
                    
                    BUFFER.Add('NOTICE '+RecNick+' :'+'6,0'+ Lista[Y]);
                  end;
              end;
            FreeAndNil(Lista);
        except
          EnviaPrivMsg(RecCanal, RecNick +': Valor inválido ou Nulo');
        end;
// Comando !DELDICA
        if Comando = '!DELDICA' then
        try
          for Y:=0 to ListBox2.Count-1 do
            begin
              if ((AnsiUpperCase(RecCanal+'=@'+RecNick) = AnsiUpperCase(ListBox2.Items[Y])) and (DelDFAIOP))  or ((AnsiUpperCase(RecCanal+'=+'+RecNick) = AnsiUpperCase(ListBox2.Items[Y])) and (DelDFAIVOICE))  then
                begin
                  Num:=PosCopyPalav(PosCopyPalav(RecMsg,2,'!DELDICA  '),1,' ');
                  if TestaNumero(Num) then
                    begin
                      EnviaPrivMsg(RecCanal, RecNick +': '+ dicaremove(StrToInt(PosCopyPalav(RecMsg,2,'!DELDICA  '))));
                    end
                  else
                    begin
                      EnviaPrivMsg(RecCanal, RecNick +': Valor inválido ou Nulo');
                    end;
                end;
            end;
        except
          EnviaPrivMsg(RecCanal, RecNick +': Valor inválido ou Nulo');
        end;
// Comando !ADDDICA
        if Comando = '!ADDDICA' then
        try
          for Y:=0 to ListBox2.Count-1 do
            begin
              if ((AnsiUpperCase(RecCanal+'=@'+RecNick) = AnsiUpperCase(ListBox2.Items[Y])) and (ADDDFOP))  or ((AnsiUpperCase(RecCanal+'=+'+RecNick) = AnsiUpperCase(ListBox2.Items[Y])) and (ADDDFVOICE))  then
                begin
                  EnviaPrivMsg(RecCanal, RecNick +': '+ adddica('Por 15,0'+RecNick+'1,0 - '+PosCopyPalav(RecMsg,2,'!ADDDICA  ')));
                end;
            end;
        except
          EnviaPrivMsg(RecCanal, RecNick +': Valor inválido ou Nulo');
        end;
//Inteligencia Artificial
//Responde Conversa
        if Procura(AnsiUpperCase(StripIRCColor(RecMsg)),AnsiUpperCase(Edit3.Text))=True then
          begin
            try
              TXT:=TStringList.Create;
              TXT.Duplicates:=dupIgnore;
              TXT.LoadFromFile(ExtractFilePath(Application.ExeName)+'bin\AI.txt');
              TXT.Text:=Crypt('D',TXT[0]);
              MSG:=AI(RecMsg,TXT);
              EnviaPrivMsg(RecCanal, RecNick+': '+MSG);
              FreeAndNil(TXT);
            except
              EnviaPrivMsg(RecCanal, RecNick+': '+'Não Sei :\');
            end;
// Assimila Conversa
            try
              Lista:=TStringList.Create;
              Lista.Duplicates:=dupIgnore;
              Lista.LoadFromFile(ExtractFilePath(Application.ExeName)+'bin\AI.txt');
              Lista.Text:=Crypt('D',Lista[0]);
              if Procura(AnsiUpperCase(Lista.Text),AnsiUpperCase(PosCopyPalav(StripIRCColor(RecMsg),2,Edit3.Text+' ')))=False then
                begin
                   if Procura(AnsiUpperCase(PosCopyPalav(StripIRCColor(RecMsg),2,Edit3.Text)),AnsiUpperCase(Edit3.Text))=False then
                     begin
                       Lista.Add(ProcuraeSubstitui(PosCopyPalav(StripIRCColor(RecMsg),2,Edit3.Text+' '),': ',''));
                       Lista.Text:=Crypt('C',Lista.Text);
                       Lista.SaveToFile(ExtractFilePath(Application.ExeName)+'bin\AI.txt');
                     end;
                end;
              FreeAndNil(Lista);
            except
              on E : Exception do
                begin
                  MSG:='Erro: '+E.Message;
                  EnviaPrivMsg(RecCanal, RecNick+': '+MSG);
                end;
            end;
          end;
// Comando !HORA
        if Comando = '!HORA' then
          begin
            if (Time>=StrToTime('00:00:00')) and (Time<=StrToTime('11:59:00')) then
              begin
                EnviaPrivMsg(RecCanal, RecNick +': '+ Copy(TimeToStr(Time),1,2)+' Hora(s)'+', '+Copy(TimeToStr(Time),4,2)+' Minuto(s)'+' e '+Copy(TimeToStr(Time),7,2)+' Segundo(s)'+' Bom-Dia 0,3 0,7:1,3D1,0 0,3 0,4:1,3D1,0 0,3 0,6:1,3D1,0 0,3 0,12:1,3D');
              end;
            if (Time>=StrToTime('12:00:00')) and (Time<=StrToTime('17:59:00')) then
              begin
                EnviaPrivMsg(RecCanal, RecNick +': '+ Copy(TimeToStr(Time),1,2)+' Hora(s)'+', '+Copy(TimeToStr(Time),4,2)+' Minuto(s)'+' e '+Copy(TimeToStr(Time),7,2)+' Segundo(s)'+' Boa-Tarde 0,3 0,7:1,3D1,0 0,3 0,4:1,3D1,0 0,3 0,6:1,3D1,0 0,3 0,12:1,3D');
              end;
            if (Time>=StrToTime('18:00:00')) and (Time<=StrToTime('23:59:00')) then
              begin
                EnviaPrivMsg(RecCanal, RecNick +': '+ Copy(TimeToStr(Time),1,2)+' Hora(s)'+', '+Copy(TimeToStr(Time),4,2)+' Minuto(s)'+' e '+Copy(TimeToStr(Time),7,2)+' Segundo(s)'+' Boa-Noite 0,3 0,7:1,3D1,0 0,3 0,4:1,3D1,0 0,3 0,6:1,3D1,0 0,3 0,12:1,3D');
              end;
          end;
// Comando !EXTENSO Numero
        if Comando = '!EXTENSO' then
        try
          if Length(Extenso(CopyPalav(RecMsg,2)))>= 451 then
            begin
              EnviaPrivMsg(RecCanal, RecNick +': Valor Muito Alto');
            end
          else
            begin
              EnviaPrivMsg(RecCanal, RecNick +': '+ Extenso(CopyPalav(RecMsg,2)));
            end;
        except
          EnviaPrivMsg(RecCanal, RecNick +': Valor inválido ou Nulo');
        end;
// Comando !INFOHOST Site
        if Comando = '!INFOHOST' then
        try
          if Length(infohost(CopyPalav(RecMsg,2)))>= 451 then
            begin
              EnviaPrivMsg(RecCanal, RecNick +': Link Muito Grande');
            end
          else
            begin
              EnviaPrivMsg(RecCanal, RecNick +': '+ infohost(CopyPalav(RecMsg,2)));
            end;
        except
          on E : Exception do
            begin
              EnviaPrivMsg(RecCanal, RecNick +': '+E.Message);
            end;
        end;
// Comando !ACHAR site
        if Comando = '!ACHAR' then
        try
          if Length(filtra(PosCopyPalav(RecMsg,2,'!ACHAR '))) <= 450 then
            begin
              EnviaPrivMsg(RecCanal, RecNick +': '+ filtra(PosCopyPalav(RecMsg,2,'!ACHAR ')));
            end
          else
            begin
              EnviaPrivMsg(RecCanal, RecNick +': Link Muito Grande');
            end
        except
          on E : Exception do
            begin
              EnviaPrivMsg(RecCanal, RecNick +': '+E.Message);
            end;
        end;
// Comando !INFO CS
        if Comando = '!INFO' then
        try
          if Length(infoip(CopyPalav(RecMsg,2)))>= 451 then
            begin
              EnviaPrivMsg(RecCanal, RecNick +': Informação Muito Grande');
            end
          else
            begin
              EnviaPrivMsg(RecCanal, RecNick +': '+ Infoip(CopyPalav(RecMsg,2)));
              BUFFER.Add('NOTICE '+RecNick+' :'+'Jogadores no Servidor:0,3 '+ InfoPlayer(CopyPalav(RecMsg,2)))
            end;
        except
          on E : Exception do
            begin
              EnviaPrivMsg(RecCanal, RecNick +': '+E.Message);
            end;
        end;
// Comando Versão :D
        if Comando = '!VERSÃO' then
          EnviaPrivMsg(RecCanal, RecNick +': Bot Versão '+GetBuildInfo+' Criado e Programado por Jocélio Pergentino (81) 8828-5355');
// Comando !ASCII
        if Comando = '!ASCII' then
        try
          if AnsiUpperCase(CopyPalav(RecMsg,2)) = AnsiUpperCase('Del') then
            begin
              EnviaPrivMsg(RecCanal, RecNick +': 7');
              Abort;
            end;
          if AnsiUpperCase(CopyPalav(RecMsg,2)) = AnsiUpperCase('Delete') then
            begin
              EnviaPrivMsg(RecCanal, RecNick +': 7');
              Abort;
            end;
          if AnsiUpperCase(CopyPalav(RecMsg,2)) = AnsiUpperCase('BackSpace') then
            begin
              EnviaPrivMsg(RecCanal, RecNick +': 8');
              Abort;
            end;
          if AnsiUpperCase(CopyPalav(RecMsg,2)) = AnsiUpperCase('Tab') then
            begin
              EnviaPrivMsg(RecCanal, RecNick +': 9');
              Abort;
            end;
          if AnsiUpperCase(CopyPalav(RecMsg,2)) = AnsiUpperCase('Enter') then
            begin
              EnviaPrivMsg(RecCanal, RecNick +': 13');
              Abort;
            end;
          if AnsiUpperCase(CopyPalav(RecMsg,2)) = AnsiUpperCase('Shift') then
            begin
              EnviaPrivMsg(RecCanal, RecNick +': 16');
              Abort;
            end;
          if AnsiUpperCase(CopyPalav(RecMsg,2)) = AnsiUpperCase('CTRL') then
            begin
              EnviaPrivMsg(RecCanal, RecNick +': 17');
              Abort;
            end;
          if AnsiUpperCase(CopyPalav(RecMsg,2)) = AnsiUpperCase('ALT') then
            begin
              EnviaPrivMsg(RecCanal, RecNick +': 18');
              Abort;
            end;
          if AnsiUpperCase(CopyPalav(RecMsg,2)) = AnsiUpperCase('CapsLock') then
            begin
              EnviaPrivMsg(RecCanal, RecNick +': 20');
              Abort;
            end;
          if AnsiUpperCase(CopyPalav(RecMsg,2)) = AnsiUpperCase('Espaço') then
            begin
              EnviaPrivMsg(RecCanal, RecNick +': 32');
              Abort;
            end;
          EnviaPrivMsg(RecCanal, RecNick +': '+ IntToStr(Ord(CopyPalav(RecMsg,2)[1])));
        except
          Abort;
        end;
// Comando !CHR
        if AnsiUpperCase(Comando) = AnsiUpperCase('!CHR') then
        try
          if StrToInt(CopyPalav(RecMsg,2)) = 7 then
            begin
              EnviaPrivMsg(RecCanal, RecNick +': {Delete}');
              Abort;
            end;
          if StrToInt(CopyPalav(RecMsg,2)) = 8 then
            begin
              EnviaPrivMsg(RecCanal, RecNick +': {BackSpace}');
              Abort;
            end;
          if StrToInt(CopyPalav(RecMsg,2)) = 9 then
            begin
              EnviaPrivMsg(RecCanal, RecNick +': {Tab}');
              Abort;
            end;
          if StrToInt(CopyPalav(RecMsg,2)) = 13 then
            begin
              EnviaPrivMsg(RecCanal, RecNick +': {Enter}');
              Abort;
            end;
          if StrToInt(CopyPalav(RecMsg,2)) = 16 then
            begin
              EnviaPrivMsg(RecCanal, RecNick +': {Shift}');
              Abort;
            end;
          if StrToInt(CopyPalav(RecMsg,2)) = 17 then
            begin
              EnviaPrivMsg(RecCanal, RecNick +': {CTRL}');
              Abort;
            end;
          if StrToInt(CopyPalav(RecMsg,2)) = 18 then
            begin
              EnviaPrivMsg(RecCanal, RecNick +': {ALT}');
              Abort;
            end;
          if StrToInt(CopyPalav(RecMsg,2)) = 20 then
            begin
              EnviaPrivMsg(RecCanal, RecNick +': {CapsLock}');
              Abort;
            end;
          if StrToInt(CopyPalav(RecMsg,2)) = 32 then
            begin
              EnviaPrivMsg(RecCanal, RecNick +': {Espaço}');
              Abort;
            end;
          EnviaPrivMsg(RecCanal, RecNick +': '+ Char(StrToInt(CopyPalav(RecMsg,2))) );
        except
          Abort;
        end;
      end;

    end;


  end;//Fim for X := 0 to RecList.Count -1 do
end;

procedure TFormTakanodanPrincipal.FormCreate(Sender: TObject);
var
  CFG: TStringList;
  NotifyIconData : TNotifyIconData;
  X: Integer;
begin
  FormTakanodanPrincipal.DoubleBuffered:=True;
//*** Nao aparece na barra ***********************************************
  SetWindowLong(Application.Handle, GWL_EXSTYLE,GetWindowLong(Application.Handle, GWL_EXSTYLE) or WS_EX_TOOLWINDOW and not WS_EX_APPWINDOW);
  Application.OnException := ManipulaExcecoes;
  vetor:=0;
  Vermelho:=0;
  Verde:=0;
  Azul:=0;
  //Cria SringList
  RecList := TStringList.Create;
  RecList.Duplicates:=dupIgnore;
  BUFFER:=TStringList.Create;
  BUFFER.Duplicates:=dupIgnore;
  if FileExists(ExtractFilePath(Application.ExeName)+'bin\exec.cfg') then
    begin
      CFG:=TStringList.Create;
      CFG.Duplicates:=dupIgnore;
      CFG.LoadFromFile(ExtractFilePath(Application.ExeName)+'bin\exec.cfg');
      CFG.Text:=Crypt('D',CFG[0]);
      Memo1.Lines.Clear;
      Memo1.Lines:=CFG;
      FreeAndNil(CFG);
    end;
  if FileExists(ExtractFilePath(Application.ExeName)+'bin\admins.cfg') then
    begin
      CFG:=TStringList.Create;
      CFG.Duplicates:=dupIgnore;
      CFG.LoadFromFile(ExtractFilePath(Application.ExeName)+'bin\admins.cfg');
      CFG.Text:=Crypt('D',CFG[0]);
      CheckListBox1.Items.Clear;
      CheckListBox1.Items:=CFG;
      if FileExists(ExtractFilePath(Application.ExeName)+'bin\adm.cfg') then
        begin
          CFG.LoadFromFile(ExtractFilePath(Application.ExeName)+'bin\adm.cfg');
          CFG.Text:=Crypt('D',CFG[0]);
          for X:=0 to CheckListBox1.Items.Count-1 do
            begin
              
              CheckListBox1.Checked[X]:=StrToBool(CFG[X]);
            end;
        end;
      FreeAndNil(CFG);
    end;
  if FileExists(ExtractFilePath(Application.ExeName)+'bin\canais.cfg') then
    begin
      CFG:=TStringList.Create;
      CFG.Duplicates:=dupIgnore;
      CFG.LoadFromFile(ExtractFilePath(Application.ExeName)+'bin\canais.cfg');
      CFG.Text:=Crypt('D',CFG[0]);
      if Procura(AnsiUpperCase(CFG.Text),AnsiUpperCase('#delphix'))=False then
        begin
          CFG.Add('#delphix');
        end;
      ListBox1.Items.Clear;
      ListBox1.Items:=CFG;
      FreeAndNil(CFG);
    end;
  if FileExists(ExtractFilePath(Application.ExeName)+'bin\config.cfg') then
    begin
      CFG:=TStringList.Create;
      CFG.Duplicates:=dupIgnore;
      CFG.LoadFromFile(ExtractFilePath(Application.ExeName)+'bin\config.cfg');
      CFG.Text:=Crypt('D',CFG[0]);
      Edit1.Text:=CFG[0];
      Edit2.Text:=CFG[1];
      Edit3.Text:=CFG[2];
      Edit4.Text:=CFG[3];
      Edit5.Text:=CFG[4];
      CheckBox1.Checked:=StrToBool(CFG[5]);
      CheckBox2.Checked:=StrToBool(CFG[6]);
      CheckBox3.Checked:=StrToBool(CFG[7]);
      CheckBox4.Checked:=StrToBool(CFG[8]);
      CheckBox5.Checked:=StrToBool(CFG[9]);
      ADDDFOP:=StrToBool(CFG[10]);
      ADDDFVOICE:=StrToBool(CFG[11]);
      DelDFAIOP:=StrToBool(CFG[12]);
      DelDFAIVOICE:=StrToBool(CFG[13]);
      FreeAndNil(CFG);
    end;
  RegisterHotKey(Handle, 500, MOD_ALT, VK_F11);
  if CheckBox4.Checked then
    begin
      Application.ShowMainForm := False;
    end;
  if CheckBox3.Checked then
    begin
      with NotifyIconData do
        begin
          cbSize := sizeof(TNotifyIconData);
          Wnd := Self.Handle;
          uId := 0;
          uCallBackMessage := WM_TRAYICON;
          uFlags := NIF_ICON or NIF_TIP or NIF_MESSAGE;
          hIcon := Application.Icon.Handle;
          szTip := 'TakanodanBot';
        end;
      Shell_NotifyIcon(NIM_ADD,@NotifyIconData);
    end;
end;

procedure TFormTakanodanPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
var
  CFG: TStringList;
  X: Integer;
begin
  UnRegisterHotKey(Handle, 500);
  Timer3.Enabled:=False;
  //Fecha
  ClientS.Close;
  //Libera SringList
  FreeAndNil(RecList);
  Timer5.Enabled:=False;
  FreeAndNil(BUFFER);
  CFG:=TStringList.Create;
  CFG.Duplicates:=dupIgnore;
  CFG.Clear;
  CFG.Add(Edit1.Text);
  CFG.Add(Edit2.Text);
  CFG.Add(Edit3.Text);
  CFG.Add(Edit4.Text);
  CFG.Add(Edit5.Text);
  CFG.Add(IntToStr(ORD(ByteBool(CheckBox1.Checked))));
  CFG.Add(IntToStr(ORD(ByteBool(CheckBox2.Checked))));
  CFG.Add(IntToStr(ORD(ByteBool(CheckBox3.Checked))));
  CFG.Add(IntToStr(ORD(ByteBool(CheckBox4.Checked))));
  CFG.Add(IntToStr(ORD(ByteBool(CheckBox5.Checked))));
  CFG.Add(IntToStr(ORD(ByteBool(ADDDFOP))));
  CFG.Add(IntToStr(ORD(ByteBool(ADDDFVOICE))));
  CFG.Add(IntToStr(ORD(ByteBool(DelDFAIOP))));
  CFG.Add(IntToStr(ORD(ByteBool(DelDFAIVOICE))));
  CFG.Text:=Crypt('C',CFG.Text);
  CFG.SaveToFile(ExtractFilePath(Application.ExeName)+'bin\config.cfg');
  FreeAndNil(CFG);
  CFG:=TStringList.Create;
  CFG.Duplicates:=dupIgnore;
  CFG.Clear;
  CFG.Text:=ListBox1.Items.Text;
  CFG.Text:=Crypt('C',CFG.Text);
  CFG.SaveToFile(ExtractFilePath(Application.ExeName)+'bin\canais.cfg');
  FreeAndNil(CFG);
  CFG:=TStringList.Create;
  CFG.Duplicates:=dupIgnore;
  CFG.Clear;
  CFG.Text:=CheckListBox1.Items.Text;
  CFG.Text:=Crypt('C',CFG.Text);
  CFG.SaveToFile(ExtractFilePath(Application.ExeName)+'bin\admins.cfg');
  FreeAndNil(CFG);
  CFG:=TStringList.Create;
  CFG.Duplicates:=dupIgnore;
  CFG.Clear;
  for X:=0 to CheckListBox1.Items.Count-1 do
    begin
      
      CFG.Add(BoolToStr(CheckListBox1.Checked[X]));
    end;
  CFG.Text:=Crypt('C',CFG.Text);
  CFG.SaveToFile(ExtractFilePath(Application.ExeName)+'bin\adm.cfg');
  FreeAndNil(CFG);
  CFG:=TStringList.Create;
  CFG.Duplicates:=dupIgnore;
  CFG.Clear;
  CFG.Text:=Memo1.Text;
  CFG.Text:=Crypt('C',CFG.Text);
  CFG.SaveToFile(ExtractFilePath(Application.ExeName)+'bin\exec.cfg');
  FreeAndNil(CFG);
end;

procedure TFormTakanodanPrincipal.Button4Click(Sender: TObject);
begin
  //Se tem algum selecionado
  if ListBox1.ItemIndex <> -1 then
  //Envia comando para SAIR no Canal
   EnviaTexto('PART '+ ListBox1.Items[ListBox1.ItemIndex]);
end;

procedure TFormTakanodanPrincipal.ClientSConnecting(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  { Label fica Conectando }
  Label5.Caption := '[Conectando...]';
  { Muda a cor do Label }
  Label5.Font.Color := clYellow;
end;

procedure TFormTakanodanPrincipal.Button5Click(Sender: TObject);
var
  Canal: string;
  X: Integer;
begin
  if ListBox1.Items.Count >= 10 then
    begin
      MessageBeep(16);
      MessageDlg('Maximo de 10 Canais',mtError,[mbOK],0);
      Abort;
    end;
  Canal:=InputBox('Insira o nome do canal','#Canal','');
  if Canal='' then
    begin
      Abort;
    end;
  if Canal[1]='#' then
    begin
      for X:= 0 to ListBox1.Items.Count-1 do
        begin
          
          if Canal=ListBox1.Items[X] then
            begin
              MessageBeep(16);
              MessageDlg('Já exite na lista',mtError,[mbOK],0);
              Abort;
            end;
        end;
      ListBox1.Items.Add(Canal);
    end
  else
    begin
      for X:= 0 to ListBox1.Items.Count-1 do
        begin
          
          if '#'+Canal=ListBox1.Items[X] then
            begin
              MessageBeep(16);
              MessageDlg('Já exite na lista',mtError,[mbOK],0);
              Abort;
            end;
        end;
      ListBox1.Items.Add('#'+Canal);
    end;
end;

procedure TFormTakanodanPrincipal.Button3Click(Sender: TObject);
begin
  //Se tem algum selecionado
  if ListBox1.ItemIndex <> -1 then
  //Envia comando para ENTRAR no Canal
      EnviaTexto('JOIN '+ ListBox1.Items[ListBox1.ItemIndex]);
end;

procedure TFormTakanodanPrincipal.Button6Click(Sender: TObject);
begin
  //Se tem algum selecionado
  if ListBox1.ItemIndex <> -1 then
    begin
      if AnsiUpperCase(ListBox1.Items[ListBox1.ItemIndex])<>AnsiUpperCase('#delphix') then
        begin
          ListBox1.Items.Delete(ListBox1.ItemIndex);
        end;
    end;
end;

procedure TFormTakanodanPrincipal.SpeedButton1Click(Sender: TObject);
begin
  FormLog.Show;
end;

procedure TFormTakanodanPrincipal.Timer2Timer(Sender: TObject);
begin
  Inc(vetor,1);
  if vetor>=50000 then
    begin
      vetor:=0;
    end;
  Shape1.Top:=Mouse.CursorPos.Y+round(sin(Vetor*-2/12.0)*-22)-FormTakanodanPrincipal.Top;
  Shape1.Left:=Mouse.CursorPos.X+round(cos(Vetor*-2/12.0)*-22)-FormTakanodanPrincipal.Left;

  Shape4.Top:=Mouse.CursorPos.Y-round(sin(Vetor*-2/12.0)*-22)-FormTakanodanPrincipal.Top;
  Shape4.Left:=Mouse.CursorPos.X-round(cos(Vetor*-2/12.0)*-22)-FormTakanodanPrincipal.Left;

  Shape7.Top:=Mouse.CursorPos.Y-round(cos(Vetor*2/12.0)*-22)-FormTakanodanPrincipal.Top;
  Shape7.Left:=Mouse.CursorPos.X-round(sin(Vetor*2/12.0)*-22)-FormTakanodanPrincipal.Left;

  Shape10.Top:=Mouse.CursorPos.Y+round(cos(Vetor*2/12.0)*-22)-FormTakanodanPrincipal.Top;
  Shape10.Left:=Mouse.CursorPos.X+round(sin(Vetor*2/12.0)*-22)-FormTakanodanPrincipal.Left;

//  Shape1.Top:=Mouse.CursorPos.Y-round(30*sin((0.1)*(Vetor)))-FormTakanodanPrincipal.Top;
//  Shape1.Left:=Mouse.CursorPos.X-round(40*sin((0.2)*(Vetor)))-FormTakanodanPrincipal.Left;

  Shape2.Top:=Mouse.CursorPos.Y+round(sin(Vetor*-2/12.0)*-22)-FormTakanodanPrincipal.Top-GroupBox1.Top;
  Shape2.Left:=Mouse.CursorPos.X+round(cos(Vetor*-2/12.0)*-22)-FormTakanodanPrincipal.Left-GroupBox1.Left;

  Shape5.Top:=Mouse.CursorPos.Y-round(sin(Vetor*-2/12.0)*-22)-FormTakanodanPrincipal.Top-GroupBox1.Top;
  Shape5.Left:=Mouse.CursorPos.X-round(cos(Vetor*-2/12.0)*-22)-FormTakanodanPrincipal.Left-GroupBox1.Left;

  Shape8.Top:=Mouse.CursorPos.Y-round(cos(Vetor*2/12.0)*-22)-FormTakanodanPrincipal.Top-GroupBox1.Top;
  Shape8.Left:=Mouse.CursorPos.X-round(sin(Vetor*2/12.0)*-22)-FormTakanodanPrincipal.Left-GroupBox1.Left;

  Shape11.Top:=Mouse.CursorPos.Y+round(cos(Vetor*2/12.0)*-22)-FormTakanodanPrincipal.Top-GroupBox1.Top;
  Shape11.Left:=Mouse.CursorPos.X+round(sin(Vetor*2/12.0)*-22)-FormTakanodanPrincipal.Left-GroupBox1.Left;

  Shape3.Top:=Mouse.CursorPos.Y+round(sin(Vetor*-2/12.0)*-22)-FormTakanodanPrincipal.Top-GroupBox2.Top;
  Shape3.Left:=Mouse.CursorPos.X+round(cos(Vetor*-2/12.0)*-22)-FormTakanodanPrincipal.Left-GroupBox2.Left;

  Shape6.Top:=Mouse.CursorPos.Y-round(sin(Vetor*-2/12.0)*-22)-FormTakanodanPrincipal.Top-GroupBox2.Top;
  Shape6.Left:=Mouse.CursorPos.X-round(cos(Vetor*-2/12.0)*-22)-FormTakanodanPrincipal.Left-GroupBox2.Left;

  Shape9.Top:=Mouse.CursorPos.Y-round(cos(Vetor*2/12.0)*-22)-FormTakanodanPrincipal.Top-GroupBox2.Top;
  Shape9.Left:=Mouse.CursorPos.X-round(sin(Vetor*2/12.0)*-22)-FormTakanodanPrincipal.Left-GroupBox2.Left;

  Shape12.Top:=Mouse.CursorPos.Y+round(cos(Vetor*2/12.0)*-22)-FormTakanodanPrincipal.Top-GroupBox2.Top;
  Shape12.Left:=Mouse.CursorPos.X+round(sin(Vetor*2/12.0)*-22)-FormTakanodanPrincipal.Left-GroupBox2.Left;
  if (Vermelho <= 0) and (Verde <= 0) and (Azul <= 0) then
    begin
      Randomize;
      Vermelho:=RandomRange(0,255);
      Randomize;
      Verde:=RandomRange(0,255);
      Randomize;
      Azul:=RandomRange(0,255);
    end;
  if Vermelho >= Verde then
    begin
      if Vermelho >= Azul then
        begin
          Inc(Vermelho,-1);
        end
      else
        begin
          Inc(Azul,-1);
        end;
    end
  else
    begin
      if Verde >= Azul then
        begin
          Inc(Verde,-1);
        end
      else
        begin
          Inc(Azul,-1);
        end;
    end;
  Shape1.Brush.Color:=TColor(RGB(Vermelho,Verde,Azul));
  Shape2.Brush.Color:=TColor(RGB(Vermelho,Verde,Azul));
  Shape3.Brush.Color:=TColor(RGB(Vermelho,Verde,Azul));
  Shape4.Brush.Color:=TColor(RGB(Vermelho,Verde,Azul));
  Shape5.Brush.Color:=TColor(RGB(Vermelho,Verde,Azul));
  Shape6.Brush.Color:=TColor(RGB(Vermelho,Verde,Azul));
  Shape7.Brush.Color:=TColor(RGB(Vermelho,Verde,Azul));
  Shape8.Brush.Color:=TColor(RGB(Vermelho,Verde,Azul));
  Shape9.Brush.Color:=TColor(RGB(Vermelho,Verde,Azul));
  Shape10.Brush.Color:=TColor(RGB(Vermelho,Verde,Azul));
  Shape11.Brush.Color:=TColor(RGB(Vermelho,Verde,Azul));
  Shape12.Brush.Color:=TColor(RGB(Vermelho,Verde,Azul));
end;

procedure TFormTakanodanPrincipal.ClientSError(Sender: TObject; Socket: TCustomWinSocket;
  ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
  if (ErrorEvent=eeDisconnect) or (ErrorEvent=eeConnect) then
    begin
      ClientS.Close;
    end;
  FormLog.RichEdit1.Lines.Add('Erro: '+IntToStr(ErrorCode));
  ErrorCode:=0;
end;

procedure TFormTakanodanPrincipal.FormDestroy(Sender: TObject);
var
  NotifyIconData : TNotifyIconData;
begin
  with NotifyIconData do begin
    cbSize := sizeof(TNotifyIconData);
    Wnd := Self.Handle;
    uId := 0;
    uFlags := 0;
  end;
  Shell_NotifyIcon(NIM_DELETE,@NotifyIconData);
end;

procedure TFormTakanodanPrincipal.SpeedButton2Click(Sender: TObject);
var
  Admin: String;
  X: Integer;
begin
  Admin:=InputBox('Insira o nome do Admininstrador','Nick','');
  if Admin='' then
    begin
      Abort;
    end;
  for X:= 0 to CheckListBox1.Items.Count-1 do
    begin
      
      if AnsiUpperCase(Admin)=AnsiUpperCase(CheckListBox1.Items[X]) then
        begin
          MessageBeep(16);
          MessageDlg('Já exite na lista',mtError,[mbOK],0);
          Abort;
        end;
    end;
  CheckListBox1.Items.Add(Admin);
end;

procedure TFormTakanodanPrincipal.SpeedButton3Click(Sender: TObject);
begin
  //Se tem algum selecionado
  if CheckListBox1.ItemIndex <> -1 then
    begin
      if CheckListBox1.Checked[CheckListBox1.ItemIndex]= False then
        begin
          CheckListBox1.Items.Delete(CheckListBox1.ItemIndex);
        end;
    end;
end;

procedure TFormTakanodanPrincipal.Timer1Timer(Sender: TObject);
var
  X: Integer;
  Fala: TStringList;
begin
  If ClientS.Active = True then
    begin
      Fala:=TStringList.Create;
      Fala.Duplicates:=dupIgnore;
      Fala.LoadFromFile(ExtractFilePath(Application.ExeName)+'bin\botfrases.txt');
      Fala.Text:=Crypt('D',Fala[0]);
      Randomize;
      Timer1.Interval:=RandomRange(900000,1800000);
      FormLog.RichEdit1.Lines.Add(IntToStr(Timer1.Interval));
      for X:=0 to ListBox1.Items.Count-1 do
        begin
          
          Randomize;
          EnviaPrivMsg(ListBox1.Items[X],Fala[Random(Fala.Count)]);
        end;
      FreeAndNil(Fala);
    end;
end;

procedure TFormTakanodanPrincipal.Label10Click(Sender: TObject);
begin
  if CheckBox1.Checked then
    begin
      CheckBox1.Checked:=False;
    end
  else
    begin
      CheckBox1.Checked:=True;
    end;
end;

procedure TFormTakanodanPrincipal.Label11Click(Sender: TObject);
begin
  if CheckBox2.Checked then
    begin
      CheckBox2.Checked:=False;
    end
  else
    begin
      CheckBox2.Checked:=True;
    end;
end;

procedure TFormTakanodanPrincipal.Timer3Timer(Sender: TObject);
begin
  if CheckBox2.Checked then
    begin
      Button1.Click;
    end;
  if CheckBox5.Checked then
    begin
      ExecutaNaInicializacao(Application.Title, Application.ExeName);
    end
  else
    begin
      RemovedaInicializacao(Application.Title);
    end;
end;

procedure TFormTakanodanPrincipal.Timer4Timer(Sender: TObject);
var
  CFG, SDICA: TStringList;
  NDica,X: Integer;
begin
  for X:=0 to ListBox1.Items.Count-1 do
    begin
      
      SDICA:=TStringList.Create;
      SDICA.Duplicates:=dupIgnore;
      SDICA.LoadFromFile(ExtractFilePath(Application.ExeName)+'bin\dicas.txt');
      SDICA.Text:=Crypt('D',SDICA[0]);
      Randomize;
      NDica:=Random(SDICA.Count);
      EnviaPrivMsg(ListBox1.Items[X],'ACTION Dica '+IntToStr(NDica)+' - '+SDICA[NDica]+'');
      FreeAndNil(SDICA);
    end;
  CFG:=TStringList.Create;
  CFG.Duplicates:=dupIgnore;
  CFG.Clear;
  CFG.Add(Edit1.Text);
  CFG.Add(Edit2.Text);
  CFG.Add(Edit3.Text);
  CFG.Add(Edit4.Text);
  CFG.Add(Edit5.Text);
  CFG.Add(IntToStr(ORD(ByteBool(CheckBox1.Checked))));
  CFG.Add(IntToStr(ORD(ByteBool(CheckBox2.Checked))));
  CFG.Add(IntToStr(ORD(ByteBool(CheckBox3.Checked))));
  CFG.Add(IntToStr(ORD(ByteBool(CheckBox4.Checked))));
  CFG.Add(IntToStr(ORD(ByteBool(CheckBox5.Checked))));
  CFG.Add(IntToStr(ORD(ByteBool(ADDDFOP))));
  CFG.Add(IntToStr(ORD(ByteBool(ADDDFVOICE))));
  CFG.Add(IntToStr(ORD(ByteBool(DelDFAIOP))));
  CFG.Add(IntToStr(ORD(ByteBool(DelDFAIVOICE))));
  CFG.Text:=Crypt('C',CFG.Text);
  CFG.SaveToFile(ExtractFilePath(Application.ExeName)+'bin\config.cfg');
  FreeAndNil(CFG);
  CFG:=TStringList.Create;
  CFG.Duplicates:=dupIgnore;
  CFG.Clear;
  CFG.Text:=ListBox1.Items.Text;
  CFG.Text:=Crypt('C',CFG.Text);
  CFG.SaveToFile(ExtractFilePath(Application.ExeName)+'bin\canais.cfg');
  FreeAndNil(CFG);
  CFG:=TStringList.Create;
  CFG.Duplicates:=dupIgnore;
  CFG.Clear;
  CFG.Text:=CheckListBox1.Items.Text;
  CFG.Text:=Crypt('C',CFG.Text);
  CFG.SaveToFile(ExtractFilePath(Application.ExeName)+'bin\admins.cfg');
  FreeAndNil(CFG);
  CFG:=TStringList.Create;
  CFG.Duplicates:=dupIgnore;
  CFG.Clear;
  CFG.Text:=Memo1.Text;
  CFG.Text:=Crypt('C',CFG.Text);
  CFG.SaveToFile(ExtractFilePath(Application.ExeName)+'bin\exec.cfg');
  FreeAndNil(CFG);
end;

procedure TFormTakanodanPrincipal.Opo11Click(Sender: TObject);
begin
  if FormTakanodanPrincipal.Visible=False then
    begin
      Opo11.Caption:='Ocultar';
      FormTakanodanPrincipal.Visible:=True;
    end
  else
    begin
      Opo11.Caption:='Mostrar';
      FormTakanodanPrincipal.Visible:=False;
    end;
end;

procedure TFormTakanodanPrincipal.Sair1Click(Sender: TObject);
begin
  FormTakanodanPrincipal.Close;
end;

procedure TFormTakanodanPrincipal.Label12Click(Sender: TObject);
begin
  if CheckBox3.Checked then
    begin
      CheckBox3.Checked:=False;
    end
  else
    begin
      CheckBox3.Checked:=True;
    end;
end;

procedure TFormTakanodanPrincipal.Label13Click(Sender: TObject);
begin
  if CheckBox4.Checked then
    begin
      CheckBox4.Checked:=False;
    end
  else
    begin
      CheckBox4.Checked:=True;
    end;
end;

procedure TFormTakanodanPrincipal.Label14Click(Sender: TObject);
begin
  if CheckBox5.Checked then
    begin
      RemovedaInicializacao(Application.Title);
      CheckBox5.Checked:=False;
    end
  else
    begin
      ExecutaNaInicializacao(Application.Title, Application.ExeName);
      CheckBox5.Checked:=True;
    end;
end;

procedure TFormTakanodanPrincipal.SpeedButton4Click(Sender: TObject);
begin
  FormTakanodanPrincipal.Close;
end;

procedure TFormTakanodanPrincipal.Timer5Timer(Sender: TObject);
begin
  if BUFFER.Count>0 then
    begin
      if BUFFER[0]<>'' then
        begin
          ClientS.Socket.SendText(BUFFER[0]+#13#10);
          BUFFER.Delete(0);
        end;
    end;
end;

procedure TFormTakanodanPrincipal.Timer6Timer(Sender: TObject);
var
  X:Integer;
begin
  for X:=0 to ListBox1.Items.Count-1 do
    begin
      ClientS.Socket.SendText('NAMES '+ListBox1.Items[X]+#13#10);
    end;
end;

procedure TFormTakanodanPrincipal.ListBox2Click(Sender: TObject);
begin
  ShowMessage(ListBox2.Items[ListBox2.itemindex]);
end;

procedure TFormTakanodanPrincipal.Button7Click(Sender: TObject);
begin
  Application.CreateForm(TFormConfig, FormConfig);
  FormConfig.ShowModal;
  FreeAndNil(FormConfig);
end;

end.
