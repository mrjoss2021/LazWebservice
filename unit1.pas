unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ComCtrls,
  ExtCtrls, StdCtrls, Grids,  Buttons, DBGrids,  db,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    IdHTTP1: TIdHTTP;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    Panel1: TPanel;
    StringGrid1: TStringGrid;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure StringGrid1Click(Sender: TObject);
  private
    procedure Json2Grid(Source:string;grid:tstringgrid);
    function MemoryStreamToString(M: TMemoryStream): string;
    { private declarations }
  public
    { public declarations }
  end;
 const

 // URL_WS = 'http://lazindo.com/index.php';

    URL_WS = 'http://localhost/webservice/esupplier.php';

var
  Form1: TForm1;
  http: TIdHTTP;
  PostData:TStringList;
  respon:widestring;
  sdatabase,suser,spass:string;
implementation

{$R *.lfm}

function TForm1.MemoryStreamToString(M: TMemoryStream): string;
begin
  M.Seek(0,soFromBeginning);
  SetString(Result, PAnsiChar(M.Memory), M.Size);
end;


procedure TForm1.BitBtn1Click(Sender: TObject);

begin
   PostData.Clear;
       memo2.Lines.clear;
  try
    PostData.Add('database='+sdatabase);
    PostData.Add('user='+suser);
    PostData.Add('password='+spass);
    PostData.Add('tab=tsupplier ');
    PostData.Add('job=0');
   respon:=http.post(URL_WS, PostData);
   memo2.Lines.text:=respon;
   respon:=copy(respon,length('Selamat Datang Di WebService Semar IDE')+1,length(respon));
   respon:=trim(respon);
   json2grid(respon,stringgrid1);
  finally
  end;

end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  memo2.Lines.clear;
  PostData.clear;
  try
    PostData.Add('database='+sdatabase);
    PostData.Add('user='+suser);
    PostData.Add('password='+spass);
    PostData.Add('tab=tsupplier');
    PostData.Add('job=1');
    {
    $kodesup=$_POST['kodesup'];
    $nama=$_POST['nama'];
    $alamat=$_POST['alamat'];
    $telepon=$_POST['telepon'];
    $perusahaan=$_POST['perusahaan'];
    }
    PostData.Add('kodesup='+Edit1.text);
    PostData.Add('nama='+Edit2.text);
    PostData.Add('alamat='+Edit3.text);
    PostData.Add('telepon='+Edit4.text);
    PostData.Add('perusahaan='+Edit5.text);
    memo1.Lines.Text:=PostData.Text;
    respon:=http.post(URL_WS, PostData);
    memo2.Lines.Add(respon);
  finally
  end;

end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
    PostData.clear;
        memo2.Lines.clear;
  try
    PostData.Add('database='+sdatabase);
    PostData.Add('user='+suser);
    PostData.Add('password='+spass);
    PostData.Add('tab=tsupplier');
    PostData.Add('job=2');
  {  PostData.Add('x1='+Edit1.text);
    PostData.Add('x2='+Edit2.text);
    PostData.Add('x3='+Edit3.text);
    PostData.Add('x4='+Edit4.text);
    PostData.Add('x5='+Edit5.text); }
    PostData.Add('kodesup='+Edit1.text);
    PostData.Add('nama='+Edit2.text);
    PostData.Add('alamat='+Edit3.text);
    PostData.Add('telepon='+Edit4.text);
    PostData.Add('perusahaan='+Edit5.text);
    respon:=http.post(URL_WS, PostData);
    memo2.Lines.Add(respon);
  finally
  end;

end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
    PostData.clear;
    memo2.Lines.clear;
  try
    PostData.Add('database='+sdatabase);
    PostData.Add('user='+suser);
    PostData.Add('password='+spass);
    PostData.Add('tab=tsupplier');
    PostData.Add('job=3');
    {
    PostData.Add('x1='+Edit1.text);
    PostData.Add('x2='+Edit2.text);
    PostData.Add('x3='+Edit3.text);
    PostData.Add('x4='+Edit4.text);
    PostData.Add('x5='+Edit5.text);
    }
    PostData.Add('kodesup='+Edit1.text);
    PostData.Add('nama='+Edit2.text);
    PostData.Add('alamat='+Edit3.text);
    PostData.Add('telepon='+Edit4.text);
    PostData.Add('perusahaan='+Edit5.text);
    respon:=http.post(URL_WS, PostData);
    memo2.Lines.Add(respon);
  finally
  end;

end;

procedure TForm1.Button1Click(Sender: TObject);
begin

  memo2.Lines.clear;
  PostData.clear;
  try
    PostData.Add('database='+sdatabase);
    PostData.Add('user='+suser);
    PostData.Add('password='+spass);
    PostData.Add('tab=tcustomer');
    PostData.Add('job=1');
    PostData.Add('x1='+Edit1.text);
    PostData.Add('x2='+Edit2.text);
    PostData.Add('x3='+Edit3.text);
    PostData.Add('x4='+Edit4.text);
    PostData.Add('x5='+Edit5.text);
    respon:=http.post(URL_WS, PostData);
    memo2.Lines.Add(respon);
  finally
  end;

end;

procedure TForm1.Button2Click(Sender: TObject);

begin
// IdHTTP1.Get(URL_WS,stream);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  http:=TIdHTTP.Create(self);
  with http do
  begin
    ReadTimeout := 0;
    AllowCookies := True;
    ProxyParams.BasicAuthentication := False;
    ProxyParams.ProxyPort := 0;
    Request.ContentLength := -1;
    Request.ContentRangeEnd := 0;
    Request.ContentRangeStart := 0;
    Request.ContentType := 'text/html';
    Request.Accept := 'text/html, */*';
    Request.BasicAuthentication := False;
    Request.UserAgent := 'Mozilla/3.0 (compatible; Indy Library)';
    HTTPOptions := [hoForceEncodeParams];
  end;

  PostData := TStringList.Create;

  sdatabase:='webservice';
  suser:='root';
  spass:='';

end;

procedure TForm1.StringGrid1Click(Sender: TObject);
var y:integer;
begin
  y:=stringgrid1.Row;
  Edit1.Text:=stringgrid1.cells[1,y];
  Edit2.Text:=stringgrid1.cells[2,y];
  Edit3.Text:=stringgrid1.cells[3,y];
  Edit4.Text:=stringgrid1.cells[4,y];
  Edit5.Text:=stringgrid1.cells[5,y];

end;



procedure TForm1.Json2Grid(Source:string;grid:tstringgrid);
function explode(separator, a: String) :TStringList;
var
  i : Integer;
  item : String;
begin
  result := TStringList.Create();

  i := pos(separator, a);
  while i > 0 do begin
    item := copy(a, 0, i-1);
    item := trim(item);
    result.Add(item);
    a := copy(a, i+length(separator), length(a));
    i := pos(separator, a);
  end;
  if a <> '' then
    result.Add(trim(a));
end;
var s:string;
sfield:string;
sdata:string;
stsource,stheader,stdata,par,shasil:tstringlist;
x,y,a,b:integer;
begin
    stsource:=tstringlist.Create;
    stheader:=tstringlist.Create;
    stdata:=tstringlist.Create;
    par:=tstringlist.Create;
    shasil:=tstringlist.Create;

    stsource.Text:=source;
      if (pos('column',stsource.Text)<0) or (pos('],"records":',stsource.Text)<0 ) then
      begin
      showmessage('invalid json text');
      exit;
      end;
  stheader.Text:=copy(stsource.Text,12,pos('],"records":',stsource.Text)-12);
  stdata.Text:=copy(stsource.Text,pos('],"records":',stsource.Text)+14,length(stsource.Text));
  stdata.Text:=copy(stdata.Text,1,pos(']]}',stdata.Text));
  shasil.Clear;
  shasil.AddStrings(explode('],',stdata.Text));
  stdata.clear;
  stdata.Text:=stringreplace(shasil.Text,']','',[rfReplaceAll]);
  stdata.Text:=stringreplace(stdata.Text,'[','',[rfReplaceAll]);
  par.Clear;
  par.AddStrings(explode(',',stheader.Text));
  x:=par.Count;
  y:=stdata.Count;
  grid.ColCount:=x+1;
  grid.rowCount:=y+1;
  for a:=0 to x-1 do
  begin
    for b:=0 to y-1 do
    begin
    grid.Cells[a,b]:='';
    end;
  end;
   grid.Cells[0,0]:='NO.';

  par.Clear;
  par.AddStrings(explode('",',stheader.Text));
    for a:=0 to x-1 do grid.Cells[a+1,0]:=trim(stringreplace(par.ValueFromIndex[a],'"','',[rfReplaceAll]));

    for b:=0 to y-1 do
    begin
  grid.Cells[0,b+1]:=inttostr(b+1);
  par.Clear;
   par.AddStrings(explode('",',stdata.ValueFromIndex[b]));
    for a:=0 to x-1 do grid.Cells[a+1,b+1]:=trim(stringreplace(par.ValueFromIndex[a],'"','',[rfReplaceAll]));
    end;
    grid.AutoSizeColumns;
 stsource.Free;
stheader.Free;
stdata.Free;
par.Free;
shasil.Free;
end;


end.

