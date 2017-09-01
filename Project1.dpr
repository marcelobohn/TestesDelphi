program Project1;

uses
  Forms,
  GUITestRunner,
  uTestCalc in 'uTestCalc.pas',
  uCalc in 'uCalc.pas',
  Unit2 in 'Unit2.pas' {Form2},
  uUtilForm in 'uUtilForm.pas',
  uTestUtilForm in 'uTestUtilForm.pas',
  uFormExemplo in 'uFormExemplo.pas' {frmExemplo},
  uTestGui in 'uTestGui.pas',
  uUtil in 'uUtil.pas',
  uTestUtil in 'uTestUtil.pas';

{$R *.RES}

begin
  Application.Initialize;
  GUITestRunner.RunRegisteredTests;
end.


