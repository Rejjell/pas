program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  _RK_Method in '_RK_Method.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Form1.calc();
  Application.Run;
end.
