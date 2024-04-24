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
    d = int(input('Quantas diciplinas você está cursando esse semestre: '))
    for j in range (0, d):
        #Entra com os dados ( nome, provas e faltas )
        print('\nDigite os dados da matéria')
        nome = input('Nome: ')
        credito = int(input('Credito: '))
        carga = int((15*credito))
        notafinal = float(input('Nota Final (A nota deve ser em porcentagem):'))
        falta = int(input('Número de Falta: '))
        # Adiciona na lista
        bd.append((nome, credito, carga, notafinal, falta))
    return bd
#  
#.......................................................................
#
def aprovadoereprovado(bd):
    #Lista de Reprovados = ldr e Lista de Aprovados = lda
    ldr = []
    lda = []
    for i in range (0, (len(bd))):
        if bd[i][3] < 60 or bd[i][4] > float(0.25*bd[i][2]):
            ldr.append(bd[i])
        else:
            lda.append(bd[i])
    return lda,ldr
#
#.......................................................................
#
def reprovado(ldr,bd):
    if len(ldr) == 0:
        print('Atenção, você não foi reprovado em nenhuma matéria')
    elif len(ldr) != 0:
        print('Atenção, você foi reprovado em %d diciplinas, pelos '
              'seguintes motivos:' %(len(ldr)))
        for i in range (0, len(ldr)):
            if ldr[i][3] < 60 and ldr[i][4] > float(0.25*bd[i][2]):
                print( ldr[i][0], ',pois ficou com nota abaixo da média e'
                       ' ultrapassou o limite de faltas.')
            elif ldr[i][3] < 60:
                print( ldr[i][0], ',pois ficou com nota abaixo da média.')
            elif ldr[i][4] > float(0.25*bd[i][2]):
                print(ldr[i][0], ',pois ultrapassou o limite de faltas.')
#
#.......................................................................
#
def aprovado(lda):
    if len(lda) == 0:
        print('Atenção, você não foi aprovado em nenhuma matéria')
    elif len(lda) != 0:
        print('Atenção, você foi aprovado em %d diciplinas, com as '
              'seguintes notas.' %(len(lda)))
        for i in range (0, len(lda)):
            print(lda[i][0], 'com uma nota de ', lda[i][3])
#
#.......................................................................
#
def main():
    print('\nRecebendo dados\n')
    bd = dados()
    print('\nCalculando, aguarde alguns nanos segundos.')
    lda,ldr = aprovadoereprovado(bd)
    print('\nResultados obtidos')
    reprovado(ldr,bd)
    aprovado(lda)
    print('Seu CR nesse semestre foi %3.2f' %(coerend(bd)))
    while True:
        reset = input('\nDeseja continuar[S/N]? ')
        if reset in 'Ss':
            print('\nRecebendo dados')
            bd = dados()
            print('\nCalculando, aguarde alguns nanos segundos.')
            lda,ldr = aprovadoereprovado(bd)
            print('\nResultados obtidos')
            reprovado(ldr,bd)
            aprovado(lda)
            print('Seu CR nesse semestre foi %3.2f' %(coerend(bd)))
        elif reset in 'Nn':
            print('Fim do Programa')
            break
        else:
            print('Codigo errado')
#
#.......................................................................
#
def coerend(bd):
    soma1 = 0 #Notas
    soma2 = 0 #Creditos
    for i in range(0,len(bd)):
        soma1 +=  ((bd[i][3])*(bd[i][1]) )
        soma2 += bd[i][1]
    cr = soma1 / soma2
    return cr
#
#.......................................................................
#
main()
#
#.......................................................................
#
