# Programdor: Werikson
# Data: 12/11/2018
#
#.......................................................................
#
def main():
    print('Exercicio simulando a construção de horario escolar')
    #Procedimento de redução
    diciplinas, matriculas = dados_iniciais()
    print('Dados iniciais: ')
    print('\n', diciplinas)
    print('\n', matriculas)
    conflito, emptySet = lista_de_conflito(diciplinas, matriculas)
    print('\n', conflito)
    #Solução
    restante = set(diciplinas)
    horario = []
    while restante != emptySet:
        i = 0
        d = diciplinas[i]
        while d not in restante:
            i = i + 1
            d = diciplinas[i]
        sessao = {d}
        tentativa = restante.difference(conflito[i])
        for s in range (len(diciplinas)):
            if diciplinas[s] in tentativa:
                if conflito[s].intersection(sessao) == emptySet:
                    sessao = sessao.union({diciplinas[s]})
        restante = restante.difference(sessao)
        horario.append(sessao)
    # Imprime as sessões não conflitantes do horário.
    for i in range(len(horario)):
        print(horario[i])
     
#
#.......................................................................
#
def dados_iniciais():
    diciplinas = ['INF100', 'INF101', 'INF103', 'MAT140',
                  'MAT141', 'MAT144', 'LET100', 'FIS203']
    matriculas = {"Ana Lobo": {'INF101', 'MAT140', 'LET100'},
                  "João Marques": {'INF100', 'INF103', 'MAT141'},
                  "Jasão Silva": {'INF100', 'MAT144', 'INF103', 'LET100'},
                  "Paulo Gomes": {'INF101', 'LET100'},
                  "Aline Souza": {'INF100', 'MAT141', 'LET100', 'INF103'},
                  "Antônio Soares": {'INF103', 'MAT144','LET100'},
                  "Teresa Oliveira": {'INF101', 'MAT141', 'LET100'},
                  "José Farias": {'MAT144', 'LET100', 'FIS203'},
                  "Ivo Lopes": {'INF101', 'FIS203', 'MAT144', 'LET100'},
                  "Luíza Xisto": {'INF101', 'MAT141'} }
    return diciplinas,matriculas
#
#.......................................................................
#
# Cria a lista com os conflitos,ou seja, se a diciplina [d] estiver presente no
#valor de um determinada chave, o par chave/valor é adicionado à lista conflito.
def lista_de_conflito(diciplinas, matriculas):
    emptySet = set()
    conflito = [emptySet for d in diciplinas]
    for a in matriculas.keys():
        for d in range(len(diciplinas)):
            if diciplinas[d] in matriculas[a]:
                conflito[d] = conflito[d].union(matriculas[a])
    return conflito, emptySet


#
#.......................................................................
#



#
#.......................................................................
#
main()
