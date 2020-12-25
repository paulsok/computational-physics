unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, TeeProcs, TeEngine, Chart, Grids, StdCtrls, Series,
  Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Chart1: TChart;
    Button2: TButton;
    Edit1: TEdit;
    Series2: TLineSeries;
    Series3: TLineSeries;
    Series4: TLineSeries;
    Series5: TLineSeries;
    Series6: TLineSeries;
    Series7: TLineSeries;
    Series8: TLineSeries;
    Series9: TLineSeries;
    Series10: TLineSeries;
    Series11: TLineSeries;
    Series12: TLineSeries;
    Series13: TLineSeries;
    Label1: TLabel;
    Button1: TButton;
    Label2: TLabel;
    Button3: TButton;
    Panel1: TPanel;
    Button4: TButton;
    Label3: TLabel;
    Series1: TPointSeries;
    Label4: TLabel;
    procedure Proizv(deg,k,a,nn:integer;var Q:real);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    function  Sxem(xx:real;a,p:integer):real;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
const
 n=8;
var
  Form1: TForm1;
  x,y:array[0..N] of real;
  i,a,t,k,p:integer;

implementation

{$R *.dfm}


procedure TForm1.FormCreate(Sender: TObject);
begin
 StringGrid1.cells[0,0]:='Xn';
 StringGrid1.cells[1,0]:='Yn';

 StringGrid1.cells[0,1]:='14';
 StringGrid1.cells[0,2]:='24';
 StringGrid1.cells[0,3]:='64';
 StringGrid1.cells[0,4]:='80';
 StringGrid1.cells[0,5]:='102';
 StringGrid1.cells[0,6]:='120';
 StringGrid1.cells[0,7]:='130';
 StringGrid1.cells[0,8]:='150';
 StringGrid1.cells[0,9]:='180';

 StringGrid1.cells[1,1]:='1';
 StringGrid1.cells[1,2]:='4';
 StringGrid1.cells[1,3]:='9';
 StringGrid1.cells[1,4]:='16';
 StringGrid1.cells[1,5]:='25';
 StringGrid1.cells[1,6]:='36';
 StringGrid1.cells[1,7]:='49';
 StringGrid1.cells[1,8]:='64';
 StringGrid1.cells[1,9]:='81';

 For i:=0 to N do
   begin
    X[i]:=strtofloat(stringGrid1.cells[0,i+1]);
    Y[i]:=strtofloat(stringGrid1.cells[1,i+1]);
    Series1.AddXY(X[i],Y[i])
   end;

end;

procedure TForm1.Button1Click(Sender: TObject);
 begin
 Form1.Close;
 end;

procedure TForm1.Proizv(deg,k,a,nn:integer;var Q:real);
 var
  A1,A2:real;
 begin
  If k>0 then
    Begin
     A1:=0;
     A2:=0;
     Proizv(deg,k-1,a,nn,A1);
     Proizv(deg,k-1,a,nn+1,A2);
     Q:=(A2-A1)/(X[a+nn+k]-X[a+nn]);
    end
   else  Q:=Y[a+nn];
 end;


function TForm1.Sxem(xx:real;a,p:integer):real;
 var
  B,Di:real; i:integer;
 begin
  Proizv(p,p,a,0,B);
  For i:=p-1 downto 0 do
   begin
    Proizv(p,i,a,0,Di);
    B:=B*(xx-x[a+i])+Di
   end;
  Sxem:=B;
 end;

procedure TForm1.Button2Click(Sender: TObject);
 var h,vv:real;
 begin
  p:=strtoint(edit1.Text);
  h:=(X[N]-X[0])/100;
  a:=0;
  vv:=x[0];
  For i:=1 to 101 do
   begin
    vv:=x[0]+(i-1)*h;
    If (vv>=x[a+1]) and (a+p<N) then a:=a+1;
    chart1.series[p].addxy(vv,Sxem(vv,a,p),'',RGB(round(255*p/N),round(255*(1-p/N)/(1-1/N)),round(255*(1-p/N)/(1-1/N))));

   end;
end;


procedure TForm1.Button3Click(Sender: TObject);
begin
series1.Clear;
series2.Clear;
series3.Clear;
series4.Clear;
series5.Clear;
series6.Clear;
series7.Clear;
series8.Clear;
series9.Clear;
series10.Clear;
series11.Clear;
series12.Clear;
series13.Clear;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
For i:=0 to N do
   begin
    X[i]:=strtofloat(stringGrid1.cells[0,i+1]);
    Y[i]:=strtofloat(stringGrid1.cells[1,i+1]);
    Series1.AddXY(X[i],Y[i])
   end;
end;

end.
