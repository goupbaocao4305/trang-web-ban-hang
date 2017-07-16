using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;

public partial class Site : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Cart"] != null)
            {
                DataTable myCart = (DataTable)Session["Cart"];
                if (myCart.Rows.Count > 0) lblSoSP.Text = myCart.Rows.Count.ToString();
                else lblSoSP.Text = "0";
            }
            else lblSoSP.Text = "0";
        }
    }
    protected void btnSearch_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("TimKiem.aspx?key=" + txtSearch.Text);
    }
}
