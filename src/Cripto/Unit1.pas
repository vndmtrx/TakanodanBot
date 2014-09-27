unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
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
  SrcPos := 0;
  SrcAsc := 0;
  Range := 256;
  if (Action = UpperCase('C')) then
  begin
    Randomize;
    OffSet := Random(Range);
    Dest := Format('%1.2x',[OffSet]);
    for SrcPos := 1 to Length(Src) do
    begin
      Application.ProcessMessages;
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

procedure TForm1.Button1Click(Sender: TObject);
var
  Texto:TStringList;
begin
  if OpenDialog1.Execute then
    begin
      Texto:=TStringList.Create;
      Texto.LoadFromFile(OpenDialog1.FileName);
      Texto.Text:=Crypt('C',Texto.Text);
      Texto.SaveToFile(ExtractFilePath(OpenDialog1.FileName)+ChangeFileExt(ExtractFileName(OpenDialog1.FileName),'')+'-New'+ExtractFileExt(OpenDialog1.FileName));
      FreeAndNil(Texto);
    end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Texto:TStringList;
begin
  if OpenDialog1.Execute then
    begin
      Texto:=TStringList.Create;
      Texto.LoadFromFile(OpenDialog1.FileName);
      Texto.Text:=Crypt('D',Texto[0]);
      Texto.SaveToFile(ExtractFilePath(OpenDialog1.FileName)+ChangeFileExt(ExtractFileName(OpenDialog1.FileName),'')+'-New'+ExtractFileExt(OpenDialog1.FileName));
      FreeAndNil(Texto);
    end;
end;

end.
