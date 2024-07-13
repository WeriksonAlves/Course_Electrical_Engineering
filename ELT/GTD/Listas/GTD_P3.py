import numpy as np
from sympy import * #var, Lambda, exp, log, sin, cos, tan, sqrt, ln
from math import inf
import matplotlib.pyplot as plt

class LT:
    def __init__(self, Raio,Distanciamneto,Resistencia,Condutancia,Frequencia,V0,I0,Comprimento,Xinicial,Xfinal):
        self.r = Raio
        self.D = Distanciamneto
        self.R = Resistencia
        self.G = Condutancia
        self.f = Frequencia
        self.V0 = V0
        self.I0 = I0
        self.l = Comprimento
        self.Xi = Xinicial
        self.Xo = Xfinal
    #.....................................................................................................................................   
    def Solução_Grafica(self):
        mi0 = pi*4e-7
        ep0 = (1e-9)/(36*pi)
        L = (mi0/pi)*ln(self.D/(self.r*0.7788))
        C = (pi*ep0)/ln(self.D/self.r)
        
        z = complex(self.R, 2*pi*self.f*L)
        y = complex(self.G, 2*pi*self.f*C)
        
        Zc = complex(sqrt(z/y))
        Gama = complex(sqrt(z*y))
        
        alpha = Gama.real 
        beta = Gama.imag
        
        print('O valor de L é: ',L,' H/m')
        print('O valor de C é: ',C,' F/m')
        print('O valor de z é: ',z,' ohns/m')
        print('O valor de y é: ',y,' S/m')
        print('O valor de Zc é: ',Zc,' ohns')
        print('O valor de Gama é: ',Gama,' 1/m')
        print('O valor de Alpha é: ',alpha)
        print('O valor de Beta é: ',beta,' 1/m')
        
        x = []
        Vx = []
        Ix = []
        Sx = []
        for i in range(self.Xi,self.Xo,1):
            x.append(i)
            
        for a in range(self.Xi,self.Xo,1):
            Vx.append(abs(self.V0*cos(beta*a) - Zc*self.I0*sin(beta*a)*complex(0,1)))
            Ix.append(abs(self.I0*cos(beta*a) - (1/Zc)*self.V0*sin(beta*a)*complex(0,1)))
            Sx.append((self.V0*cos(beta*a) - Zc*self.I0*sin(beta*a)*complex(0,1))*conjugate(self.I0*cos(beta*a) - (1/Zc)*self.V0*sin(beta*a)*complex(0,1)))
        
        plt.plot(x,Vx)
        plt.plot(x,Ix)
        