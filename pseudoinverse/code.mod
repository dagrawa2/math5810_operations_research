# Pseudoinverse

/* Model  Section */

set N;

param A{i in N, j in N};
param I{i in N, j in N};

var X{i in N, j in N};
var mu{i in N, j in N};
var nu;

/* Minimize ||I - AX||_infty */

minimize Z:
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

/*

set N := 1 2 3 4;

param I: 1 2 3 4 :=
1 1 0 0 0
2 0 1 0 0
3 0 0 1 0
4 0 0 0 1;

param A: 1 2 3 4 :=
1 1 2 3 4
2 2 3 4 5
3 3 4 5 6
4 4 5 6 7;

*/

set N := 1 2;

param I: 1 2 :=
1 1 0
2 0 1;

param A: 1 2 :=
1 1 2
2 2 4;

end;