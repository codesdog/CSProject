using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Windows.Forms.DataVisualization.Charting;

namespace CSharpCallPython
{
    public partial class fmChart2 : Form
    {
        public fmChart2()
        {
            InitializeComponent();
        }

        /// <summary>
        /// 创建比较计算结果表
        /// </summary>
        /// <returns></returns>
        private DataTable InitComputedTable()
        {
            DataTable dt = new DataTable();
            //添加列
            dt.Columns.Add("Items");//单词
            dt.Columns.Add("do");//词频计数
            dt.Columns.Add("go");//出现该词的语料计数

            DataRow dr = dt.NewRow();
            dr[0] = "单词计数";
            dr[1] = 35;
            dr[2] = 20;
            dt.Rows.Add(dr);

            dr = dt.NewRow();
            dr[0] = "语料计数";
            dr[1] = 50;
            dr[2] = 29;
            dt.Rows.Add(dr);

            return dt;
        }

        private void FmChart2_Load(object sender, EventArgs e)
        {
            DataTable dt = InitComputedTable();
            BindScoreTrend(dt);
        }

        /// <summary>
        /// 比较柱状图Chart绑定数据
        /// </summary>
        /// <param name="dt"></param>
        private void BindScoreTrend(DataTable dt)
        {
            chart1.Series.Clear();
            for (int i = 1; i < dt.Columns.Count; i++)
            {
                Series cs = new Series();
                cs.Points.DataBind(dt.DefaultView, dt.Columns[0].ColumnName, dt.Columns[i].ColumnName, string.Format("LegendText={0},YValues={1},ToolTip={1}", dt.Columns[0].ColumnName, dt.Columns[i].ColumnName));
                cs.ChartType = SeriesChartType.Column;
                cs.Name = dt.Columns[i].ColumnName;
                cs.Label= dt.Columns[i].ColumnName + " #VAL ";
                chart1.Series.Add(cs);
            }
            chart1.DataBind();
        }
    }
}
