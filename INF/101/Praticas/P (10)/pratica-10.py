# Nome: Werikson Frederiko de Oliveira Alves
# Data: 25/10/2018
# Matricula: 96708
# O programa lê as temperaturas máximas médias de determinado dia contidas
# em um dicionário, em que cada chave é o dia do mês e o valor associado, a
# temperatura máxima média em graus Celsius desse dia, e depois calcula a media.
#
#.......................................................................
#
def main():
    #Gera um dicionario vazio
    temperaturas = dict()
    nomearq = input('\nEntre com o nome do arquivo de dados: ')
    arqFunc = open(nomearq,'r')
    #Gera um dicionario vazio
    temperaturas = dict()
    linha = arqFunc.readline().rstrip('\n')
    chave = 0
    while linha != '':
        chave = chave + 1
        temperaturas[(chave)] = float(linha)
        linha = arqFunc.readline().rstrip('\n')   
    arqFunc.close()
    # Calcula a media
    medfinal = media(temperaturas)
    #Impressão dos resultados
    print('\nTemperaturas Máximas Médias (°C)\n'
          '  no Mês de Setembro em Viçosa\n')
    for chave in temperaturas.keys():
        print('%10s     %2.1f' %(chave, temperaturas[chave]))
    print('\nMédia das temperaturas máximas médias no mês de setembro: %2.1f'
           %(medfinal))   
#
#.......................................................................
#
def media(temperaturas):
    # Cria uma lista apenas com os valores do dicionarios
    soma1 = 0
    soma2 = 0
    for chave in temperaturas.keys():
        soma1 = temperaturas[chave] + soma1
        soma2 = 1 + soma2
    media = (soma1)/(soma2)
    return media
#
#.......................................................................
#
main()
#
#.......................................................................
#
