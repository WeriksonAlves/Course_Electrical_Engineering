#
#.......................................................................
#
def main():
    L = [43, 36, 25,18, 18, 14, 9]
    print('Lista embaralhada = ',L)
    ordena(L)
    print ('\nLista ordenada    = ',L)
    
    
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
    valor_minimo = L[i]
    for k in range (i+1,len(L)):
        if L[k] < valor_minimo:
            minimo_do_elemento = k
            valor_minimo = L[k]
    return minimo_do_elemento
#
#.......................................................................
#
main()
