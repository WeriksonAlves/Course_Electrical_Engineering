
namespace calculadora
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
            this.Executar = new System.Windows.Forms.Button();
            this.cdet = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // Executar
            // 
            this.Executar.Location = new System.Drawing.Point(406, 213);
            this.Executar.Name = "Executar";
            this.Executar.Size = new System.Drawing.Size(75, 23);
            this.Executar.TabIndex = 0;
            this.Executar.Text = "button1";
            this.Executar.UseVisualStyleBackColor = true;
            this.Executar.Click += new System.EventHandler(this.Executar_Click);
            // 
            // cdet
            // 
            this.cdet.AutoSize = true;
            this.cdet.Location = new System.Drawing.Point(403, 127);
            this.cdet.Name = "cdet";
            this.cdet.Size = new System.Drawing.Size(35, 13);
            this.cdet.TabIndex = 1;
            this.cdet.Text = "label1";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.cdet);
            this.Controls.Add(this.Executar);
            this.Name = "Form1";
            this.Text = "Form1";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button Executar;
        private System.Windows.Forms.Label cdet;
    }
}

