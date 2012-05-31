unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,FileUtil, SynMemo,inifiles, SynHighlighterPas, StrHolder, Forms,
  Controls, Graphics, Dialogs, StdCtrls, Menus;

type

  { TForm2 }

  TForm2 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    popsyn: TPopupMenu;
    syn2: TSynFreePascalSyn;
    SynMemo1: TSynMemo;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Label2Click(Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form2: TForm2;

implementation
   uses unit1;
{$R *.lfm}

{ TForm2 }

procedure TForm2.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  closeaction:=cafree;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  { TODO 4 -ono -cjm : cargar archivo y configuracion personalizada }
  form2.Color:=form1.Color;
  label1.Font.Color:=fcolor;
  label2.Font.Color:=fcolor;
  confg:=tinifile.Create(rutavar+'\confg.ini');
  synmemo1.Color:=stringtocolor(confg.readstring('visor de unidades','synmemo','clWhite'));
  syn2.CommentAttri.Foreground:=stringtocolor(confg.readString('visor de unidades','comentarios','clnone'));
  syn2.KeyAttri.Foreground:=stringtocolor(confg.readString('visor de unidades','palabras reservadas','clNone'));
  syn2.StringAttri.Foreground:=stringtocolor(confg.readString('visor de unidades','cadenas','clnone'));
  syn2.SymbolAttri.Foreground:=stringtocolor(confg.readString('visor de unidades','simbolos','clnone'));
  syn2.NumberAttri.Foreground:=stringtocolor(confg.readString('visor de unidades','numeros','clnone'));
  //confg.readString('visor de unidades','normal','clnone');
  synmemo1.Font.Name:=confg.readString('visor de unidades','letra','Courier New');
  synmemo1.Font.Color:=stringtocolor(confg.readstring('visor de unidades','color de letra','cldefault'));
  synmemo1.Font.CharSet:=confg.readInteger('visor de unidades','charset',1);
  synmemo1.Font.Style:=form1.StrToStyle(confg.readstring('visor de unidades','estilo de letra','FFFF'));
  synmemo1.Font.Height:=confg.readInteger('visor de unidades','tamaño letra',-13);
  synmemo1.Gutter.LineNumberPart().MarkupInfo.Background:=synmemo1.Color;
  confg.Free;

end;

procedure TForm2.Label2Click(Sender: TObject);
begin
  label2.Font.color:=fcolor;
end;

end.

