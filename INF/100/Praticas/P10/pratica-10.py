# Nome do aluno: Wérikson Frederiko de Oliveira Alves
# Matrícula: 96708
# Data: 15/05/2018
# O programa irá ler um tamanho para a "tabela", e pedirá que o usuario digite
# alguns valores para completa-la. Logo em seguida pedirá para entrar com um
# número a ser procurado e informará quantas vezes ele aparece. 

import math
import numpy as np

# Escreva seu código abaixo desta linha

#Lendo o tamanho:
r=n=0
while n <= 0:
    n= int(input('Entre com o valor de n: '))
#Construindo o arranjo:
valor = np.empty (n)
#Lendo os valores:
print('Digite cada valor em uma linha:')
for i in range (0,n):
    valor[i]=float(input(''))
#Procurando o valor:
p = float(input('Entre com o valor procurado: '))
for i in range(0,n):
    if p == valor[i]:
        r+=1
#Imprimindo na tela o numerode vezes que foi repetido:
print()
print('O valor procurado aparece', r, 'vezes no arranjo') 
