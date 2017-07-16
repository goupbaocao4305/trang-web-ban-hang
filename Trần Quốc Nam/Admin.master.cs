using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            else
            {
                if (Session["quyen"] != null)
                {
                    int i = (int)Session["quyen"];
                    if (i == 1)
                    {
                        lblChao.Text = "Chào " + Session["username"].ToString() + ".";
                    }
                    else
                    {
                        Response.Redirect("Default.aspx");
                    }
                }
            }
        }
    }
    protected void btnlogout_Click(object sender, EventArgs e)
    {
        Session["username"] = null;
        Session["quyen"] = null;
        Response.Redirect("Default.aspx");
    }
}
