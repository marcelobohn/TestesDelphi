unit uUtilForm;

interface

uses
  Forms, Classes, SysUtils;

Type
  TRetornoAbreForm = (abAbriu, abReabriu, abErro);

  TUtilForm = class
  public
    function AbreForm(NomeForm: String): Integer;
    function FechaForm(NomeForm: String): Integer;
  end;

var
  UtilForm: TUtilForm;

implementation

{ TUtilForm }

function TUtilForm.AbreForm(NomeForm: String): Integer;
var
  fc: TFormClass;
  pc: TPersistentClass;
  f: TForm;
begin
try
   f := Application.FindComponent(NomeForm) as TForm;
   if (Assigned(f)) then
      begin
      f.WindowState := wsNormal;
      f.Show;
      result := 2;
      end
   else
      begin
      pc := FindClass('T' + NomeForm);
      if (Assigned(pc)) then
         begin
         fc := TFormClass(pc);
         f := fc.Create(Application);
         result := 1;
         end
      else
         result := 0;
      end;
except
   result := 0;
end;
end;

function TUtilForm.FechaForm(NomeForm: String): Integer;
var
  f : TForm;
begin
try
   f := Application.FindComponent(NomeForm) as TForm;
   if (Assigned(f)) then
      begin
      f.Close;
      FreeAndNil(f);
      result := 1;
      end
   else
      result := 0;
except
   result := 0;
end;
end;

end.
