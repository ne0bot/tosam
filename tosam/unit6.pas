unit Unit6;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil,windows, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type

  { TForm6 }

  TForm6 = class(TForm)
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Image1: TImage;
    Label1: TLabel;
    texto_weblazarus: TLabel;
    textoiconos: TLabel;
    texto_webiconos: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    textolicencia: TLabel;
    weblicencia: TLabel;
    texto_lazarus: TLabel;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure texto_weblazarusClick(Sender: TObject);
    procedure texto_webiconosClick(Sender: TObject);
    procedure weblicenciaClick(Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.lfm}

{ TForm6 }

procedure TForm6.texto_weblazarusClick(Sender: TObject);
begin
  shellexecute(self.Handle,nil,pchar(texto_weblazarus.Caption),nil,nil,sw_shownormal);
end;

procedure TForm6.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  closeaction:=cafree;
end;

procedure TForm6.texto_webiconosClick(Sender: TObject);
begin
  shellexecute(self.Handle,nil,pchar(texto_webiconos.Caption),nil,nil,sw_shownormal);
end;

procedure TForm6.weblicenciaClick(Sender: TObject);
begin
  ShellExecute(self.Handle,nil,pchar(weblicencia.Caption),nil,nil,sw_shownormal);
end;

end.

