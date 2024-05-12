using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ciclos
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void btn_executar_Click(object sender, EventArgs e)
        {
            ////FOR
            //for(int valor = 0; valor <= 50; valor++)
            //{
            //    lista.Items.Add(valor);
            //}

            ////FOR impar
            //for (int valor = 1; valor <= 100; valor+=2)
            //{
            //    lista.Items.Add(valor);
            //}

            ////WHILE
            //int vezes = 0;
            //while(vezes <= 100)
            //{
            //    lista.Items.Add(vezes++);// de 0 a 100
            //}

            ////DO
            //int vezes = 0;
            //do
            //{
            //    lista.Items.Add(vezes);
            //    vezes++;
            //} while (vezes <= 100);

            string frase = "Este ciclo é fantastico.";

            lista.Items.Add(frase);
            lista.Items.Add(frase.ToUpper());//transforma para letra maiuscula
            lista.Items.Add(frase.Length);//quantas letras

            foreach (char c in frase)
            {
                lista.Items.Add(c);//apresenta cada letra em um nova linha
            }



        }
    }
}
