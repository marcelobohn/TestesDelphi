unit uTestUtilForm;

interface
                 
uses
  TestFramework, TextTestRunner, Classes;

const
  formTeste = 'frmExemplo';

Type
  TTestUtilForm = class(TTestCase)
  published
    //AbreForm
    procedure AbrirForm;
    procedure ReabrirForm;
    procedure AbrirFecharAbrirForm;
    procedure AbrirFormQueNaoExiste;

    //FechaForm
    procedure FecharForm;
    procedure FecharFormNaoCriado;
    procedure FecharFormQueNaoExiste;
  end;

implementation

uses
 uUtilForm, Unit2;

{ TTestUtilForm }

procedure TTestUtilForm.AbrirForm;
var
  r: integer;
begin
try
   r := UtilForm.AbreForm(formTeste);
   CheckEquals(r,1);
finally
   UtilForm.FechaForm(formTeste);
end;
end;

procedure TTestUtilForm.ReabrirForm;
var
  r: integer;
begin
try
   UtilForm.AbreForm(formTeste);
   r := UtilForm.AbreForm(formTeste);
   CheckEquals(r,2);
finally
   UtilForm.FechaForm(formTeste);
end
end;

procedure TTestUtilForm.AbrirFecharAbrirForm;
var
  r: integer;
begin
try
   UtilForm.AbreForm(formTeste);
   UtilForm.FechaForm(formTeste);
   r := UtilForm.AbreForm(formTeste);
   CheckEquals(r,1);
finally
   UtilForm.FechaForm(formTeste);
end
end;

procedure TTestUtilForm.AbrirFormQueNaoExiste;
var
  r: integer;
begin
r := UtilForm.AbreForm('FormNaoExiste');
CheckEquals(r,0);
end;

procedure TTestUtilForm.FecharForm;
var
  r: integer;
begin
UtilForm.AbreForm(formTeste);
r := UtilForm.FechaForm(formTeste);
CheckEquals(r,1);
end;

procedure TTestUtilForm.FecharFormNaoCriado;
var
  r: integer;
begin
r := UtilForm.FechaForm(formTeste);
CheckEquals(r,0);
end;

procedure TTestUtilForm.FecharFormQueNaoExiste;
var
  r: integer;
begin
r := UtilForm.FechaForm('FormNaoExiste');
CheckEquals(r,0);
end;

initialization
  TestFramework.RegisterTest(TTestUtilForm.Suite);

end.
