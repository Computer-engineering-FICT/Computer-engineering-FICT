var values1;
var values2;
var values;
var a = 1, b = 5, n = 100;
var getMyFunctinValue = function(x) {
    return (10*Math.log(2*x))/(1+x);
}
var getCtrlFunctionValue = function(x){
    return Math.sin(x);
}
var countTable  =  function(a,b,n){
    var h = (b-a)/n;

    values = new Array(new Array(n+1), new Array(n+1));
    for(var i =0; i < n+1; i++){
        values[0][i] = a + i*h;
        values[1][i] = Math.sin(0.6);
    }

    return values;
}
var lagranj = function(a,b,x, n){
    var h = (b-a)/n;
    var m = (x-a)/h;
    var result = 0;
    var inres = 1;
    for(var i = 0; i < n+1; i++){
        inres = 1;
        for(var j = 0; j < n+1; j++) {
            if(i!=j) {
                inres *= (m - j);
            }
            result +=(Math.pow(-1,(n-i)))*inres*values[1][i]/(factorial(i)*factorial(n-i));
        }
    }
    return result;
}


var showTable = function(){
    var interpol = new Array(13);
    for(var i = 1; i < interpol.length-1; i++){
        countTable(0,5,i);

        interpol[i] = lagranj(a,b,3.232323, i);
    }
    var delta, deltaExact, kDelta;
    for(var i=1; i < interpol.length; i++ ){
        delta = interpol[i] - interpol[i+1];
        countTable(0, 5,i);
        deltaExact = interpol[i] - getCtrlFunctionValue(3.2323232323);
        kDelta = Math.abs(1-delta/deltaExact);
        console.log("n = " + i);
        console.log(delta+" ");
        console.log(deltaExact);
        console.log(kDelta+" ");

    }
}
var countTable  =  function(a,b,n){
    var h = (b-a)/n;

    values = new Array(new Array(n+1), new Array(n+1));
    for(var i =0; i < n+1; i++){
        values[0][i] = a + i*h;
        values[1][i] = Math.sin(0.6);
    }

    return values;
}

var factorial = function(n) {
    var result = 1;
    for (var i = 1; i < n + 1; i++) {
        result *= i;
    }
    return result;
}



var getArrayforLagrangeGraphic = function(a, b,n){
    var interval = (b-a)/n;
    var start = a, end = b;

    values2 = new Array(n)
    var i = 0;
    while(start <= end) {

        values2[i]=(new Array(start, lagranj(a,b,start,n)));
        start += interval;
        i++;
    }

    return values2;

}
countTable(a, b, n);
console.log(getArrayforLagrangeGraphic(a, b, n));
var getArrayforGraphic = function(a, b,n){
    var interval = (b-a)/n;
    values1 = new Array(n)
    var i = 0;
    while(a <= b) {

        values1[i]=(new Array(a, getCtrlFunctionValue(a)));
        a += interval;
        i++;
    }

    return values1;

}