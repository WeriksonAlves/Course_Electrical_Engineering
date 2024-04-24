# Transformando numero e letras para Binario
#
#.......................................................................
#
def numero_binomial(numero):
    L = [] #Lista vazia
    quociente = numero//2
    resto = numero%2
    L.append(resto)
    print(quociente,resto)
    while quociente != 1:
        resto = quociente%2
        quociente = quociente//2
        print(quociente,resto)
        L.append(resto)
    L.append(quociente)
    print(quociente,resto,L)
#
#.......................................................................
#
def main():
    numero = int(input('Digite um numero: '))
    numero_binomial(numero)
    while True:
        reset = input('\nDeseja continuar[S/N]? ')
        if reset in 'Ss':
            numero = int(input('Digite um numero: '))
            numero_binomial(numero)
        elif reset in 'Nn':
            print('Fim do Programa')
            break
        else:
            print('Codigo errado')
#
#.......................................................................
#
main()
