namespace CSharpCallPython
{
    partial class FmMaim
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
            this.tbSource = new System.Windows.Forms.TextBox();
            this.lbCount = new System.Windows.Forms.Label();
            this.btnComput = new System.Windows.Forms.Button();
            this.tbResult = new System.Windows.Forms.TextBox();
            this.btnSplit = new System.Windows.Forms.Button();
            this.dgvResult = new System.Windows.Forms.DataGridView();
            this.btnAnalysis = new System.Windows.Forms.Button();
            this.openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
            ((System.ComponentModel.ISupportInitialize)(this.dgvResult)).BeginInit();
            this.SuspendLayout();
            // 
            // tbSource
            // 
            this.tbSource.Location = new System.Drawing.Point(12, 12);
            this.tbSource.Multiline = true;
            this.tbSource.Name = "tbSource";
            this.tbSource.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.tbSource.Size = new System.Drawing.Size(325, 319);
            this.tbSource.TabIndex = 0;
            this.tbSource.Text = "Youth is not a time of life";
            this.tbSource.TextChanged += new System.EventHandler(this.textBox1_TextChanged);
            // 
            // lbCount
            // 
            this.lbCount.AutoSize = true;
            this.lbCount.ForeColor = System.Drawing.Color.Red;
            this.lbCount.Location = new System.Drawing.Point(387, 174);
            this.lbCount.Name = "lbCount";
            this.lbCount.Size = new System.Drawing.Size(17, 12);
            this.lbCount.TabIndex = 1;
            this.lbCount.Text = "空";
            // 
            // btnComput
            // 
            this.btnComput.Location = new System.Drawing.Point(362, 22);
            this.btnComput.Name = "btnComput";
            this.btnComput.Size = new System.Drawing.Size(75, 23);
            this.btnComput.TabIndex = 2;
            this.btnComput.Text = "计算";
            this.btnComput.UseVisualStyleBackColor = true;
            this.btnComput.Click += new System.EventHandler(this.BtnComput_Click);
            // 
            // tbResult
            // 
            this.tbResult.Location = new System.Drawing.Point(461, 12);
            this.tbResult.Multiline = true;
            this.tbResult.Name = "tbResult";
            this.tbResult.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.tbResult.Size = new System.Drawing.Size(327, 319);
            this.tbResult.TabIndex = 3;
            // 
            // btnSplit
            // 
            this.btnSplit.Location = new System.Drawing.Point(362, 98);
            this.btnSplit.Name = "btnSplit";
            this.btnSplit.Size = new System.Drawing.Size(75, 23);
            this.btnSplit.TabIndex = 4;
            this.btnSplit.Text = "句子拆分";
            this.btnSplit.UseVisualStyleBackColor = true;
            this.btnSplit.Click += new System.EventHandler(this.BtnSplit_Click);
            // 
            // dgvResult
            // 
            this.dgvResult.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvResult.Location = new System.Drawing.Point(13, 337);
            this.dgvResult.Name = "dgvResult";
            this.dgvResult.RowTemplate.Height = 23;
            this.dgvResult.Size = new System.Drawing.Size(775, 147);
            this.dgvResult.TabIndex = 5;
            // 
            // btnAnalysis
            // 
            this.btnAnalysis.Location = new System.Drawing.Point(362, 250);
            this.btnAnalysis.Name = "btnAnalysis";
            this.btnAnalysis.Size = new System.Drawing.Size(75, 23);
            this.btnAnalysis.TabIndex = 6;
            this.btnAnalysis.Text = "分析";
            this.btnAnalysis.UseVisualStyleBackColor = true;
            this.btnAnalysis.Click += new System.EventHandler(this.BtnAnalysis_Click);
            // 
            // openFileDialog1
            // 
            this.openFileDialog1.FileName = "openFileDialog1";
            // 
            // FmMaim
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 608);
            this.Controls.Add(this.btnAnalysis);
            this.Controls.Add(this.dgvResult);
            this.Controls.Add(this.btnSplit);
            this.Controls.Add(this.tbResult);
            this.Controls.Add(this.btnComput);
            this.Controls.Add(this.lbCount);
            this.Controls.Add(this.tbSource);
            this.Name = "FmMaim";
            this.Text = "FmMaim";
            ((System.ComponentModel.ISupportInitialize)(this.dgvResult)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox tbSource;
        private System.Windows.Forms.Label lbCount;
        private System.Windows.Forms.Button btnComput;
        private System.Windows.Forms.TextBox tbResult;
        private System.Windows.Forms.Button btnSplit;
        private System.Windows.Forms.DataGridView dgvResult;
        private System.Windows.Forms.Button btnAnalysis;
        private System.Windows.Forms.OpenFileDialog openFileDialog1;
    }
}