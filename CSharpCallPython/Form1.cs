using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using IronPython.Hosting;
using Microsoft.Scripting;
using Microsoft.Scripting.Hosting;

namespace CSharpCallPython
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                ScriptEngine pyEngine = Python.CreateEngine();//创建Python解释器对象
                dynamic py = pyEngine.ExecuteFile(@"test1.py");//读取脚本文件
                string dd = py.main(textBox1.Lines);//调用脚本文件中对应的函数
                textBox2.Text += dd + "\r\n";

                //ScriptEngine pyEngine = Python.CreateEngine();//创建一个Python引擎
                //dynamic da = pyEngine.CreateScriptSourceFromString(textBox1.Text);//读取脚本源码字符串
                //da.Execute();//执行脚本;winForm程序中执行结果会在输出中显示;控制台程序中执行结果会显示在控制台中
            }
            catch (Exception ex)
            {
                textBox2.Text += ex.Message;
            }

        }
    }
}
