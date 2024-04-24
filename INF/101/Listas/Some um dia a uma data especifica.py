#Programa soma data
#.......................................................................
def le_data():
    d = int(input('\nDigite o dia selecionado: '))
    m = int(input('Digite o mes selecionado: '))
    a = int(input('Digite o ano selecionado: '))
    
    return d, m, a 
#.......................................................................
def fevereirobissexto(d, m, a):
    #Fevereiro
    if d < 1 or d > 29:
        print ('Data invalida')
        
    else:
        if d<29:
            d += 1
        else:
            d=1
            m += 1
        return d, m, a
#.......................................................................
def fevereiro(d, m, a):
    #Fevereiro
    if d < 1 or d > 28:
        print ('Data invalida')
        
    else:
        if d<28:
            d += 1
        else:
            d=1
            m += 1
        return d, m, a
#.......................................................................
def dezembro(d, m, a):
    if d < 1 or d > 31:
        print ('Data invalida')
        
    else:
        if d<31:
            d += 1
        else:
            d = 1
            m = 1
            a += 1
        return d, m, a
#.......................................................................
def mesescom31(d, m, a):
    if d < 1 or d > 31:
        print ('Data invalida')
        
    else:
        if d<31:
            d += 1
        else:
            d = 1
            m += 1
        return d, m, a
#.......................................................................
def mesescom30(d, m, a):
    if d < 1 or d > 30:
        print ('Data invalida')
        
    else:
        if d<30:
            d += 1
        else:
            d = 1
            m += 1
        return d, m, a
#.......................................................................
def anobissexto(d,m,a):
    while  m < 1 or m>12:
        print ('Data invalida')
        break
    if m==2:
        print(fevereirobissexto(d, m, a))
    elif m==12:
        print(dezembro(d, m, a))
    elif m==4 or m==6 or m==9 or m==11:
        print(mesescom30(d, m, a))
    else:
        print(mesescom31(d, m, a))
#.......................................................................
def anonaobissexto(d,m,a):
    while m < 1 or m>12:
        print ('Data invalida')
        break
    if m==2:
        print(fevereiro(d, m, a))
    elif m==12:
        print(dezembro(d, m, a))
    elif m==4 or m==6 or m==9 or m==11:
        print(mesescom30(d, m, a))
    else:
        print(mesescom31(d, m, a))
#.......................................................................
def addone(d, m, a):
    resto = a%4
    if resto == 0:

        anobissexto(d, m, a)
    else:
        anonaobissexto(d,m,a)
#.......................................................................
def main():
    d,m,a = le_data()
    addone(d, m, a)
    while True:
        reset = input('\nDeseja continuar[S/N]? ')
        if reset in 'Ss':
            d,m,a = le_data()
            addone(d, m, a)
        elif reset in 'Nn':
            print('Fim do Programa')
            break
        else:
            print('Codigo errado')
#.......................................................................
main()  
