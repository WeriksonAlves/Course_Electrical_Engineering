# Nome do aluno:
# Matrícula:
# Data:
# (breve comentário dizendo o que o programa faz)

import imagens

def main():
    # Lê o arquivo com a imagem original e a coloca na matriz im.
    im = imagens.Imagem('fruits-700.jpg')
    im.mostrar()

    # Produz a imagem em tons de cinza em im1 a partir de im.
    print("Tons de cinza...")
    im1 = tonal(im)
    
    # Produz o embossing da imagem em im2 a partir de im1.
    print("Embossing...")
    im2 = emboss(im1)
    im2.mostrar()
    
    print("Fim do processamento!")


# Implemente aqui a função tonal() que recebe uma imagem como parâmetro e
# retorna a imagem em tons de cinza.

...

# Implemente aqui a função emboss() que recebe uma imagem em tons de cinza e
# retorna a imagem embossed.

...

# Chama a função main para iniciar o processo.
main()