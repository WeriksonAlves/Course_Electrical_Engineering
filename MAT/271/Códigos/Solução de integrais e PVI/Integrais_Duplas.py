import numpy as np
from sympy import * #var, Lambda, exp, log, sin, cos, tan, sqrt, ln
from math import inf
from fractions import Fraction

x,y = var('x y')

class Sol_Int2:
    def __init__(self, num, den, Fx, a, b, c, d, n, e):
        self.Fx = Fx
        self.num = num
        self.den = den
        self.a = float(a)
        self.b = float(b)
        self.c = float(c)
        self.d = float(d)
        self.n = n
        self.e = e
        print('\n Após as definições temos a seguinte função:')
        display(Integral(Integral(cos(x+y),(y,a,b)),(x,c,d)))
        
        self.h = self.b - self.a
        self.h1 = self.h/self.n
        
        #Cria o vetor com os valores de x a serem usados
        self.vetor_y = [a]
        for i in range(self.n):
            self.vetor_y.append(self.vetor_y[i] + self.h1)
        print('\n O vetor y é: ',self.vetor_y)
        print('Primeiro é preciso resolver a integral ')
        display(Integral(cos(x+y),(y,self.a,self.b)))
        