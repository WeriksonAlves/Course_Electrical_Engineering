
namespace operadoresmatematicos
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
            this.cmd_executar = new System.Windows.Forms.Button();
            this.text_parcela_1 = new System.Windows.Forms.TextBox();
            this.text_parcela_2 = new System.Windows.Forms.TextBox();
            this.label_resultados = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // cmd_executar
            // 
            this.cmd_executar.Location = new System.Drawing.Point(47, 208);
            this.cmd_executar.Name = "cmd_executar";
            this.cmd_executar.Size = new System.Drawing.Size(75, 23);
            this.cmd_executar.TabIndex = 0;
            this.cmd_executar.Text = "Executar";
            this.cmd_executar.UseVisualStyleBackColor = true;
            this.cmd_executar.Click += new System.EventHandler(this.cmd_executar_Click);
            // 
            // text_parcela_1
            // 
            this.text_parcela_1.Location = new System.Drawing.Point(44, 46);
            this.text_parcela_1.Name = "text_parcela_1";
            this.text_parcela_1.Size = new System.Drawing.Size(100, 20);
            this.text_parcela_1.TabIndex = 1;
            // 
            // text_parcela_2
            // 
            this.text_parcela_2.Location = new System.Drawing.Point(44, 88);
            this.text_parcela_2.Name = "text_parcela_2";
            this.text_parcela_2.Size = new System.Drawing.Size(100, 20);
            this.text_parcela_2.TabIndex = 2;
            // 
            // label_resultados
            // 
            this.label_resultados.AutoSize = true;
            this.label_resultados.Location = new System.Drawing.Point(44, 155);
            this.label_resultados.Name = "label_resultados";
            this.label_resultados.Size = new System.Drawing.Size(0, 13);
            this.label_resultados.TabIndex = 3;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(484, 311);
            this.Controls.Add(this.label_resultados);
            this.Controls.Add(this.text_parcela_2);
            this.Controls.Add(this.text_parcela_1);
            this.Controls.Add(this.cmd_executar);
            this.Name = "Form1";
            this.Text = "Form1";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button cmd_executar;
        private System.Windows.Forms.TextBox text_parcela_1;
        private System.Windows.Forms.TextBox text_parcela_2;
        private System.Windows.Forms.Label label_resultados;
    }
}

