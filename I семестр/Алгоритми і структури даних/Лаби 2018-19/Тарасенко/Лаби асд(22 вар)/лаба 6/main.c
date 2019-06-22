
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int a[10][10];

void swap(int nlines, int ncol) {
    int c;
    c=a[nlines][ncol];
    a[nlines][ncol]=a[nlines][ncol-1];
    a[nlines][ncol-1]=c;
}

int binSearch(int i, int j){
    if (a[i][j]<=a[i][j-1])
        return j;
    int left = 0;
    int right = j;
    int key=a[i][j];
    //printf("key=%d\n",key);
    int mid;
    while (left <= right){
        mid = (left + right) / 2;
        //printf("mid=%d\n",mid);
        if (key > a[i][mid])
            right = mid-1;
        else
            left = mid+1;
        //printf("left=%d ",left);
        //printf("right=%d\n",right);
    }
    if (left == right)
        return left;
    else
        return left;
}

int main()
{
    int n,m,z;
    scanf("%d",&n);
    scanf("%d",&m);
    srand(time(NULL));
    for (int i=0;i<n;i++){
        for (int j=0;j<m;j++){
            a[i][j]=rand()%90+10;
            printf("%d ",a[i][j]);
        }
        printf("\n");
    }
    printf("\n");
    for (int i=0;i<n;i++){
        for (int j=1;j<m;j++){
            z=binSearch(i,j);
            //printf("z%d=%d\n",j,z);
            int l=j;
            for (;l>z;l--){
                swap(i,l);
            }
            /*for (int i=0;i<n;i++){
                for (int j=0;j<m;j++){
                    //printf("%d ",a[i][j]);
                }
               // printf("\n");
            }*/
        }
    }
    for (int i=0;i<n;i++){
        for (int j=0;j<m;j++){
            printf("%d ",a[i][j]);
        }
        printf("\n");
    }
    return 0;
}
