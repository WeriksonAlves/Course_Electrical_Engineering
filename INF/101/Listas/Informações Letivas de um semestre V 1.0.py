'''
O Programa informa a aprovação e a reprovação de um aluno no semestre
Programa construido por Werikson, no dia 02/10/2018, como forma de revisar
o básico que já foi aprendido.
'''
#
#.......................................................................
#
def dados():
    #Banco de dados = bd
    bd = list()
    print('\nDigite os dados da matéria')
    nome = input('Nome: ')
    credito = int(input('Credito: '))
    carga = int((15*credito))
    n = int(input('Digite quantas Provas você fez: '))
    #Nota total
    soma = 0
    for i in range(1, n+1):
        nota = float(input('Nota %d (A nota deve ser em porcentagem):' %(i)))
        soma += nota
    notafinal = (soma / n)
    falta = int(input('Número de Falta: '))
    # Adiciona na lista
    bd.append((nome, credito, carga, notafinal, falta))
    
    return bd
#
#.......................................................................
#
def aprovadoereprovado(bd):
    #Lista de Reprovados = ldr
    #Lista de Aprovados = lda
    ldr = []
    lda = []
    for i in range (0, len(bd)):
        print(len(bd))
        if bd[i][3] < 60 or bd[i][4] > float(0.25*bd[i][2]):
            ldr.append(bd[i])
        else:
            lda.append(bd[i])
    print(ldr, lda)
    return lda,ldr
#
#.......................................................................
#
def reprovado(ldr):
    if len(ldr) == 0:
        print('Atenção, você não foi reprovado em nenhuma matéria')
    elif len(ldr) != 0:
        print('Atenção, você foi reprovado em %d diciplinas, pelos seguintes '
              'motivos:' %(len(ldr)))
        for i in range (0, len(ldr)):
            if ldr[i][3] < 60:
                print( ldr[i][0], ',pois ficou com nota abaixo da média.')
            elif ldr[i][4] > float(0.25*bd[i][2]):
                print(ldr[i][0], ',pois ultrapassou o limite de faltas.')
            elif ldr[i][3] < 60 and ldr[i][4] > float(0.25*bd[i][2]):
                print( ldr[i][0], ',pois ficou com nota abaixo da média e'
                       'ultrapassou o limite de faltas.')
#
#.......................................................................
#
def aprovado(lda):
    print('Atenção, você foi aprovado em %d diciplinas, com as seguintes '
          'notas.' %(len(lda)))
    for i in range (0, len(lda)):
        print(lda[i][0], 'com uma nota de ', lda[i][3])
#
#.......................................................................
#
def main():
    print('\nRecebendo dados\n')
    d = int(input('Quantas diciplinas você está cursando esse semestre: '))
    for j in range (0, d):
        bd = dados()
    print('\nCalculando, aguarde alguns nanos segundos.')
    lda,ldr = aprovadoereprovado(bd)
    print('\nResultados obtidos')
    reprovado(ldr)
    aprovado(lda)
    while True:
        reset = input('\nDeseja continuar[S/N]? ')
        if reset in 'Ss':
            print('\nRecebendo dados')
            d = int(input('Quantas diciplinas você está cursando esse semestre: '))
            for j in range (0, d):
                bd = dados()
            print('\nCalculando, aguarde alguns nanos segundos.')
            lda,ldr = aprovadoereprovado(bd)
            print('\nResultados obtidos')
            reprovado(ldr)
            aprovado(lda)
        elif reset in 'Nn':
            print('Fim do Programa')
            break
        else:
            print('Codigo errado')
#
#.......................................................................
#
main()
#
#.......................................................................
#
