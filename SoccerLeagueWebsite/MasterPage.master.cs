using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//Name: Sidharth Choudhary    Student#- 300990285
public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
      
    }

    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (Session["theme"] != null)
        {
            Page.Theme = Session["theme"].ToString();
        }
    }
    protected void ThemeDdl_SelectedIndexChanged(object sender, EventArgs e)
    {
    }
}
//Name: Sidharth Choudhary    Student#- 300990285