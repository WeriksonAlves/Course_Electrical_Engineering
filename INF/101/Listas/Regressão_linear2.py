'''
Código editado por: Hiago Braga
'''

import numpy as np

def adiciona(cont):
    bd = list()
    for i in range(cont):
        x = float(input())
        bd.append(x)
    return bd

contador = int(input("Quantos pontos você irá incluir na sua regressão? "))
print('Digite os valores de x: \n')

x = np.array(adiciona(contador))
print('Digite os valores de y: \n')

y = np.array(adiciona(contador))

pl = np.polyfit(x,y,1)
yfit = pl[0]*x + pl[1]
yresid = y - yfit
SQresid = sum(pow(yresid,2))
SQtotal = len(y) * np.var(y)
R2 = 1 - SQresid/SQtotal

print (pl)
print(R2)

import matplotlib.pyplot as plt
plt.plot(x,y,'o')
plt.plot(x,np.polyval(pl,x),'g--')
plt.xlabel("tempo (s)")
plt.ylabel("Ln(A)")
plt.show()
