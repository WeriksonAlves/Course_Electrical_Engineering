using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace classes
{
    public partial class Form1 : Form
    {
        //uma variavel que estiver aqui pode ser usada nos blocos abaixos

        public Form1()
        {
            InitializeComponent();
            
            //uma variavel que estiver aqui nao interfere no bloco abaixo
            //
        }

        private void button1_Click(object sender, EventArgs e)
        {
            pessoa p1 = new pessoa();

            p1.nome = "Werikson";
            p1.apelido = "Alves";
            p1.idade = 21;
            p1.Falar();
            p1.Apresentar_se();

            //pessoa p2 = new pessoa();
            //p2.nome = "Carlos";
            //p2.idade = 53;
            //p2.Falar();
        }
    }
}
