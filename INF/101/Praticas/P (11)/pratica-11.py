# Nome: Werikson Frederiko de Oliveira Alves
# Data: 01/11/2018
# Matricula: 96708
# Consideramos um dicionário contendo o estoque de uma quitanda antes de
# uma venda. Após a venda, o estoque é atualizado e o programa calcula o
# valor total em reais do estoque atualizado.
#
#.......................................................................
#
def main():
    #Le o estoque
    arq_estoque = input('\nEntre com o nome do arquivo contendo o estoque: ')
    estoque = leiaEstoque(arq_estoque)
    #Le as vendas
    arq_vendas = input('Entre com o nome do arquivo contendo as vendas: ')
    vendas = leiaVendas(arq_vendas)
    #Atualiza o estoque e o imprime
    atualizeEstoque(estoque, vendas)
    print('Estoque atualizado em %d produtos vendidos...\n' %(len(vendas)))
    print('\n       Estoque da Quitanda\n'
          '\nProduto       Preço   Quantidade')
    for chave in sorted(estoque.keys()):
        print('%-10s %8.2f %12.3f' %(chave, estoque[chave][1], estoque[chave][0]))
    #Calcula o valor total do estoque e o imprime
    total = calculeValorTotal(estoque)
    print('\nValor total do estoque: R$ %-12.2f' %(total))
#
#.......................................................................
#
def leiaEstoque(nomearq):
    # Lê o arquivo
    arqFunc = open(nomearq, 'r')
    # Dicionario vazio
    estoque = {}
    j=0
    linha = arqFunc.readline().rstrip('\n')
    while linha!= '':
        dados = linha.split(',')
        chave = dados[0]
        estoque[chave] = [int(dados[1]) , float(dados[2])]
        linha = arqFunc.readline().rstrip('\n')
        j += 1
    arqFunc.close()
    print(j, 'linhas lidas...')
    return estoque
#
#.......................................................................
#
def leiaVendas(nomearq):
    # Lê o arquivo
    arqFunc = open(nomearq, 'r')
    # Dicionario vazio
    vendas = []
    i=0
    linha = arqFunc.readline().rstrip('\n')
    while linha!= '':
        dados = linha.split(',')
        produto = dados[0]
        quantidade = float(dados[1])
        vendas.append((produto, quantidade))
        linha = arqFunc.readline().rstrip('\n')
        i = i+1
    arqFunc.close()
    print(i, 'linhas lidas...')
    return vendas
#
#.......................................................................
#
def atualizeEstoque(estoque, vendas):
    for i in range (len(vendas)):
        estoque[vendas[i][0]][0] -= vendas[i][1]

#
#.......................................................................
#
def calculeValorTotal(estoque):
    total = 0
    for chave in estoque.keys():
        quantidade = float(estoque[chave][0])
        preco = float(estoque[chave][1])
        custo = preco*quantidade
        total += custo
    return total
#
#.......................................................................
#
main()
