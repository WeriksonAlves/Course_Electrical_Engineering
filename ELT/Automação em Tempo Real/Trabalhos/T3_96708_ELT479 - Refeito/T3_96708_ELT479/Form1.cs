using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;



namespace T3_96708_ELT479
{
    public partial class Form1 : Form
    {
        //Definições das variaveis utilizadas
        int ID;         //Numero para o hangar      
        int N_hangar;   //Numero do hangar na checklistbox
        int N_aviao;    //Numero do aviao
        bool verifica; //Verifica se o hangar está ocupado
        List<Class1> Lista_de_Avioes = new List<Class1>();
        List<Class_2> estacionamento = new List<Class_2>();
        Random randNum = new Random();
        Mutex m = new Mutex();

        public int x = 957;      //Posição na horizontal
        public int y = 55;      //Posição na vertical
        public int identidade = 0;
        public int variavel;
        public int cor;

        Mutex Pista_ON = new Mutex();


        //====================================================
        string pasta_images = "";
        Image img_fundo;
        Image img_1;
        Image img_2;
        Image img_3;
        Image img_4;
        Image img_5;
        Image img_6;
        Image img_7;
        Image img_8;
        Image img_9;
        Image img_10;
        int num = 0;

        // OK - Inicializa o sistema
        public Form1()
        {
            InitializeComponent();
            //====================================================
            pasta_images = Application.StartupPath + @"\images\";

            //====================================================
            img_fundo = Image.FromFile(pasta_images + "Fundo.png");
            img_1 = Image.FromFile(pasta_images + "Pousa1.png");
            img_2 = Image.FromFile(pasta_images + "Pousa2.png");
            img_3 = Image.FromFile(pasta_images + "Pousa3.png");
            img_4 = Image.FromFile(pasta_images + "Pousa4.png");
            img_5 = Image.FromFile(pasta_images + "Pousa5.png");
            img_6 = Image.FromFile(pasta_images + "Pousa6.png");
            img_7 = Image.FromFile(pasta_images + "Pousa7.png");
            img_8 = Image.FromFile(pasta_images + "Pousa8.png");
            img_9 = Image.FromFile(pasta_images + "Pousa9.png");
            img_10 = Image.FromFile(pasta_images + "Pousa10.png");

            //====================================================
            Bitmap imgback = new Bitmap(pictureBox_Fundo.Width, pictureBox_Fundo.Height);
            Graphics desenhador = Graphics.FromImage(imgback);
            //====================================================
            //Desenho aeroporto
            desenhador.Clear(Color.Transparent);

            desenhador.DrawImage(img_fundo,
                                 new Rectangle(0, 0, 1000, 450),
                                 new Rectangle(0, 0, 1000, 450),
                                 GraphicsUnit.Pixel);
            pictureBox_Fundo.BackgroundImage = imgback;
            //====================================================
            Adicionando();
            timer1.Enabled = true;
            timer1.Interval = 10;
        }

        public void Adicionando()
        {
            //====================================================
            Point reg_1 = reg1.Location;
            Point reg_2 = reg2.Location;
            Point reg_3 = reg3.Location;
            Point reg_4 = reg4.Location;
            Point reg_5 = reg5.Location;
            Point reg_6 = reg6.Location;
            Point reg_7 = reg7.Location;
            Point reg_8 = reg8.Location;
            Point reg_9 = reg9.Location;
            Point reg_10 = reg10.Location;
            //====================================================
            Class_2 estacionamento1 = new Class_2();
            estacionamento1.position_x = reg_1.X;
            estacionamento1.position_y = reg_1.Y;
            estacionamento1.estado = true;
            estacionamento.Add(estacionamento1);
            //====================================================
            Class_2 estacionamento2 = new Class_2();
            estacionamento2.position_x = reg_2.X;
            estacionamento2.position_y = reg_2.Y;
            estacionamento2.estado = true;
            estacionamento.Add(estacionamento2);
            //====================================================
            Class_2 estacionamento3 = new Class_2();
            estacionamento3.position_x = reg_3.X;
            estacionamento3.position_y = reg_3.Y;
            estacionamento3.estado = true;
            estacionamento.Add(estacionamento3);
            //====================================================
            Class_2 estacionamento4 = new Class_2();
            estacionamento4.position_x = reg_4.X;
            estacionamento4.position_y = reg_4.Y;
            estacionamento4.estado = true;
            estacionamento.Add(estacionamento4);
            //====================================================
            Class_2 estacionamento5 = new Class_2();
            estacionamento5.position_x = reg_5.X;
            estacionamento5.position_y = reg_5.Y;
            estacionamento5.estado = true;
            estacionamento.Add(estacionamento5);
            //====================================================
            Class_2 estacionamento6 = new Class_2();
            estacionamento6.position_x = reg_6.X;
            estacionamento6.position_y = reg_6.Y;
            estacionamento6.estado = true;
            estacionamento.Add(estacionamento6);
            //====================================================
            Class_2 estacionamento7 = new Class_2();
            estacionamento7.position_x = reg_7.X;
            estacionamento7.position_y = reg_7.Y;
            estacionamento7.estado = true;
            estacionamento.Add(estacionamento7);
            //====================================================
            Class_2 estacionamento8 = new Class_2();
            estacionamento8.position_x = reg_8.X;
            estacionamento8.position_y = reg_8.Y;
            estacionamento8.estado = true;
            estacionamento.Add(estacionamento8);
            //====================================================
            Class_2 estacionamento9 = new Class_2();
            estacionamento9.position_x = reg_9.X;
            estacionamento9.position_y = reg_9.Y;
            estacionamento9.estado = true;
            estacionamento.Add(estacionamento9);
            //====================================================
            Class_2 estacionamento10 = new Class_2();
            estacionamento10.position_x = reg_10.X;
            estacionamento10.position_y = reg_10.Y;
            estacionamento10.estado = true;
            estacionamento.Add(estacionamento10);

        }
            // OK - Janela de trabalho: Inicializa o Layout completo e esconde os aviões
        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void Desenhar()
        {
            //====================================================
            Bitmap imgback = new Bitmap(pictureBox_Fundo.Width, pictureBox_Fundo.Height);
            Graphics desenhador = Graphics.FromImage(imgback);
            //====================================================
            //Desenho aeroporto  
            desenhador.DrawImage(img_fundo,
                                 new Rectangle(0, 0, 1000, 450),
                                 new Rectangle(0, 0, 1000, 450),
                                 GraphicsUnit.Pixel);
            //====================================================
            // Desenho avião

            Image[] Cor_Aviao = new Image[10] {img_1, img_2, img_3, img_4,
                img_5, img_6, img_7, img_8, img_9, img_10,};


            foreach (Class1 Aviao in Lista_de_Avioes)
            {
                Aviao.Percurso(pictureBox_Fundo.Width, pictureBox_Fundo.Height);
                desenhador.DrawImage(Cor_Aviao[Aviao.cor],
                                     new Rectangle(Aviao.x, Aviao.y, 25, 25),
                                     new Rectangle(0, 0, 25, 25),
                                     GraphicsUnit.Pixel);
            }

            pictureBox_Fundo.BackgroundImage = imgback;
        }

        // OK - Label informando a hora atual
        private void Timer_Relogio_Tick(object sender, EventArgs e)
        {
            this.Label_Relogio.Text = DateTime.Now.ToString("HH:mm:ss");
        }

        // F - Falta completar
        private void Botao_N_A_Click(object sender, EventArgs e)
        {
            //====
            Class1 Av = new Class1();
            num += 1;
            //====
            Av.identidade = 200 + num;
            Av.cor = randNum.Next(0, 10);
            Lista_de_Avioes.Add(Av);
            //====
            string Id = (200 + num).ToString();
            String ultima = (ID + " => " + DateTime.Now.ToLongTimeString());
            //listBox.Text = ultima;

            Label_Espera.Text = " " + Lista_de_Avioes.Count();
            //Identifica();
        }


        // OK - Aciona a operação de identificação do avião
        public void Identifica()
        {
            Random randNum = new Random();
            ID = randNum.Next(1, 11);
            N_aviao = randNum.Next(1, 1000);

            Label_Id_1.Text = "N°: " + N_aviao; //Identifica o avião
            Label_HdC.Text = DateTime.Now.ToString("HH:mm:ss"); //Marca a chegada do avião atual

            verifica = false;
            while (verifica == false) //Verifica se hangar escolhido está vazio
            {
                if (CheckedListBox_Hangares.CheckedItems.Contains("Hangar Nº" + ID))//Se sim, escolhe outro
                {
                    ID = randNum.Next(1, 11);
                }

                else//Se nao, prossegue
                {
                    N_hangar = ID - 1;
                    verifica = true;
                }
            }
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            Desenhar();
            labh.Text = DateTime.Now.ToString();
            if (Lista_de_Avioes.Count() > 0)
            {
                int result = String.Compare(Lista_de_Avioes[0].estacionar1.ToLongTimeString(), DateTime.Now.ToLongTimeString());
                if (result == 0)
                {
                    int w = Lista_de_Avioes[0].variavel;
                    estacionamento[w].estado = true;
                    Lista_de_Avioes[0].decole = true;
                }
            }
            for (int k = 0; k < estacionamento.Count; k++)
            {
                estacionamento[k].rehora();
            }
        }


         
    }
}
