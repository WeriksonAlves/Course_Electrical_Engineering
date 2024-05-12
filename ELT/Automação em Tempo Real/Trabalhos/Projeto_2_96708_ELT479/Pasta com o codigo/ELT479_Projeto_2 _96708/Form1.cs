using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ELT479_Projeto_2__96708
{
    public partial class Form1 : Form
    {
        int x; //Posição horizontal
        int y; //Posição vertical
        int ID; //Identificação do avião
        bool verifica; //Verifica se existe este aviao        
        int N_hangar; //Identificação do hangar
        int N_aviao; //Identificação do hangar

        public Form1()
        {
            InitializeComponent();            
        }

        // Janela de trabalho 1ª a inicializar
        private void Form1_Load(object sender, EventArgs e)
        {
            picture_aviao.Visible = false; //Esconde o avião ao iniciar
        }

        // OK Timer para captar a hora atual
        private void timer_Tick(object sender, EventArgs e)
        {
            this.label_horario.Text = DateTime.Now.ToString("HH:mm:ss"); //Apresenta a hora na janela
        }

        // private int duration = 20;

        // OK Botão responsavel por indicar a chegada de um novo avião
        private void btn_novo_aviao_Click(object sender, EventArgs e)
        {
            x = 957; y = 55;                                     // Posição inicial dos aviões 
            picture_aviao.Location = new Point(x, y);            // Posiciona o avião
            picture_aviao.Visible = true;                        //Mostra o aviao na tela

            Random randNum = new Random();
            ID = randNum.Next(1, 11);                              //Gera um número aleatorio 1 a 10
            label_id.Text = "N°: " + ID;                            //Identifica o avião
            label_hora.Text = DateTime.Now.ToString("HH:mm:ss");    //Marca a chegada do avião atual
            verifica = false;
            
            while (verifica == false)
            {
                if (checkedListBox1.CheckedItems.Contains("Hangar Nº" + ID)) //aviao.Contains(ID))
                {
                    ID = randNum.Next(1, 11);                                //Gera um número aleatorio 1 a 10
                    label_id.Text = "N°: " + ID;                             //Identifica o avião
                    label_hora.Text = DateTime.Now.ToString("HH:mm:ss");     //Marca a chegada do avião atual

                }
                else
                {
                    N_hangar = ID - 1;
                    N_aviao = ID;
                    //checkedListBox1.SetItemChecked(N_hangar, true);  //Marca no inicio do pouso
                    verifica = true;
                }
            }
            timer_animacao.Enabled = true;                          //Começa a contagem do vôo
            btn_novo_aviao.Enabled = false;                         //Evita dois aviões na pista ao mesmo tempo
        }

        // OK Label responsavel por mostra a hora atual na tela
        private void label_horario_Click(object sender, EventArgs e)
        {

        }

        // OK Animação do vôo
        private void animacao()
        {
            picture_aviao.Location = new Point(x, y); // Reposiciona a imagem
        }

        // OK Temporizador responsavel por animar o voô (passo 100)
        private void timer_animacao_Tick(object sender, EventArgs e)
        {
            // Movimenta a imagem durante o vôo
            if (x <= 975 && x > 675) { x -= 3; animacao(); }

            // Movimenta sobre a pista de pouso ate x = 35; y = 155
            else if (x <= 675 && x > 46) { x -= 37; animacao(); }
            else if (x == 46 && y == 55) { x = 35; y = 81; animacao(); }
            else if (x == 35 && y >= 81 && y < 155)
            {
                y += 37;
                animacao();                    // Aguarda 1 segundo
                picture_aviao.Visible = false; // Avião entra no hangar
                checkedListBox1.SetItemChecked(N_hangar, true); //Marca o hangar atual 
                saida(N_hangar,ID);
                btn_novo_aviao.Enabled = true; // Botão é acinado novamente

            }
        }

        private async void saida(int N_hangar, int N_aviao)
        {
            await Task.Delay(60000);
            checkedListBox1.SetItemChecked(N_hangar, false);
            label3.Text = "Hangar Nº " + N_aviao + " liberado às " + DateTime.Now.ToString("HH:mm:ss");
        }
               
    }
}