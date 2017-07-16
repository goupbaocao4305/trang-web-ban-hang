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

public partial class TKDonHang : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ToString());
    ASP.global_asax m = new ASP.global_asax();
    DataTable x = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            load();
        }
    }
    void load()
    { //lấy ra danh sách hóa đơn và hiển thị theo ngày đặt hàng
        string sql = "";
        if (txtNgay.Text == "") sql = "select * from HoaDon order by NgayDatHang desc";
        else sql = "select * from HoaDon where NgayDatHang='" + txtNgay.Text + "'";
        m.ConvertToDataTable(sql, ref x);
        GridView1.DataSource = x;
        GridView1.DataBind();
    }
    protected void btnLoc_Click(object sender, EventArgs e)
    {
        load();//load lại lọc
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        //Phân trang + số dòng
        GridView1.PageIndex = e.NewPageIndex;
        int trang_thu = e.NewPageIndex;
        int so_dong = GridView1.PageSize;
        stt = trang_thu * so_dong + 1;
        load();
    }
    int stt = 1;
    public string get_stt()
    {
        return Convert.ToString(stt++);
    }
}