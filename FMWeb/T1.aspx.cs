using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FMWeb
{
    public partial class T1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {
            string path = e.Item.ValuePath.ToString();//取值
            string path1 = Menu1.SelectedValue.ToString();//取值
            lbErr.Text = "ItemValue:"+path + ";MenuValue:"+path1;
        }
    }
}