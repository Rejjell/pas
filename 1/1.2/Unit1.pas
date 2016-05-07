unit Unit1;
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, Chart, StdCtrls, RK_Method;

  function calcQ(V:Real; h:Real):Double;

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
  m = 1000;
  Cx=2;
  Cy=0.6;
  Sm=5;

  V0=5000;
  q0=-25;
  h0=100000;
  L0=0;
  R=6371000;
  g=9.81;


implementation
{$R *.dfm}

//Çàäàåì ôóíêöèè (ïðàâûå ÷àñòè óðàâíåíèé)

function calcQ(V:Real; h: Real):Double;
var
  p : Real;
begin
  p := h/100000;
  Result := p*V*V/200;
end;

procedure Syst (var t: TFloat; var X: TFloatVector;
                var RP: TFloatVector);
var
  q,V,h, phi,L : Real;
begin
  V := X[0];
  phi := X[1];
  h := X[2];
  L := X[3];
  q := calcQ(V,h);
  RP[0] := -Cx*q*Sm/m-g*cos(phi);     //means dx0/dt = 2t
  RP[1] := Cy*q*Sm/m/V - (q/V - V/(R+h))*cos(phi);  //means dx1/dt = 3x0
  RP[2] := V*sin(phi);
  RP[3] := R/(R+h)*V*cos(phi);
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
    st : Integer;
begin
  Memo1 := TMemo.Create(Self);
  Memo1.Parent := Self;
  Memo1.Top := 50;
  Memo1.Left := 50;
  Memo1.Width := 700;
  Memo1.Show();

  Memo1.Clear;

  First := 0.0;
  st := 137;
  //st:=10;
  Last  := st;
  Count:= 4;
  Points:=st+1; //11 points for output
  StepsFact:=1000000; //all steps inside function = 10*StepsFact
  StepsFact:=10000;
  try
  SetLength(InitConds, Count);
    InitConds[0]:=5000.0;  //x0(0)=0
    InitConds[1]:=-25.0*pi/180;  //x1(0)=0
    InitConds[2]:=100000.0;
    InitConds[3]:=0.0;
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
  for I := Points-11 to Points - 1 do
      Memo1.Lines.Add(
                 't = '+ FloatToStr(TOut[I])+
      '           V = '+ FloatToStr(XOuts[0, I])+
      '           phi = '+ FloatToStr(XOuts[1, I])+
      '           h = '+ FloatToStr(XOuts[2, I])+
      '           L = '+ FloatToStr(XOuts[3, I])
      );
  //Clean memory:
  XOuts := Nil; tOut := Nil; InitConds := Nil;


end;



end.
