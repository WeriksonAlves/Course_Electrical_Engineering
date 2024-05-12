
namespace ELT479_Projeto_2__96708
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
            this.timer = new System.Windows.Forms.Timer(this.components);
            this.btn_novo_aviao = new System.Windows.Forms.Button();
            this.label_horario = new System.Windows.Forms.Label();
            this.picture_aviao = new System.Windows.Forms.PictureBox();
            this.pic_fundo = new System.Windows.Forms.PictureBox();
            this.timer_animacao = new System.Windows.Forms.Timer(this.components);
            this.label1 = new System.Windows.Forms.Label();
            this.label_id = new System.Windows.Forms.Label();
            this.label_hora = new System.Windows.Forms.Label();
            this.label_info = new System.Windows.Forms.Label();
            this.checkedListBox1 = new System.Windows.Forms.CheckedListBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.timer1 = new System.Windows.Forms.Timer(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.picture_aviao)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pic_fundo)).BeginInit();
            this.SuspendLayout();
            // 
            // timer
            // 
            this.timer.Enabled = true;
            this.timer.Interval = 1000;
            this.timer.Tick += new System.EventHandler(this.timer_Tick);
            // 
            // btn_novo_aviao
            // 
            this.btn_novo_aviao.AutoSize = true;
            this.btn_novo_aviao.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_novo_aviao.Location = new System.Drawing.Point(90, 270);
            this.btn_novo_aviao.Name = "btn_novo_aviao";
            this.btn_novo_aviao.Size = new System.Drawing.Size(142, 35);
            this.btn_novo_aviao.TabIndex = 1;
            this.btn_novo_aviao.Text = "Novo Avião";
            this.btn_novo_aviao.UseVisualStyleBackColor = true;
            this.btn_novo_aviao.Click += new System.EventHandler(this.btn_novo_aviao_Click);
            // 
            // label_horario
            // 
            this.label_horario.AutoSize = true;
            this.label_horario.Font = new System.Drawing.Font("Microsoft Sans Serif", 20.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label_horario.Location = new System.Drawing.Point(250, 270);
            this.label_horario.Name = "label_horario";
            this.label_horario.Size = new System.Drawing.Size(158, 31);
            this.label_horario.TabIndex = 2;
            this.label_horario.Text = "HH:MM:SS";
            this.label_horario.Click += new System.EventHandler(this.label_horario_Click);
            // 
            // picture_aviao
            // 
            this.picture_aviao.BackColor = System.Drawing.SystemColors.Control;
            this.picture_aviao.Enabled = false;
            this.picture_aviao.Image = global::ELT479_Projeto_2__96708.Properties.Resources.ELT479_aviao;
            this.picture_aviao.Location = new System.Drawing.Point(428, 270);
            this.picture_aviao.Name = "picture_aviao";
            this.picture_aviao.Size = new System.Drawing.Size(25, 25);
            this.picture_aviao.SizeMode = System.Windows.Forms.PictureBoxSizeMode.CenterImage;
            this.picture_aviao.TabIndex = 3;
            this.picture_aviao.TabStop = false;
            // 
            // pic_fundo
            // 
            this.pic_fundo.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.pic_fundo.Image = global::ELT479_Projeto_2__96708.Properties.Resources.ELT479_backgrond_aero1;
            this.pic_fundo.Location = new System.Drawing.Point(0, 0);
            this.pic_fundo.Name = "pic_fundo";
            this.pic_fundo.Size = new System.Drawing.Size(1000, 350);
            this.pic_fundo.SizeMode = System.Windows.Forms.PictureBoxSizeMode.AutoSize;
            this.pic_fundo.TabIndex = 0;
            this.pic_fundo.TabStop = false;
            // 
            // timer_animacao
            // 
            this.timer_animacao.Tick += new System.EventHandler(this.timer_animacao_Tick);
            // 
            // label1
            // 
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(849, 98);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(127, 53);
            this.label1.TabIndex = 5;
            this.label1.Text = "Hangares ocupados";
            // 
            // label_id
            // 
            this.label_id.AutoSize = true;
            this.label_id.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label_id.Location = new System.Drawing.Point(727, 189);
            this.label_id.Name = "label_id";
            this.label_id.Size = new System.Drawing.Size(83, 25);
            this.label_id.TabIndex = 6;
            this.label_id.Text = "N° 000";
            // 
            // label_hora
            // 
            this.label_hora.AutoSize = true;
            this.label_hora.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label_hora.Location = new System.Drawing.Point(721, 261);
            this.label_hora.Name = "label_hora";
            this.label_hora.Size = new System.Drawing.Size(104, 25);
            this.label_hora.TabIndex = 7;
            this.label_hora.Text = "00:00:00";
            // 
            // label_info
            // 
            this.label_info.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label_info.Location = new System.Drawing.Point(695, 154);
            this.label_info.Name = "label_info";
            this.label_info.Size = new System.Drawing.Size(140, 151);
            this.label_info.TabIndex = 8;
            this.label_info.Text = "Avião";
            this.label_info.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            // 
            // checkedListBox1
            // 
            this.checkedListBox1.CheckOnClick = true;
            this.checkedListBox1.FormattingEnabled = true;
            this.checkedListBox1.Items.AddRange(new object[] {
            "Hangar Nº1",
            "Hangar Nº2",
            "Hangar Nº3",
            "Hangar Nº4",
            "Hangar Nº5",
            "Hangar Nº6",
            "Hangar Nº7",
            "Hangar Nº8",
            "Hangar Nº9",
            "Hangar Nº10"});
            this.checkedListBox1.Location = new System.Drawing.Point(854, 154);
            this.checkedListBox1.Name = "checkedListBox1";
            this.checkedListBox1.Size = new System.Drawing.Size(122, 154);
            this.checkedListBox1.TabIndex = 9;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(704, 223);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(121, 25);
            this.label2.TabIndex = 10;
            this.label2.Text = "chegou às";
            // 
            // label3
            // 
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(87, 131);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(500, 42);
            this.label3.TabIndex = 11;
            this.label3.Text = "Nenhum avião foi liberado até agora! ";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1034, 321);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.checkedListBox1);
            this.Controls.Add(this.label_hora);
            this.Controls.Add(this.label_id);
            this.Controls.Add(this.label_info);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.picture_aviao);
            this.Controls.Add(this.label_horario);
            this.Controls.Add(this.btn_novo_aviao);
            this.Controls.Add(this.pic_fundo);
            this.MaximumSize = new System.Drawing.Size(1050, 360);
            this.MinimumSize = new System.Drawing.Size(1050, 360);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.picture_aviao)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pic_fundo)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.PictureBox pic_fundo;
        private System.Windows.Forms.Timer timer;
        private System.Windows.Forms.Button btn_novo_aviao;
        private System.Windows.Forms.Label label_horario;
        private System.Windows.Forms.PictureBox picture_aviao;
        private System.Windows.Forms.Timer timer_animacao;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label_id;
        private System.Windows.Forms.Label label_hora;
        private System.Windows.Forms.Label label_info;
        private System.Windows.Forms.CheckedListBox checkedListBox1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Timer timer1;
    }
}

