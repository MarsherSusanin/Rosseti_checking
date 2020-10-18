program RosSeti;

uses
  System.StartUpCopy,
  FMX.Forms,
  HeaderFooterTemplate in 'HeaderFooterTemplate.pas' {HeaderFooterForm},
  main in 'main.pas' {Form1},
  GlobalVar in 'GlobalVar.pas',
  Unitworkorder in 'Unitworkorder.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(THeaderFooterForm, HeaderFooterForm);
  Application.CreateForm(TForm2, Form2);
  Application.MainForm := HeaderFooterForm;
  Application.Run;
end.

