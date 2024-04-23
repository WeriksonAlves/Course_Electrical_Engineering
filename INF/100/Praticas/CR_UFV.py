#np = Numerop de provas
#nt = Nota
#nf = nota final
#pt = provas totais
#pu = prova unica

#..........................................................................................................................
import np as numpy
#..........................................................................................................................
def cps(p1):
    soma = 0
    for i in range (0, p1):
        nt[i] = float(input('Digite a nota: '))
        soma = soma + nt[i]
        nf = soma / np
    return nf
#..........................................................................................................................
def sps(p1):
    soma = 0
    for i in range (0, p1):
        nt[i] = float(input('Digite a nota: '))
        soma = soma + nt[i]
    nf = soma
    return nf
#..........................................................................................................................
def numb_prova():
    np = int(input('Digite o numero de provas: '))
    return np
#..........................................................................................................................

#..........................................................................................................................

#..........................................................................................................................

#..........................................................................................................................
def prog_principal():
    print('Calculando CR do semestre')
    print('Precione 1 para provas que a soma é maior que 100 ou 2 para provas que a soma é menor ou igual a 100')
    x=int(input('Digite o modelo de soma: '))
    if x==1:
        y = cps(numb_prova())
        return y
    elif x==2:
        y = sps(numb_prova())
        return y

prog_principal()

print('Nota final é ', NF)
