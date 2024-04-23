#Metodo da Aproximações Sucessivas
#Data 10/08/21 - Werikson

from math import sin,cos,e,pi,log,sqrt,exp

def F(x):
    return -1 - x*exp(x)

def main():
    dados = {'n':[],
             'Xn':[],
             'Fxn':[],
             'e_abs':[],
             'e_rel':[]}
    n = 0
    dados['n'].append(n)
    
    #Dados
    print('Entrada dos parâmetros:')
    x0 = -1 #float(input('Entre com o valor arbitrário de X0: '))
    E1 = 5 #float(input('Entre com o valor do expoente do valor de parada (10^(-E)): '))
    E = 10**(-E1)
    print()
    dados['Xn'].append(x0)
    
    print('Processando seu resultado')
    fd = None
    e_abs = 0.5
    e_rel = 0.5
    dados['e_abs'].append(e_abs)
    dados['e_rel'].append(e_rel)
    
    valor_x = []
    valor_x.append(x0)
    
    Fx0 = F(x0)
    dados['Fxn'].append(Fx0)
    xn = Fx0
    erro = 1
    while erro > E:
        dados['Xn'].append(xn)
        valor_x.append(xn)
        
        n = n + 1
        dados['n'].append(n)
        
        e_abs = abs(valor_x[n] - valor_x[n-1])
        e_rel = abs(e_abs/valor_x[n])
        erro = e_abs
        dados['e_abs'].append(e_abs)
        dados['e_rel'].append(e_rel)
        
        Fxn = F(xn)
        dados['Fxn'].append(Fxn)
        xn = Fxn
        
        if n >= 100:
            print('Sequência muito longa!')
            break
        
        
    for key in dados.keys():
        print(' ', key, end = ' ' * 4)

    print('\n')

    for i in range(n+1):
        for key in dados.keys():
            print('%.5f' % dados[key][i], end = ' ' * 3)
        print('\n')
    print()
    print('Sua resposta mais aproximada é x[',n,'] = ','%.5f' % xn,
          'com um erro absoluto de ', '%.4f' % erro)


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
