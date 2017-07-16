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

public partial class ChiTietHoaDon : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ToString());
    ASP.global_asax m = new ASP.global_asax();
    DataTable x = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            loadCTHD();
            loadUserInfo();
        }
    }
    void loadCTHD()
    {
        if (Request.QueryString["id"] != null)
        {
            string s = "show_CTHD '" + Request.QueryString["id"].ToString() + "'";
            m.ConvertToDataTable(s, ref x);
            GridView1.DataSource = x;
            GridView1.DataBind();
            lblTongTien.Text = String.Format("{0:0,0}", TongTien(x)) + " đ";
        }
        else
        {
            Response.Redirect("QuanLyHoaDon.aspx");
        }
    }
    void loadUserInfo()
    {
        if (Request.QueryString["id"] != null)
        {
            string s = "select * from HoaDon where MaHD = '" + Request.QueryString["id"].ToString() + "'";
            m.ConvertToDataTable(s, ref x);
            DataList1.DataSource = x;
            DataList1.DataBind();
        }
        else
        {
            Response.Redirect("QuanLyHoaDon.aspx");
        }
    }
    Decimal TongTien(DataTable DT)
    {
        Decimal S = 0;
        foreach (DataRow DR in DT.Rows)
            S += Decimal.Parse(DR["ThanhTien"].ToString());
        return S;
    }
    protected void btnHuy_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] != null)
        {
            HoaDonBLL hb = new HoaDonBLL();
            hb.xoaCTHD(Request.QueryString["id"].ToString());
            hb.xoaHD(Request.QueryString["id"].ToString());
            Response.Redirect("QuanLyHoaDon.aspx?mess=del-done");
        }
    }
    protected void btnTroVe_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.Url.AbsolutePath.ToString());
    }
}