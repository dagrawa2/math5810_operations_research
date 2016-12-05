from cvxopt.modeling import variable, op
from numpy import *

def Pseudoinverse(A):
	n = size(A, 0)
	I = zeros((n,n))
	for i in range(n):
		I[i,i] = 1
	X = variable(n**2)
	mu = variable(n**2)
	nu = variable()
	C = []
	for i in range(n):
		for j in range(n):
			C.append( (I[i,j]-sum(A[i,k]*X[n*k+j] for k in range(n)) <= mu[n*i+j]) )
			C.append( (-I[i,j]+sum(A[i,k]*X[n*k+j] for k in range(n)) <= mu[n*i+j]) )
	for i in range(n):
		C.append( (sum(mu[n*i+j] for j in range(n)) <= nu) )
	op(nu, [C[0]]).solve()
	return X.value

A = matrix([[1,2],[2,5]])
B = Pseudoinverse(A)
print B


print C[2]