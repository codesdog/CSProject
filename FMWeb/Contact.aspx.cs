using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace FMWeb
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            btnSubmit.Click += BtnSubmit_Click;
            btnSubmit.Attributes.Add("onclick", "javascript:shield()");
            GridView1.PageIndexChanging += GridView1_PageIndexChanging;
            bindGv();
        }

        private void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            bindGv();
        }

        private void BtnSubmit_Click(object sender, EventArgs e)
        {
            int i = 1;
            do
            {
                i++;
            }
            while (i>0);
            lbErr.Text = i.ToString();
        }

        private void bindGv()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("ID");
            for (int i = 0; i < 100; i++)
            {
                DataRow dr = dt.NewRow();
                dr[0] = i + 1;
                dt.Rows.Add(dr);
            }
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}