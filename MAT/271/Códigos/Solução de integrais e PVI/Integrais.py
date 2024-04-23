import numpy as np
from sympy import * #var, Lambda, exp, log, sin, cos, tan, sqrt, ln
from math import inf
from fractions import Fraction

x,y = var('x y')

class Sol_Int:
    def __init__(self, num, den, Fx, a, b, n, e):
        self.Fx = Fx
        self.num = num
        self.den = den
        self.a = float(a)
        self.b = float(b)
        self.n = n
        self.e = e
        print('\n Após as definições temos a seguinte função:')
        display(Integral(Fx(x),(x,a,b)))
    
    def Trapezio(self):
        a = self.a
        b = self.b
        Fx = self.Fx
        n = self.n
        e = self.e
        
        print('..........Método do Trapézio..........')
        h = b - a
        h1 = h/n
        
        #Cria o vetor com os valores de x a serem usados
        vetor_x = [a]
        for i in range(n):
            vetor_x.append(vetor_x[i] + h1)
        print('\n O vetor x é: ',vetor_x)
        
        vetor_improprio, Imp = self.Verifica_Impropria(self.num, self.den, vetor_x)
        
        if (Imp == True):
            print("\n Como existe um elemento improrio, foi aplicado limite no ponto avaliado e substituido na hora de somar")
            S1 = np.zeros((n+1))
            S1[0] = Fx(a)
            S1[n] = Fx(b)
            for j in range(0,n+1):
                if(vetor_improprio[j] != 0):
                    S1[j] = vetor_improprio[j]
                else:
                    if(j > 0 and j < n+1):
                        S1[j] = Fx(vetor_x[j])                        
            S2 = 0
            for i in range(0,n+1):
                if (i > 0 and i < n):
                    S2 += 2*S1[i]
                else:
                    S2 += S1[i]
            print('\n',S1)
            Aproximacao = float( (h1/2)*S2 )  
        else:
            S1 = np.zeros((n+1))
            S1[0] = Fx(a)
            S1[n] = Fx(b)
            S = 0
            for j in range(1,n):
                S += Fx(vetor_x[j])
                S1[j] = Fx(vetor_x[j])
            Aproximacao =  float((h1/2)*(Fx(a) + 2*S + Fx(b)))
        Real = float(integrate(Fx(x),(x,a,b)))
        print('\n O vetor da resposta aproximada é: ',S1 )
        print('\n A resposta aproximada da integral  é: %9.5f' %Aproximacao)
        print(' A resposta real da integral é: %9.5f' %Real)

        self.Limitante_superior_Trapezio(n, h, Fx, vetor_x, e)

    def Limitante_superior_Trapezio(self, n, h, Fx, vetor_x, e):
        vetor_Dx2 = []
        Dx2 = Lambda(x, diff(diff(Fx(x),x),x))
        tamanho = len(vetor_x)
        
        Dx22 = Dx2(x).simplify().as_numer_denom()
        num1 = Dx22[0]
        den1 = Dx22[1]
        vetor_improprio2,Imp2 = self.Verifica_Impropria(num1, den1, vetor_x)
        if(Imp2 == True):
            print("\n Como existe um elemento improrio, foi aplicado limite no ponto avaliado e substituido na hora da analise.")
            for t in range(tamanho):
                vetor_Dx2.append(abs(Dx2(vetor_x[t])))
            for d in range(0, n+1):
                if (vetor_improprio2[d] != 0):
                    vetor_Dx2[d] = abs(vetor_improprio2[d])
            maximo = max(vetor_Dx2)
            
        else:      
            for t in range(tamanho):
                vetor_Dx2.append(abs(Dx2(vetor_x[t])))
            maximo = max(vetor_Dx2)
        
        print('\n O vetor f" é: ', vetor_Dx2, '\n Sendo o maior valor: ', maximo)
        erro = (h*maximo)*( (h/n)**2 )/12
        if (erro < e):
            print('Portanto, temos que: \n |E1| = %1.5f' %erro,' < ', e )
        elif (erro > e):
            n_min = np.ceil(sqrt(((h**3)/(12*e))*maximo))
            print('\n Portanto, temos que: \n |E1| < %1.5f' %erro)
            print('\n Logo, para que (|E1|<', e, ') o número mínimo de subintervalos deve ser %d.' %n_min)
            
    def Simpson_Um_Terço(self):
        a = self.a
        b = self.b
        Fx = self.Fx
        n = self.n
        e = self.e
        
        print('..........Simpson_1/3..........')
        if(n % 2 == 1):
            print('O valor de n está incorreto, deve ser um numero par.')
            return None
        else:
            print('O valor de n está correto.')
            
        h = (b - a)
        h1 = h/n
        #Cria o vetor com os valores de x a serem usados
        vetor_x = [a]
        for i in range(n):
            vetor_x.append(vetor_x[i] + h1)
        print('\n O vetor x é: ',vetor_x)
        
        vetor_improprio, Imp = self.Verifica_Impropria(self.num, self.den, vetor_x)
        if (Imp == True):
            print("Como existe um elemento improrio, foi aplicado limite no ponto avaliado e substituido na hora de somar")
            RA = np.zeros((n+1))
            RA[0] = Fx(a)
            RA[n] = Fx(b)
            for j in range(0,n+1):
                if(vetor_improprio[j] != 0):                   
                    RA[j] = vetor_improprio[j]
                else:
                    if(j > 0 and j < n+1):
                        RA[j] = Fx(vetor_x[j])   
            RA2 = 0
            for i in range(0,n+1):
                if (i > 0 and i < n):
                    resto = i % 2
                    if(resto == 1):
                        RA2 += 4*(RA[i])
                    elif(resto == 0):
                        RA2 += 2*RA[i] 
                else:
                    RA2 += RA[i] 
            print('\n',RA)
            Aproximacao = float( (h1/3)*RA2 )
        else:
            RA = np.zeros((n+1))
            RA[0] = Fx(a)
            RA[n] = Fx(b)
            S1 = S2 = 0
            if(n == 2):
                S1 += Fx(vetor_x[1])
                RA[1] = Fx(vetor_x[1]) 
            elif (n >= 4):
                for j in range(1,n):
                    RA[j] = Fx(vetor_x[j]) 
                    resto = j % 2
                    if(resto == 1):
                        S1 += Fx(vetor_x[j])
                    elif(resto == 0):
                        S2 += Fx(vetor_x[j])
            Aproximacao =  float((h1/3)*(Fx(a) + 4*S1 +2*S2 + Fx(b)))
            
        Real = float(integrate(Fx(x),(x,a,b)))
        print('\n O vetor da resposta aproximada é: ',RA )
        print('\n A resposta aproximada da integral  é: %9.5f' %Aproximacao)
        print(' A resposta real da integral é: %9.5f' %Real)

        self.Limitante_superior_Simpson_1_3(n, h, Fx, vetor_x, e)

    def Limitante_superior_Simpson_1_3(self,n, h, Fx, vetor_x, e):
        vetor_Dx4 = []
        Dx4 = Lambda(x, diff(diff(diff(diff(Fx(x),x),x),x),x))
        tamanho = len(vetor_x)
        
        Dx44 = Dx4(x).simplify().as_numer_denom()
        num1 = Dx44[0]
        den1 = Dx44[1]
        vetor_improprio4,Imp4 = self.Verifica_Impropria(num1, den1, vetor_x)
        if(Imp4 == True):
            print("\n Como existe um elemento improrio, foi aplicado limite no ponto avaliado e substituido na hora da analise.")
            for t in range(tamanho):
                vetor_Dx4.append(abs(Dx4(vetor_x[t])))
            for d in range(0, n+1):
                if (vetor_improprio4[d] != 0):
                    vetor_Dx4[d] = abs(vetor_improprio4[d])
            maximo4 = max(vetor_Dx4)
            
        else:
            for t in range(tamanho):
                vetor_Dx4.append(abs(Dx4(vetor_x[t])))
            maximo4 = max(vetor_Dx4)
            
        print('\n O vetor f"" é: ', vetor_Dx4, '\n Sendo o maior valor: ', maximo4)

        erro = (h*maximo4)*( (h/n)**4 )/180

        if (erro < e):
            print('Portanto, temos que: \n |E2| = %1.5f' %erro,' < ', e )
        elif (erro > e):
            n_min = np.ceil((((h**5)/(180*e))*maximo4)**0.25)
            print('\n Portanto, temos que: \n |E1| < %1.5f' %erro)
            print('\n Logo, para que (|E1|<', e, ') o número mínimo de subintervalos deve ser %d.' %n_min)
    
    def Simpson_Tres_Oitavos(self):
        a = self.a
        b = self.b
        Fx = self.Fx
        n = self.n
        e = self.e
        
        print('\n ..........Simpson_3/8..........')
        if(n % 3 != 0):
            print('\n O valor de n está incorreto, deve ser multiplo de 3.')
            return None
        else:
            print('O valor de n está correto.')
        h = (b - a)
        h1 = h/n
        #Cria o vetor com os valores de x a serem usados
        vetor_x = [a]
        for i in range(n):
            vetor_x.append(vetor_x[i] + h1)
        print('\n O vetor x é: ',vetor_x)
        
        vetor_improprio, Imp = self.Verifica_Impropria(self.num, self.den, vetor_x)
        if (Imp == True):
            print("Como existe um elemento improrio, foi aplicado limite no ponto avaliado e substituido na hora de somar")
            RA = np.zeros((n+1))
            RA[0] = Fx(a)
            RA[n] = Fx(b)
            for j in range(0,n+1):
                if(vetor_improprio[j] != 0):                   
                    RA[j] = vetor_improprio[j]
                else:
                    if(j > 0 and j < n+1):
                        RA[j] = Fx(vetor_x[j])
            RA2 = 0
            for i in range(0,n+1):
                if (i > 0 and i < n):
                    resto = i % 3
                    if(resto != 0):
                        RA2 += 3*(RA[i])
                    else:
                        RA2 += 2*RA[i] 
                else:
                    RA2 += RA[i] 
            print('\n',RA)
            Aproximacao = float( (3*h1/8)*RA2 )
        else:
            RA = np.zeros((n+1))
            RA[0] = Fx(a)
            RA[n] = Fx(b)
            S1 = S2 = 0
            if(n == 3):
                S1 += Fx(vetor_x[1]) + Fx(vetor_x[2])
                RA[1] = Fx(vetor_x[1])
                RA[2] = Fx(vetor_x[2])
            else:
                for j in range(1,n):
                    RA[j] = Fx(vetor_x[j])
                    resto = j % 3
                    if(resto != 0):
                        S1 += Fx(vetor_x[j])
                    else:
                        S2 += Fx(vetor_x[j])
            Aproximacao =  float( (3*h1/8) * ( Fx(a) + 3*S1 + 2*S2 + Fx(b) ) )
        print('\n O vetor da resposta aproximada é: ',RA )
        print('\n A resposta aproximada da integral  é: %9.5f' %Aproximacao)
        Real = float(integrate(Fx(x),(x,a,b)))
        print(' A resposta real da integral é: %9.5f' %Real)
        
        self.Limitante_superior_Simpson_3_8(n, h, Fx, vetor_x, e)

    def Limitante_superior_Simpson_3_8(self,n, h, Fx, vetor_x, e):
        vetor_Dx4 = []
        Dx4 = Lambda(x, diff(diff(diff(diff(Fx(x),x),x),x),x))
        tamanho = len(vetor_x)
        
        Dx44 = Dx4(x).simplify().as_numer_denom()
        num1 = Dx44[0]
        den1 = Dx44[1]
        vetor_improprio4,Imp4 = self.Verifica_Impropria(num1, den1, vetor_x)
        if(Imp4 == True):
            print("\n Como existe um elemento improrio, foi aplicado limite no ponto avaliado e substituido na hora da analise.")
            for t in range(tamanho):
                vetor_Dx4.append(abs(Dx4(vetor_x[t])))
            for d in range(0, n+1):
                if (vetor_improprio4[d] != 0):
                    vetor_Dx4[d] = abs(vetor_improprio4[d])
            maximo4 = max(vetor_Dx4)
            
        else:
            for t in range(tamanho):
                vetor_Dx4.append(abs(Dx4(vetor_x[t])))
            maximo4 = max(vetor_Dx4)
        print('\n O vetor f"" é: ', vetor_Dx4, '\n Sendo o maior valor: ', maximo4)

        erro = (h*maximo4)*( (h/n)**4 )/80

        if (erro < e):
            print('Portanto, temos que: \n |E2| = %1.5f' %erro,' < ', e )
        elif (erro > e):
            correcao = np.ceil( ( ( (h**5)/(80*e) )*maximo4 )**0.25 )
            n_min = 3*np.ceil(correcao/3)
            print('\n Portanto, temos que: \n |E1| < %1.5f' %erro)
            print('\n Logo, para que (|E1|<', e, ') o número mínimo de subintervalos deve ser %d.' %n_min)

    def Verifica_Impropria(self, num, den, vetor_x_T):
        vetor_improprio = [0]*len(vetor_x_T)
        Imp = False
        for i in range(len(vetor_x_T)):
            num1 = Lambda(x,num)
            den1 = Lambda(x,den)
            while ( den1(vetor_x_T[i]) == 0 ):
                print('Elemento ',i,' é improprio!')
                Imp = True
                num1 = Lambda(x, diff(num1(x),x))
                den1 = Lambda(x, diff(den1(x),x))
                vetor_improprio[i] = num1(vetor_x_T[i])/den1(vetor_x_T[i])
        return vetor_improprio, Imp
    
class Sol_Int_Dupla:
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