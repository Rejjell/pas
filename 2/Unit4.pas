unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, Chart, StdCtrls;

type
  TForm4 = class(TForm)
  procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  //procedure FormShow(Sender: TObject);
  procedure FormCreate();

  end;

var
  Form4: TForm4;
  s,x,y,h, g: double;
  Label1 : TLabel;
  Button1: TButton;
  Chart1: TChart;
  Series1: TLineSeries;
  Series2: TLineSeries;
implementation
{$R *.dfm}

procedure TForm4.FormCreate();
begin
  Self.Caption := 'Create';


  Button1 := TButton.Create(Self);
  Button1.Parent := Self;
  Button1.Left := 50;
  Button1.Top := 50;

  Label1:= TLabel.Create(Self);
  Label1.Visible := True;
  Label1.Parent := Self;
  Label1.Caption := 'Hello';
  Label1.Left := 50;
  Label1.Top := 150;

  Chart1:= TChart.Create(Self);
  Chart1.Parent := Self;
  Chart1.Left := 300;
  Chart1.Top := 150;

  Series1  := TLineSeries.Create(Chart1);
  Series2  := TLineSeries.Create(Chart1);

  Chart1.AddSeries(Series1);
  Chart1.AddSeries(Series2);
  Button1Click(Self);
end;

procedure TForm4.Button1Click(Sender: TObject);
begin
  s:=0;
h:=0.1;
x:=0;
while(x<=1) do
 begin
  y:=ln(x+1);
  s:=s+y*h;
  x:=x+h;
 end;
Label1.Caption:=FloatToStr(s);
x:=0;
g:=0.001;
while (x<=1) do
begin
 y:=ln(x+1);
 x:=x+g;
 Series1.AddXY(x,y,' ',clRed);
end;

x:=0;
while (x<=1) do
begin
 Series2.AddXY(x,0,' ',clBlue);
 y:=ln(x+1);
 Series2.AddXY(x,y,' ',clBlue);
 x:=x+h;
 Series2.AddXY(x,y,' ',clBlue);
end;
end;
end.
 