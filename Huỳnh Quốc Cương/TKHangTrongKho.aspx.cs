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

public partial class TKHangTrongKho : System.Web.UI.Page
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
        if (ddtSapXep.SelectedValue == "0") sql = "select * from Hang order by Soluong";//hiển thị theo số lương tăng dần
        else sql = "select * from Hang order by Soluong desc";//ngược lại giảm dần
        m.ConvertToDataTable(sql, ref x);
        GridView1.DataSource = x;
        GridView1.DataBind();
    }
    protected void ddtSapXep_SelectedIndexChanged(object sender, EventArgs e)
    {
        load();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        //số trang và số dòng
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