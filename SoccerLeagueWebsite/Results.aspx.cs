using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
//Name: Sidharth Choudhary    Student#- 300990285
public partial class Results : System.Web.UI.Page
{
    string connectionString = ConfigurationManager.ConnectionStrings["SqlConn"].ConnectionString;
    SqlConnection conn = new SqlConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            databind();
        }
    }


    private void databind()
    {
    }



        protected void Page_PreInit(object sender, EventArgs e)
    {
        if (Session["theme"] != null)
        {
            Page.Theme = Session["theme"].ToString();
        }
    }

    protected void uploadButton_Click(object sender, EventArgs e)
    {
    }

    protected void PlayerGrid_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
//Name: Sidharth Choudhary    Student#- 300990285