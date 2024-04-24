# Nome: Werikson Frederiko de Oliveira Alves
# Matricula: 96708
# Data: 27/09/2018
# O programa lê os dados dos alunos de uma disciplina contendo e retona
# quais alunos estão reprovados.
#
#.......................................................................
#
def main():
    alunos = leiaAlunos('let374.dat')
    reprov = verifiqueReprovados(alunos)
    # Imprime relatório dos sobre as notas e faltas de todos os alunos.
    print("\n               ***Alunos Reprovados na Disciplina LET374***\n"
          "\nMatrícula          Nome                  Curso"
          "                 Nota  Faltas")
    for i in range(len(reprov)):
        print('%7d   %-25s   %-24s  %1d   %4d' %(reprov[i][0], reprov[i][1],
                                      reprov[i][2], reprov[i][3],
                                      reprov[i][4]))
#
#.......................................................................
#
def leiaAlunos(nomeArq):
    # Abre o arquivo no formato dat contendo os dados 
    arqFuncs = open(nomeArq, 'r')
    # Gera o banco de dados armazenando-o em uma lista de tuplas.
    bd = []
    linha = arqFuncs.readline().rstrip('\n')
    while linha != '':
        dados = linha.split(',')
        #print(dados)
        matr = int(dados[0])
        nome = dados[1]
        curso = dados[2]
        nota = int(dados[3])
        faltas = int(dados[4])
        bd.append((matr, nome, curso, nota, faltas))
        linha = arqFuncs.readline().rstrip('\n')
    arqFuncs.close() 

    return bd
#
#.......................................................................
#
def verifiqueReprovados(bd):
    # alunosreprovados = ar
    ar = []
    for i in range (len(bd)):
        if bd[i][3] < 60 or bd[i][4] > 15:
            ar.append(bd[i])
            
    return ar
#
#.......................................................................
#
main()
