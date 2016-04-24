unit Unit1;
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, Chart, StdCtrls, RK_Method;

  function calcQ(V:Real; h:Real):Real;
  function f1(VarArray:TVarsArray):extended;
  function f2(VarArray:TVarsArray):extended;
  function f3(VarArray:TVarsArray):extended;
  function f4(VarArray:TVarsArray):extended;

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

//Задаем функции (правые части уравнений)

function calcQ(V:Real; h: Real):Real;
var
  p : Real;
begin
  p := h/100;
  Result := p*V*V/2;
end;

function f1(VarArray:TVarsArray):extended;
var
  q,V,h, phi,L : Real;
begin
    V := VarArray[1];
    phi := VarArray[2];
    L := VarArray[3];
    h := VarArray[4];
    q := calcQ(V,h);
    Result:= -Cx*q*Sm/m-g*cos(phi);
end;

function f2(VarArray:TVarsArray):extended;
var
  q,V,h, phi,L : Real;
begin
    V := VarArray[1];
    phi := VarArray[2];
    L := VarArray[3];
    h := VarArray[4];
    Form1.print('V='+floattostr(V));
    Form1.print('phi='+floattostr(phi));
    Form1.print('L='+floattostr(L));
    Form1.print('h='+floattostr(h));
    q := calcQ(V,h);
  Result:= Cy*q*Sm/m/V - (q/V - V/(R+h))*cos(phi);
end;

function f3(VarArray:TVarsArray):extended;
var
  q,V,h, phi,L : Real;
begin
    V := VarArray[1];
    phi := VarArray[2];
    L := VarArray[3];
    h := VarArray[4];
    q := calcQ(V,h);
  Result:= R/(R+h)*V*cos(phi);
end;

function f4(VarArray:TVarsArray):extended;
var
  q,V,h, phi,L : Real;
begin
    V := VarArray[1];
    phi := VarArray[2];
    L := VarArray[3];
    h := VarArray[4];
    q := calcQ(V,h);
  Result:= V*sin(phi);
end;

procedure TForm1.print(str:string);
begin
  Self.Memo1.Lines.Add(str);
end;

procedure TForm1.calc();
var
  I: Integer;
  FunArray: TFunArray; // массив функций
  First: Extended; // начальная точка по независимой координате
  Last: Extended; // конечная точка по независимой координате
  Steps: Integer; // число шагов по независимой координате
  InitArray: TInitArray; // вектор начальных значений
  Res: TResArray; // матрица результатов включая независ. переменную
  //Memo1 : TMemo;
begin
  Memo1 := TMemo.Create(Self);
  Memo1.Parent := Self;
  Memo1.Top := 50;
  Memo1.Left := 50;
  Memo1.Show();
  // Создаем вектор функций:
  SetLength(FunArray,4);
  FunArray[0]:=f1;
  FunArray[1]:=f2;
  FunArray[2]:=f3;
  FunArray[3]:=f4;
  // Задаем интервал и число шагов:
  First:=-30;
  Last:=10;
  Steps:=10;
  // Задаем начальные условия:
  SetLength(InitArray,4);
  InitArray[0]:=50;
  InitArray[1]:=-25;
  InitArray[2]:=100;
  InitArray[3]:=0;
  // Вызов метода и получение результатов:
  //Memo1.Lines.Clear;
  I:=Runge_Kutt(FunArray, First, Last, Steps, InitArray, Res);
  ShowMessage('Код ошибки = '+IntToStr(I));
  For I:=0 to Steps do
  Memo1.Lines.Add(floattostr(Res[0,I])+'   '+floattostr(Res[1,I])
  +'   '+floattostr(Res[2,I]));
end;



end.
 