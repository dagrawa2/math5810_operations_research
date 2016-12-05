# Pseudoinverse

/* Model  Section */

param n;  # dimension of matrix A
set N := 1..n;

param A{i in N, j in N};  # matrix whose pseudoinverse is desired

param I{i in N, j in N} :=  # identity matrix
if i=j then
1
else
0;

var X{i in N, j in N};  # pseudoinverse of A
var mu{i in N, j in N};
var nu;

minimize Z:  # minimize ||I-AX||_infty
nu;

s.t. C1{i in N, j in N}:
I[i,j] - sum{k in N} A[i,k]*X[k,j] <= mu[i,j];

s.t. C2{i in N, j in N}:
-I[i,j] + sum{k in N} A[i,k]*X[k,j] <= mu[i,j];

s.t. C3{i in N}:
sum{j in N} mu[i,j] <= nu;

solve;

for {i in N}{
printf{j in N}: "%5g  ", X[i,j];
printf "\n";
}

data;

param n := 4;

param A:
1 2 3 4 :=
1 1 2 3 4
2 2 3 4 5
3 3 4 5 6
4 4 5 6 7;

end;