using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FMWeb
{
    public partial class MS001 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            btnSub.Click += BtnSub_Click;
            if (!IsPostBack)
            {
                DataTable dt = GetData(10);
                initSelect(dt);
            }
        }

        private void BtnSub_Click(object sender, EventArgs e)
        {
            lbErr.Text = divC.InnerHtml;
            txt.Value = divC.InnerHtml;
        }

        private void initSelect(DataTable dt)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendLine("<select id='m0' class='demo0' multiple='multiple'>");
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                DataRow dr = dt.Rows[i];
                sb.AppendLine(string.Format("<option value='{0}'>{1}</option>",dr[0],dr[1]));
            }
            sb.AppendLine("</select>");
            sb.AppendLine("<hr/>");
            sb.AppendLine("<select id='m1' class='demo1' multiple='multiple'>");
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                DataRow dr = dt.Rows[i];
                sb.AppendLine(string.Format("<option value='{0}'>{1}</option>", dr[0], dr[1]));
            }
            sb.AppendLine("</select>");
            divC.InnerHtml = sb.ToString();
        }

        private DataTable GetData(int rows)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("ID");
            dt.Columns.Add("Title");
            DataRow dr;
            for (int i = 0; i < rows; i++)
            {
                dr = dt.NewRow();
                dr[0] = i;
                dr[1] = "项"+i.ToString();
                dt.Rows.Add(dr);
            }            
            return dt;
        }
    }
}