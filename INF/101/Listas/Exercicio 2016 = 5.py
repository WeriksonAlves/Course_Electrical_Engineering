#
#.......................................................................
#
def main():
    d,m,a = le_data()
    print(checkDate(m, d, a))
    while True:
        reset = input('\nDeseja continuar[S/N]? ')
        if reset in 'Ss':
            d,m,a = le_data()
            print(checkDate(m, d, a))
        elif reset in 'Nn':
            print('Fim do Programa')
            break
        else:
            print('Codigo errado')
        
#
#.......................................................................
#
def le_data():
    d = int(input('\nDigite o dia selecionado: '))
    m = int(input('Digite o mes selecionado: '))
    a = int(input('Digite o ano selecionado: '))
    return d,m,a
#
#.......................................................................
#
def checkDate(m, d, a):
    if a<1600:
        return False
    elif m < 1 or m > 12:
        return False
    elif d<1 or d>31:
        return False
    elif m== 4 or m==6 or m==9 or m==11:
        if d==31:
            return False
        else:
            return True
    elif m==2:
        resto = a%4
        if (a%400) == 0:            
            if d>29:
                return False
            else:
                return True
        elif d>28:
            return False
    else:
        return True
#
#.......................................................................
#
main()
#
#.......................................................................
#
