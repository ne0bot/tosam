unit Unit8;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs;

type

  { TForm8 }

  TForm8 = class(TForm)
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form8: TForm8;

implementation
       uses unit4;

       { TForm8 }
procedure TForm8.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
closeaction:=cafree;
end;

{$R *.lfm}

end.

