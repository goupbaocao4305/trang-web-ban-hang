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

public partial class TKHangBanChay : System.Web.UI.Page
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
    {
        string sql = "";
        //Hiển thị danh sách số hàng bán chạy theo số lương tăng dần
        if (ddtSapXep.SelectedValue == "0") sql = "select * from thongKeMuaNhieu() order by Soluong desc";
        else sql = "select * from thongKeMuaNhieu() order by Soluong";//Và ngược lại theo số lượng giảm dần
        m.ConvertToDataTable(sql, ref x);
        GridView1.DataSource = x;
        GridView1.DataBind();
        lblTongTien.Text = String.Format("{0:0,0}", TongTien(x)) + " đ";//tổng số tiền thống kê tất cả mặt hàng bán được
    }
    protected void ddtSapXep_SelectedIndexChanged(object sender, EventArgs e)
    {
        load();
    }
    Decimal TongTien(DataTable DT)
    {
        //Tổng số tiền theo số lượng bán được của mỗi sản phẩm
        Decimal S = 0;
        foreach (DataRow DR in DT.Rows)
            S += Decimal.Parse(DR["ThanhTien"].ToString());
        return S;
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        //số trang và dòng
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