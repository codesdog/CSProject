namespace CSharpCallPython
{
    partial class frmCluster
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.btnCluster = new System.Windows.Forms.Button();
            this.lbT1 = new System.Windows.Forms.Label();
            this.lbT2 = new System.Windows.Forms.Label();
            this.lbT3 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(12, 12);
            this.textBox1.Multiline = true;
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(393, 415);
            this.textBox1.TabIndex = 0;
            // 
            // dataGridView1
            // 
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(412, 13);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.RowTemplate.Height = 23;
            this.dataGridView1.Size = new System.Drawing.Size(384, 414);
            this.dataGridView1.TabIndex = 1;
            // 
            // btnCluster
            // 
            this.btnCluster.Location = new System.Drawing.Point(12, 446);
            this.btnCluster.Name = "btnCluster";
            this.btnCluster.Size = new System.Drawing.Size(75, 23);
            this.btnCluster.TabIndex = 2;
            this.btnCluster.Text = "Cluster";
            this.btnCluster.UseVisualStyleBackColor = true;
            this.btnCluster.Click += new System.EventHandler(this.BtnCluster_Click);
            // 
            // lbT1
            // 
            this.lbT1.AutoSize = true;
            this.lbT1.Location = new System.Drawing.Point(113, 456);
            this.lbT1.Name = "lbT1";
            this.lbT1.Size = new System.Drawing.Size(41, 12);
            this.lbT1.TabIndex = 3;
            this.lbT1.Text = "label1";
            // 
            // lbT2
            // 
            this.lbT2.AutoSize = true;
            this.lbT2.Location = new System.Drawing.Point(314, 457);
            this.lbT2.Name = "lbT2";
            this.lbT2.Size = new System.Drawing.Size(41, 12);
            this.lbT2.TabIndex = 4;
            this.lbT2.Text = "label2";
            // 
            // lbT3
            // 
            this.lbT3.AutoSize = true;
            this.lbT3.Location = new System.Drawing.Point(552, 456);
            this.lbT3.Name = "lbT3";
            this.lbT3.Size = new System.Drawing.Size(41, 12);
            this.lbT3.TabIndex = 5;
            this.lbT3.Text = "label3";
            // 
            // frmCluster
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(808, 491);
            this.Controls.Add(this.lbT3);
            this.Controls.Add(this.lbT2);
            this.Controls.Add(this.lbT1);
            this.Controls.Add(this.btnCluster);
            this.Controls.Add(this.dataGridView1);
            this.Controls.Add(this.textBox1);
            this.Name = "frmCluster";
            this.Text = "frmCluster";
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.Button btnCluster;
        private System.Windows.Forms.Label lbT1;
        private System.Windows.Forms.Label lbT2;
        private System.Windows.Forms.Label lbT3;
    }
}