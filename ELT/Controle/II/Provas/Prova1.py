from sympy import * 
from tbcontrol.symbolic import routh

s, K = var('s K')

import numpy as np
import matplotlib.pyplot as plt
import control as ct
import sympy

class Prova_1:
    def __init__(self, nG, dG, nH, dH):
        self.G = ct.tf(nG,dG)
        self.H = ct.tf(nH,dH)
        self.F = ct.feedback(self.G, self.H)
        
        self.nG = nG
        self.dG = dG
        self.nH = nH
        self.dH = dH
        
        display('A função de malha aberta é: ', self.G)
        display('A retroalimentação é: ', self.H)
        display('A função de malha fechada é: ', self.F)
        
    def LR(self):
        self.ng = 0
        if (len(self.nG) == 1):
            self.ng = K * self.nG[0]
        else:
            for i in range(len(self.nG),0,-1):
                self.ng += self.nG[-i]* (s**(i-1))
            self.ng = self.ng * K
        self.dg = 0
        for i in range(len(self.dG),0,-1):
            self.dg += self.dG[-i]* (s**(i-1))
        
        self.nh = 0
        for i in range(len(self.nH),0,-1):
            self.nh += self.nH[-i]* (s**(i-1))
        self.dh = 0
        for i in range(len(self.dH),0,-1):
            self.dh += self.dH[-i]* (s**(i-1))
        
        self.g = self.ng/self.dg # G_s    
        self.h = self.nh/self.dh # H_s
        self.f = sympy.cancel(self.g/(1 + self.g*self.h)) # F_s
        
        # FT malha aberta
        C_s = K
        P_s = self.g
        G_s = (C_s*P_s)
        print("Malha aberta G(s)= {}".format(G_s))
        
        # FT malha fechada
        H_s = self.h;
        F_s = sympy.cancel((G_s)/(1+G_s*H_s))
        print("Malha fechada F(s)= {}".format(F_s)) 
        
        #obtem o denominador da FT malha fechada
        num_F_s, den_F_s = sympy.fraction(F_s)
        print('\n Para que a solução seja estável "s" deve ser menor que zero, logo: ')
        #tabela de routh
        tab_routh=routh(sympy.poly(den_F_s,s))
        K_estab=sympy.cancel(sympy.solve([e > 0 for e in tab_routh[:, 0]], K))
        sympy.pprint("\n O sistema é estável se: {}".format(K_estab))
        print(" \nTabela de Routh:")
        display(routh(sympy.poly(den_F_s,s)))
        plt(ct.root_locus(self.G))
        
    def Avanco(self, Mp = None, Wn = None, Kp = None, csi = None):
        teste = 1
        

        