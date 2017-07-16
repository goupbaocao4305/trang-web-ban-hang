using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class control_top : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Username"] != null)
        {
            pnl_guest.Visible = false;
            lblChao.Text = "Chào " + Session["Username"].ToString() + ",";
            int i = (int)Session["Quyen"];
            if (i == 1)
                btnAdmin.Visible = true;
            else
                btnAdmin.Visible = false;
        }
        else
            pnl_user.Visible = false;
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        TaiKhoanBLL tk = new TaiKhoanBLL();
        if (tk.dangNhap(txtUsername.Text, txtPass.Text))
        {
            Session["Username"] = txtUsername.Text;
            Session["Quyen"] = tk.layQuyen(txtUsername.Text);
            if (Request.QueryString["id"] != null)
                Response.Redirect(Request.Url.AbsolutePath.ToString() + "?id=" + Request.QueryString["id"].ToString());
            else
                Response.Redirect(Request.Url.AbsolutePath.ToString() + "?mess=log-done");
        }
        else
            Page.ClientScript.RegisterStartupScript(Page.GetType(),"Thông báo", "<script>alert('Tài khoản hoặc mật khẩu chưa đúng!')</script>");
    }
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session["Username"] = null;
        Session["Quyen"] = null;
        if (Request.QueryString["id"] != null)
            Response.Redirect(Request.Url.AbsolutePath.ToString() + "?id=" + Request.QueryString["id"].ToString());
        else
            Response.Redirect(Request.Url.AbsolutePath.ToString());
    }
    protected void btnAdmin_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin.aspx");
    }
}