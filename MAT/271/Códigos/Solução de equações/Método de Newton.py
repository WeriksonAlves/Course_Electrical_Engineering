#Metodo de Newton
#Data 10/08/21 - Werikson

from math import sin,cos,pi,log,sqrt,exp

def F(x):
    return (x)*(exp(x)) - 7

def Fd(x):
    return exp(x)*(1 + x)

def main():
    dados = {'n____':[],
             'Xn___':[],
             'e_abs':[],
             'e_rel':[],
             'Fxn__':[],
             'FDxn_':[]}
    n = 0
    dados['n____'].append(n)
    
    #Dados
    print('Entrada dos parâmetros:')
    x0 = 1 #float(input('Entre com o valor arbitrário de X0: '))
    dados['Xn___'].append(x0)
    E1 = 3 #float(input('Entre com o valor do expoente do valor de parada (10^(-E)): '))
    E = 10**(-E1)
    print()
    
    print('Processando seu resultado')
    #f1 = F(x0)
    #f2 = Fd(x0)
    dados['Fxn__'].append(F(x0))
    dados['FDxn_'].append(Fd(x0))
    
    e_abs = 0.5
    e_rel = 0.5
    dados['e_abs'].append(e_abs)
    dados['e_rel'].append(e_rel)
    
    valor_x = []
    valor_x.append(x0)
    
    xn = x0 - (F(x0)/Fd(x0))
    erro = 1
    while erro > E:
        dados['Xn___'].append(xn)
        valor_x.append(xn)
        
        n = n + 1
        dados['n____'].append(n)

        dados['Fxn__'].append(F(xn))
        dados['FDxn_'].append(Fd(xn))
    
        e_abs = abs(valor_x[n] - valor_x[n-1])
        e_rel = abs(e_abs/valor_x[n])
        dados['e_abs'].append(e_abs)
        dados['e_rel'].append(e_rel)
        
        xn = xn - (F(xn)/Fd(xn))
        erro = e_abs
        
        if n >= 100:
            print('Sequencia muito longa!')
            break

    for key in dados.keys():
        print(key, end = ' ' * 6)

    print('\n')

    for i in range(n+1):
        for key in dados.keys():
            print('%.6f' % dados[key][i], end = ' ' * 3)
        print('\n')
    print()
    print('Sua resposta mais aproximada é x[',n,'] = ','%.5f' % xn,
          'com um erro absoluto de ', '%.5f' % erro)


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
