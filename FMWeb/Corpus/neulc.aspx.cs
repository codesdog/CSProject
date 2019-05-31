using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

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
            gvCorpusforWordList.RowDataBound += GvCorpusforWordList_RowDataBound;
            btnLemmaAll.Click += BtnLemmaAll_Click;
            if (!IsPostBack)
            {
                
                divOutput.Visible = false;
                mvNeulc.ActiveViewIndex = 3;
                rbltxtFrom.SelectedValue = "0";
                muNeulc.Items[3].Selected = true;
            }
        }

        private void BtnLemmaAll_Click(object sender, EventArgs e)
        {
            DataTable dtCorpusforWordList = (DataTable)ViewState["dtCorpusforWordList"];
            StringBuilder sb = new StringBuilder();

            foreach (DataRow dr in dtCorpusforWordList.Rows)
            {
                sb.AppendLine(dr["OriginalText"].ToString());
            }
            txtcontent.Value = sb.ToString();
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
                txt_Author.Value = "";
                txt_Title.Value = "";
                divFromCorpus.Visible = false;
            }
            txtcontent.InnerText = "";
        }

        private void BtnQueryforWordlist_Click(object sender, EventArgs e)
        {
            divCorpusforWordList.Visible = true;
            GetDataQueryed();
            DataTable dtCorpusforWordList = (DataTable)ViewState["dtCorpusforWordList"];
            gvCorpusforWordList.DataSource = dtCorpusforWordList;
            gvCorpusforWordList.DataBind();
        }

        private void GvCorpusforWordList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (((Label)e.Row.FindControl("lbText")) != null)
                {
                    Label lbText = (Label)(e.Row.FindControl("lbText"));

                    //下面三句代码可以实现你的效果，如果不合适，自己可以比照着修改一下。
                    string strContext = lbText.Text;
                    string js = string.Format("fillTextfromRow(\"{0}\");", strContext);
                    e.Row.Attributes.Add("onclick", js);
                    string[] paraWords = strContext.Split(' ');
                    int wordDisp = 10;
                    if (paraWords.Length<wordDisp)
                    {
                        wordDisp = paraWords.Length;
                        
                    }
                    string temp = "";
                    for (int i = 0; i < wordDisp; i++)
                    {
                        temp += paraWords[i] + " ";
                    }
                    lbText.Text = temp.TrimEnd() + "...";
                }
                ////e.Row.Attributes.Add("onclick", e.Row.ClientID.ToString() + ".checked=true;alert(" + e.Row.ClientID.ToString() + ")");
                //e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='#Efefef';Cursor:hand");
                //e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=''");

                //DataRowView row = (DataRowView)e.Row.DataItem;
                //e.Row.ID = gvCorpusforWordList.DataKeys[e.Row.RowIndex]["CorpusID"].ToString();//ID为唯一能够标识一条记录的字段 
                //if (e.Row.ID != null && row != null)
                //{
                //    e.Row.Cells[1].Attributes.Add("ondblclick", "window.open('ParhelionRestEdittPage.aspx?index=" + (e.Row.RowIndex + 1).ToString() + "&id=" + e.Row.Cells[0].Text.Trim() + "',null,'width=400,height=108,left=300,top=200');");

                //    e.Row.Cells[1].Attributes.Add("onmouseover", "c=this.style.backgroundColor;this.style.backgroundColor='#F89E14',this.style.cursor='pointer';");
                //    //鼠标事件 this.style.backgroundColor='#F89E14' 列背景色  this.style.cursor='pointer' 鼠标放上去样式 
                //    e.Row.Cells[1].Attributes.Add("onmouseout", "this.style.backgroundColor='';");
                //}

                
                //下面两句代码是添加鼠标效果，可以省略，当鼠标移动到行上时，变颜色
                e.Row.Attributes.Add("onmouseover", "currentcolor=this.style.backgroundColor;this.style.backgroundColor='#ccddff',this.style.fontWeight='Bold',this.style.cursor='pointer';");
                //当鼠标离开的时候 将背景颜色还原的以前的颜色
                e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=currentcolor,this.style.fontWeight='';");
            }
        }

        private void GetDataQueryed()
        {
            DataTable dt = new DataTable("词汇表");
            DataColumn colID = new DataColumn()
            {
                ColumnName = "CorpusID",/*自增列名称*/
                AutoIncrement = true /*设置是否为自增列*/,
                AutoIncrementSeed = 1 /*设置自增初始值*/,
                AutoIncrementStep = 1 /*设置每次子增值*/
            };
            dt.Columns.Add(colID);
            dt.Columns.Add("Title");
            dt.Columns.Add("OriginalText");
            for (int i = 0; i < 10; i++)
            {
                DataRow dr = dt.NewRow();
                dr["Title"] = "Title" + (i + 1).ToString();
                dr["OriginalText"] = "Para " + (i + 1).ToString() + ":Towards the close of the fifteenth century, Spain achieved her final triumph over the infidels of Granada, and made her name glorious through all generations by the discovery of America. The religious zeal and romantic daring which a long course of Moorish wars had called forth were now exalted to redoubled fervor!" ;
                dt.Rows.Add(dr);
            }
            ViewState["dtCorpusforWordList"]=dt;
        }
        private void GetTextFromCorpusByKeyWords()
        {
            throw new NotImplementedException();
        }

        private void BtnCloseLemma_Click(object sender, EventArgs e)
        {
            txt_Author.Value = "";

            divOutput.Visible = false;
        }

        private void BtnBackLemma_Click(object sender, EventArgs e)
        {
            divOutput.Visible = false;

        }

        private void Lemmanew_Click(object sender, EventArgs e)
        {
            divOutput.Visible = true;

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
                case "30":
                    {
                        mvNeulc.ActiveViewIndex = 3;
                        divFromCorpus.Visible = false;
                        divfromshuru.Visible = true;
                        muNeulc.Items[3].Selected = true;
                        break;
                    }
                case "31":
                    {
                        mvNeulc.ActiveViewIndex = 3;
                        muNeulc.Items[3].Selected = true;
                        divFromCorpus.Visible = true;
                        divfromshuru.Visible = false;
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