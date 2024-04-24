def leiaLista():
    ldni = list()
    numint = int(input('Digite um numero inteiro maior que zero: '))
    while numint >= 0:
        ldni.append(numint)
        numint = int(input('Digite um numero inteiro maior que zero: '))
    return ldni


def par(ldni):
    lp = list()
    for i in range (0,len(ldni)):
        resto = ldni[i] % 2
        if resto == 0:
            lp.append(ldni[i])
    return lp

def main ():
    print(par(leiaLista()))

#
#
#
main()
