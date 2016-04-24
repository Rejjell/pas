unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, TeeProcs, TeEngine, Chart, Series;

type
  TMainForm = class(TForm)
    Chart1: TChart;
    Series1: TLineSeries;
    Series2: TLineSeries;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Button1: TButton;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses RK_Method;

{$R *.dfm}

function f0(Vars: TVarsArray): Extended;
begin
  Result:=Vars[1]*StrToFloat(MainForm.Edit1.Text);
end;

function f1(Vars: TVarsArray): Extended;
begin
  Result:=sin(Vars[0])*StrToFloat(MainForm.Edit2.Text);
end;


procedure TMainForm.Button1Click(Sender: TObject);
var
 Funs: TFunArray;
 F,L:Extended;
 S,I:Integer;
 Ins: TInitArray;
 Outs: TResArray;
begin
 Series1.Clear;
 Series2.Clear;
 Label3.Caption:='Код ошибки = ';
 SetLength(Funs,2);
   Funs[0]:=f0;
   Funs[1]:=f1;
 SetLength(Ins,2);
   Ins[0]:=1;
   Ins[1]:=0;
 F:=0;
 L:=2*pi;
 S:=1000;
 I:=Runge_Kutt(Funs,F,L,S,Ins,Outs);
 Label3.Caption:='Код ошибки = '+IntToStr(I);
 for I:=0 to S do
 begin
   Series1.AddXY(Outs[0,I],Outs[1,I]);
   Series2.AddXY(Outs[0,I],Outs[2,I]);
 end;   
end;

end.
