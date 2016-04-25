unit Unit1;
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, Chart, StdCtrls, RK_Method;

  function calcRo(h:Real):Double;

type
  TForm1 = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
    Memo1 : TMemo;
    procedure calc();
    procedure print(str:string);
    
  end;

var
  Form1: TForm1;
  L: TLabel;
      
 
 
 
 
 
 
 

const
  P =1000;
  A=200;
  D=0.1;
  mc=20;
  G=9.81;

implementation
{$R *.dfm}

//Задаем функции (правые части уравнений)

function calcRo(h:Real):Double;
begin
  Result := 0.00132*exp(-1.44345/10000*h);
end;

procedure Syst (var t: TFloat; var X: TFloatVector;
                var RP: TFloatVector);
var
  V,phi,_x,_y,m : Real;
begin
  V := X[0];
  phi := X[1];
  _x := X[2];
  _y := X[3];
  m := X[4];

  RP[0] := P/m-D*V*V/m-G/m*sin(phi)+A/m*sin(phi);     //means dx0/dt = 2t
  RP[1] := -G/m/V*cos(phi) + A/m/V*cos(phi);  //means dx1/dt = 3x0
  RP[2] := V*cos(phi);
  RP[3] := V*sin(phi);
  RP[4] := -mc;
end;

procedure TForm1.print(str:string);
begin
  Self.Memo1.Lines.Add(str);
end;

procedure TForm1.calc();
var
    I, t1, t2: Cardinal;
    tOut, InitConds: TFloatVector;
    XOuts: TFloatMatrix;
    Points: Cardinal;
    First, Last: TFloat; 
    StepsFact: Cardinal;     
    Count: Word;
    St:Integer;
begin
  Memo1 := TMemo.Create(Self);
  Memo1.Parent := Self;
  Memo1.Top := 50;
  Memo1.Left := 50;
  Memo1.Width := 1300;
  Memo1.Height := 700;
  Memo1.Show();

  Memo1.Clear;
  St:=20;
  First := 0.0;
  Last  := St;//137.0;
  Count:= 5;
  Points:=St+1; //11 points for output
  StepsFact:=1000000; //all steps inside function = 10*StepsFact
  StepsFact:=10000;
  try
  SetLength(InitConds, Count);
    InitConds[0]:=300.0;  //x0(0)=0
    InitConds[1]:=30.0*pi/180;  //x1(0)=0
    InitConds[2]:=0.0;
    InitConds[3]:=0.0;
    InitConds[4]:=1130.0;
    SetLength(tOut, Points);
    SetLength(XOuts, Count, Points);
  except
    ShowMessage('Out of memory!!!');
    exit;
  end;

  t1:= GetTickCount();
  I := rk4fixed( Syst, InitConds, First, Last, tOut, XOuts, StepsFact );
  t2:= GetTickCount();
  Memo1.Lines.Add('Error Code = ' + IntToStr(I));
  Memo1.Lines.Add('Run time, ms = ' + IntToStr(t2-t1));
  Memo1.Lines.Add('');
  if I = 0 then
  for I := 0 to Points  do
      Memo1.Lines.Add(
                 't = '+ FloatToStr(TOut[I])+
      '           V = '+ FloatToStrf(XOuts[0, I],ffFixed,6,3)+
      '           phi = '+ FloatToStrf(XOuts[1, I],ffFixed,6,3)+
      '           x = '+ FloatToStrf(XOuts[2, I],ffFixed,6,3)+
      '           y = '+ FloatToStrf(XOuts[3, I],ffFixed,6,3)+
      '           m = '+ FloatToStrf(XOuts[4, I],ffFixed,6,3)
      );
  //Clean memory:
  XOuts := Nil; tOut := Nil; InitConds := Nil;


end;



end.
