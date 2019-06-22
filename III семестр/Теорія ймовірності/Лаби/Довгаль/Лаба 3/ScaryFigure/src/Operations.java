public class Operations {

    static double calcTrap(double r, MyFunction func){

        double currentStep=0, square=0, step=Main.delta;
        for (;square<r;currentStep+=step) square+= (func.doOperation(currentStep)+func.doOperation(currentStep+step))/2*step;
        return currentStep;
    }

    static double afterFunc(double currentX, double y){
        double result=0;
        MyFunction currentFunc;
        PhiX phiX= new PhiX();

        if (y>=0&&y<=currentX){
            currentFunc= new FirstFunc();
            result= currentFunc.doOperation(currentX)/phiX.doOperation(currentX);
        }else if (y>currentX&&y<=Main.a){
            currentFunc= new SecondFunc();
            result= currentFunc.doOperation(y)/phiX.doOperation(currentX);
        }

        return result;
    }

    static double matWaiting(double[] argMas){

        double sum=0;
        for (int i=0;i<argMas.length;i++) sum+=argMas[i];
        return sum/argMas.length;
    }

    static double dispersion(double[] argMas, double matW){

        double sum=0;
        for (int i=0;i<argMas.length;i++) sum+=Math.pow(argMas[i]-matW,2);
        return sum/argMas.length;
    }

    static double covariation(double[] xMas, double[] yMas, double matWx, double matWy){

        double sum=0;
        for (int i=0;i<xMas.length;i++) sum+=(xMas[i]-matWx)*(yMas[i]-matWy);
        return sum/xMas.length;
    }

    static double correlNum(double cov, double xSigma, double ySigma){
        return cov/(xSigma*ySigma);
    }

}
