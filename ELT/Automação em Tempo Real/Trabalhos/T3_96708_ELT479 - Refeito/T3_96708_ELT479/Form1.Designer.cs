
namespace T3_96708_ELT479
{
    partial class Form1
    {
        /// <summary>
        /// Variável de designer necessária.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Limpar os recursos que estão sendo usados.
        /// </summary>
        /// <param name="disposing">true se for necessário descartar os recursos gerenciados; caso contrário, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Código gerado pelo Windows Form Designer

        /// <summary>
        /// Método necessário para suporte ao Designer - não modifique 
        /// o conteúdo deste método com o editor de código.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.Timer_Relogio = new System.Windows.Forms.Timer(this.components);
            this.Botao_N_A = new System.Windows.Forms.Button();
            this.Label_Relogio = new System.Windows.Forms.Label();
            this.Label_FdE = new System.Windows.Forms.Label();
            this.Label_Espera = new System.Windows.Forms.Label();
            this.Label_Chegada = new System.Windows.Forms.Label();
            this.Label_HdC = new System.Windows.Forms.Label();
            this.Label_Id_1 = new System.Windows.Forms.Label();
            this.Label_Partida = new System.Windows.Forms.Label();
            this.Label_Id_2 = new System.Windows.Forms.Label();
            this.Label_HdP = new System.Windows.Forms.Label();
            this.CheckedListBox_Hangares = new System.Windows.Forms.CheckedListBox();
            this.PictureBox_Pousa = new System.Windows.Forms.PictureBox();
            this.PictureBox_Decola = new System.Windows.Forms.PictureBox();
            this.pictureBox_Fundo = new System.Windows.Forms.PictureBox();
            this.timer1 = new System.Windows.Forms.Timer(this.components);
            this.listBox = new System.Windows.Forms.ListBox();
            ((System.ComponentModel.ISupportInitialize)(this.PictureBox_Pousa)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.PictureBox_Decola)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox_Fundo)).BeginInit();
            this.SuspendLayout();
            // 
            // Timer_Relogio
            // 
            this.Timer_Relogio.Enabled = true;
            this.Timer_Relogio.Interval = 1000;
            this.Timer_Relogio.Tick += new System.EventHandler(this.Timer_Relogio_Tick);
            // 
            // Botao_N_A
            // 
            this.Botao_N_A.AutoSize = true;
            this.Botao_N_A.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Botao_N_A.Location = new System.Drawing.Point(151, 136);
            this.Botao_N_A.Name = "Botao_N_A";
            this.Botao_N_A.Size = new System.Drawing.Size(142, 35);
            this.Botao_N_A.TabIndex = 0;
            this.Botao_N_A.Text = "Novo Avião";
            this.Botao_N_A.UseVisualStyleBackColor = true;
            this.Botao_N_A.Click += new System.EventHandler(this.Botao_N_A_Click);
            // 
            // Label_Relogio
            // 
            this.Label_Relogio.AutoSize = true;
            this.Label_Relogio.Font = new System.Drawing.Font("Microsoft Sans Serif", 21.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Label_Relogio.Location = new System.Drawing.Point(367, 136);
            this.Label_Relogio.Name = "Label_Relogio";
            this.Label_Relogio.Size = new System.Drawing.Size(161, 33);
            this.Label_Relogio.TabIndex = 2;
            this.Label_Relogio.Text = "HH:mm:ss";
            // 
            // Label_FdE
            // 
            this.Label_FdE.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Label_FdE.Location = new System.Drawing.Point(12, 254);
            this.Label_FdE.Name = "Label_FdE";
            this.Label_FdE.Size = new System.Drawing.Size(146, 98);
            this.Label_FdE.TabIndex = 3;
            this.Label_FdE.Text = "Nº de aviões para pousar:";
            // 
            // Label_Espera
            // 
            this.Label_Espera.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Label_Espera.Location = new System.Drawing.Point(49, 311);
            this.Label_Espera.Name = "Label_Espera";
            this.Label_Espera.Size = new System.Drawing.Size(72, 23);
            this.Label_Espera.TabIndex = 4;
            this.Label_Espera.Text = "0";
            // 
            // Label_Chegada
            // 
            this.Label_Chegada.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Label_Chegada.Location = new System.Drawing.Point(165, 254);
            this.Label_Chegada.Name = "Label_Chegada";
            this.Label_Chegada.Size = new System.Drawing.Size(233, 60);
            this.Label_Chegada.TabIndex = 5;
            this.Label_Chegada.Text = "O Avião \r\nChegou às:";
            // 
            // Label_HdC
            // 
            this.Label_HdC.AutoSize = true;
            this.Label_HdC.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Label_HdC.Location = new System.Drawing.Point(294, 279);
            this.Label_HdC.Name = "Label_HdC";
            this.Label_HdC.Size = new System.Drawing.Size(104, 25);
            this.Label_HdC.TabIndex = 6;
            this.Label_HdC.Text = "00:00:00";
            // 
            // Label_Id_1
            // 
            this.Label_Id_1.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Label_Id_1.Location = new System.Drawing.Point(260, 256);
            this.Label_Id_1.Name = "Label_Id_1";
            this.Label_Id_1.Size = new System.Drawing.Size(121, 23);
            this.Label_Id_1.TabIndex = 7;
            this.Label_Id_1.Text = "000";
            // 
            // Label_Partida
            // 
            this.Label_Partida.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Label_Partida.Location = new System.Drawing.Point(404, 254);
            this.Label_Partida.Name = "Label_Partida";
            this.Label_Partida.Size = new System.Drawing.Size(233, 60);
            this.Label_Partida.TabIndex = 8;
            this.Label_Partida.Text = "O Avião \r\nPartiu às:";
            // 
            // Label_Id_2
            // 
            this.Label_Id_2.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Label_Id_2.Location = new System.Drawing.Point(504, 256);
            this.Label_Id_2.Name = "Label_Id_2";
            this.Label_Id_2.Size = new System.Drawing.Size(123, 23);
            this.Label_Id_2.TabIndex = 9;
            this.Label_Id_2.Text = "000";
            // 
            // Label_HdP
            // 
            this.Label_HdP.AutoSize = true;
            this.Label_HdP.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Label_HdP.Location = new System.Drawing.Point(513, 279);
            this.Label_HdP.Name = "Label_HdP";
            this.Label_HdP.Size = new System.Drawing.Size(104, 25);
            this.Label_HdP.TabIndex = 10;
            this.Label_HdP.Text = "00:00:00";
            // 
            // CheckedListBox_Hangares
            // 
            this.CheckedListBox_Hangares.FormattingEnabled = true;
            this.CheckedListBox_Hangares.Items.AddRange(new object[] {
            "Hangar Nº 01 Ocupado",
            "Hangar Nº 02 Ocupado",
            "Hangar Nº 03 Ocupado",
            "Hangar Nº 04 Ocupado",
            "Hangar Nº 05 Ocupado",
            "Hangar Nº 06 Ocupado",
            "Hangar Nº 07 Ocupado",
            "Hangar Nº 08 Ocupado",
            "Hangar Nº 09 Ocupado",
            "Hangar Nº 10 Ocupado"});
            this.CheckedListBox_Hangares.Location = new System.Drawing.Point(674, 197);
            this.CheckedListBox_Hangares.Name = "CheckedListBox_Hangares";
            this.CheckedListBox_Hangares.Size = new System.Drawing.Size(164, 154);
            this.CheckedListBox_Hangares.TabIndex = 11;
            // 
            // PictureBox_Pousa
            // 
            this.PictureBox_Pousa.Image = global::T3_96708_ELT479.Properties.Resources.Pousa;
            this.PictureBox_Pousa.Location = new System.Drawing.Point(299, 144);
            this.PictureBox_Pousa.Name = "PictureBox_Pousa";
            this.PictureBox_Pousa.Size = new System.Drawing.Size(25, 25);
            this.PictureBox_Pousa.SizeMode = System.Windows.Forms.PictureBoxSizeMode.CenterImage;
            this.PictureBox_Pousa.TabIndex = 12;
            this.PictureBox_Pousa.TabStop = false;
            // 
            // PictureBox_Decola
            // 
            this.PictureBox_Decola.Image = global::T3_96708_ELT479.Properties.Resources.Decola;
            this.PictureBox_Decola.Location = new System.Drawing.Point(336, 144);
            this.PictureBox_Decola.Name = "PictureBox_Decola";
            this.PictureBox_Decola.Size = new System.Drawing.Size(25, 25);
            this.PictureBox_Decola.SizeMode = System.Windows.Forms.PictureBoxSizeMode.CenterImage;
            this.PictureBox_Decola.TabIndex = 13;
            this.PictureBox_Decola.TabStop = false;
            // 
            // pictureBox_Fundo
            // 
            this.pictureBox_Fundo.Location = new System.Drawing.Point(3, 1);
            this.pictureBox_Fundo.Name = "pictureBox_Fundo";
            this.pictureBox_Fundo.Size = new System.Drawing.Size(1080, 350);
            this.pictureBox_Fundo.TabIndex = 14;
            this.pictureBox_Fundo.TabStop = false;
            // 
            // timer1
            // 
            this.timer1.Tick += new System.EventHandler(this.timer1_Tick);
            // 
            // listBox
            // 
            this.listBox.FormattingEnabled = true;
            this.listBox.Location = new System.Drawing.Point(845, 197);
            this.listBox.Name = "listBox";
            this.listBox.Size = new System.Drawing.Size(140, 147);
            this.listBox.TabIndex = 15;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1084, 351);
            this.Controls.Add(this.listBox);
            this.Controls.Add(this.PictureBox_Decola);
            this.Controls.Add(this.PictureBox_Pousa);
            this.Controls.Add(this.CheckedListBox_Hangares);
            this.Controls.Add(this.Label_HdP);
            this.Controls.Add(this.Label_Id_2);
            this.Controls.Add(this.Label_Partida);
            this.Controls.Add(this.Label_Id_1);
            this.Controls.Add(this.Label_HdC);
            this.Controls.Add(this.Label_Chegada);
            this.Controls.Add(this.Label_Espera);
            this.Controls.Add(this.Label_FdE);
            this.Controls.Add(this.Label_Relogio);
            this.Controls.Add(this.Botao_N_A);
            this.Controls.Add(this.pictureBox_Fundo);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.PictureBox_Pousa)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.PictureBox_Decola)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox_Fundo)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Timer Timer_Relogio;
        private System.Windows.Forms.Button Botao_N_A;
        private System.Windows.Forms.Label Label_Relogio;
        private System.Windows.Forms.Label Label_FdE;
        private System.Windows.Forms.Label Label_Espera;
        private System.Windows.Forms.Label Label_Chegada;
        private System.Windows.Forms.Label Label_HdC;
        private System.Windows.Forms.Label Label_Id_1;
        private System.Windows.Forms.Label Label_Partida;
        private System.Windows.Forms.Label Label_Id_2;
        private System.Windows.Forms.Label Label_HdP;
        private System.Windows.Forms.CheckedListBox CheckedListBox_Hangares;
        private System.Windows.Forms.PictureBox PictureBox_Pousa;
        private System.Windows.Forms.PictureBox PictureBox_Decola;
        private System.Windows.Forms.PictureBox pictureBox_Fundo;
        private System.Windows.Forms.Timer timer1;
        private System.Windows.Forms.ListBox listBox;
    }
}

