unit uTestGui;

interface

uses
  Forms,
  GUITesting, GUITestRunner, Unit2;

type
  T_TGUITestCase = class(TGUITestCase)
  protected
    mForm : TForm2;

    procedure SetUp; override;
  public
    procedure TearDown; override;
  published
    procedure Test_EnterTextInto;
  end;

implementation

uses
  TestFramework,
  TestExtensions;

{ T_TGUITestCase }

procedure T_TGUITestCase.SetUp;
begin
  inherited;
  mForm := TForm2.Create(nil);
  ActionDelay := 10;
  mForm.Show;
  Application.ProcessMessages;
end;

procedure T_TGUITestCase.TearDown;
begin
  inherited;
  mForm.Release;
  Application.ProcessMessages;
  inherited;
end;

procedure T_TGUITestCase.Test_EnterTextInto;
const c_text = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ `1234567890-=~!@#$%^&*()_+[]{}\|;'':",./<>?';
begin
  fFailsOnNoChecksExecuted := False;
  EnterTextInto(mForm.xMemo, c_text);
  //Assert(mForm.xMemo.Text = c_text);
  //CheckEqualsString('', mForm.xMemo.Text, c_text);
  //CheckEqualsString(mForm.xMemo.Text, c_text);
  //CheckEqualsString(mForm.xMemo.Lines.Text, c_text);
  CheckEquals(mForm.xMemo.Tag, 1);

  EnterTextInto(mForm.xEdit, c_text);
  //Assert(mForm.xEdit.Text = c_text);
  //CheckEqualsString(mForm.xEdit.Text, c_text);

  //SetFocus(mForm.xMemo);
end;

initialization
  //RegisterTests('', [T_TGUITestCase.Suite]);

end.
