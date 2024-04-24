# Nome: Wérikson Frederiko de Oliveira Alves
# Data: 29/11/2018
# Matricula: 96708
# Com a modelagem da classe Cliente e Conta da aula anterior, foi  modelado a classe
# conta especial que é uma sub classe da classe conta, utilizando Herança, para
# estabelecer um limite, de forma que o cliente possa fazer um saque a descoberto.
#.......................................................................
from banco import Cliente, Conta

class Banco:
    def __init__(self, nome):
        self.nome = nome
        self.contas = []

    def abreConta(self, conta):
        self.contas.append(conta)

    def listaContas(self):
        print('\nContas do Banco', self.nome)
        for c in self.contas:
            c.resumo()    
#.......................................................................
class ContaEspecial(Conta):        
    def __init__(self,clientes, numero, saldo=0.00, limite=0.00):
        super().__init__(clientes, numero, saldo)
        self.limite = limite

    def saque(self, valor):
        if (self.saldo + self.limite) >= valor:
            self.saldo -= valor
            self.operacoes.append(("SAQUE", valor))
#.......................................................................
def main():
    cliente1 = Cliente("João Silva", "3456-7890")
    cliente2 = Cliente("Maria Silva", "3456-7890")
    cliente3 = Cliente("José Vargas", "2351-1809")
    contaJM = ContaEspecial([cliente1, cliente2],
    76534, 100.00, 500.00)
    contaJ = Conta([cliente3], 80297, 10.00)
    banco1 = Banco("Tatu")
    banco1.abreConta(contaJM)
    banco1.abreConta(contaJ)
    banco1.listaContas()
    contaJM.saque(50.00)
    contaJ.deposito(300.00)
    contaJM.saque(190.00)
    contaJ.deposito(95.26)
    contaJ.saque(245.00)
    contaJM.saque(654.38)    # não será realizado; ultrapassa limite
    contaJM.extrato()
    contaJ.extrato()
    banco1.listaContas()
#
#.......................................................................
#
main()
