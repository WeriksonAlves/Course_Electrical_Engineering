# Nome: Werikson Frederiko de Oliveira Alves
# Data: 13/09/2018
# Matricula: 96708
# O programa ler uma tupla e calcula o salario mutiplicado pelo numero de horas trabalhadas.
#
#...............................................................................
#
# Função principal
# Lista de funcionarios = ldf
# Horas Trabalhadas = nht
# Lista de Salarios Brutos = lsb
# Salario bruto do funcionario = sbf
def main():
    ldf = [] # Lista de funcionarios = ldf
    t = leiaFunc()
    while t != ():
        ldf.append(t)
        t = leiaFunc()
        
    lsb = [] # Lista de Salarios Brutos = lsb
    
    # Horas Trabalhadas = nht
    for i in range(0, len(ldf)):
        nht = float(input('\nDigite o número de horas trabalhadas do(a) 1o(a) funcionário(a): '))
        sbf = calcSalBruto(ldf[i], nht)
        lsb.append(sbf)
    # Imprime a Tabela
    print('\n***     Relatorio dos Salários Brutos     ***')
    print('Matrícula         Nome          Salário Bruto')
    for j in range (0,len(ldf)):
        print('%7d   %-15s   %8.2f' %(ldf[j][0], ldf[j][1], lsb[i]))    

#
#...............................................................................
#
# Função leiaFunc
# Tuplas de funcionarios
def leiaFunc():
    func = ()

    matr = int(input('\nEntre com o no de matrícula de um(a) funcionário(a) (nº < 0 p/ terminar):'))
    if matr < 0:
        func = ()
        return func

    else:
        nome = input('Digite o nome do(a) funcionário(a): ')
        cargo = input('Digite o cargo dele(a): ')
        salario = float(input('Digite o salário por hora dele(a): '))

        func = (matr,nome,cargo,salario)

        return func
#
#...............................................................................
#
# Função calcSalBruto
def calcSalBruto(func, nht):
    sbf = func[3]* nht
    return sbf
#
#...............................................................................
#
main()
