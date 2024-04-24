# Nome: Wérikson Frederiko de Oliveira Alves
# Data: 22/11/2018
# Matricula: 96708
# O programa utiliza classes para modelar um banco de varejo, usando classes
# para representar os clientes e as contas.
#
#.......................................................................
#
class Cliente:
    def __init__(self, nome, telefone):
        self.nome = nome
        self.telefone = telefone
#
#.......................................................................
#
class Conta:
    def __init__(self, clientes, numero, saldo=0.00):
        self.clientes = clientes
        self.numero = numero
        self.saldo = 0
        self.operacoes = []
        self.deposito(saldo)

    def deposito(self, valor):
        self.saldo += valor
        self.operacoes.append(("DEPÓSITO", valor))

    def extrato(self):
        print("\nExtrato da CC nº %s\n" % self.numero)
        for op in self.operacoes:
            print("%10s %10.2f\n" % (op[0], op[1]))
        print("%10s %10.2f" % ('SALDO', self.saldo))
        
    def saque(self, valor):
        if self.saldo >= valor:
            self.saldo -= valor
            self.operacoes.append(('SAQUE', valor))
        else:
            print('Você nao pode realizar esse saque')

    def resumo(self):
        print("\nCc nº %s Saldo: %10.2f" %
              (self.numero, self.saldo))
#
#.......................................................................
#
def main():
    cliente1 = Cliente("João Silva", "3234-7890")
    cliente2 = Cliente("Maria Silva", "3234-7890")
    cliente3 = Cliente("José Vargas", "2567-0987")
    
    conta1 = Conta([cliente1, cliente2], 1, 1000.00)
    conta2 = Conta([cliente3], 2, 500.00)
    
    conta1.saque(50.00)
    conta2.deposito(300.00)
    conta1.saque(190.00)
    conta2.deposito(95.15)
    conta2.saque(256.71)
    
    conta1.resumo()
    conta2.resumo()

    conta1.extrato()
    conta2.extrato()
#
#.......................................................................
#
main()
    
