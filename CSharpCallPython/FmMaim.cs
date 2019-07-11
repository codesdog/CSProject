using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
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
            lbCount.Text = getWordSum(tbSource.Text).ToString();
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
            StringBuilder sb = new StringBuilder();
            sb.AppendLine(string.Format("这个句子由{0}个单词组成", keysList.Count));
            foreach (object item in keysList)
            {
                sb.AppendLine((string)item + ":" + (string)ht[item]);
            }
            lbCount.Text = sb.ToString();
        }

        private StringBuilder SplitWords()
        {
            var text = tbSource.Text;
            string[] words = Regex.Split(text, @"\W+");//这句代码就是将文本转为单词，但是需要添加这一句引用  using System.Text.RegularExpressions;
            var i = 0;
            StringBuilder sb = new StringBuilder();
            sb.AppendLine(string.Format("这个句子由{0}个单词组成", words.Length));
            foreach (var word in words)
            {
                i++;
                sb.AppendLine(string.Format("第{0}个单词是:{1}", i, word));
            }
            return sb;
        }

        private void BtnSplit_Click(object sender, EventArgs e)
        {
            StringBuilder sb= SplitWords();
            tbResult.Text = sb.ToString();
        }

        private void BtnComput_Click(object sender, EventArgs e)
        {
            string ws=getWordSum(tbSource.Text).ToString();
            tbResult.Text = ws;
        }

        /// <summary>
        /// C#统计文章中单词的重复次数，并且按照次数从高到低排序返回（无法处理中文）
        /// </summary>
        /// <param name="content"></param>
        /// <returns></returns>
        private Dictionary<string, int> gethotstring(string content)
        {
            Dictionary<string, int> HOT = new Dictionary<string, int>();
            string[] s = content.Split(new char[] { ' ' });
            for (int i = 0; i < s.Length; i++)
            {
                if (HOT.ContainsKey(s[i]))
                {
                    HOT[s[i]]++; ;
                }
                else
                {
                    HOT[s[i]] = 1;
                }
            }
            return HOT.OrderByDescending(r => r.Value).ToDictionary(r => r.Key, r => r.Value);
        }

        private void BtnAnalysis_Click(object sender, EventArgs e)
        {
            string content = tbSource.Text;
            //Dictionary<string, int> HOT = gethotstring(content);
            //StringBuilder sb = new StringBuilder();
            //foreach (var item in HOT)
            //{
            //    sb.AppendLine(string.Format("{0},{1}",item.Key,item.Value));
            //}
            //tbResult.Text = sb.ToString();
            SplitText(content);
            //gets(content);
        }

        private void SplitText(string txts)
        {
            string resultStr = txts.Replace("\n", " ").Replace("\t", " ").Replace("\r", " ").Replace("\""," ");
            string[] results = resultStr.Split(new char[] {'.' });
            string[] trimresults= results.Where(s=>!string.IsNullOrEmpty(s)).ToArray();
            trimresults=trimresults.Where(s => s!=" ").ToArray();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < trimresults.Length; i++)
            {
                sb.AppendLine(string.Format("第{0}句（句长：{2}）：{1}", i+1, trimresults[i], getWordSum(trimresults[i])));
            }
            tbResult.Text = sb.ToString();
        }

        private string CheckSplitter(string strTemp)
        {
            strTemp = Regex.Replace(strTemp, @"([\S]+)([\.\?!:])([”""'\)]*) ([ “”‘""'\(]*)([A-Z\d][\S]*)", new MatchEvaluator(ClassConditionalReplace));
            return strTemp;
        }
        static string ClassConditionalReplace(Match m)
        {
            string strResult = "";
            string strTotal = m.Groups[0].Value.ToString();
            //将提取的字符串拆分为：候选分界符前面的词“strPrecedingWord”、候选分界符“strSentenceSplitter”、可能出现的句尾单引号或双引号或圆括号“strClosingMark”、空格（在正则表达式中有体现）、可能出现的句首单引号或双引号或圆括号“strOpeningMark”、候选分界符后的第一个单词“strFollowingWord”。
            string strPrecedingWord = m.Groups[1].Value.ToString();
            string strSentenceSplitter = m.Groups[2].Value.ToString();
            string strClosingMark = m.Groups[3].Value.ToString();
            string strOpeningMark = m.Groups[4].Value.ToString();
            string strFollowingWord = m.Groups[5].Value.ToString();
            if (strSentenceSplitter == ".")
            {
                //遇到候选句点“.”，需要进一步判断是否是句号。
                //(此处程序省略，具体解释请看下文！）
            }
            else
            {
                //遇到“?!:”，直接在“?!:”后面加上断句标记“|||”。
                strSentenceSplitter = strSentenceSplitter + strClosingMark +"|||";
            }
            // （此处对strFollowingWord字符串作进一步处理。）
            //用下面的字符串替换原有字符串。
            strResult = strPrecedingWord + strSentenceSplitter + " " + strOpeningMark + strFollowingWord;
            return strResult;
        }

        private void gets(string text)
        {
            IStringAna ana = new StringAna();
            var sp = Stopwatch.StartNew();
            var rlt = ana.Ana(text);
            //Console.WriteLine($"Elapsed:{sp.ElapsedTicks}");
            if (rlt == null)
            {
                lbCount.Text = "error";
            }
            else
            {
                StringBuilder sb = new StringBuilder();
                foreach (var item in rlt)
                {
                    sb.AppendLine($"{ item.Key}:{ item.Value}");
                    //Console.WriteLine($"{item.Key}:{item.Value}");
                }
                tbResult.Text =sb.ToString();
            }
        }

        static void FindComValue(DataTable dt)
        {
            
            if (dt.Rows.Count > 0)
            {
                DataTable tabTemp = dt.Clone();
                string row1 = dt.Rows[0][0].ToString();//取表的第一行第一列
                DataRow[] drr = dt.Select("a=" + row1);
                DataRow drTemp = tabTemp.NewRow();//临时新的行
                foreach (DataRow row in drr)
                {
                    for (int i = 0; i < dt.Columns.Count; i++)
                    {
                        if (i != 0)
                        {
                            if (drTemp[i].ToString().Trim() == "")
                                drTemp[i] = "0";
                            drTemp[i] = Convert.ToString(Convert.ToDouble(drTemp[i].ToString()) + Convert.ToDouble(row[i].ToString()));//合并每一列的数据
                        }
                        else
                        {
                            drTemp[i] = row[i].ToString();//添加第一列，不需要相加
                        }
                    }
                    dt.Rows.Remove(row);//清除此类的行
                }
                tabTemp.Rows.Add(drTemp);//添加临时新的行数据
                FindComValue(dt);
            }
        }

        private void BtnViewChart_Click(object sender, EventArgs e)
        {
            fmChart fm1 = new fmChart();
            fm1.Show();
        }

        private void BtnChart2_Click(object sender, EventArgs e)
        {
            fmChart2 fm1 = new fmChart2();
            fm1.Show();
        }

        private void BtnCluster_Click(object sender, EventArgs e)
        {
            frmCluster fm1 = new frmCluster();
            fm1.Show();
        }
    }
}
