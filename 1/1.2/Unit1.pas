unit Unit1;
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, Chart, StdCtrls, RK_Method;

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
    procedure calc();
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
function f1(VarArray:TVarsArray):extended;
var
  q : Real;
begin
    q := VarArray[0];
    Result:= -Cx*q*Sm/m-g*cos(q);
end;

function f2(VarArray:TVarsArray):extended;
begin
   Result:=1;
end;

function f3(VarArray:TVarsArray):extended;
begin
   Result:=1;
end;

function f4(VarArray:TVarsArray):extended;
begin
   Result:=1;
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
  Memo1 : TMemo;
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
  First:=0;
  Last:=10;
  Steps:=10;
  // Задаем начальные условия:
  SetLength(InitArray,4);
  InitArray[0]:=0;
  InitArray[1]:=0;
  InitArray[2]:=0;
  InitArray[3]:=0;
  // Вызов метода и получение результатов:
  Memo1.Lines.Clear;
  I:=Runge_Kutt(FunArray, First, Last, Steps, InitArray, Res);
  //ShowMessage('Код ошибки = '+IntToStr(I));
  For I:=0 to Steps do
  Memo1.Lines.Add(floattostr(Res[0,I])+'   '+floattostr(Res[1,I])
  +'   '+floattostr(Res[2,I]));
end;



end.
 