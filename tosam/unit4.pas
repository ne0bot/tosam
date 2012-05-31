unit Unit4;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, SynMemo,SynHighlighterPas, TplShapesUnit,
  Forms, Controls, Graphics, Dialogs, StdCtrls, inifiles, EditBtn,
  Buttons, ExtCtrls;

type

  { TForm4 }

  TForm4 = class(TForm)
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    boton_cancelar: TBitBtn;
    boton_aceptar: TBitBtn;
    BitBtn5: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    CheckBox1: TCheckBox;
    boton_colorprograma: TColorButton;
    boton_colorvisorunid: TColorButton;
    boton_colorcoment: TColorButton;
    boton_colorpalabrasre: TColorButton;
    boton_colorcadenas: TColorButton;
    boton_colorsimbolos: TColorButton;
    boton_colornumeros: TColorButton;
    boton_colorvisorf: TColorButton;
    boton_colortextos: TColorButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    FontDialog1: TFontDialog;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Memo1: TMemo;
    plRoundRectShape1: TplRoundRectShape;
    syn: TSynFreePascalSyn;
    SynMemo1: TSynMemo;
    procedure boton_cancelarClick(Sender: TObject);
    procedure boton_aceptarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
    procedure boton_colorvisorunidColorChanged(Sender: TObject);
    procedure boton_colorcomentColorChanged(Sender: TObject);
    procedure boton_colorpalabrasreColorChanged(Sender: TObject);
    procedure boton_colorcadenasColorChanged(Sender: TObject);
    procedure boton_colorsimbolosColorChanged(Sender: TObject);
    procedure boton_colornumerosColorChanged(Sender: TObject);
    procedure boton_colorvisorfColorChanged(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form4: TForm4;
implementation
       uses unit1,Unit8;
{$R *.lfm}

{ TForm4 }
procedure TForm4.FormCreate(Sender: TObject);
begin  //asignar coonfiguraciones personalizadas
  confg:=tinifile.Create(rutavar+'\confg.ini');
  boton_colorprograma.ButtonColor:=form1.Color;
  boton_colortextos.ButtonColor:=fcolor;
  boton_colorvisorf.ButtonColor:=stringtocolor(confg.ReadString('visor de fragmentos','color','clwhite'));
  boton_colorvisorunid.ButtonColor:=stringtocolor(confg.ReadString('visor de unidades','synmemo','clwhite'));
  boton_colorcoment.ButtonColor:=stringtocolor(confg.ReadString('visor de unidades','comentarios','clnone'));
  boton_colorpalabrasre.ButtonColor:=stringtocolor(confg.ReadString('visor de unidades','palabras reservadas','clnone'));
  boton_colorcadenas.ButtonColor:=stringtocolor(confg.ReadString('visor de unidades','cadenas','clnone'));
  boton_colorsimbolos.ButtonColor:=stringtocolor(confg.ReadString('visor de unidades','simbolos','clnone'));
  boton_colornumeros.ButtonColor:=stringtocolor(confg.ReadString('visor de unidades','numeros','clnone'));
  memo1.Color:= boton_colorvisorf.ButtonColor;
  memo1.Font.Name:=confg.ReadString('visor de fragmentos','letra','courier new');
  memo1.Font.Height:=confg.ReadInteger('visor de fragmentos','tamaño letra',0);
  memo1.Font.Color:=stringtocolor(confg.ReadString('visor de fragmentos','color letra','cldefault'));
  memo1.Font.Style:=form1.StrToStyle(confg.ReadString('visor de fragmentos','estilo letra','FFFF'));
  memo1.Font.CharSet:=confg.ReadInteger('visor de fragmentos','charset',1);
  synmemo1.Color:=boton_colorvisorunid.ButtonColor;
  synmemo1.Font.Name:=confg.ReadString('visor de unidades','letra','courier new');
  synmemo1.Font.CharSet:=confg.ReadInteger('visor de unidades','charset',1);
  synmemo1.Font.Height:=confg.ReadInteger('visor de unidades','tamaño letra',-13);
  synmemo1.Font.Color:=stringtocolor(confg.ReadString('visor de unidades','color de letra','cldefault'));
  synmemo1.Font.Style:=form1.StrToStyle(confg.ReadString('visor de unidades','estilo de letra','FFFF'));
  synmemo1.Gutter.LineNumberPart().MarkupInfo.Background:=synmemo1.Color;
  syn.CommentAttri.Foreground:= boton_colorcoment.ButtonColor;
  syn.KeyAttri.Foreground:=boton_colorpalabrasre.ButtonColor;
  syn.StringAttri.Foreground:=boton_colorcadenas.ButtonColor;
  syn.SymbolAttri.Foreground:= boton_colorsimbolos.ButtonColor;
  syn.NumberAttri.Foreground:=boton_colornumeros.ButtonColor;
  form4.Color:=form1.Color;
  label1.Font.Color:=fcolor;
  label2.Font.Color:=fcolor;
  checkbox1.Font.Color:=fcolor;
  label3.Font.Color:=fcolor;
  label10.Font.Color:=fcolor;
  label14.Font.Color:=fcolor;
  label11.Font.Color:=fcolor;
  label13.Font.Color:=fcolor;
  label4.Font.Color:=fcolor;
  label5.Font.Color:=fcolor;
  label6.Font.Color:=fcolor;
  label7.Font.Color:=fcolor;
  label8.Font.Color:=fcolor;
  label9.font.Color:=fcolor;
  label12.Font.Color:=fcolor;
  edit3.Text:=confg.ReadString('ruta baul unidades','ruta',rutabunid);
  edit4.Text:=confg.ReadString('ruta baul fragmentos','ruta',rutabunid);
  edit1.Text:=memo1.Font.Name;
  edit2.Text:=synmemo1.Font.Name;
  confg.Free;
  if edit3.Text = edit4.Text then checkbox1.Checked:=true;
end;

procedure TForm4.boton_cancelarClick(Sender: TObject);
begin
  form4.Close;
  form4.FreeOnRelease;
end;

procedure TForm4.boton_aceptarClick(Sender: TObject);
begin
  confg:= tinifile.Create(rutavar+'\confg.ini');
  if form4.Color<>boton_colorprograma.ButtonColor then
  confg.WriteString('prog','color',colortostring(boton_colorprograma.ButtonColor));
  if fcolor<>boton_colortextos.ButtonColor then
  confg.WriteString('prog','textos',colortostring(boton_colortextos.ButtonColor));
  confg.WriteString('visor de unidades','synmemo',colortostring(boton_colorvisorunid.ButtonColor));
  confg.WriteString('visor de unidades','comentarios',colortostring(boton_colorcoment.ButtonColor));
  confg.WriteString('visor de unidades','palabras reservadas',colortostring(boton_colorpalabrasre.ButtonColor));
  confg.WriteString('visor de unidades','cadenas',colortostring(boton_colorcadenas.ButtonColor));
  confg.WriteString('visor de unidades','simbolos',colortostring(boton_colorsimbolos.ButtonColor));
  confg.WriteString('visor de unidades','numeros',colortostring(boton_colornumeros.ButtonColor));
  //confg.WriteString('visor de unidades','normal','clnone');
  confg.WriteString('visor de unidades','letra',synmemo1.Font.Name);
  confg.Writestring('visor de unidades','color de letra',colortostring(synmemo1.Font.Color));
  confg.WriteInteger('visor de unidades','charset',synmemo1.Font.CharSet);
  confg.Writestring('visor de unidades','estilo de letra',form1.StyleToStr(synmemo1.Font.Style));
  confg.WriteInteger('visor de unidades','tamaño letra',synmemo1.Font.Height);
  confg.WriteString('visor de fragmentos','color',colortostring(memo1.Color));
  confg.WriteString('visor de fragmentos','letra',memo1.Font.Name);
  confg.WriteString('visor de fragmentos','color letra',colortostring(memo1.Font.Color));
  confg.WriteInteger('visor de fragmentos','tamaño letra',memo1.Font.Height);
  confg.WriteInteger('visor de fragmentos','charset',memo1.Font.CharSet);
  confg.WriteString('visor de fragmentos','estilo letra',form1.StyleToStr(memo1.Font.Style));
  confg.WriteString('ruta baul unidades','ruta',edit3.Text);
  confg.WriteString('ruta baul fragmentos','ruta',edit4.Text);
  confg.Free;
  form1.Color:=boton_colorprograma.ButtonColor;
  fcolor:=boton_colortextos.ButtonColor;
  form1.Label1.Font.Color:=fcolor;
  form4.Close;
end;

procedure TForm4.Button1Click(Sender: TObject);
begin
  if fontdialog1.Execute= true then
  begin
    memo1.Font.Name:=fontdialog1.Font.Name;
    memo1.Font.Height:=fontdialog1.Font.Height;
    memo1.Font.Color:=fontdialog1.Font.Color;
    memo1.Font.CharSet:=fontdialog1.Font.CharSet;
    memo1.Font.Style:=fontdialog1.Font.Style;
    edit1.Text:=memo1.Font.Name;
  end;
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
  if fontdialog1.Execute=true then
  begin
    synmemo1.Font.Name:=fontdialog1.Font.Name;
    synmemo1.Font.Height:=fontdialog1.Font.Height;
    synmemo1.Font.Color:=fontdialog1.Font.Color;
    synmemo1.Font.CharSet:=fontdialog1.Font.CharSet;
    synmemo1.Font.Style:=fontdialog1.Font.Style;
    edit2.Text:=synmemo1.Font.Name;
  end;
end;

procedure TForm4.CheckBox1Change(Sender: TObject);
begin
  if checkbox1.Checked=false then
  begin
    edit3.Enabled:=true;
    edit4.Enabled:=true;
    button3.enabled:=true;
    button4.Enabled:=true;
    bitbtn1.Enabled:=true;
    bitbtn2.Enabled:=true;
  end
  else if (checkbox1.Checked=true)and(edit3.Text<>edit4.Text) then
  begin
   application.CreateForm(tform8,form8);
   form8.ShowModal;
  end
  else if (checkbox1.Checked=true)and(edit3.Text =edit4.Text) then
  begin
   edit3.Enabled:=false;
   edit4.Enabled:=false;
   button3.enabled:=false;
   button4.Enabled:=false;
   bitbtn1.Enabled:=false;
   bitbtn2.Enabled:=false;
  end;
end;

procedure TForm4.boton_colorvisorunidColorChanged(Sender: TObject);
begin
  synmemo1.Color:=boton_colorvisorunid.ButtonColor;
  synmemo1.Gutter.LineNumberPart().MarkupInfo.Background:=boton_colorvisorunid.ButtonColor;
end;

procedure TForm4.boton_colorcomentColorChanged(Sender: TObject);
begin
  syn.CommentAttri.Foreground:=boton_colorcoment.ButtonColor;
end;

procedure TForm4.boton_colorpalabrasreColorChanged(Sender: TObject);
begin
  syn.KeyAttri.Foreground:=boton_colorpalabrasre.ButtonColor;
end;

procedure TForm4.boton_colorcadenasColorChanged(Sender: TObject);
begin
  syn.StringAttri.Foreground:=boton_colorcadenas.ButtonColor;
end;

procedure TForm4.boton_colorsimbolosColorChanged(Sender: TObject);
begin
  syn.SymbolAttri.Foreground:=boton_colorsimbolos.ButtonColor;
end;

procedure TForm4.boton_colornumerosColorChanged(Sender: TObject);
begin
  syn.NumberAttri.Foreground:=boton_colornumeros.ButtonColor;
end;

procedure TForm4.boton_colorvisorfColorChanged(Sender: TObject);
begin
  memo1.Color:=boton_colorvisorf.ButtonColor;
end;

procedure TForm4.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin

  closeaction:=cafree;
end;

end.

