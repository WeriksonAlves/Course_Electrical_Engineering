#
#.......................................................................
#
def main():
    L = [36, 18, 43, 9, 18, 25, 14]
    n = int(input('\nDigite o Numero a ser verificado: '))
    verif(L,n)
    while True:
        reset = input('\nDeseja continuar[S/N]? ')
        if reset in 'Ss':
            n = int(input('Digite o Numero a ser verificado: '))
            verif(L,n)
        elif reset in 'Nn':
            print('Fim do Programa')
            break
        else:
            print('Codigo errado')
#
#.......................................................................
#
def verif(L, n):
    for i in range (len(L)):
        if n == L[i]:
            return print(i)
        
    return print(-1)

main()
