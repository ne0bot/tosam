program tosam;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, pl_excontrols, pl_bgracontrols, pl_castle, lazcontrols,
  pl_bgrauecontrols, rx, pl_shapespak, Unit1, Unit2, Unit3, Unit4, Unit5, Unit6,
  Unit7, Unit9
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource := True;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

