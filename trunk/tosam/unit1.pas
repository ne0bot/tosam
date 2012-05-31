unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil,inifiles, ueled, Forms, Controls, Graphics, Dialogs, ComCtrls, StdCtrls,
  Buttons, ExtCtrls, ShellCtrls, Menus, EditBtn, FileCtrl;

type

  { TForm1 }

  TForm1 = class(TForm)
    Bevel1: TBevel;
    boton_acerca: TBitBtn;
    boton_ayuda: TBitBtn;
    boton_config: TBitBtn;
    boton_anadirunidad: TBitBtn;
    boton_exportar: TBitBtn;
    boton_vercodigo: TBitBtn;
    boton_anadirfragmento: TBitBtn;
    boton_eliminarfragmento: TBitBtn;
    boton_verfragmento: TBitBtn;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    FilterComboBox1: TFilterComboBox;
    ImageList1: TImageList;
    ImageList2: TImageList;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem20: TMenuItem;
    MenuItem21: TMenuItem;
    MenuItem22: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    opendia: TOpenDialog;
    PageControl1: TPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
    poplist: TPopupMenu;
    lista: TShellListView;
    popmemo: TPopupMenu;
    poptree: TPopupMenu;
    popanulador: TPopupMenu;
    popmemo2: TPopupMenu;
    tab_fragmentos: TTabSheet;
    tab_unidades: TTabSheet;
    TreeView1: TTreeView;
    uELED1: TuELED;
    uELED2: TuELED;
    procedure boton_acercaClick(Sender: TObject);
    procedure boton_configClick(Sender: TObject);
    procedure boton_anadirunidadClick(Sender: TObject);
    procedure boton_verfragmentoClick(Sender: TObject);
    procedure boton_vercodigoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure errores(sender:tobject;e:exception);
    procedure actualizar;
    procedure listaSelectItem(Sender: TObject; Item: TListItem;Selected: Boolean);
    function StyleToStr(Style: TFontStyles): String;
    function StrToStyle(Str: String): TFontStyles;
    function crear_id (nombre :string) : string;
    function crear_descripcion(ruta:string):boolean;
  private

  public

  end;
var //variables globales
  Form1: TForm1;
  fcolor:tcolor;
  confg:tinifile;
  rutabunid:string;
  rutavar:string;
  general:string;
  archivo:textfile;
implementation

{$R *.lfm}
uses Unit2,Unit3,Unit4,unit5,unit6,unit7,Unit9;

procedure tform1.actualizar;
begin
  lista.Root:='';
  lista.Root:=edit3.Text;
  edit1.Text:='';
  edit5.Text:='';
  memo1.Text:='';
end;

procedure TForm1.listaSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
var //ppid:pointer;
  s:string;
begin //en construccción
  if item.Selected then
  begin       { TODO 12 -o no aun -cjames : aqui quedaste si es que no te suicidas por esa mierda de moscas en los ojos }
    //ppid:=nil;
    confg:=tinifile.Create(rutavar+'\confg.ini');
    edit1.Text:= item.Caption;
    s:=confg.ReadString('unidades',edit1.Text,'bb');
   // getmem(ppid,length(edit1.text)+2);
    //string(ppid^):= confg.ReadString('unidades',edit1.text,'bb');
    showmessage( s);//string(ppid^));
    //freemem(ppid);
    confg.Free;
  end;
end;

function tform1.crear_descripcion(ruta:string):boolean;
begin
  if ruta <>'' then
  begin
    try
    assignfile(archivo,ruta);
    rewrite(archivo);
    try
    writeln(archivo,'escriba aquí la descripción');
    finally
    closefile(archivo);
    end;
    except
      crear_descripcion:=false;
      exit;
    end;
    crear_descripcion:=true;
  end
  else crear_descripcion:=false;
end;

function tform1.crear_id (nombre :string) : string; //crear id  ciclo perfecto
var i,s,g,d:integer;
begin
if nombre <>'' then //como un relojito suizo
  begin
  g:=0;//el mecanismo es hermoso
  randomize;
  for i := 0 to length (nombre)-1 do
     begin
     s:= ord(nombre[i]);
     d := s*2;
     g:=g+d;
     end;
  s:= random(g)+random(560);
  crear_id := inttostr(s)+nombre[ random(length(nombre))];
  end;
end;

function tform1.strtostyle(str:string):tfontstyles;
begin
  Result := [];
  {T = true, S = false}
  if Str[1] = 'T' then
    Include(Result, fsBold);
  if Str[2] = 'T' then
    Include(Result, fsItalic);
  if Str[3] = 'T' then
    Include(Result, fsUnderLine);
  if Str[4] = 'T' then
    Include(Result, fsStrikeOut);
end;

function tform1.StyleToStr(style:tfontstyles):string  ;
begin
  SetLength(Result, 4);
  {T = true, S = false 83 is ordinal value of S, if true then S + 1 (84) = T}
  Result[1] := Char(Integer(fsBold In Style) + 83);
  Result[2] := Char(Integer(fsItalic In Style) + 83);
  Result[3] := Char(Integer(fsUnderline In Style) + 83);
  Result[4] := Char(Integer(fsStrikeOut In Style) + 83);
  {replace all S to F's if you like}
  Result := StringReplace(Result, 'S', 'F', [rfReplaceAll]);
end;

procedure tform1.errores(sender:tobject;e:exception);
begin
   application.CreateForm(tform5,form5);
   form5.showmodal;
end;



procedure TForm1.FormCreate(Sender: TObject);
begin
  application.OnException:=@errores;//primero la seguridad!!!
  rutavar:=getenvironmentvariable('localappdata')+'\jcode';
  rutabunid:=rutavar+'\unidades';
  if not directoryexists(rutavar) then
  begin
    if forcedirectories(rutavar)=false then
    begin
    showmessage('es imposible crear la ruta de trabajo');
    halt;{ TODO 3 -ono -cjimmy : falta desarrollar una solucion mas eficiente }
    end;
  end;
  if not fileexists(rutavar+'\confg.ini') then
  begin //configuraciones predeterminadas
    confg:=tinifile.Create(rutavar+'\confg.ini');
    confg.writestring('prog','color',colortostring(form1.Color));
    confg.WriteString('prog','textos',colortostring(clblack));
    confg.WriteString('visor de unidades','synmemo','clWhite');
    confg.WriteString('visor de unidades','comentarios','clnone');
    confg.WriteString('visor de unidades','palabras reservadas','clNone');
    confg.WriteString('visor de unidades','cadenas','clnone');
    confg.WriteString('visor de unidades','simbolos','clnone');
    confg.WriteString('visor de unidades','numeros','clnone');
    confg.WriteString('visor de unidades','normal','clnone');
    confg.WriteString('visor de unidades','letra','Courier New');
    confg.Writestring('visor de unidades','color de letra','cldefault');
    confg.WriteInteger('visor de unidades','charset',1);
    confg.Writestring('visor de unidades','estilo de letra','FFFF');
    confg.WriteInteger('visor de unidades','tamaño letra',-13);
    confg.WriteString('visor de fragmentos','color','clDefault');
    confg.WriteString('visor de fragmentos','letra','courier new');
    confg.WriteString('visor de fragmentos','color letra','cldefault') ;
    confg.WriteInteger('visor de fragmentos','tamaño letra',0);
    confg.WriteInteger('visor de fragmentos','charset',1);
    confg.WriteString('visor de fragmentos','estilo letra','FFFF');
    confg.WriteString('ruta baul unidades','ruta',rutabunid);
    confg.WriteString('ruta baul fragmentos','ruta',rutabunid);
    confg.WriteString('unidades','test 0','xxxx');
    confg.WriteString('fragmentos','test 1','xxxx');
    confg.Free;
  end;
  confg:=tinifile.Create(rutavar+'\confg.ini');
  form1.Color:=stringtocolor(confg.ReadString('prog','color','clsilver'));
  edit2.Text:=confg.ReadString('ruta baul fragmentos','ruta',rutabunid);
  edit3.Text:=confg.ReadString('ruta baul unidades','ruta',rutabunid);
  fcolor:= stringtocolor(confg.ReadString('prog','textos','clblack'));
  label1.Font.Color:=fcolor;
  confg.Free;
  lista.Root:=edit3.Text;
  if not directoryexists(edit2.Text) then
  begin
    if forcedirectories(edit2.Text)=false then
    begin
      showmessage('es imposible acceder a la ruta actual del baul de unidades, por favor seleccione otra');
      application.CreateForm(tform9,form9);//configuración especial
      form9.ShowModal;
      exit;
    end;
  end;
  if not directoryexists(edit3.Text) then
  begin
    if forcedirectories(edit3.Text)=false then
    begin
      showmessage('es imposible acceder a la ruta del baul de fragmentos, por favor seleccione otra');
      application.CreateForm(tform9,form9);
      form9.ShowModal;
      exit;
    end;
  end;
end;

procedure TForm1.boton_anadirunidadClick(Sender: TObject);
var
  nombre,id:string;
begin   { TODO 10 -o  aun no -cjimmy : estas trabajando en este procedimiento}
  nombre:='';//hay que ser explicitos.
  if opendia.Execute=true then
  begin  //comprobaciones por precaución!!!
    if fileutil.FileExistsUTF8(opendia.FileName)=false then
    begin//primer filtro
      showmessage('no se ha podido encontrar el archivo de origen, si la carpeta contenedora tiene un nombre con simbolos especiales mueva el archivo e intentelo nuevamente.');
      exit;
    end;
    if directoryexists(edit3.Text)=false then
    begin//segundo filtro
      if forcedirectories(edit3.text)=false then
      begin
        showmessage('la ruta del baul no pudo ser creada por favor seleccione otra en el panel de configuraciones');
        exit;
      end;
    end;
    nombre:=extractfilename(opendia.FileName);
    if fileexists(edit3.Text+'\'+nombre)=true then
    begin//tercer filtro
      if inputquery('el nombre de archivo ya existe','renombrelo por favor',false,nombre) then
      begin
        if nombre=extractfilename(opendia.FileName) then
        begin
          showmessage('no le cambio el nombre al archivo,intentelo nuevamente');
          nombre:='';
          exit;
        end
        else
        begin
        if extractfileext(nombre)<>'.pas' then nombre:=nombre+'.pas';
        end;
      end
      else
      begin
        nombre:='';
        exit;
      end;
    end;

    if copyfile(opendia.FileName,edit3.Text+'\'+nombre)=true then
    begin
      id:=crear_id(nombre);
      if crear_descripcion(edit3.Text+'\'+id)=true then
      begin
        confg:=tinifile.Create(rutavar+'\confg.ini');
        confg.WriteString('unidades',nombre,id);
        confg.WriteString('autor',id,'desconocido');
        confg.Free;
        actualizar;
      end
      else
      begin
        deletefile(edit3.Text+'\'+nombre);
        showmessage('perdon pero no se ha podido crear el fichero de descripción del archivo seleccionado,intentelo con otro archivo y si el problema persiste  reportelo como error para poder solucionarlo.');
      end;
    end
    else
    begin
    showmessage('no se pudo copiar el archivo al baul,revise sus permisos de escritura e intentelo nuevamente ');
    exit;
    end;
  end;
end;

procedure TForm1.boton_verfragmentoClick(Sender: TObject);
begin
  application.CreateForm(tform7,form7);
  form7.Show;
end;

procedure TForm1.boton_vercodigoClick(Sender: TObject);
begin
  application.CreateForm(tform2,form2) ;
  form2.Show;
end;

procedure TForm1.boton_configClick(Sender: TObject);
begin
  application.CreateForm(tform4,form4);
  form4.show;
end;

procedure TForm1.boton_acercaClick(Sender: TObject);
begin
  application.CreateForm(tform6,form6);
  form6.ShowModal;
end;

end.

