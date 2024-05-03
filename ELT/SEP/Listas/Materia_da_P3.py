import numpy as np
from sympy import * #var, Lambda, exp, log, sin, cos, tan, sqrt, ln
from math import inf
from fractions import Fraction

class Anel:
    def __init__(self, V_Base, S_Base):
        self.V_Base = V_Base
        self.S_Base = S_Base
    #.....................................................................................................................................   
    def Corrente_3F(self, k, z_k_k):
        self.z_k_k_3F = z_k_k
        print('\n..........3F - Corrente de CC na barra K..........\n')
        i_cc_k = 1/self.z_k_k_3F
        I_Base = self.S_Base/((3**0.5)*self.V_Base)
        I_cc_k = i_cc_k *I_Base
        print('\n Portanto, para um curto trifásico equilibrado em anel, temos que:')
        print('i_cc_',k,' = ',i_cc_k,' pu.')
        print('\nI_Base = ', I_Base, ' A.\n')
        print('I_cc_',k,' = ',abs(I_cc_k),'<',(180/pi)*arg(I_cc_k),' A.')
    #.....................................................................................................................................   
    def Tensão_3F(self, i, z_i_k):
        print('\n..........3F - Tensão na barra vizinha i..........\n')
        v_r_i = 1 - (z_i_k/self.z_k_k_3F)
        V_r_i = v_r_i*self.V_Base/(3**0.5)
        print('\n Portanto, para um curto trifásico equilibrado em anel, temos que:')
        print('v_r_',i,' = ',v_r_i,' pu.')
        print('\nV_Base = ', self.V_Base/(3**0.5), ' V.\n')
        print('V_r_', i, ' = ', abs(V_r_i),'<',(180/pi)*arg(V_r_i),' V.')
    #.....................................................................................................................................   
    def Fluxo_3F(self, p, q, z_p_k, z_q_k, z_p_q):
        print('\n..........3F - Fluxo de corrente na linha vizinha p-q..........\n')
        i_p_q = ((z_q_k - z_p_k)/(self.z_k_k_3F))*((1)/(z_p_q))
        I_Base = self.S_Base/((3**0.5)*self.V_Base)
        I_p_q = i_p_q*I_Base
        print('\n Portanto, para um curto trifásico equilibrado em anel, temos que:')
        print('i_',p,'-',q,' = ', i_p_q, ' pu.')
        print('\nI_Base = ', I_Base, ' A.\n')
        print('I_',p,'-',q,' = ', abs(I_p_q),'<',(180/pi)*arg(I_p_q),' A.')
    #.....................................................................................................................................   
    def Corrente_2F(self, k, z_k_k):
        self.z_k_k_2F = z_k_k
        print('\n..........2F - Corrente de CC na barra K..........\n')
        i_A_pos = (100)/(2*self.z_k_k_2F)
        i_A_neg = -(100)/(2*self.z_k_k_2F)
        i_A = i_A_pos + i_A_neg
        i_B = complex(0,- (100*(3**0.5))/(2*self.z_k_k_2F))
        i_C = complex(0,  (100*(3**0.5))/(2*self.z_k_k_2F))
        I_Base = self.S_Base/((3**0.5)*self.V_Base)
        I_A = i_A*I_Base
        I_B = i_B*I_Base
        I_C = i_C*I_Base
        print('\n Portanto, para um curto bifásico em anel, temos que:')
        print('i_A_pos = ', i_A_pos, ' pu.')
        print('i_A_neg = ', i_A_neg, ' pu.')
        print('i_A_zero = 0 pu.\n')
        print('i_cc_A',k,' = ', i_A, ' pu.')
        print('i_cc_B',k,' = ', i_B, ' pu.')
        print('i_cc_C',k,' = ', i_C, ' pu.')
        print('\nI_Base = ', I_Base, ' A.\n')
        print('I_cc_A',k,' = ', abs(I_A),'<',(180/pi)*arg(I_A),' A.')
        print('I_cc_B',k,' = ', abs(I_B),'<',(180/pi)*arg(I_B),' A.')
        print('I_cc_C',k,' = ', abs(I_C),'<',(180/pi)*arg(I_C),' A.')
    #.....................................................................................................................................   
    def Tensão_2F(self, i, z_i_k):
        print('\n..........2F - Tensão na barra vizinha i..........\n')
        v_i_pos = (100) - (100*z_i_k)/(2*self.z_k_k_2F)
        v_i_neg = (100*z_i_k)/(2*self.z_k_k_2F)      
        v_A_i = (v_i_pos + v_i_neg)/100
        v_B_i = (v_i_pos*complex(-0.5,-(3**0.5)/2) + v_i_neg*complex(-0.5,(3**0.5)/2))/100
        v_C_i = (v_i_pos*complex(-0.5,(3**0.5)/2) + v_i_neg*complex(-0.5,-(3**0.5)/2))/100
        V_Base = self.V_Base/(3**0.5)
        V_A_i = v_A_i*V_Base
        V_B_i = v_B_i*V_Base
        V_C_i = v_C_i*V_Base     
        print('\n Portanto, para um curto bifásico em anel, temos que:')
        print('v_i_pos = ',v_i_pos, ' pu.')
        print('v_i_neg = ',v_i_neg, ' pu.')
        print('v_i_zero = 0 pu.\n')
        print('v_A_', i, ' = ',v_A_i, ' pu.')
        print('v_B_', i, ' = ',v_B_i, ' pu.')
        print('v_C_', i, ' = ',v_C_i, ' pu.')
        print('\nV_Base = ', self.V_Base/(3**0.5), ' V.\n')
        print('V_A_', i, ' = ', abs(V_A_i),'<',(180/pi)*arg(V_A_i),' V.')
        print('V_B_', i, ' = ', abs(V_B_i),'<',(180/pi)*arg(V_B_i),' V.')
        print('V_C_', i, ' = ', abs(V_C_i),'<',(180/pi)*arg(V_C_i),' V.')
    #.....................................................................................................................................   
    def Fluxo_2F(self, p, q, z_p_k, z_q_k, z_p_q):
        print('\n..........2F - Fluxo de corrente na linha vizinha p-q..........\n')
        i_p_q_pos = (100/z_p_q)*((z_q_k - z_p_k)/(2*self.z_k_k_2F))
        i_p_q_neg = (100/z_p_q)*((z_p_k - z_q_k)/(2*self.z_k_k_2F))
        i_p_q_A = i_p_q_pos + i_p_q_neg
        i_p_q_B = (i_p_q_pos*complex(-0.5,-(3**0.5)/2) + i_p_q_neg*complex(-0.5,(3**0.5)/2))
        i_p_q_C = (i_p_q_pos*complex(-0.5,(3**0.5)/2) + i_p_q_neg*complex(-0.5,-(3**0.5)/2))  
        I_Base = self.S_Base/((3**0.5)*self.V_Base)
        I_p_q_A = i_p_q_A*I_Base
        I_p_q_B = i_p_q_B*I_Base
        I_p_q_C = i_p_q_C*I_Base
        print('\n Portanto, para um curto bifásico em anel, temos que:')
        print('i_p_q_pos = ',i_p_q_pos,' pu.')
        print('i_p_q_neg = ',i_p_q_neg,' pu.')
        print('i_p_q_zero = 0 pu.\n')
        print('i_A_',p,'-',q,' = ',i_p_q_A,' pu.')
        print('i_B_',p,'-',q,' = ',i_p_q_B,' pu.')
        print('i_C_',p,'-',q,' = ',i_p_q_C,' pu.')
        print('\nI_Base = ', I_Base, ' A.\n')
        print('I_A_',p,'-',q,' = ',abs(I_p_q_A),'<',(180/pi)*arg(I_p_q_A),' A.')
        print('I_B_',p,'-',q,' = ',abs(I_p_q_B),'<',(180/pi)*arg(I_p_q_B),' A.')
        print('I_C_',p,'-',q,' = ',abs(I_p_q_C),'<',(180/pi)*arg(I_p_q_C),' A.')
    #.....................................................................................................................................   
    def Corrente_1F(self, k, z_k_k_pos, z_k_k_zero):
        self.z_k_k_pos = z_k_k_pos
        self.z_k_k_zero = z_k_k_zero
        print('\n..........1F - Corrente de CC na barra K..........\n')
        i_A_pos = (100)/(2*self.z_k_k_pos + self.z_k_k_zero)
        i_A_neg = i_A_pos
        i_A_zero = i_A_pos
        i_A = i_A_pos + i_A_neg + i_A_zero
        i_B = (i_A_pos*complex(-0.5,-(3**0.5)/2) + i_A_neg*complex(-0.5,(3**0.5)/2)) + i_A_zero
        i_C = (i_A_pos*complex(-0.5,(3**0.5)/2) + i_A_neg*complex(-0.5,-(3**0.5)/2)) + i_A_zero
        I_Base = self.S_Base/((3**0.5)*self.V_Base)
        I_A = i_A*I_Base
        I_B = i_B*I_Base
        I_C = i_C*I_Base
        print('\n Portanto, para um curto monofásico em anel, temos que:')
        print('i_A_pos = ', i_A_pos, ' pu.')
        print('i_A_neg = ', i_A_neg, ' pu.')
        print('i_A_zero = ', i_A_zero, ' pu.\n')
        print('i_cc_A',k,' = ', i_A, ' pu.')
        print('i_cc_B',k,' = ', i_B, ' pu.')
        print('i_cc_C',k,' = ', i_C, ' pu.')
        print('\nI_Base = ', I_Base, ' A.\n')
        print('I_cc_A',k,' = ', abs(I_A),'<',(180/pi)*arg(I_A),' A.')
        print('I_cc_B',k,' = ', abs(I_B),'<',(180/pi)*arg(I_B),' A.')
        print('I_cc_C',k,' = ', abs(I_C),'<',(180/pi)*arg(I_C),' A.')
    #.....................................................................................................................................   
    def Tensão_1F(self, i, z_i_k_pos, z_i_k_zero):
        print('\n..........1F - Tensão na barra vizinha i..........\n')
        v_i_pos = (100) - (100*z_i_k_pos)/(2*self.z_k_k_pos + self.z_k_k_zero)
        v_i_neg = (100*z_i_k_pos)/(2*self.z_k_k_pos + self.z_k_k_zero) 
        v_i_zero = (100*z_i_k_zero)/(2*self.z_k_k_pos + self.z_k_k_zero)
        v_A_i = 1 -(2*z_i_k_pos + z_i_k_zero)/(2*self.z_k_k_pos + self.z_k_k_zero)
        v_B_i = complex(-0.5,-(3**0.5)/2) - (z_i_k_zero - z_i_k_pos)/(2*self.z_k_k_pos + self.z_k_k_zero)
        v_C_i = complex(-0.5,(3**0.5)/2)  - (z_i_k_zero - z_i_k_pos)/(2*self.z_k_k_pos + self.z_k_k_zero)
        V_A_i = v_A_i*self.V_Base/(3**0.5)
        V_B_i = v_B_i*self.V_Base/(3**0.5)
        V_C_i = v_C_i*self.V_Base/(3**0.5)        
        print('\n Portanto, para um curto monofásico em anel, temos que:')
        print('v_i_pos = ',v_i_pos, ' pu.')
        print('v_i_neg = ',v_i_neg, ' pu.')
        print('v_i_zero = ',v_i_zero, ' pu.\n')
        print('v_A_', i, ' = ',v_A_i, ' pu.')
        print('v_B_', i, ' = ',v_B_i, ' pu.')
        print('v_C_', i, ' = ',v_C_i, ' pu.')
        print('\nV_Base = ', self.V_Base/(3**0.5), ' V.\n')
        print('V_A_', i, ' = ', abs(V_A_i),'<',(180/pi)*arg(V_A_i),' V.')
        print('V_B_', i, ' = ', abs(V_B_i),'<',(180/pi)*arg(V_B_i),' V.')
        print('V_C_', i, ' = ', abs(V_C_i),'<',(180/pi)*arg(V_C_i),' V.')
    #.....................................................................................................................................   
    def Fluxo_1F(self, p, q, z_p_k_pos, z_q_k_pos, z_p_q_pos, z_p_k_zero, z_q_k_zero, z_p_q_zero):
        print('\n..........1F - Fluxo de corrente na linha vizinha p-q..........\n')
        i_p_q_pos = (1/z_p_q_pos)*((z_q_k_pos - z_p_k_pos)/(2*self.z_k_k_pos + self.z_k_k_zero))
        i_p_q_neg = (1/z_p_q_pos)*((z_q_k_pos - z_p_k_pos)/(2*self.z_k_k_pos + self.z_k_k_zero))
        i_p_q_zero = (1/z_p_q_zero)*((z_q_k_zero - z_p_k_zero)/(2*self.z_k_k_pos + self.z_k_k_zero))
        
        i_p_q_A = (100/(2*self.z_k_k_pos + self.z_k_k_zero))*((2*(z_q_k_pos - z_p_k_pos)/z_p_q_pos)+((z_q_k_zero - z_p_k_zero)/z_p_q_zero))
        i_p_q_B = (100/(2*self.z_k_k_pos + self.z_k_k_zero))*((  (z_p_k_pos - z_q_k_pos)/z_p_q_pos)+((z_q_k_zero - z_p_k_zero)/z_p_q_zero))
        i_p_q_C = (100/(2*self.z_k_k_pos + self.z_k_k_zero))*((  (z_p_k_pos - z_q_k_pos)/z_p_q_pos)+((z_q_k_zero - z_p_k_zero)/z_p_q_zero)) 
        
        '''i_p_q_A = i_p_q_pos + i_p_q_neg
        i_p_q_B = (i_p_q_pos*complex(-0.5,-(3**0.5)/2) + i_p_q_neg*complex(-0.5,(3**0.5)/2))
        i_p_q_C = (i_p_q_pos*complex(-0.5,(3**0.5)/2) + i_p_q_neg*complex(-0.5,-(3**0.5)/2))'''  
        I_Base = self.S_Base/((3**0.5)*self.V_Base)
        I_p_q_A = i_p_q_A*I_Base
        I_p_q_B = i_p_q_B*I_Base
        I_p_q_C = i_p_q_C*I_Base
        print('\n Portanto, para um curto monofásico em anel, temos que:')
        print('i_p_q_pos = ',i_p_q_pos,' pu.')
        print('i_p_q_neg = ',i_p_q_neg,' pu.')
        print('i_p_q_zero = 0 pu.\n')
        print('i_A_',p,'-',q,' = ',i_p_q_A,' pu.')
        print('i_B_',p,'-',q,' = ',i_p_q_B,' pu.')
        print('i_C_',p,'-',q,' = ',i_p_q_C,' pu.')
        print('\nI_Base = ', I_Base, ' A.\n')
        print('I_A_',p,'-',q,' = ',abs(I_p_q_A),'<',(180/pi)*arg(I_p_q_A),' A.')
        print('I_B_',p,'-',q,' = ',abs(I_p_q_B),'<',(180/pi)*arg(I_p_q_B),' A.')
        print('I_C_',p,'-',q,' = ',abs(I_p_q_C),'<',(180/pi)*arg(I_p_q_C),' A.')
#.....................................................................................................................................
class Autotransformador:
    def __init__(self, V_Base_1,V_Base_2,V_Base_3,S_Base):
        self.V_Base_1 = V_Base_1
        self.V_Base_2 = V_Base_2
        self.V_Base_3 = V_Base_3
        self.S_Base = S_Base
    #.....................................................................................................................................
    def Impedancias(self,z_hl_pos,z_ht_pos,z_lt_pos,S_hl,S_ht,S_lt):
        print('\n..........Conversão das impedâncias..........\n')
        z_hl = z_hl_pos*self.S_Base/S_hl
        z_ht = z_ht_pos*self.S_Base/S_ht
        z_lt = z_lt_pos*self.S_Base/S_lt
        self.z_h = (z_hl + z_ht - z_lt)/2
        self.z_l = (z_hl - z_ht + z_lt)/2
        self.z_t = (-z_hl + z_ht + z_lt)/2
        print('\n Após a mudança de base, temos que:')
        print('z_HL = ',z_hl,'% pu.')
        print('z_HT = ',z_ht,'% pu.')
        print('z_LT = ',z_lt,'% pu.\n')
        print('z_H = ',self.z_h,'% pu.')
        print('z_L = ',self.z_l,'% pu.')
        print('z_T = ',self.z_t,'% pu.\n')
    #.....................................................................................................................................
    def Curto_3F(self,Local,z_G1_pos,z_G1_zero,z_G2_pos,z_G2_zero):
        print('\n..........3F - Cálculo do curto circuito na barra..........\n')
        if(Local == 'H' or Local == 'h'):
            z1 = z_G1_pos
            z2 = self.z_h + self.z_l + z_G2_pos
            z3 = self.z_t
            z_eq_pos = (z1*z2)/(z1 + z2)
            I_Base = self.S_Base/(self.V_Base_1*(3**0.5))
        elif(Local == 'L' or Local == 'l'):
            z1 = z_G1_pos + self.z_h + self.z_l
            z2 = z_G2_pos
            z3 = self.z_t
            z_eq_pos = (z1*z2)/(z1 + z2)
            I_Base = self.S_Base/(self.V_Base_2*(3**0.5))
        elif(Local == 'T' or Local == 't'):
            z1 = z_G1_pos + self.z_h
            z2 = self.z_l + z_G2_pos
            z3 = self.z_t
            z_eq_pos = ((z1*z2)/(z1 + z2)) + z3
            I_Base = self.S_Base/(self.V_Base_3*(3**0.5))
        else:
            print('Local de curto incorreto, tente de novo')
            return None
        i_cc = 100/z_eq_pos
        I_cc = i_cc*I_Base
        print('\n Após definido o curto (em ',Local,'), temos que:')
        print('z1 = ',z1,'% pu.')
        print('z2 = ',z2,'% pu.')
        print('z3 = ',z3,'% pu.\n')
        print('z_eq_pos = ',z_eq_pos,'% pu.\n')
        print('\n Portanto, para um curto trifásico em um autotransformador, temos que:')
        print('i_cc',Local,' = ',i_cc,' pu.')
        print('I_Base = ',I_Base,' A.')
        print('I_cc_',Local,' = ',I_cc,' A.')
    #.....................................................................................................................................
    def Curto_1F(self,Local,z_G1_pos,z_G1_zero,z_G2_pos,z_G2_zero):
        self.z_G1_pos = z_G1_pos
        self.z_G2_pos = z_G2_pos
        self.z_G1_zero = z_G1_zero
        self.z_G2_zero = z_G2_zero
        self.Local = Local
        print('\n..........1F - Cálculo do curto circuito na barra..........\n')
        if(Local == 'H' or Local == 'h'):
            z1_pos = z_G1_pos
            z2_pos = self.z_h + self.z_l + z_G2_pos
            z3_pos = self.z_t
            z_eq_pos = (z1_pos*z2_pos)/(z1_pos + z2_pos)
            z1_zero = z_G1_zero
            z2_zero = self.z_h + ((self.z_l + z_G2_zero)*self.z_t)/((self.z_l + z_G2_zero) + self.z_t)
            z_eq_zero = (z1_zero*z2_zero)/(z1_zero + z2_zero)
            I_Base = self.S_Base/(self.V_Base_1*(3**0.5))
        elif(Local == 'L' or Local == 'l'):
            z1_pos = z_G1_pos + self.z_h + self.z_l
            z2_pos = z_G2_pos
            z3_pos = self.z_t
            z_eq_pos = (z1_pos*z2_pos)/(z1_pos + z2_pos)
            z1_zero = ((z_G1_zero + self.z_h)*self.z_t)/((z_G1_zero + self.z_h) + self.z_t) + self.z_l
            z2_zero = z_G2_zero
            z_eq_zero = (z1_zero*z2_zero)/(z1_zero + z2_zero)
            I_Base = self.S_Base/(self.V_Base_2*(3**0.5))
        elif(Local == 'T' or Local == 't'):
            z1_pos = z_G1_pos + self.z_h
            z2_pos = self.z_l + z_G2_pos
            z3_pos = self.z_t
            z_eq_pos = (z1_pos*z2_pos)/(z1_pos + z2_pos) + z3_pos
            z1_zero = z_G1_zero + self.z_h
            z2_zero = self.z_l + z_G2_zero
            z3_zero = self.z_t
            z_eq_zero = ((z1_zero*z2_zero)/(z1_zero + z2_zero)) + z3_zero            
            I_Base = self.S_Base/(self.V_Base_3*(3**0.5))
        else:
            print('Local de curto incorreto, tente de novo')
            return None
        print('\n Após definido o curto (em ',Local,'), temos que:')
        print('z1_pos = ',z1_pos,'% pu.')
        print('z2_pos = ',z2_pos,'% pu.')
        print('z3_pos = ',z3_pos,'% pu.\n')
        print('z_eq_pos = ',z_eq_pos,'% pu.\n')
        print('z1_zero = ',z1_zero,'% pu.')
        print('z2_zero = ',z2_zero,'% pu.')
        print('z_eq_zero = ',z_eq_zero,'% pu.\n')        
        i_A_pos = 100/(2*z_eq_pos + z_eq_zero)
        i_A_neg = i_A_pos
        i_A_zero = i_A_pos
        i_A = i_A_pos + i_A_neg + i_A_zero
        i_B = (i_A_pos*complex(-0.5,-(3**0.5)/2) + i_A_neg*complex(-0.5,(3**0.5)/2)) + i_A_zero
        i_C = (i_A_pos*complex(-0.5,(3**0.5)/2) + i_A_neg*complex(-0.5,-(3**0.5)/2)) + i_A_zero
        I_A = i_A*I_Base
        I_B = i_B*I_Base
        I_C = i_C*I_Base
        print('\n Portanto, para um curto monofásico na barra ',Local,' de um autotransformador, temos que:')       
        print('i_A_pos = ', i_A_pos, ' pu.')
        print('i_A_neg = ', i_A_neg, ' pu.')
        print('i_A_zero = ', i_A_zero, ' pu.\n')
        print('i_cc_A',Local,' = ', i_A, ' pu.')
        print('i_cc_B',Local,' = ', i_B, ' pu.')
        print('i_cc_C',Local,' = ', i_C, ' pu.')
        print('\nI_Base = ', I_Base, ' A.\n')
        print('I_cc_A',Local,' = ', abs(I_A),'<',(180/pi)*arg(I_A),' A.')
        print('I_cc_B',Local,' = ', abs(I_B),'<',(180/pi)*arg(I_B),' A.')
        print('I_cc_C',Local,' = ', abs(I_C),'<',(180/pi)*arg(I_C),' A.')
        
        self.Correntes_individuais(Local,i_A_pos)
    #.....................................................................................................................................
    def Correntes_individuais(self,Local,i_A_pos):
        if(Local == 'H' or Local == 'h'):
            z1_pos = self.z_G1_pos
            z2_pos = self.z_h + self.z_l + self.z_G2_pos
            z3_pos = self.z_t
            z1_zero = self.z_G1_zero
            z2_zero = self.z_h
            z3_zero = self.z_t
            z4_zero = self.z_l + self.z_G2_zero
            z0 = (z3_zero*z4_zero)/(z3_zero + z4_zero)
            I_Base = self.S_Base/(self.V_Base_1*(3**0.5))
            i_A_p_G1 = i_A_pos*(z2_pos/(z1_pos + z2_pos))
            i_A_p_zh = i_A_pos - i_A_p_G1
            i_A_z_G1 = i_A_pos*((z2_zero + z0)/(z1_zero + (z2_zero + z0)))
            i_A_z_zh = i_A_pos - i_A_z_G1
            i_A_z_zt = i_A_z_zh*(z4_zero/(z3_zero + z4_zero))
            i_A_z_zl = i_A_z_zh - i_A_z_zt
            print('\n..........Correntes..........\n')
            print('\nI_Base = ', I_Base, ' A.\n')
            print('\n Para a sequência positiva, na barra ',Local,', temos que:')       
            print('i_A_G1 = ', i_A_p_G1, ' pu ==> I_A_G1 = ', i_A_p_G1*I_Base, ' A.')
            print('i_A_zh = ', i_A_p_zh, ' pu ==> I_A_zh = ', i_A_p_zh*I_Base, ' A.')
            print('i_A_zl = ', i_A_p_zh, ' pu ==> I_A_zl = ', i_A_p_zh*I_Base, ' A.')
            print('i_A_zt = 0 pu ==> I_A_zt = 0 A.')
            print('i_A_G2 = ', i_A_p_zh, ' pu ==> I_A_G2 = ', i_A_p_zh*I_Base, ' A.\n')
            print('\n Para a sequência negativa, o resultado é o mesmo da sequência positiva.\n')
            print('\n Para a sequência zero, na barra ',Local,', temos que:')       
            print('i_A_G1 = ', i_A_z_G1, ' pu ==> I_A_G1 = ', i_A_z_G1*I_Base, ' A.')
            print('i_A_zh = ', i_A_z_zh, ' pu ==> I_A_zh = ', i_A_z_zh*I_Base, ' A.')
            print('i_A_zl = ', i_A_z_zl, ' pu ==> I_A_zl = ', i_A_z_zl*I_Base, ' A.')
            print('i_A_zt = ', i_A_z_zt, ' pu ==> I_A_zt = ', i_A_z_zt*I_Base, ' A.')
            print('i_A_G2 = ', i_A_z_zl, ' pu ==> I_A_G2 = ', i_A_z_zl*I_Base, ' A.\n')
            self.Contribuições(i_A_p_G1,i_A_p_zh,i_A_z_G1,i_A_z_zh,i_A_z_zt,i_A_z_zl)
        elif(Local == 'L' or Local == 'l'):
            z1_pos = self.z_G1_pos + self.z_h + self.z_l 
            z2_pos = self.z_G2_pos
            z3_pos = self.z_t
            z1_zero = self.z_G1_zero + self.z_h
            z2_zero = self.z_l
            z3_zero = self.z_t
            z4_zero = self.z_G2_zero
            z0 = (z3_zero*z1_zero)/(z3_zero + z1_zero)
            I_Base = self.S_Base/(self.V_Base_2*(3**0.5))
            i_A_p_zl = i_A_pos*(z2_pos/(z1_pos + z2_pos))
            i_A_p_G2 = i_A_pos - i_A_p_zl
            i_A_z_zl = i_A_pos*((z4_zero)/(z2_zero + (z4_zero + z0)))
            i_A_z_G2 = i_A_pos - i_A_z_zl
            i_A_z_zt = i_A_z_zl*(z1_zero/(z3_zero + z1_zero))
            i_A_z_zh = i_A_z_zl - i_A_z_zt
            print('\n..........Correntes..........\n')
            print('\nI_Base = ', I_Base, ' A.\n')
            print('\n Para a sequência positiva, na barra ',Local,', temos que:')       
            print('i_A_G1 = ', i_A_p_zl, ' pu ==> I_A_G1 = ', i_A_p_zl*I_Base, ' A.')
            print('i_A_zh = ', i_A_p_zl, ' pu ==> I_A_zh = ', i_A_p_zl*I_Base, ' A.')
            print('i_A_zl = ', i_A_p_zl, ' pu ==> I_A_zl = ', i_A_p_zl*I_Base, ' A.')
            print('i_A_zt = 0 pu ==> I_A_zt = 0 A.')
            print('i_A_G2 = ', i_A_p_G2, ' pu ==> I_A_G2 = ', i_A_p_G2*I_Base, ' A.\n')
            print('\n Para a sequência negativa, o resultado é o mesmo da sequência positiva.\n')
            print('\n Para a sequência zero, na barra ',Local,', temos que:')       
            print('i_A_G1 = ', i_A_z_zh, ' pu ==> I_A_G1 = ', i_A_z_zh*I_Base, ' A.')
            print('i_A_zh = ', i_A_z_zh, ' pu ==> I_A_zh = ', i_A_z_zh*I_Base, ' A.')
            print('i_A_zl = ', i_A_z_zl, ' pu ==> I_A_zl = ', i_A_z_zl*I_Base, ' A.')
            print('i_A_zt = ', i_A_z_zt, ' pu ==> I_A_zt = ', i_A_z_zt*I_Base, ' A.')
            print('i_A_G2 = ', i_A_z_G2, ' pu ==> I_A_G2 = ', i_A_z_G2*I_Base, ' A.\n')
            self.Contribuições(i_A_p_zl, i_A_p_G2, i_A_z_zh, i_A_z_zl, i_A_z_zt, i_A_z_G2)
    #.....................................................................................................................................
    def Contribuições(self,    i_A_p_G1, i_A_p_zh, i_A_z_G1, i_A_z_zh, i_A_z_zt, i_A_z_zl):
        print('\n..........Contribuição do ',self.V_Base_1,'..........\n')
        i_A =  i_A_p_G1 + i_A_p_G1 + i_A_z_G1
        i_B = (i_A_p_G1*complex(-0.5,-(3**0.5)/2) + i_A_p_G1*complex(-0.5,(3**0.5)/2)) + i_A_z_G1
        i_C = (i_A_p_G1*complex(-0.5,(3**0.5)/2) + i_A_p_G1*complex(-0.5,-(3**0.5)/2)) + i_A_z_G1
        I_Base = self.S_Base/(self.V_Base_1*(3**0.5))
        I_A = i_A*I_Base
        I_B = i_B*I_Base
        I_C = i_C*I_Base
        print('i_cc_A = ', i_A, ' pu.')
        print('i_cc_B = ', i_B, ' pu.')
        print('i_cc_C = ', i_C, ' pu.')
        print('\nI_Base = ', I_Base, ' A.\n')
        print('I_cc_A = ', abs(I_A),'<',(180/pi)*arg(I_A),' A.')
        print('I_cc_B = ', abs(I_B),'<',(180/pi)*arg(I_B),' A.')
        print('I_cc_C = ', abs(I_C),'<',(180/pi)*arg(I_C),' A.')
        
        print('\n..........Contribuição do Autotransformador..........\n')
        i_Atf =  i_A_p_zh + i_A_p_zh + i_A_z_zh
        i_Btf = (i_A_p_zh*complex(-0.5,-(3**0.5)/2) + i_A_p_zh*complex(-0.5,(3**0.5)/2)) + i_A_z_zh
        i_Ctf = (i_A_p_zh*complex(-0.5,(3**0.5)/2) + i_A_p_zh*complex(-0.5,-(3**0.5)/2)) + i_A_z_zh
        I_Base = self.S_Base/(self.V_Base_1*(3**0.5))
        I_Atf = i_Atf*I_Base
        I_Btf = i_Btf*I_Base
        I_Ctf = i_Ctf*I_Base
        print('i_cc_A = ', i_Atf, ' pu.')
        print('i_cc_B = ', i_Btf, ' pu.')
        print('i_cc_C = ', i_Ctf, ' pu.')
        print('\nI_Base = ', I_Base, ' A.\n')
        print('I_cc_A = ', abs(I_Atf),'<',(180/pi)*arg(I_Atf),' A.')
        print('I_cc_B = ', abs(I_Btf),'<',(180/pi)*arg(I_Btf),' A.')
        print('I_cc_C = ', abs(I_Ctf),'<',(180/pi)*arg(I_Ctf),' A.')
        print('\n..........Contribuição do ',self.V_Base_2,'..........\n')
        i_A2 =  i_A_p_zh + i_A_p_zh + i_A_z_zl
        i_B2 = (i_A_p_zh*complex(-0.5,-(3**0.5)/2) + i_A_p_zh*complex(-0.5,(3**0.5)/2)) + i_A_z_zl
        i_C2 = (i_A_p_zh*complex(-0.5,(3**0.5)/2) + i_A_p_zh*complex(-0.5,-(3**0.5)/2)) + i_A_z_zl
        I_Base = self.S_Base/(self.V_Base_2*(3**0.5))
        I_A2 = i_A2*I_Base
        I_B2 = i_B2*I_Base
        I_C2 = i_C2*I_Base
        print('i_cc_A = ', i_A2, ' pu.')
        print('i_cc_B = ', i_B2, ' pu.')
        print('i_cc_C = ', i_C2, ' pu.')
        print('\nI_Base = ', I_Base, ' A.\n')
        print('I_cc_A = ', abs(I_A2),'<',(180/pi)*arg(I_A2),' A.')
        print('I_cc_B = ', abs(I_B2),'<',(180/pi)*arg(I_B2),' A.')
        print('I_cc_C = ', abs(I_C2),'<',(180/pi)*arg(I_C2),' A.')
        print('\n..........Contribuição da Corrente no Neutro do Autotransformador..........\n')
        I1 = I_A2 - I_Atf
        I2 = I_Btf - I_B2
        I3 = I_Ctf - I_C2
        Inh = I1 - I2 - I3
        print('I_NH = (I_Atf - I_A_G2)-(I_B_G2 - I_B_G2)-(I_Ctf - I_C_G2) = ',Inh,' A.')
        print('\n..........Contribuição da Corrente no Delta do Autotransformador..........\n')
        I_Base = self.S_Base/(self.V_Base_3*(3))
        Idelta = i_A_z_zt*I_Base
        print('\nI_Base = ', I_Base, ' A.\n')
        print('I_Delta = i_A_z_zt*I_Base = ',Idelta,' A.')  