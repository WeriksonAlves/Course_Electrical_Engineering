#
# Nome do programador: 
# Matrícula: 
# Data: 
# (breve comentário sobre o que o programa faz)
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


if __name__ == '__main__':
    main()

