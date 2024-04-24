# Nome: Wérikson Frederiko de Oliveira Alves
# Data: 04/10/2018
# Matricula: 96708
# Verifica e imprime os alunos reprovados por faltas e por nota em uma
# disciplina de 60 horas-aulas, usando a linha de comando.
#.......................................................................
#
import sys
#
#.......................................................................
#
def main():
    if len(sys.argv) != 4:
        print('***ERRO: Este programa deve ser executado com três argumentos:\n'
              'python3 p09.py <nome da disciplina> <carga horária> <arquivo '
              'de dados>')
        return 
    bd = leiaAlunos(sys.argv[3])
    print('               ***Alunos Reprovados na Disciplina %s***' %
          (sys.argv[1]))
    verifiqueReprovados(bd)
#
#.......................................................................
#
def leiaAlunos(nomearq):
    #Abre o arquivo
    arq = open(nomearq, 'r')
    #Cria a lista vazia
    bd = []
    linha = arq.readline().rstrip('\n')
    while linha != '':
        dados = linha.split(',')
        matric = dados[0]
        nome = dados[1]
        curso = dados[2]
        nota = int(dados[3])
        faltas = int(dados[4])
        bd.append((matric, nome, curso, nota, faltas))
        linha = arq.readline().rstrip('\n')
    #Fecha o arquivo
    arq.close()
    return bd
#
#.......................................................................
#
def verifiqueReprovados(bd):
    print('\nMatrícula          Nome                  Curso'
          '                 Nota  Faltas')
    #Percorre o banco de dados
    for i in range (0, len(bd)):
        if bd[i][3] < 60 or bd[i][4] > (0.25*int(sys.argv[2])):
            print('%7s   %-25s   %-22s    %2d    %3d' %
                  (bd[i][0], bd[i][1], bd[i][2], bd[i][3], bd[i][4]))
#
#.......................................................................
#
main()
