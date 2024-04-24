#
# Nome do programador: Wérikson Frederiko de Oliveira Alves
# Matrícula: 96708
# Data: 16/08/2018
# Este programa tem o objetivo de calcular estatísticas de um conjunto de dados que se referem às notas finais de INF100
# As estatísticas que serão calculadas são: a média das notas, o desvio padrão das notas, a maior nota e a menor nota.
#

import math
import numpy as np

def main():
    nomeArq  = 'notas_inf100.dat'
    arqNotas = open(nomeArq, 'r')
    linhas = arqNotas.read().split('\n')

    notas = np.array(list(map(float, linhas)))

    print('%d notas lidas.' % len(linhas))
    print()
    print('Média das notas:         %5.1f' % media(notas))
    print('Desvio padrão das notas: %5.1f' % desvioPad(notas))
    print('Maior nota:              %5.1f' % maximo(notas))
    print('Menor nota:              %5.1f' % minimo(notas))

#
# Insira abaixo a implementação das funções requeridas:
#
# Calculo da média:
def media(notas):
    soma = 0
    n = len(notas)
    for i in range (0,n):
        soma = soma + notas[i]

    if n>0:
        media = soma/n
        return media
    else:
        return None
#
# Calculo do desvio padrão:
#
def desvioPad(notas):
    soma1 = 0
    soma2 = 0
    n = len(notas)
    for i in range (0,n):
        # Soma1 = media
        soma1 = (soma1 + notas[i] )
        
        soma2 = (soma2 + (notas[i] ) ** 2)
        
    if n <= 1:
        return None
    else:
        desvio = math.sqrt((soma2 - (soma1**2/n) ) / (n-1) )
        return desvio
# 
# Calculo da maior maior nota:
#
def maximo(notas):
    maximo= -1
    n = len(notas)
    for i in range (0,n):
        if notas[i] >= maximo:
            maximo = notas[i]
    return maximo
#
# Calculo da maior menor nota:
#
def minimo(notas):
    minimo= 101
    n = len(notas)
    for i in range (0,n):
        if notas[i] <= minimo:
            minimo = notas[i]
    return minimo       
#.................................................................................................
if __name__ == '__main__':
    main()
