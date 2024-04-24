# Nome: Wérikson Frederiko de Oliveira Alves
# Matrícula: 96708
# Data: 23/08/2018
# O programa irá receber uma lista qualquer, com valores misturados
# e retornará a lista ordenada de forma crescente.

#...................................................................

# Função principal
def main():
    lista = [43, 36, 25,18, 18, 14, 9]
    print('Lista embaralhada = ',lista)
    ordena(lista)
    print()
    print ('Lista ordenada = ',lista)
#
#..................................................................
#

# Função minimo
# im = indice do minimo

def minimo(lista,h):
    minimo_do_elemento = h
    valor_minimo = lista[h]
    for j in range (h+1, len(lista)):
        if lista[j] < valor_minimo:
           valor_minimo = lista[j]
           minimo_do_elemento = j 

    return minimo_do_elemento
#
#..................................................................
#

#Função ordena
def ordena(lista):
    for h in range (0, len(lista)-1):
        j = minimo(lista, h)
        lista[j], lista[h] = lista[h], lista[j]

#
#..................................................................
#


main()
