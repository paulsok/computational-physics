unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, TeeProcs, TeEngine, Chart, Grids, StdCtrls, Series;

const
N=10;

type
Nap = array[1..N] of Double;
Mat = array[1..N] of Nap;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Chart1: TChart;
    Series1: TLineSeries;
    Series2: TLineSeries;
    Panel1: TPanel;
    Menu: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Series3: TLineSeries;
    StringGrid2: TStringGrid;
    Label6: TLabel;
    StringGrid3: TStringGrid;
    Button3: TButton;
    Button4: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Form1: TForm1;
  X,Y:array[1..N] of real;
  i,j,k,br,u:integer;
  l,mor,t:double;


implementation

{$R *.dfm}
procedure Smenastrok(var a: mat; const i,j:integer);  //процедура смены строк местами
  var s:integer;
      t:real;
  Begin
   For s:=1 to 3 do     //для массива начиная с 1-го элемента 1 строки до конца строки
    begin              //меняем местами строки
     t:=a[i,s];
     a[i,s]:=a[j,s];
     a[j,s]:=t;
    end;
  end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 StringGrid1.cells[0,0]:='X';
 StringGrid1.cells[1,0]:='Y';

 stringGrid1.cells[0,1]:= '1';
 stringGrid1.cells[0,2]:= '2';
 stringGrid1.cells[0,3]:= '3';
 stringGrid1.cells[0,4]:= '4';
 stringGrid1.cells[0,5]:= '5';
 stringGrid1.cells[0,6]:= '6';
 stringGrid1.cells[0,7]:= '7';
 stringGrid1.cells[0,8]:= '8';
 stringGrid1.cells[0,9]:= '9';
 stringGrid1.cells[0,10]:= '10';

 stringGrid1.cells[1,1]:= '1';
 stringGrid1.cells[1,2]:= '4';
 stringGrid1.cells[1,3]:= '9';
 stringGrid1.cells[1,4]:= '16';
 stringGrid1.cells[1,5]:= '25';
 stringGrid1.cells[1,6]:= '36';
 stringGrid1.cells[1,7]:= '49';
 stringGrid1.cells[1,8]:= '64';
 stringGrid1.cells[1,9]:= '81';
 stringGrid1.cells[1,10]:= '100';

 for j := 1 to N do
  begin
  for i:=0 to N-1 do
    begin
      x[i+1]:=strtofloat(stringGrid1.cells[0,i+1]);
      y[i+1]:=strtofloat(stringGrid1.cells[1,i+1]);
      Series1.AddXY(X[j],Y[j])
    end;
  end;

end;

procedure TForm1.Button1Click(Sender: TObject);
var sum,sum1,sum2,sum3,sum4,sum5,sum6:real;
A,B,a0,b0,w :real;

begin
 sum1:=0;
 sum2:=0;
 sum3:=0;
 sum4:=0;
 sum6:=0;

 for j := 1 to N do
  begin
      Series1.AddXY(X[j],Y[j])
  end;

 for i:=1 to N do
  begin
   sum1:=sum1+x[i];
   sum2:=sum2+y[i];
   sum3:=sum3+x[i]*y[i];
   sum4:=sum4+x[i]*x[i];
   sum6:=sum6+sqr(y[i]);
  end;

 {Линейное приближение}

 sum5:=N*sum4-sum1*sum1;
 a0:=(N*sum3-sum1*sum2)/sum5;
 b0:=(sum2*sum4-sum1*sum3)/sum5;
 t:=(x[N]-x[1])/100;
 w:=x[1];
 for i:=1 to 101 do
  begin
   series2.AddXY(w,a0*w+b0);
   w:=w+t;
  end;
 sum:=sum6/(N-2)-(sum2*sum2+a0*a0*sum5)/(N*(N-2));
 A:=sqrt(sqr(sum)/sum5);
 B:=sqrt(sum4*sqr(sum)/sum5);
 Label3.Caption:=floattostr(A);
 Label5.Caption:=floattostr(B);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
Form1.Close
end;


procedure TForm1.Button3Click(Sender: TObject);
var summ0,summ1,summ2,summ3,summ4,summ5,summ6:real;
 a: Mat;
 b,p: Nap;
 arg:real;

begin
 summ0:=0;
 summ1:=0;
 summ2:=0;
 summ3:=0;
 summ4:=0;
 summ5:=0;
 summ6:=0;
u:=3;

 for j := 1 to N do
  begin
      Series1.AddXY(X[j],Y[j])
  end;

 for i := 1 to N do
    begin
   summ0:=summ0+x[i];
   summ1:=summ1+sqr(x[i]);
   summ2:=summ2+(sqr(x[i])*x[i]);
   summ3:=summ3+sqr(x[i])*sqr(x[i]);
   summ4:=summ4+y[i];
   summ5:=summ5+x[i]*y[i];
   summ6:=summ6+sqr(x[i])*y[i];
  end;

 StringGrid2.Cells[0, 0]:= FloatToStr(10);
 StringGrid2.Cells[0, 1]:= FloatToStr(summ2);
 StringGrid2.Cells[0, 2]:= FloatToStr(summ1);

 StringGrid2.Cells[1, 0]:= FloatToStr(summ2);
 StringGrid2.Cells[1, 1]:= FloatToStr(summ1);
 StringGrid2.Cells[1, 2]:= FloatToStr(summ2);

 StringGrid2.Cells[2, 0]:= FloatToStr(summ1);
 StringGrid2.Cells[2, 1]:= FloatToStr(summ2);
 StringGrid2.Cells[2, 2]:= FloatToStr(summ3);

 StringGrid3.Cells[0, 0]:= FloatToStr(summ4);
 StringGrid3.Cells[0, 1]:= FloatToStr(summ5);
 StringGrid3.Cells[0, 2]:= FloatToStr(summ6);

 br:=0;
  for j := 0 to u - 1 do                   // массив начиная с первого номера для строки и
    for i := 0 to u - 1 do                 //коллонны
    a[i + 1, j + 1] := StrToFloatDef(StringGrid2.Cells[j, i], 0);
      for i := 0 to u - 1 do
      b[i + 1] := StrToFloatDef(StringGrid3.Cells[0, i], 0);
        for i:=1 to u-1 do
          for j:=i+1 to u do
            begin         //выполняем прямой ход метода Гауса
              a[j,i]:=-a[j,i]/a[i,i];   //делим строку(взятую с противоположным знаком)
                for k:=i+1 to u do      //на выбранный вед. эл. a[i,i] далее
                a[j,k]:=a[j,k]+a[j,i]*a[i,k];//к последующей строке прибавляем предыдущую
                b[j]:=b[j]+a[j,i]*b[i]       // для каждого элемента в строке j
            end;
if a[j,i]=0 then    //проверка если ведущий элемент равен нулю
begin
for j:=i+1 to u do
If a[j,i]<>0 then   // если нашлась строка с ненулевым новым ведущим элементом
    begin
      SmenaStrok(a,i,j);  //меняем эту строку-перемещаем наверх
       br:=1;             //установка флага
        break;
    end;
   If br=1 then         // в зависимости от флага
      i:=i+1;           //переход к следующему диагональному ведущему элементу
end;
p[u]:=b[u]/a[u,u];      // обратный ход Гаусса нач. с вычисления последнего корня Хn
  for i:=u-1 downto 1 do   //используя пред. знач. Хn
begin
  l:=b[i];
  for j:=i+1 to u do l:=l-p[j]*a[i,j];  ///вычисляем оставшиеся корни системы
  p[i]:=l/a[i,i];
end;
arg:=0;
for i:=1 to 100 do
  begin
   series3.AddXY(arg,p[1]+p[2]*arg+p[3]*sqr(arg));
   arg:=arg+t;
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
Series1.Clear;
Series2.Clear;
Series3.Clear;
end;

end.
