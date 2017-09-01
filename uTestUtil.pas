unit uTestUtil;

interface

uses
  TestFramework, TextTestRunner, Classes, SysUtils;

Type
  TTestUtil = class(TTestCase)
  published
    procedure IffBooleanTrue;
    procedure IffBooleanFalse;
    procedure IffStringTrue;
    procedure IffStringFalse;
    procedure IffIntegerTrue;
    procedure IffVariantTrue;

    procedure QuebraStringSemEspacos;
    procedure QuebraStringComEspacos;
  end;

implementation

uses
  uUtil;

{ TTestUtil }

procedure TTestUtil.IffBooleanFalse;
var
  r: Boolean;
begin
r := Util.Iff(1=2, True, False);
CheckFalse(r);
end;

procedure TTestUtil.IffBooleanTrue;
var
  r: Boolean;
begin
r := Util.Iff(1=1, True, False);
CheckTrue(r);
end;

procedure TTestUtil.IffStringFalse;
var
   r: String;
begin
r := Util.Iff(1=2, 'Verdadeiro', 'Falso');
CheckEqualsString('Falso', r);
end;

procedure TTestUtil.IffStringTrue;
var
   r: String;
begin
r := Util.Iff(1=1, 'Verdadeiro', 'Falso');
CheckEqualsString('Verdadeiro', r);
end;

procedure TTestUtil.IffIntegerTrue;
var
   r: Integer;
begin
r := Util.Iff(1=1, 123, 456);
CheckEquals(123, r);
end;

procedure TTestUtil.IffVariantTrue;
var
   r: Variant;
begin
r := Util.Iff(1=1, '123', 456);
CheckEquals(123, StrToInt(r));
end;

procedure TTestUtil.QuebraStringSemEspacos;
var
   l: TStringList;
begin
l := Util.QuebraString('a,b,c',',');
CheckEquals(l.count, 3);
CheckEquals(l[0], 'a');
CheckEquals(l[1], 'b');
CheckEquals(l[2], 'c');
end;

procedure TTestUtil.QuebraStringComEspacos;
var
   l: TStringList;
begin
l := Util.QuebraString('Novo Hamburgo|Ivoti|Porto Alegre|Santa Maria|Torres','|');
CheckEquals(l.count, 5);
CheckEquals(l[0], 'Novo Hamburgo');
CheckEquals(l[4], 'Torres');
end;

initialization
  TestFramework.RegisterTest(TTestUtil.Suite);

end.
