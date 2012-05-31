unit Unit5;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,FileUtil, BGRALabelFX, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, StdCtrls;

type

  { TForm5 }

  TForm5 = class(TForm)
    BGRALabelFX1: TBGRALabelFX;
    BGRALabelFX2: TBGRALabelFX;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Memo1: TMemo;
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.lfm}

{ TForm5 }

procedure TForm5.Button2Click(Sender: TObject);
begin
  form5.Close;
end;

procedure TForm5.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  halt;
  closeaction:=cafree;
end;

end.

