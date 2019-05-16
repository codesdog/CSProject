using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace FMWeb
{
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            menu01.MenuItemClick += Menu01_MenuItemClick;
            btnSubmit.Click += BtnSubmit_Click;
            if (!IsPostBack)
            {
                mv1.ActiveViewIndex = 0;
            }
        }

        private DataTable GetDT(string tbName, int rows)
        {
            DataTable dt = new DataTable(tbName);
            dt.Columns.Add("级别");
            dt.Columns.Add("词汇量");
            dt.Columns.Add("级别号");
            DataRow dr= dt.NewRow();
            dr[0] = "";
            dr[1] = tbName ;
            dt.Rows.Add(dr);
            return dt;
        }

        private void BtnSubmit_Click(object sender, EventArgs e)
        {
            if (lbErr.Text == "现在是开灯状态")
            {
                btnSubmit.BackColor = Color.Black;
                btnSubmit.ForeColor = Color.White;
                btnSubmit.Text = "开灯";
                lbErr.Text = "现在是关灯状态";
            }
            else
            {
                btnSubmit.BackColor = Color.White;
                btnSubmit.ForeColor = Color.Black;
                btnSubmit.Text = "关灯";
                lbErr.Text = "现在是开灯状态";
            }            
        }

        private void Menu01_MenuItemClick(object sender, MenuEventArgs e)
        {
            switch (menu01.SelectedValue)
            {
                case "1"://这个值是在Menu中加入Item时设定的
                    {
                        mv1.ActiveViewIndex = 1;
                        break;
                    }
                case "2":
                    {
                        mv1.ActiveViewIndex = 2;
                        break;
                    }
                case "3":
                    {
                        mv1.ActiveViewIndex = 3;
                        break;
                    }                
                default:
                    mv1.ActiveViewIndex = 0;
                    break;
            }
        }
    }
}