unit uCalc;

interface

Type
  TCalc = class
  public
    function Add(A,B: integer): Integer; overload;
    function Add(A,B: double): Double; overload;
  end;

implementation

{ TCalc }

function TCalc.Add(A, B: integer): Integer;
begin
  result := A+B;
end;

function TCalc.Add(A, B: double): Double;
begin
  result := A+B;
end;

end.
