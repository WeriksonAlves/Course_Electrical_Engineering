'''
O Programa informa a aprovação e a reprovação de um aluno no semestre
Programa construido por Werikson, no dia 02/10/2018, como forma de revisar
o básico que já foi aprendido.
'''
#
#.......................................................................
#
def dados(nomearq):
    #Abrindo o arquivo
    arq = open(nomearq, 'r')
    #Cria a lista vazia
    bd = list()
    #Dividindo cada linha
    linha = arq.readline().rstrip('\n')
    while linha != '':
        #Separando cada dado
        dados = linha.split(';')
        nome = dados[0]
        credito = int(dados[1])
        carga = int(dados[2])
        notafinal = float(dados[3])
        falta = int(dados[4])
        bd.append((nome, credito, carga, notafinal, falta))
        linha = arq.readline().rstrip('\n')
    #Fechando o arquivo
    arq.close()
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
        if bd[i][3] < 60 or bd[i][4] > float(0.25*bd[i][2]):
            ldr.append(bd[i])
        else:
            lda.append(bd[i])
    return lda,ldr
#
#.......................................................................
#
def reprovado(ldr):
    if len(ldr) == 0:
        print('\nAtenção, você não foi reprovado em nenhuma matéria')
    elif len(ldr) != 0:
        print('\nAtenção, você foi reprovado em %d diciplinas, pelos seguintes '
              'motivos:' %(len(ldr)))
        ordena(ldr)
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
    if len(lda) == 0:
        print('\nAtenção, você não foi aprovado em nenhuma matéria')
    elif len(lda) != 0:
        print('\nAtenção, você foi aprovado em %d diciplinas, com as '
              'seguintes notas.' %(len(lda)))
        ordena(lda)
        for i in range (0, len(lda)):
            print(lda[i][0], 'com uma nota de ', lda[i][3])
#
#.......................................................................
#
def ordena(L):
    for i in range(0,len(L)-1):
        j = minimo(L,i)
        L[j],L[i] = L[i],L[j]
#
#.......................................................................
#
def minimo(L,i):
    minimo_do_elemento = i
    valor_minimo = L[i][1]
    for k in range (i+1,len(L)):
        if L[k][1] < valor_minimo:
            minimo_do_elemento = k
            valor_minimo = L[k][1]
    return minimo_do_elemento
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
def main():
    print('\nLendo dados de um arquivo')
    bd = dados('Dados para Informações letivas de um semestre.txt')
    print('\nCalculando, aguarde alguns nanos segundos.')
    lda,ldr = aprovadoereprovado(bd)
    print('\nResultados obtidos (Ordenados em função de creditos)')
    reprovado(ldr)
    aprovado(lda)
    print('Seu CR nesse semestre foi %3.2f' %(coerend(bd)))
    while True:
        reset = input('\nDeseja continuar[S/N]? ')
        if reset in 'Ss':
            print('\nRecebendo dados (Ordenados em função de creditos)')
            bd = dados('Dados para Informações letivas de um semestre.txt')
            print('\nCalculando, aguarde alguns nanos segundos.')
            lda,ldr = aprovadoereprovado(bd)
            print('\nResultados obtidos')
            reprovado(ldr)
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
main()
#
#.......................................................................
#
