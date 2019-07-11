using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Windows.Forms;

namespace CSharpCallPython
{
    public partial class frmCluster : Form
    {
        public frmCluster()
        {
            InitializeComponent();
        }
        #region Cluster
        /// <summary>
        /// 返回一段语料中的语族
        /// </summary>
        /// <param name="corpusContext">文本</param>
        /// <param name="ClusterLength">词族的长度</param>
        /// <returns></returns>
        public static DataTable GetClusterFromCorpus(string corpusContext, int ClusterLength)
        {
            DataTable dt = new DataTable();
            List<string> words = ParseWords(corpusContext);
            dt.Columns.Add("Cluster", typeof(string));
            dt.Columns.Add("Count", typeof(int));
            DataRow dr;
            DataRow[] drs;
            int i = 0;
            string cluster;
            while (i <= words.Count - ClusterLength)
            {
                cluster = GetPhrase(words, words[i], 0, ClusterLength - 1, i);
                drs = dt.Select("Cluster='" + cluster + "'");
                if (drs.Length > 0)
                {
                    dr = drs[0];
                    dr["Count"] = int.Parse(dr["Count"].ToString()) + 1;
                }
                else
                {
                    dr = dt.Rows.Add();
                    dr["Cluster"] = cluster;
                    dr["Count"] = 1;
                }
                i = i + 1;
            }
            dt.DefaultView.Sort = "Count Desc";
            return dt;

        }

        /// <summary>
        /// 解析句子中的单词
        /// </summary>
        /// <param name="sentence">包含符号的句子</param>
        /// <returns></returns>
        public static List<string> ParseWords(string sentence)
        {
            Regex reg = new Regex(@"\b\w+\b");
            MatchCollection mc = reg.Matches(sentence);
            List<string> words = new List<string>();
            foreach (Match m in mc)
            {
                words.Add(m.Value);
            }
            return words;
        }

        /// <summary>
        /// 通过要查找的单词获取短语字符串
        /// </summary>
        /// <param name="words">划分好的单词</param>
        /// <param name="findWord">要查询的单词</param>
        /// <param name="leftWords">左边的单词个数</param>
        /// <param name="rightWords">右边的单词个数</param>
        /// <returns></returns>
        private static string GetPhrase(List<string> words, string findWord, int leftWords, int rightWords, int startIndex = 0)
        {
            string phrase = "";
            if (leftWords == 0 && rightWords == 0) return phrase;
            int wordIndex = words.FindIndex(startIndex, word => word == findWord);//要找的两个单词相距单词个数与参数个数相同
            if (wordIndex < 0) return phrase;
            int leftIndex = wordIndex - leftWords;
            int rightIndex = wordIndex + rightWords;
            if (leftIndex < 0) leftIndex = 0;
            if (rightIndex > words.Count - 1) rightIndex = words.Count - 1;
            if (leftIndex == rightIndex) return phrase;
            while (leftIndex <= rightIndex)
            {
                phrase = phrase + words[leftIndex] + " ";
                leftIndex += 1;
            }
            return phrase.Trim();

        }
        #endregion

        private void BtnCluster_Click(object sender, EventArgs e)
        {
            DateTime dt1 = DateTime.Now;
            string str = textBox1.Text;
            lbT1.Text = ExecDateDiff(dt1, DateTime.Now);
            dt1 = DateTime.Now;
            int intlength = 2;
            DataTable dt= GetClusterFromCorpus(str,intlength);
            lbT2.Text = ExecDateDiff(dt1, DateTime.Now);
            dt1 = DateTime.Now;
            dataGridView1.DataSource = dt;
            lbT3.Text = ExecDateDiff(dt1, DateTime.Now);
        }
        #region 返回时间差
        public static string DateDiff(DateTime DateTime1, DateTime DateTime2)
        {
            string dateDiff = null;
            try
            {
                TimeSpan ts1 = new TimeSpan(DateTime1.Ticks);
                TimeSpan ts2 = new TimeSpan(DateTime2.Ticks);
                TimeSpan ts = ts1.Subtract(ts2).Duration();
                string hours = ts.Hours.ToString(), minutes = ts.Minutes.ToString(), seconds = ts.Seconds.ToString();
                if (ts.Hours < 10)
                {
                    hours = "0" + ts.Hours.ToString();
                }
                if (ts.Minutes < 10)
                {
                    minutes = "0" + ts.Minutes.ToString();
                }
                if (ts.Seconds < 10)
                {
                    seconds = "0" + ts.Seconds.ToString();
                }
                dateDiff = hours + ":" + minutes + ":" + seconds;
            }
            catch
            {

            }
            return dateDiff;
        }

        /// <summary>
        /// 程序执行时间测试
        /// </summary>
        /// <param name="dateBegin">开始时间</param>
        /// <param name="dateEnd">结束时间</param>
        /// <returns>返回(秒)单位，比如: 0.00239秒</returns>
        public static string ExecDateDiff(DateTime dateBegin, DateTime dateEnd)
        {
            TimeSpan ts1 = new TimeSpan(dateBegin.Ticks);
            TimeSpan ts2 = new TimeSpan(dateEnd.Ticks);
            TimeSpan ts3 = ts1.Subtract(ts2).Duration();
            //你想转的格式
            return ts3.TotalMilliseconds.ToString();
        }
        #endregion
    }
}
