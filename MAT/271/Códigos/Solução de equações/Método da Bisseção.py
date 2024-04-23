#Metodo da bisseção
#Data 29/07/21 - Werikson

from math import sin,cos,e,pi,log,sqrt

def valor_medio(a0,b0):
    xn = (b0+a0)/2
    #print('an = ',"%.5f" %a0,'; bn = ',"%.5f" %b0,'; xn = ',"%.5f" %xn)
    return xn

def dados_iniciais():
    a0 = -0.5 #float(input('Entre com o menor valor do intervalo (a0): '))
    b0 = 0  #float(input('Entre com o maior valor do intervalo (b0): '))
    E1 = 3  #float(input('Entre com o valor do expoente do valor de parada (10^(-E)): '))
    E = 10**(-E1)
    return a0,b0,E

def funcao(a,b,xn):
    fn = F(xn)
    fa = F(a)
    fb = F(b)
    #print('fan = ',"%.5f" %fa ,'; fbn = ',"%.5f" % fb,'; fxn = ',"%.5f" %fn)
    return fn,fa,fb

def F(x):
    return (3*x) - cos(x) + 2 


def TVI(fa0,fb0,fx0):
    if (fa0*fx0 < 0) or (fx0*fb0 < 0):
        return 1
    else:
        print('Esse intervalo não atende ao TVI')
        return 0
        
    
def atualiza(fa0,fb0,fx0,a0,b0,x0):
    if fa0*fx0 < 0:
        bn = x0
        an = a0
    elif fx0*fb0 < 0:
        an = x0
        bn = b0
    return an,bn      

def main():
    dados = {'n':[],
             'an':[],
             'bn':[],
             'Xn+1':[],
             'fan':[],
             'fbn':[],
             'fxn':[],
             'e_abs':[],
             'e_rel':[]}
    n = 0
    dados['n'].append(n)
    
    #Dados
    print('Entrada dos parâmetros:')
    a0,b0,E = dados_iniciais()
    dados['an'].append(a0)
    dados['bn'].append(b0)
    print()
    
    print('Processando seu resultado')
    x0 = valor_medio(a0,b0)
    dados['Xn+1'].append(x0)
    
    fx0,fa0,fb0 = funcao(a0,b0,x0)
    dados['fxn'].append(fx0)
    dados['fan'].append(fa0)
    dados['fbn'].append(fb0)
         
    e_abs = 0.5
    e_rel = 0.5
    dados['e_abs'].append(e_abs)
    dados['e_rel'].append(e_rel)

    v = TVI(fa0,fb0,fx0)
    if v == 0:
        return None
    
    valor_x = []
    valor_x.append(x0)
    
    an,bn = atualiza(fa0,fb0,fx0,a0,b0,x0)
    erro = 1
    while erro > E:
        dados['an'].append(an)
        dados['bn'].append(bn)
        
        n = n + 1
        dados['n'].append(n)
        
        xn = valor_medio(an,bn)
        dados['Xn+1'].append(xn)
        valor_x.append(xn)
        
        fn,fan,fbn = funcao(an,bn,xn)
        dados['fxn'].append(fn)
        dados['fan'].append(fan)
        dados['fbn'].append(fbn)
        
        e_abs = abs(valor_x[n] - valor_x[n-1])
        e_rel = abs(e_abs/valor_x[n])
        erro = e_abs
        dados['e_abs'].append(e_abs)
        dados['e_rel'].append(e_rel)
        
        an,bn = atualiza(fan,fbn,fn,an,bn,xn)
    
    for key in dados.keys():
        print(' '*3, key, end = ' ' * 4)

    print('\n')

    for i in range(n+1):
        for key in dados.keys():
            print('%.5f' % dados[key][i], end = ' ' * 3)
        print('\n')
    print()
    print('Sua resposta mais aproximada é x[',n+1,'] = ','%.5f' % xn,' com um erro de ', erro)


main()

while True:
    reset = input('\nDeseja continuar[S/N]? ')
    if reset in 'Ss':
        main()
    elif reset in 'Nn':
        print('Fim do Programa')
        break
    else:
        print('Codigo errado')
