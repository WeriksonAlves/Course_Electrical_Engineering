# Nome: Werikson Frederiko de Oliveira Alves
# Data: 8/11/2018
# Matricula: 96708
# O programa atualiza um dicionario, já povoado, e calcula o valor total
# do estoque.
#
#.......................................................................
#
def main():
    #Cria o dicionario
    estoque = {'tomate': [1000, 2.30],
               'alface': [500, 0.45],
               'batata': [2150, 1.20],
               'feijao': [100, 5.50] }
    # Atualizando estoque
    estoque['feijao'] = [100, 6.10]
    #Imprimindo na tela
    print('\n      Estoque da Quitanda\n'
          '\nProduto      Preço   Quantidade')
    for chave in sorted(estoque.keys()):
        print('%-10s %7.2f %10d' %(chave, estoque[chave][1],
                                  estoque[chave][0]))
    #Calcula o valor total do estoque e o imprime
    total = calculaValorTotal(estoque)
    print('\nValor total do estoque:    %7.2f' %(total))
#
#.......................................................................
#
def calculaValorTotal(estoque):
    total = 0
    for chave in estoque.keys():
        quantidade = int(estoque[chave][0])
        preco = float(estoque[chave][1])
        custo = preco*quantidade
        total += custo
    return total
#
#.......................................................................
#
main()
