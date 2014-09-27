unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Menus;

type
  TFormLog = class(TForm)
    RichEdit1: TRichEdit;
    PopupMenu1: TPopupMenu;
    Limpar1: TMenuItem;
    procedure RichEdit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Limpar1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormLog: TFormLog;

implementation

{$R *.dfm}

procedure TFormLog.RichEdit1Change(Sender: TObject);
begin
  RichEdit1.SelLength := 0;
  RichEdit1.SelStart:= RichEdit1.GetTextLen;
  RichEdit1.Perform( EM_SCROLLCARET, 0, 0 );
end;

procedure TFormLog.FormCreate(Sender: TObject);
begin
  SendMessage(RichEdit1.Handle, EM_LIMITTEXT, 0, $FFFFFF); 
end;

procedure TFormLog.Limpar1Click(Sender: TObject);
begin
  RichEdit1.Lines.Clear;
end;

end.
