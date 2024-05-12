using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace controledecondicoes
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void cmd_executar_Click(object sender, EventArgs e)
        {
            //// && and
            //// || or

            //// IF se 
            //int valor = 2;

            //if (valor <= 2)
            //{
            //    label_resultado.Text = "OK";
            //}
            //else if (valor == 1)
            //{

            //}
            //else
            //{
            //    label_resultado.Text = "Falso";
            //}
            //// ELSE caso contrario

            //int valor = 10;

            //switch (valor)
            //{
            //    //case = no caso de
            //    case 10:
            //        label_resultado.Test = "primeira opção";
            //        break;

            //    case 20:
            //        label_resultado.Text = "Segunda opção";
            //        break;

            //    default:
            //        label_resultado.Text = "Nenhum resultado";
            //        break;
            //}

            // operador ternario
            int valor 10;

            if (valor ==10)
            {
                label_resultado.Text = "sim";
            }
            else
            {
                label_resultado.Text = "não";
            }

            label_resultado.Text = valor == 10 ? "Sim" : "Não";
         }
    }
}
