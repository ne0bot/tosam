unit Unit7;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,FileUtil,inifiles, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Menus;

type

  { TForm7 }

  TForm7 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Memo1: TMemo;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    PopupMenu1: TPopupMenu;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form7: TForm7;

implementation
       uses unit1;
{$R *.lfm}

{ TForm7 }

procedure TForm7.FormCreate(Sender: TObject);
begin { TODO 4 -o    no -cjm : falta escribir el proceso de cargar de archivo }
  form7.Color:=form1.Color;
  label1.Font.Color:=fcolor;
  confg:=tinifile.Create(rutavar+'\confg.ini');
  memo1.Color:=stringtocolor(confg.readString('visor de fragmentos','color','clDefault'));
  memo1.Font.Name:=confg.readString('visor de fragmentos','letra','courier new');
  memo1.Font.Color:=stringtocolor(confg.readString('visor de fragmentos','color letra','cldefault'));
  memo1.Font.Height:=confg.readInteger('visor de fragmentos','tamaño letra',0);
  memo1.Font.CharSet:=confg.readInteger('visor de fragmentos','charset',1);
  memo1.Font.Style:=form1.StrToStyle(confg.readString('visor de fragmentos','estilo letra','FFFF'));
  confg.Free;
end;

procedure TForm7.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  closeaction:=cafree;
end;

end.

