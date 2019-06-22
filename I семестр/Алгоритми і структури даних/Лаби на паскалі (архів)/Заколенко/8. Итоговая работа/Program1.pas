Program MyMatrix;
  Uses Lab8;
  var
    n:Tindex;
    A,B:Matrix;
    X,X1:Tarray;
    Myfile:text;
  begin
    InputMatrix(n,A);
    OutputMatrix(n,A);
    WriteMatrix(MyFile,A,n);
    ResetMatrix(MyFile,B,n);
    Vektor(B,X,n);
    OutputVektor(X,n);
    NewVektor(X,X1,n);
    OutputVektor(X,n);
  end.