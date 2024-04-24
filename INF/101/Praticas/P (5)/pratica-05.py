# Nome: Wérikson Frederiko de Oliveira Alves
# Matricula: 96708
# Data: 06/09/2018
# O usuario irá digitar alguns códigos para certas operações, e o programa irá
# informar passo a passo o resultado de cada passo que aconteceu na fila (se aumenta
# o numero de pessoas na fila, ou se alguem vai ser atendido.
#
#...............................................................................
#
def main():
    print('Simulação de duas filas de banco')
    n = int(input('Quantos clientes serão inicialmente? '))
    opers = leiaOperacoes()
    simule(n, opers)


#
#...............................................................................
#
def leiaOperacoes():
    
    print('\nDigite a sequência de operações a ser feitas:')
    print('F para adicionar um cliente na fila 1')
    print('G para adicionar um cliente na fila 2')
    print('A para atender cliente na fila 1')
    print('B para atender cliente na fila 2')
    print('S para sair da simulação')
    opers = input()
            
    return opers
#
#...............................................................................
#
def simule(n, opers):
    fila1 = list(range(1,((n//2)+1)))
    fila2 = list(range((n//2)+1,n+1))
    for letra in opers:
        # Para fila 1
        print('\nExistem %d clientes na fila 1.' % len(fila1))
        print('Fila 1 atual: ', fila1)
        print('Existem %d clientes na fila 2.' % len(fila2))
        print('Fila 2 atual: ', fila2)
        if letra == 'A':
            if len(fila1) > 0:
                a = fila1.pop(0)
                print("Cliente %d atendido." %a)
            else:
                print("Fila vazia! Ninguém para atender.")
        elif letra == 'F':
            n = n + 1 # incrementa o tíquete para novo cliente
            fila1.append(n)

        #Para fila 2
        elif letra == 'B':
            if len(fila2) > 0:
                a = fila2.pop(0)
                print("Cliente %d atendido." %a)
            else:
                print("Fila vazia! Ninguém para atender.")
        elif letra == 'G':
            n = n + 1 # incrementa o tíquete para novo cliente
            fila2.append(n)
        elif letra == 'S':
            print('\nFim da simulação.')
            
        else:
            print('Operação inválida! Digite apenas F, G, A, B ou S.')
                        
    
#
#...............................................................................
#
main()



