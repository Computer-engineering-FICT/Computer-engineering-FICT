'use strict';

// Declare app level module which depends on views, and components
var values;

var a = 1, b = 5, n = 10;
var getMyFunctinValue = function(x) {
  return (10*Math.log(2*x))/(1+x);
}
var getCtrlFunctionValue = function(x){
  return Math.sin(x);
}

var lagranj = function(a,b,x,n){
  var h = (b-a)/n;
  var m = (x-a)/h;
  var result = 0;
  var inres = 1;
  for(var i = 0; i < values.length; i++){
    inres = 1;
    for(var j = 0; j < values.length; j++) {
      if(i!=j) {
        inres *= (m - j);
      }
      result +=(Math.pow(-1,(n-i)))*inres*values[i][1]/(factorial(i)*factorial(n-i));
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
  console.log(values);
return values;
}

var factorial = function(n) {
  var result = 1;
  for (var i = 1; i < n + 1; i++) {
    result *= i;
  }
  return result;
}

countTable(0,5,10);
showTable();
