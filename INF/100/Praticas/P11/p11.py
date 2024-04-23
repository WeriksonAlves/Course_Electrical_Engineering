# Nome do aluno: Wériskon Frederiko de Oliveira Alves
# Matrícula: 96708
# Data: 24/05/2018
# O programa irá produzir uma matriz do tamanho que o usuario quer, e irá imprimir os picos na tela comparados com seus 4 vizinhos.

import numpy as np

# Obter o tamanho da matriz quadrada
n=0
while n < 1:
	n=int(input('tamanho: '))

# Criar uma matrix n x n de valores inteiros aleatórios entre 0 e 10
np.random.seed(1)
m = np.random.randint( 0, 11, (n,n) )

# Insira o restante do código a partir desta linha
t=0
for i in range (0,n):
  for j in range (0,n):
    print('%3d' %(m[i][j]), end='')
  print()

print()

for i in range (1,n-1):
  print('', end='   ')
  for j in range (1,n-1):
    if m[i][j] >= m[i-1][j] and m[i][j] >= m[i+1][j] and m[i][j] >= m[i][j-1] and m[i][j] >= m[i][j+1]:
      print('%3d' %(m[i][j]), end='' )
    else:
      print('', end='   ')
  print()
print()
