# Nome: Wérikson Frederiko de Oliveira Alves
# Matrícula: 96708
# Data: 30/08/2018
# O Programa começa com uma lista vazia, o qual o usuario vai preenchendo a lista, com os
# valores não negativos, e depois o programa calcula a média, imprimino a média e o números
# de valores abaixo dela.  

#
#..........................................................................................
#
#Função principal:
def main():
    print('Entre com uma lista de números não negativos (-1 para terminar):')
    L = leiaLista()
    m = calculeMedia(L)
    a = abaixo(L, m)
    print('A média dos dados é: %2.2f' %m)
    print('Há', a, 'dado(s) abaixo da média.')
#
#..........................................................................................
#
#Função que lê a lista:
def leiaLista():
    #Lista vazia
    Lista = []
    #Lendo os números
    while True:
        n = float(input())
        if n <= -1:
            break
        Lista.append(n)
        
    return Lista
#
#..........................................................................................
#
#Função que calcula a média:
def calculeMedia(L):
    soma=0
    for i in range (0, len(L)):
        soma += L[i]
    media = soma / (len(L))
    return media
#
#..........................................................................................
#
#Função que calcula os valores menores que a media:
def abaixo(L,m):
    k=0
    for i in range (0, len(L)):
        if L[i] < m:
            k += 1
    return k
#
#..........................................................................................
#
main()
        
