import numpy as np
from sympy import Matrix

class SisLin:

    def __init__(self, A, B = [0, 0, 0]):
        self.A = np.array(A, dtype = float)
        self.B = np.array(B, dtype = float)
        self.L = None
        self.U = None

    def verifyLU(self):
        m, n = self.A.shape
        for i in range(1, m+1):
            print(f'Minimo quadrado da matriz A_{i}{i}: ',
                  np.round(np.linalg.det(self.A[:i,:i]), 4))
        
    
    def LU(self):
        U = np.copy(self.A)
        L = np.zeros(np.shape(self.A))
        pivot = []
        m,n = U.shape
        for i in range(n-1):
            for j in range(i+1, n):
                if U[i,i] == 0:
                    print('Existe elemento nulo na diagonal principal!')
                    break
                ml = U[j,i]/U[i,i]
                U[j,:] = U[j,:] - ml*U[i,:]
                pivot.append(ml)
                
        pivot = np.array(pivot)
        
        for i in range(n-1):
            for j in range(i+1, n):
                L[j,i] = pivot[0]
                pivot = np.delete(pivot, 0)
        
        for i in range(n):
            for j in range(n):
                if i == j:
                    L[i,j] = 1
        Ldf = Matrix(L)
        Udf = Matrix(U)
        self.L = L
        self.U = U


        print('*' * 14,'Matriz L', '*' * 14 ,'\n')

        display(Ldf)

        
        print('*' * 14,'Matriz U', '*' * 14 ,'\n')

        display(Udf)

        


    def goit(self):
        L = np.copy(self.L)
        B = np.copy(self.B).T
        m, n = self.L.shape
        k = 1
        for i in range(m - 1):
            for j in range(k, n):
                c = L[i][i] / L[j][i]
                L[j] = (L[i] - c * L[j])
                B[j] = (B[i] - c * B[j])
            k += 1

        Y = self.solution(L, B).T
        print('Vetor Y:', Y[0])
        X = self.solution(self.U, Y)
        print('Vetor X:', X.T[0])
        
        
        #return X

    def solution(self, l , y):
        L = np.copy(l)
        Y = np.copy(y).T
        m, n = L.shape
        X = np.zeros((1, len(Y))).T
        k = n - 2
        X[len(Y) - 1] = Y[-1] / L[-1][-1]
        
        for i in range(m-2, -1, -1):
            X[i] = ((Y[i:] - L[i][i+1:].dot(X[i+1:])) / L[i][i])[0]
            
        return X
        

    def Jacobi_Richardson(self, e = 0.1, c = 4, X0 = [0, 0, 0], lim = 50):
        a = np.copy(self.A)
        b = np.copy(self.B).T
        X = np.zeros(b.shape)
        X_aux = np.array(X0, dtype = float)
        m, n = a.shape
        N = 0
        
        k = 1
        
        for j in range(m):
            X[j] = b[j] / a[j,j]
            X[j] -= np.sum(np.delete(X_aux, j) * (np.array([np.delete(a[j], j)]) / (a[j,j])))
        print(f'x_{k}: ', np.round(X, c))
        
        while np.linalg.norm(X - X_aux) > e and N < lim:
            X_aux = np.copy(X)
            for j in range(m):
                X[j] = b[j] / a[j,j]
                X[j] -= np.sum(np.delete(X_aux, j) * (np.array([np.delete(a[j], j)]) / (a[j,j])))
            k += 1
            N += 1
            print(f'x_{k}: ', np.round(X, c))

    def verify_JR(self):
        m, n = self.A.shape
        B = []
        for i in range(m):
            B_aux = np.sum(np.absolute(np.delete(self.A[i], i) / self.A[i,i]))
            B.append(B_aux)
            if B_aux >= 1:
                print('Não há garantia de convergencia pelo método de Jacobi-'
                      'Richardson.')
                return print(f'B_{i+1} = {B[i]:.4f}')
            
        print('Há garantia de convergencia pelo método de Jacobi-Richardson')
        return print('B = ', B)

    def verify_GS(self):
        m, n = self.A.shape
        B = np.ones((1, m))
        for i in range(m):
            B[0][i] = np.sum(np.absolute(np.delete(self.A[i], i) / self.A[i,i] * np.delete(B, i)))
            if B[0][i] >= 1:
                print('Não há garantia de convergencia pelo método de Gauss-'
                      'Seidel.')
                return print(f'B_{i+1} = {B[0][i]:.4f}')
        print('Há garantia de convergencia pelo método de Gauss-Seidel')
        return print(f'B = ', B[0])


    def Gauss_Seidel(self, e = 0.1, c = 4, X0 = [0, 0, 0], lim = 50):
        a = np.copy(self.A)
        b = np.copy(self.B).T
        X = np.array(X0, dtype = float)
        X_ant = np.copy(X)
        m, n = a.shape
        k = 1
        N = 0
        
        for j in range(m):
            X[j] = b[j] / a[j,j]
            X[j] -= np.sum(np.delete(X, j) * (np.array([np.delete(a[j], j)]) / (a[j,j])))
        print(f'x_{k}: ', np.round(X, c))
            
        while np.linalg.norm(X - X_ant) > e and N < lim:
            X_ant = np.copy(X)
            for j in range(m):
                X[j] = b[j] / a[j,j]
                X[j] -= np.sum(np.delete(X, j) * (np.array([np.delete(a[j], j)]) / (a[j,j])))
            k += 1
            N += 1
            print(f'x_{k}: ', np.round(X, c))
            