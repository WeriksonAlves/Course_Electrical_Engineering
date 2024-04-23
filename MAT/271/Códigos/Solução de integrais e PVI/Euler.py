import numpy as np
from sympy import * #var, Lambda, exp, log, sin, cos, tan, sqrt, ln
from math import inf
from fractions import Fraction

x,y = var('x y')

class Sol_Q:
    def __init__(self, num, den, Fx, x0, y0, b, n, e):
        self.num = num
        self.den = den
        self.Fx = Fx
        self.x0 = x0
        self.y0 = y0
        self.b = b
        self.n = n
        self.e = e
        print('\n Após as definições temos a seguinte função:')
        display(Fx(x,y))
    #.....................................................................................................................................   
    def Runge_Kutta_Ordem_UM(self):
        print('\n..........Método de Euler Ordem 1..........\n')
        
        self.h = (self.b - self.x0)/self.n
        print('\n h = ',self.h)
        
        #Cria o vetor com os valores de x a serem usados
        vetor_x = np.zeros((self.n+1))
        vetor_x[0] = self.x0
        for i in range(1, self.n+1):
            vetor_x[i] = vetor_x[i-1] + self.h
        #print('\n O vetor x é: ',vetor_x)
        
        #Cria o vetor com os valores de Aproximações da solução
        vetor_A = np.zeros((self.n+1))
        vetor_A[0] = self.y0
        for i in range(1, self.n+1):
            vetor_A[i] = vetor_A[i-1] + self.h*self.Fx(vetor_x[i-1],vetor_A[i-1])
        #print('\n O vetor de aproximações é: ',vetor_A)
        
        for j in range(0,self.n+1):
            print('\n y[%1.4f' %vetor_x[j],'] é : %9.6f' %vetor_A[j]) 
        
        self.Erro(vetor_x,vetor_A)
    #.....................................................................................................................................   
    def Erro(self, vetor_x, vetor_A):
        vetor_Dx2 = np.zeros((self.n+1))
        Dx2 = Lambda((x,y), diff(self.Fx(x,y),(x)))
        
        for i in range(0,self.n+1):
            vetor_Dx2[i] = Dx2(vetor_x[i],vetor_A[i])
        maximo = max(vetor_Dx2)
        
        erro = abs(((self.h**2)/2)*maximo)
        
        if (erro < self.e):
            print('\n Portanto, temos que o erro absoluto é: \n |E| = %1.5f' %erro,' < ', self.e )
        
        elif (erro > self.e):
            print('\n Portanto, temos que: \n |E1| < %1.5f' %erro)
            if (self.h < 10**(-4)):
                print('\n O h se tornou muito pequeno, diminua o número de subintervalos')
            else:
                print('\n Para uma melhor aproximação aumente o número de subintervalos')
    #.....................................................................................................................................   
    def Runge_Kutta_Ordem_Dois(self):
        print('\n..........Método de Euler Ordem 2..........\n')
        
        self.h = (self.b - self.x0)/self.n
        print('\n h = ',self.h)
        
        #Cria o vetor com os valores de x a serem usados
        vetor_x = np.zeros((self.n+1))
        vetor_x[0] = self.x0
        for i in range(1, self.n+1):
            vetor_x[i] = vetor_x[i-1] + self.h
        #print('\n O vetor x é: ',vetor_x)
        
        #Cria o vetor com os valores de Aproximações da solução
        vetor_A = np.zeros((self.n+1))
        vetor_A[0] = self.y0
        for i in range(1, self.n+1):
            K1 = self.Fx(vetor_x[i-1],vetor_A[i-1])
            K2 = self.Fx( (vetor_x[i-1]+self.h), (vetor_A[i-1]+self.h*K1) )
            vetor_A[i] = vetor_A[i-1] + (self.h/2)*(K1 + K2)
        #print('\n O vetor de aproximações é: ',vetor_A)
        
        for j in range(0,self.n+1):
            print('\n y[%1.4f' %vetor_x[j],'] é : %9.6f' %vetor_A[j]) 
        
        self.Erro(vetor_x,vetor_A)
    #.....................................................................................................................................  
    def Runge_Kutta_Ordem_Tres(self):
        print('\n..........Método de Euler Ordem 3..........\n')
        
        self.h = (self.b - self.x0)/self.n
        print('\n h = ',self.h)
        
        #Cria o vetor com os valores de x a serem usados
        vetor_x = np.zeros((self.n+1))
        vetor_x[0] = self.x0
        for i in range(1, self.n+1):
            vetor_x[i] = vetor_x[i-1] + self.h
        print('\n O vetor x é: ',vetor_x)
        
        #Cria o vetor com os valores de Aproximações da solução
        vetor_A = np.zeros((self.n+1))
        vetor_A[0] = self.y0
        for i in range(1, self.n+1):
            K1 = self.Fx(vetor_x[i-1],vetor_A[i-1])
            K2 = self.Fx( (vetor_x[i-1] + self.h/2), (vetor_A[i-1] + (self.h/2)*K1) )
            K3 = self.Fx( (vetor_x[i-1] + 3*self.h/4), (vetor_A[i-1] + (3*self.h/4)*K2) )
            vetor_A[i] = vetor_A[i-1] + (self.h/9)*(2*K1 + 3*K2 + 4*K3)
        #print('\n O vetor de aproximações é: ',vetor_A)
        
        for j in range(0,self.n+1):
            print('\n y[%1.4f' %vetor_x[j],'] é : %9.6f' %vetor_A[j])
        
        self.Erro(vetor_x,vetor_A)
    #.....................................................................................................................................   
    def Runge_Kutta_Ordem_Quatro(self):
        print('\n..........Método de Euler Ordem 4..........\n')
        
        self.h = (self.b - self.x0)/self.n
        print('\n h = ',self.h)
        
        #Cria o vetor com os valores de x a serem usados
        vetor_x = np.zeros((self.n+1))
        vetor_x[0] = self.x0
        for i in range(1, self.n+1):
            vetor_x[i] = vetor_x[i-1] + self.h
        print('\n O vetor x é: ',vetor_x)
        
        #Cria o vetor com os valores de Aproximações da solução
        vetor_A = np.zeros((self.n+1))
        vetor_A[0] = self.y0
        for i in range(1, self.n+1):
            K1 = self.Fx(vetor_x[i-1],vetor_A[i-1])
            K2 = self.Fx( (vetor_x[i-1] + self.h/2), (vetor_A[i-1] + (self.h/2)*K1) )
            K3 = self.Fx( (vetor_x[i-1] + self.h/2), (vetor_A[i-1] + (self.h/2)*K2) )
            K4 = self.Fx( (vetor_x[i-1] + self.h  ), (vetor_A[i-1] + (self.h)*K3  ) )
            vetor_A[i] = vetor_A[i-1] + (self.h/6)*(1*K1 + 2*K2 + 2*K3 + 1*K4)
        #print('\n O vetor de aproximações é: ',vetor_A)
        
        for j in range(0,self.n+1):
            print('\n y[%1.4f' %vetor_x[j],'] é : %9.6f' %vetor_A[j])
        
        self.Erro(vetor_x,vetor_A)
    #.....................................................................................................................................