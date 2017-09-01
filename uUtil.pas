unit uUtil;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TStringArray = array of string;
  TUtil = class
  private
    { Private declarations }
  public
    { Public declarations }
    function Iff(const Condition: Boolean; const TruePart: Variant; const FalsePart: Variant): Variant; overload;
    function QuebraString(input: String; separador: char) : TStringList;
    function Split(l: TStringList): TStringArray;
  end;

var
  Util: TUtil;

implementation

{ TUtil }

function TUtil.Iff(const Condition: Boolean; const TruePart, FalsePart: Variant): Variant;
begin
if (Condition) then
   result := TruePart
else
   result := FalsePart;
end;

function TUtil.Split(l: TStringList): TStringArray;
var
   i: integer;
begin
SetLength(result, l.count);
for i := 0 to l.count-1 do
    begin
    result[i] := l[i];
    end;
end;

function TUtil.QuebraString(input: String; separador: char) : TStringList;
var resultado: TStringList;
begin
resultado := TStringList.Create;
resultado.Delimiter := separador;
resultado.DelimitedText :=  '"' + StringReplace(input, separador, '"' + separador + '"', [rfReplaceAll]) + '"' ;
result := resultado;
end;

end.
