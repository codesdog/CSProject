using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FMWeb.Corpus
{
    public partial class test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            btn.Click += Btn_Click;
            btnUrl.Click += BtnUrl_Click;
            btn2.Click += Btn2_Click;
        }

        private void BtnUrl_Click(object sender, EventArgs e)
        {
            string urlp = "NEULC";
            if (Request.QueryString["cp"]== null)
            {
                throw new ArgumentNullException(Request.QueryString["cp"]);
            }
            else
            {
                urlp = Request.QueryString["cp"];
            }
            lbtxt.Text = urlp;
        }

        private void Btn2_Click(object sender, EventArgs e)
        {
            string keyw = tb2.Text;
            DataTable dt = GetDt();
            DataView dv = dt.DefaultView;
            dv.RowFilter = "' ' + C2 + ' ' like '%[^a-zA-Z]"+keyw+"[^a-zA-Z]%'";
            DataTable dtResult = dv.ToTable();
            gv2.DataSource = dtResult;
            gv2.DataBind();
        }

        private void Btn_Click(object sender, EventArgs e)
        {
            string ssVal = tb1.Text;
            double sval = double.Parse(ssVal);
            lbtxt.Text = string.Format("{0:N}", sval);
        }

        private DataTable GetDt()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("C1");
            dt.Columns.Add("C2");
            DataRow dr = dt.NewRow();
            dr[0] = "Teacher";
            dr[1] = "I am a teacher";
            dt.Rows.Add(dr);

            dr = dt.NewRow();
            dr[0] = "you";
            dr[1] = "you are a Ice";
            dt.Rows.Add(dr);

            dr = dt.NewRow();
            dr[0] = "he";
            dr[1] = "he is handsome";
            dt.Rows.Add(dr);

            dr = dt.NewRow();
            dr[0] = "she";
            dr[1] = "she is beautiful";
            dt.Rows.Add(dr);
            return dt;
        }
    }
}