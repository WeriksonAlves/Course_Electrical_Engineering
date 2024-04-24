# p07.py
# Nome do programador: Wérikson Frederiko de Oliveira Alves
# Matrícula: 96708
# Data: 20/09/2018
# Faz um relatório dos salários brutos auferidos pelos funcionários de
# uma empresa. Os registros dos funcionários são lidos do arquivo
# 'funcionarios.csv' e as horas trabalhadas, do arquivo 'horas_trab.dat'.


def main():
    funcionarios = leiaFunc('funcionarios.csv')
    salariosBrutos = calcSalBruto('horas_trab.dat', funcionarios)

    # Imprime relatório dos salários brutos de todos os funcionários.
    print("\n***     Relatório dos Salários Brutos     ***"
          "\nMatrícula         Nome          Salário Bruto")
    for i in range(len(funcionarios)):
        print("%7d    %-20s    %8.2f" % (funcionarios[i][0],
                                         funcionarios[i][1],
                                         salariosBrutos[i]))

def leiaFunc(nomeArq):
    # Abre o arquivo no formato csv contendo os dados dos funcionários:
    # matr,nome,cargo,salPorHora
    arqFuncs = open(nomeArq, 'r')

    # Gera o banco de dados dos funcionarios armazenando-o em uma lista
    # de tuplas.
    bd = []
    linha = arqFuncs.readline().rstrip('\n')
    while linha != '':
        dados = linha.split(',')
        #print(dados)
        matr = int(dados[0])
        nome = dados[1]
        cargo = dados[2]
        salPorHora = float(dados[3])
        bd.append((matr, nome, cargo, salPorHora))
        linha = arqFuncs.readline().rstrip('\n')
    arqFuncs.close()

    return bd

###
# Implemente aqui a função calcSalBruto(nomeArq, bd)
#
def calcSalBruto(nomeArq, bd):
    # Abre o arquivo no formato dat contendo as horas trabalhadas dos
    # funcionários.
    arqFuncs = open(nomeArq,'r')

    # Gera a lista de salários dos funcionarios, armazenando-o em uma
    # lista.
    lsb = []
    horas = arqFuncs.readline().rstrip('\n')
    i = 0
    while horas != '':
        dados = horas.split(' ')
        salnor = int(dados[0])
        salext = float(dados[1])

        salario1 = salnor * (bd[i][3])
        salario2 = salext * ( (1.5) * (bd[i][3]) )
        saltot = salario1 + salario2

        lsb.append(saltot)
        i += 1
        horas = arqFuncs.readline().rstrip('\n')
    arqFuncs.close()
          
    return lsb
    
###

main()
