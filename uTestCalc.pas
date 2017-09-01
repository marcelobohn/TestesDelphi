unit uTestCalc;

interface

uses
  TestFramework, TextTestRunner;

Type
  TTestNumbersAdding = class(TTestCase)
  published
    procedure TestIntegerAdd;
    procedure TestDoubleAdd;
  end;

implementation

uses
 uCalc;

{ TTestNumbersAdding }

procedure TTestNumbersAdding.TestDoubleAdd;
var A,B: double;
    i: integer;
    calc: TCalc;
begin
  calc := TCalc.Create;
  for i := 1 to 1000 do
  begin
    A := Random*11;
    B := Random*111;
    CheckEquals(A+B,calc.Add(A,B));
  end;
end;

procedure TTestNumbersAdding.TestIntegerAdd;
var A,B: Integer;
    i: integer;
    calc: TCalc;
begin
  calc := TCalc.Create;
  for i := 1 to 1000 do
  begin
    A := Trunc(Random*100);
    B := Trunc(Random*1000);
    CheckEquals(A+B,calc.Add(A,B));
  end;
end;

initialization
  TestFramework.RegisterTest(TTestNumbersAdding.Suite);

end.
