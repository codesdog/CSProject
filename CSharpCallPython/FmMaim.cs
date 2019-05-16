using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Windows.Forms;

namespace CSharpCallPython
{
    public partial class FmMaim : Form
    {
        public FmMaim()
        {
            InitializeComponent();
        }
        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            lbCount.Text = getWordSum(tb1.Text).ToString();
        }

        private int getWordSum(string text)
        {
            string textbasic = text;
            char[] basictemp = text.ToCharArray();
            int chfrom = Convert.ToInt32("4e00", 16);    //范围（0x4e00～0x9fff）转换成int（chfrom～chend）
            int chend = Convert.ToInt32("9fff", 16);
            foreach (char c in basictemp)
            {
                if (' ' != c)
                {
                    string temp = c.ToString();
                    int firstcode = char.ConvertToUtf32(temp, 0);
                    if (firstcode >= chfrom && firstcode <= chend)
                    {
                        textbasic = textbasic.Replace(c, ' ');
                    }
                }
            }

            char[] ch = new char[] { ' ', ',', '?', '!', '(', ')', '\n' };
            string[] stemp = textbasic.Split(ch, StringSplitOptions.RemoveEmptyEntries);

            return stemp.Length;
        }
        public void StatisticsWords(string path)
        {
            if (!File.Exists(path))
            {
                Console.WriteLine("文件不存在！");
                return;
            }
            Hashtable ht = new Hashtable(StringComparer.OrdinalIgnoreCase);
            StreamReader sr = new StreamReader(path, System.Text.Encoding.UTF8);
            string line = sr.ReadLine();

            string[] wordArr = null;
            int num = 0;
            while (line.Length > 0)
            {
                //   MatchCollection mc =  Regex.Matches(line, @"\b[a-z]+", RegexOptions.Compiled | RegexOptions.IgnoreCase);
                //foreach (Match m in mc)
                //{
                //    if (ht.ContainsKey(m.Value))
                //    {
                //        num = Convert.ToInt32(ht[m.Value]) + 1;
                //        ht[m.Value] = num;
                //    }
                //    else
                //    {
                //        ht.Add(m.Value, 1);
                //    }
                //}
                //line = sr.ReadLine();

                wordArr = line.Split(' ');
                foreach (string s in wordArr)
                {
                    if (s.Length == 0)
                        continue;
                    //去除标点
                    line = Regex.Replace(line, @"[\p{P}*]", "", RegexOptions.Compiled);
                    //将单词加入哈希表
                    if (ht.ContainsKey(s))
                    {
                        num = Convert.ToInt32(ht[s]) + 1;
                        ht[s] = num;
                    }
                    else
                    {
                        ht.Add(s, 1);
                    }
                }
                line = sr.ReadLine();
            }

            ArrayList keysList = new ArrayList(ht.Keys);
            //对Hashtable中的Keys按字母序排列
            keysList.Sort();
            //按次数进行插入排序【稳定排序】，所以相同次数的单词依旧是字母序
            string tmp = String.Empty;
            int valueTmp = 0;
            for (int i = 1; i < keysList.Count; i++)
            {
                tmp = keysList[i].ToString();
                valueTmp = (int)ht[keysList[i]];//次数
                int j = i;
                while (j > 0 && valueTmp > (int)ht[keysList[j - 1]])
                {
                    keysList[j] = keysList[j - 1];
                    j--;
                }
                keysList[j] = tmp;//j=0
            }
            //打印出来
            foreach (object item in keysList)
            {
                Console.WriteLine((string)item + ":" + (string)ht[item]);
            }
        }
    }
}
