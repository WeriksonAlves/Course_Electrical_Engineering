#
#.......................................................................
#
def leiaOperacoes():
    print('Digite a sequência de operações a ser feitas:'
          '\nF para adicionar um cliente na fila 1'
          '\nG para adicionar um cliente na fila 2'
          '\nA para atender cliente na fila 1'
          '\nB para atender cliente na fila 2'
          '\nS para sair da simulação')
    opers = str(input())
    return opers
#
#.......................................................................
#
def simule(n, opers):
    
    if (n%2) != 0:
        fila1 = list(range(1,(n//2)+1))
        fila2 = list(range((n//2)+1, n+1))
        
    else:
        fila1 = list(range(1,(n//2)+1))
        fila2 = list(range((n//2)+1, n+1))
        
    for letra in opers:
        print('\nExistem %d clientesna fila 1' %len(fila1),
              '\nFila 1 atual: %s' %(fila1),
              '\nExistem %d clientesna fila 2' %len(fila2),
              '\nFila 2 atual: %s' %(fila2))
        if letra == 'F':
            n +=1
            fila1.append(n)
        elif letra == 'G':
            n +=1
            fila2.append(n)
        elif letra == 'A':
            if len(fila1) > 0:
                atendido = fila1.pop(0)
                print("Cliente %d atendido." % atendido)
            else:
                print("Fila vazia! Ninguém para atender.")
        elif letra == 'B':
            if len(fila2) > 0:
                atendido = fila2.pop(0)
                print("Cliente %d atendido." % atendido)
            else:
                print("Fila vazia! Ninguém para atender.")
        elif letra == 'S':
            print('\nFim da Simulação')
        else:
            print("Operação inválida! Digite apenas F, G, A, B ou S.")
#
#.......................................................................
#
def main():
    print('\nSimulação de duas filas de banco')
    n = int(input('Quantos clientes serão inicialmente? '))
    opers = leiaOperacoes()
    simule(n, opers)
    reset = str(input('\nDeseja realizar outro teste [S/N]? '))
    while True:
        if reset in 'Ss':
            print('\nSimulação de duas filas de banco')
            n = int(input('Quantos clientes serão inicialmente? '))
            simule(n, leiaOperacoes())
            reset = str(input('Deseja realizar outro teste [S/N]? '))
        elif reset in 'Nn':
            print('Fim do programa')
            break
        else:
            print('Código Invalido')
            reset = str(input('Deseja realizar outro teste [S/N]? '))
            
            
    
#
#.......................................................................
#
main()
#
#.......................................................................
#
