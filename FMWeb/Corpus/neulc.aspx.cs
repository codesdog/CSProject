using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FMWeb.Corpus
{
    public partial class neulc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            muNeulc.MenuItemClick += muNeulc_MenuItemClick;
            lemmanew.Click += Lemmanew_Click;
            btnBackLemma.Click += BtnBackLemma_Click;
            btnCloseLemma.Click += BtnCloseLemma_Click;
            rbltxtFrom.SelectedIndexChanged += RbltxtFrom_SelectedIndexChanged;
            btnQueryforWordlist.Click += BtnQueryforWordlist_Click;
            if (!IsPostBack)
            {
                inputDiv.Visible = true;
                outputDiv.Visible = false;
                mvNeulc.ActiveViewIndex = 3;
                rbltxtFrom.SelectedValue = "0";
                muNeulc.Items[3].Selected = true;
            }
        }

        private void RbltxtFrom_SelectedIndexChanged(object sender, EventArgs e)
        {            
            if (rbltxtFrom.SelectedValue == "0")
            {
                divfromshuru.Visible = false;
                divTexts.Visible = true;
                divFromCorpus.Visible = true;
                txtKeyWordsforWordlist.Value = "";
            }
            else
            {
                divfromshuru.Visible = true;
                divTexts.Visible = true;
                username.Value = "";
                homecity_name.Value = "";
                divFromCorpus.Visible = false;
            }
            txtcontent.InnerText = "";
        }

        private void BtnQueryforWordlist_Click(object sender, EventArgs e)
        {
            throw new NotImplementedException();
        }

        private void GetTextFromCorpusByKeyWords()
        {
            throw new NotImplementedException();
        }

        private void BtnCloseLemma_Click(object sender, EventArgs e)
        {
            username.Value = "";

            outputDiv.Visible = false;
            inputDiv.Visible = true;
        }

        private void BtnBackLemma_Click(object sender, EventArgs e)
        {
            outputDiv.Visible = false;
            inputDiv.Visible = true;
        }

        private void Lemmanew_Click(object sender, EventArgs e)
        {
            outputDiv.Visible = true;
            inputDiv.Visible = false;
        }

        private void muNeulc_MenuItemClick(object sender, MenuEventArgs e)
        {
            switch (muNeulc.SelectedValue)
            {
                case "1"://这个值是在Menu中加入Item时设定的
                    {
                        mvNeulc.ActiveViewIndex = 1;
                        break;
                    }
                case "2":
                    {
                        mvNeulc.ActiveViewIndex = 2;
                        break;
                    }
                case "3":
                    {
                        mvNeulc.ActiveViewIndex = 3;
                        break;
                    }
                case "4":
                    {
                        mvNeulc.ActiveViewIndex = 4;
                        break;
                    }
                default:
                    mvNeulc.ActiveViewIndex = 0;
                    break;
            }
        }

    }
}