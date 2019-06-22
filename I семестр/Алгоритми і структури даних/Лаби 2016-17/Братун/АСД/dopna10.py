n,m=map(int,input().split())
A=[0]*n
for i in range(len(A)):
    A[i]=[0]*m

c=1
k=1
while c<m:
    for j in range (0,m-1):
        A[i][c]=k
        k=k+1

    for j in range(m-1,0):
        A[i][c]=k
        k=k+1
        c=c+1
for i in range(len(A)):
               print(' '.join(map(str,(A[i]))))
