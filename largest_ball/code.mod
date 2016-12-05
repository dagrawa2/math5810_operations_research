# Largest Ball in a Polyhedron

/* Model  Section */

param m;  # number of hyperplanes defining polyhedron
set M := 1..m;

param n;  # dimension of Euclidean space
set N := 1..n;

param A{i in M, j in N};  # rows are normal vectors to hyperplanes
param b{i in M};  # off-sets of the hyperplanes

var p{i in N};  # center of ball
var r >= 0;  # radius of ball


maximize Z:  # maximize radius
r;

s.t. C{i in M}:  # radius r is in polyhedron
sqrt(sum{j in N} A[i,j]**2)*r + sum{j in N} A[i,j]*p[j] <= b[i];


solve;

printf "Center p =  (";
printf{j in N}: "%5g  ", p[j];
printf ")\n";
printf "\n";
printf "Radius r =  %5g", r;

data;

param m := 4;
param n := 3;

param A:  # the ith row is a_i^T
  1 2 3 :=
1 -5 2 7
2 0 0 -5
3 -0 -1 6
4 5 -1 6;

param b :=  # the ith entry is b_i
1 0
2 0
3 0
4 5;

end;