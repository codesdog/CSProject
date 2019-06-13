using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FMWeb
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            btnSubmit.Click += BtnSubmit_Click;
            btnSubmit.Attributes.Add("onclick", "javascript:shield()");
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
    }
}