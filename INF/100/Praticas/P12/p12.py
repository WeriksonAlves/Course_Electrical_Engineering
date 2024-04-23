# Nome do aluno:
# Matrícula:
# Data:
# Este programa aplica algumas transformadas geométricas simples em uma imagem.

import imagens

# Ler o arquivo 'jardim.jpg' e o mostrar na tela
im1 = imagens.Imagem('jardim.jpg')
im1.mostrar()

# Pegar o número de linhas (altura) e número de colunas (largura)
# da matriz que representa a imagem
m = im1.altura
n = im1.largura

# Criar uma imagem im2 "vazia", colorida, de tamanho m x n
im2 = imagens.Imagem('', (m,n))

# Produzir imagem rotacionada em 180°
for i in range( 0, m ):
    for j in range( 0, n ):
        im2[i][j] = im1[m-1-i][n-1-j]
im2.mostrar()

#-------------------------------------------------------------------
# INSERIR SEU CÓDIGO ABAIXO DESTA LINHA

