double b=2, a[3]={5,7,499};
unsigned n=3;
do{if(b)break;
b+=a[n];}while(--n);
for(n=0;n<3;n++)b*=a[n];
while(n--)b+=a[n];
n=a[2]>b&&n!=1;
