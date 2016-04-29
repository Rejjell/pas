unit Unit1;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, Chart, StdCtrls, Solver;

type
  TForm1 = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure main();
    function func(x:Real):Real;
  end;

var
  Form1: TForm1;
  aLeft,aRight, h, midle:Real;
  Memo1:TMemo;

implementation

{$R *.dfm}

procedure TForm1.main();
begin

  Memo1 := TMemo.Create(Self);
  Memo1.Parent := Self;
  Memo1.Top := 50;
  Memo1.Left := 50;
  Memo1.Width := 1300;
  Memo1.Height := 700;
  Memo1.Show();

h := 0;
aLeft :=0 ;
aRight := 9;

while ((aRight - aLeft>0.00001) ) do
begin
midle := aLeft +  (aRight-aLeft)/2;
Memo1.Lines.Add(FloatToStr(aLeft) + ' '+ FloatToStr(aRight) + ' ' + FloatToStr(midle));
if (func(midle)*func(aLeft)<0) then
  aRight := midle
  else
if (func(midle)*func(aRight)<0) then
  aLeft := midle;
h := h+1;
end;
Memo1.Lines.Add(FloatToStr(aLeft) + ' '+ FloatToStr(aRight));

end;

function TForm1.func(x:Real):Real;
begin
  Result := x-3;//x*x-9*x+24;
end;

end.
