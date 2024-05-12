using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace classes
{
    class pessoa
    {
        //public possibilita usar a classefora daqui
        public string nome;
        public string apelido;
        public int idade;
        private string cor_cabelo;

        //exemplo de metodos
        public void Falar()
        {
            System.Windows.Forms.MessageBox.Show("Olá, meu nome é " + nome + ".");
        }

        public void Apresentar_se()
        {
            //System.Windows.Forms.MessageBox.Show("O meu nome é " + nome + " e tenho " + idade + "anos.");
            System.Windows.Forms.MessageBox.Show(ConstruirNome());
        }
        private string ConstruirNome()
        {
            string N_comp = nome + " " + apelido;
            return N_comp;
        }
    }
}
