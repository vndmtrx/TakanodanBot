program TakanodanBot;

uses
  Forms,
  Windows,
  Dialogs,
  Unit1 in 'Unit1.pas' {FormTakanodanPrincipal},
  Unit2 in 'Unit2.pas' {FormLog},
  Unit3 in 'Unit3.pas' {FormConfig};

{$R *.RES}

Var
  HprevHist : HWND;
begin
  HprevHist := FindWindow(Nil, 'TakanodanBot por Zero_Col');
  if HprevHist = 0 then
    begin
      Application.Initialize;
      Application.Title:='TakanodanBot por Zero_Col';
      Application.CreateForm(TFormTakanodanPrincipal, FormTakanodanPrincipal);
  Application.CreateForm(TFormLog, FormLog);
  Application.Run;
    end
  else
    begin
      Application.Terminate;
    end;
end.
