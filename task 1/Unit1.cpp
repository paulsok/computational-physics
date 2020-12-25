//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit1.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm1 *Form1;

double Lagrange(float* Xk, float* Yk, float X);

float Xk [8], Yk [8];
float Mult, Sum, shag,X;
int i, j, step, a;

//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
 : TForm(Owner)
{
}
//---------------------------------------------------------------------------
double Lagrange(float* Xk, float* Yk, float X)
{
 Sum  = 0;
	for (i = 0; i < 8; ++i) {
		Mult=1;
		for (j = 0; j < 8; ++j) {
			if (i != j) {
			Mult =(X - Xk[j])/(Xk[i] - Xk[j]);
			}
		}
		Sum = Sum + Yk[i] * Mult ;
	}
return Sum;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button4Click(TObject *Sender)
{
  X=0.01;
  for (i = 0; i < 100; i++) {
		Series2 -> AddXY(X,Lagrange(Xk,Yk,X)," ",clBlue);
		X = X +i*shag;
 }
Label2 ->Caption= FloatToStr(shag);
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button1Click(TObject *Sender)
{
Close();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button2Click(TObject *Sender)
{
 for (i = 0, j= 0; i < 8, j < 8; ++i, ++j) {
  Xk[i] = StrToFloat(StringGrid1 -> Cells [i+1] [1]);
  Yk[i] = StrToFloat(StringGrid1 -> Cells [j+1] [2]);
  }
 step = StrToInt(Edit1->Text);
 for (i = 0; i <= 8; ++i) {
  Series1 -> AddXY(Xk[i],Yk[i]," ",clRed);
 }

 for (i = 0; i < 8; i++) {
  shag = ((StrToFloat(StringGrid1 -> Cells [8] [1]))-
  (StrToFloat(StringGrid1 -> Cells [1] [1])))/100;
  }
}
//---------------------------------------------------------------------------
void __fastcall TForm1::FormCreate(TObject *Sender)
{
 StringGrid1->Cells [0] [0] = "�";
 StringGrid1->Cells [0] [1] = "X";
 StringGrid1->Cells [0] [2] = "F(X)";
 for (i = 0; i < StringGrid1->ColCount ;i++) {
 StringGrid1->Cells [i+1] [0] = IntToStr(i+1);}
 Edit1 -> Text = IntToStr(7);

 StringGrid1->Cells [1] [1] = "1";
 StringGrid1->Cells [2] [1] = "2";
 StringGrid1->Cells [3] [1] = "3";
 StringGrid1->Cells [4] [1] = "4";
 StringGrid1->Cells [5] [1] = "5";
 StringGrid1->Cells [6] [1] = "6";
 StringGrid1->Cells [7] [1] = "7";
 StringGrid1->Cells [8] [1] = "8";

 StringGrid1->Cells [1] [2] = "1";
 StringGrid1->Cells [2] [2] = "4";
 StringGrid1->Cells [3] [2] = "9";
 StringGrid1->Cells [4] [2] = "16";
 StringGrid1->Cells [5] [2] = "25";
 StringGrid1->Cells [6] [2] = "36";
 StringGrid1->Cells [7] [2] = "49";
 StringGrid1->Cells [8] [2] = "64";
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button3Click(TObject *Sender)
{
 Series1 -> Clear();
 Series2 -> Clear();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button5Click(TObject *Sender)
{
for(int i = 0; i < StringGrid1->ColCount; i++)
for(int j = 0; j < StringGrid1->RowCount; j++)
StringGrid1->Cells[i+1][j+1] = "";
}

