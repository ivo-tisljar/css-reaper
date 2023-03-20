program CssReaper;

uses
  Vcl.Forms,
  CssReaperMain in 'CssReaperMain.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
