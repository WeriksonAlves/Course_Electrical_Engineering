#!/usr/bin/env python
# coding: utf-8

# # Margem de Ganho e de Fase

# In[ ]:


#get_ipython().run_line_magic('matplotlib', '')
from sympy import var, Lambda
import numpy as np
import matplotlib.pyplot as plt
from control import tf, bode


# In[ ]:


class MargemGanho:
    import numpy as np
    import matplotlib.pyplot as plt
    from control import tf, bode
    def __init__(self, G):
        self.G = G
    
    def parameters(self):
        mag, phase, omega = bode(self.G, db=True, plot=False)
        magdb = 20 * np.log10(mag)
        phasedg = 180 / np.pi * phase
        return omega, magdb, phasedg
    
    def pontos(self, omega, mag, phase):
        w_db = w_deg = j = k = 0
        
        try:
            while mag[j] > 0:
                j += 1
            w_db = omega[j]
        except IndexError:
            j = j -1
            w_db = omega[j]
        try:
            while phase[k] > -180:
                k += 1
            w_deg = omega[k]
        except IndexError:
            k = k-1 
            w_deg = omega[k]
        return (j,w_db, k , w_deg)
    
    def plot(self):
        omega, magdb, phasedg = self.parameters()
        j,w_db, k, w_deg = self.pontos(omega, magdb, phasedg)        
        plt.figure(figsize=(10, 7))
        
        plt.style.use('ggplot')
        
        plt.subplot(211)
        plt.semilogx()
        plt.title('Diagrama de Bode', fontsize=18, fontfamily='monospace', fontweight='bold')
        plt.ylabel('Magnitude (dB)', fontsize=16, fontfamily='serif')
        plt.plot(omega, magdb, linewidth=2, color = 'brown')
        plt.plot([w_db], [0], marker='o', color = 'black', linewidth=2, label='ganho = 0')
        plt.plot([w_deg], magdb[k], marker='o', color = 'blue', linewidth=2, label= f'ganho = {magdb[k]:.2f}')
        plt.fill_between(omega[j:k], 0, magdb[j:k] , where = magdb[j:k] < 0 , color='green', alpha=0.5)
        plt.fill_between(omega[k:j], 0, magdb[k:j] , where = magdb[k:j] > 0 , color='red', alpha=0.5)
        plt.legend(fontsize=14, frameon=True, framealpha = 0.5, facecolor='white', loc=0)
        #plt.grid()
        
        plt.subplot(212)
        plt.semilogx()
        plt.ylabel('Fase (deg)', fontsize=16, fontfamily = 'serif')
        plt.xlabel('Frequência (rad/s)', fontsize=16, fontfamily = 'serif')
        plt.plot(omega, phasedg, linewidth=2, color='brown')
        plt.plot([w_deg], [-180], marker='o', color = 'blue', linewidth=2, label='fase = -180')
        plt.plot([w_db], [phasedg[j]], marker='o', color = 'black', linewidth=2, label=f'fase = {phasedg[j]:.2f}')
        plt.fill_between(omega[k:j], phasedg[k:j], -180 , where = phasedg[k:j] < -180, color='red', alpha=0.5)
        plt.fill_between(omega[j:], phasedg[j:], -180 , where = phasedg[j:] > -180, color='green', alpha=0.5)
        plt.legend(fontsize=14, frameon=True, framealpha = 0.5, facecolor='white', loc=0)
        #plt.grid()
        
        plt.show()
        


# ### Calculo da função de transferencia de malha aberta

# In[ ]:


G1 = tf([1], [1, 1])
G2 = tf([1], [1, 2])
G3 = tf([1], [1, 4])
gc = 6857 * tf([1, 1.18], [1, 16.32])
G = G1 * G2 * G3 * gc


# In[ ]:


MargemGanho(G).plot()

