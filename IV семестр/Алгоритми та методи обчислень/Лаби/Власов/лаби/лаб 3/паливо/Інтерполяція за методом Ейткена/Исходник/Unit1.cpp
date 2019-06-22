//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit1.h"
#include "Unit2.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm1 *Form1;
float X[16],Y[16];//масиви вузл≥в
int n=2;//початкове значенн€ к≥лькост≥ вузл≥в

       //функц≥€- ≥нтерпол€ц≥йний многочлен Ћагранжа
       // (обчислюЇтьс€ ≥терац≥йно - за методом ≈йткена) 
float L(float x,float X[100],float Y[100],int n,int m1,int m2)
{
    if(n==(m2-m1+1))
    {
        if(n==2)
        {
           float y=( Y[m1]*(X[m2]-x)-(X[m1]-x)*Y[m2] )/(X[m2]-X[m1]);
           return y;
         }
         if(n>2)
         {
            float y=( L(x,X,Y,n-1,m1,m2-1)*(X[m2]-x)-
                      L(x,X,Y,n-1,m1+1,m2)*(X[m1]-x) )/(X[m2]-X[m1]);
            return y;
          }            
    }
}

//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
     //¬их≥д
void __fastcall TForm1::N6Click(TObject *Sender)
{
   Form1->Close();        
}
//---------------------------------------------------------------------------
     //при активац≥њ форми
void __fastcall TForm1::FormActivate(TObject *Sender)
{
    StringGrid1->Cells[0][0]="  X";
    StringGrid1->Cells[0][1]="  Y";

}
//---------------------------------------------------------------------------
        //зм≥на к≥лькост≥ вузл≥в
void __fastcall TForm1::UpDown1Click(TObject *Sender, TUDBtnType Button)
{
    StringGrid1->ColCount=UpDown1->Position+1;
    n=UpDown1->Position;
}
//---------------------------------------------------------------------------
          //натисненн€ клав≥ш≥ на клав≥атур≥
void __fastcall TForm1::StringGrid1KeyPress(TObject *Sender, char &Key)
{
  if(Key==13) //клав≥ша ENTER
  {
     Series1->Clear();
     Series2->Clear();
     for(int i=0;i<n;i++)
        if(StringGrid1->Cells[i][0]!="")
           if(StringGrid1->Cells[i][1]!="")
             {     //заповнюЇмо масиви вузл≥в
                X[i]=StrToFloat(StringGrid1->Cells[i+1][0]);
                Y[i]=StrToFloat(StringGrid1->Cells[i+1][1]);
             }

     for(int i=0;i<n;i++)
       Series1->AddXY(X[i],Y[i]);//виводимо вузли

     float a=StrToFloat(StringGrid1->Cells[1][0]);//л≥ва границ€
     float b=StrToFloat(StringGrid1->Cells[n][0]);//права границ€
     float d=(b-a)/200;  //крок виводу граф≥ку
     for(int i=0;i<200;i++)//виводимо ≥нтерпол€ц≥йний многочлен
        Series2->AddXY(a+d*i,L(a+d*i,X,Y,n,0,n-1));

  }

}
//---------------------------------------------------------------------------
        //збереженн€ граф≥ку у файл
void __fastcall TForm1::N2Click(TObject *Sender)
{
    if(SavePictureDialog1->Execute())
         Chart1->SaveToBitmapFile(SavePictureDialog1->FileName+".bmp");
}
//---------------------------------------------------------------------------
       //показати дов≥дку
void __fastcall TForm1::N4Click(TObject *Sender)
{
   Form2->ShowModal();        
}
//---------------------------------------------------------------------------

