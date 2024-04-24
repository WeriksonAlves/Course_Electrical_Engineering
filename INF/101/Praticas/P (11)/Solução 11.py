# p11.py
# Luiz C. A. Albuquerque
# lcaa@dpi.ufv.br
# 30/10/2018
# Atualiza um estoque e calcula seu valor total usando um dicionÃ¡rio
# em Python para armazenar os dados.

def main():
    nomearq = input('Entre com o nome do arquivo contendo o estoque: ')
    estoque = leiaEstoque(nomearq)

    nomearq = input('Entre com o nome do arquivo contendo as vendas: ')
    vendas = leiaVendas(nomearq)
    
    atualizeEstoque(estoque, vendas)
    
    print('\n\n       Estoque da Quitanda')
    print('\nProduto       PreÃ§o   Quantidade')
    for p in sorted(estoque.keys()):
        print('%-10s  %7.2f    %9.3f' % (p, estoque[p][1], estoque[p][0]))

    print('\nValor total do estoque: R$ %.2f' % calculaValorTotal(estoque))

def leiaEstoque(nome):
    arq = open(nome, 'r')
    estoque = {}
    nlinhas = 0
    linha = arq.readline().rstrip('\n')
    while linha != '':
        nlinhas += 1
        dados = linha.split(',')
        produto = dados[0]
        quantidade = float(dados[1])
        preco = float(dados[2])
        estoque[produto] = [quantidade, preco]
        linha = arq.readline().rstrip('\n')
    arq.close()
    print(nlinhas, 'linhas lidas...')
    return estoque

def leiaVendas(nome):
    arq = open(nome, 'r')
    vendas = []
    nlinhas = 0
    linha = arq.readline().rstrip('\n')
    while linha != '':
        nlinhas += 1
        dados = linha.split(',')
        produto = dados[0]
        quantVendida = float(dados[1])
        vendas.append((produto, quantVendida))
        linha = arq.readline().rstrip('\n')
    arq.close()
    print(nlinhas, 'linhas lidas...')
    return vendas

def atualizeEstoque(estoque, vendas):
    for operacao in vendas:
        produto, quantidade = operacao
        preco = estoque[produto][1]
        custo = preco * quantidade
        estoque[produto][0] -= quantidade
    print('Estoque atualizado em', len(vendas), 'produtos vendidos...')
    
def calculaValorTotal(e):
    total = 0.0
    for p in e.keys():
        total = total + e[p][0] * e[p][1]
    return total

main()
