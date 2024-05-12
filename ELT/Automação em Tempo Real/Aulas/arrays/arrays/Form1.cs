using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace arrays
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void btn_executar_Click(object sender, EventArgs e)
        {
            ////ARRAY
            //int[] valores;
            //valores = new int[5];
            //valores[0] = 10;
            //valores[1] = 20;
            //valores[2] = 30;
            //valores[3] = 40;
            //valores[4] = 50;

            //int resultado = valores[0] + valores[3];
            //lista.Items.Add(resultado);

            int[] valores = new int[] { 10, 20, 30, 40, 50, 60, 70,19 };

            //foreach (int valor in valores)
            //    lista.Items.Add(valor);

            for (int indice = 0; indice < valores.Length; indice++)
                lista.Items.Add(valores[indice]);
        }
    }
}
