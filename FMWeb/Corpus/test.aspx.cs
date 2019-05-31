using System;
using System.Collections.Generic;
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
        }

        private void Btn_Click(object sender, EventArgs e)
        {
            string ssVal = tb1.Text;
            double sval = double.Parse(ssVal);
            lbtxt.Text = string.Format("{0:N}", sval);
        }
    }
}