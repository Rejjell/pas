program Project1;

uses
  Forms, Unit4;

var
  Form : TForm4;
{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm4,Form);
  Form.Caption := 'GG';
  Form.FormCreate();
  Application.Run;
end.
