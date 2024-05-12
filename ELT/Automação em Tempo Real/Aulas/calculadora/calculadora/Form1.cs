using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace calculadora
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Executar_Click(object sender, EventArgs e)
        {
            c1_matematica calculadora = new c1_matematica();
            //int Resultado = calculadora.Adicao(10,20);
            //int Resultado = calculadora.Subtracao(15, 20);
            //int_Resultado = calculadora.Multiplicao(5, 20)
            int Resultado = calculadora.Operacoes(10,5,"adicao");
            cdet.Text = Resultado.ToString();
        }
    }
}
