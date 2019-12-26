using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//Name: Sidharth Choudhary    Student#- 300990285
public partial class AddDisplayClubs : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public string textBoxClub
    {
        get
        {
            return txtClub.Text;
        }
    }

    public string textBoxCity
    {
        get
        {
            return txtCity.Text;
        }
    }
    public void clearmethod ()
    {
        txtClub.Text = string.Empty;
        txtCity.Text = string.Empty;
    }
    
}
//Name: Sidharth Choudhary    Student#- 300990285