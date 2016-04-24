program Example;

uses
  Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  RK_Method in '..\RK_Method.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
