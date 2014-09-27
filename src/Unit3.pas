unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFormConfig = class(TForm)
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    GroupBox2: TGroupBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormConfig: TFormConfig;

implementation

uses Unit1;

{$R *.dfm}

procedure TFormConfig.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TFormConfig.CheckBox1Click(Sender: TObject);
begin
  ADDDFOP:=CheckBox1.Checked;
end;

procedure TFormConfig.CheckBox2Click(Sender: TObject);
begin
  ADDDFVOICE:=CheckBox2.Checked;
end;

procedure TFormConfig.CheckBox4Click(Sender: TObject);
begin
  DelDFAIOP:=CheckBox4.Checked;
end;

procedure TFormConfig.CheckBox5Click(Sender: TObject);
begin
  DelDFAIVOICE:=CheckBox5.Checked;
end;

procedure TFormConfig.FormCreate(Sender: TObject);
begin
  CheckBox1.Checked:=ADDDFOP;
  CheckBox2.Checked:=ADDDFVOICE;
  CheckBox4.Checked:=DelDFAIOP;
  CheckBox5.Checked:=DelDFAIVOICE;
end;

end.
