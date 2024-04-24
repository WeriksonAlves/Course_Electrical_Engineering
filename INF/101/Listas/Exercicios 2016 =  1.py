#
#Faça uma programa em pythin que leia uma expressão com parenteses e, usando uma
#pilha, verifique se os parenteses estão balaceados.
#
#...............................................................................
#

def main():
    print('Simulação de parenteses')
    lcp = le_exp()
    ver(lcp)
    while True:
        reset = input('\nDeseja continuar[S/N]? ')
        if reset in 'Ss':
            print('Simulação de parenteses')
            lcp = le_exp()
            ver(lcp)
        elif reset in 'Nn':
            print('Fim do Programa')
            break
        else:
            print('Codigo errado')
#
#...............................................................................
#       
def ver(expr):
    #par_abe = parenteses aberto e par_fec = parenteses fechados
    
    # Percorre a lista
    lp = list()
    for letra in expr:
        if letra == ')':
            if len(lp)== 0:
                return print('Errado')
            else:
                lp.pop()
            
        elif letra == '(':
            lp.append('(')
            
    if len(lp)== 0:
        return print('Certo')
#
#...............................................................................
#
def le_exp():
    #Lê a expressão com parenteses
    lcp = input()
         
    return lcp

#
#...............................................................................
#











main()    
