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

public partial class QuanLyHoaDon : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ToString());
    ASP.global_asax m = new ASP.global_asax();
    DataTable x = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        //Hủy Hóa đơn (delete)
        if (!IsPostBack)
        {
            load();
            if (Request.QueryString["mess"] != null)
            {
                if (Request.QueryString["mess"] == "del-done")
                    Page.ClientScript.RegisterStartupScript(Page.GetType(),"TB","<script>alert('Hủy hóa đơn thành công.')</script>");
            }
        }
    }
    void load()
    {
        //Load hiển thị hóa đơn ra GRV
        HoaDonBLL tb = new HoaDonBLL();
        ArrayList lst = new ArrayList();
        lst = (ArrayList)tb.showHoaDon();
        GridView1.DataSource = lst;
        GridView1.DataBind();
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        //cập nhật trạng thái hóa đơn
        if (e.CommandName == "CapNhat")
        {
            foreach (GridViewRow r in GridView1.Rows)
            {
                if (GridView1.DataKeys[r.DataItemIndex].Value.ToString() == e.CommandArgument.ToString())
                {
                    DropDownList ddl = (DropDownList)r.Cells[4].FindControl("ddlTrangThai");
                    string TrangThai = ddl.SelectedValue.ToString();
                    HoaDonBLL tb = new HoaDonBLL();
                    string MaHD = e.CommandArgument.ToString();
                    tb.capNhatTrangThai(MaHD, TrangThai);
                    load();
                    string scr = "<script>alert('Thay đổi trạng thái thành công.')</script>";//windowload form thông báo trạng thái cập nhật
                    Page.ClientScript.RegisterStartupScript(Page.GetType(), "Thông báo", scr);
                }
            }
        }
    }
    protected void btnLoc_Click(object sender, EventArgs e)
    {
        //locj hóa đơn
        if (ddlTrThai.SelectedValue.ToString() == "0")//giá trị bằng 0 khi không có hóa đơn
            load();
        else
        {
            //Lấy ra hóa đơn theo trạng thái
            m.ConvertToDataTable("select * from HoaDon where TrangThai=N'" + ddlTrThai.SelectedValue.ToString() + "'", ref x);
            GridView1.DataSource = x;
            GridView1.DataBind();
        }
    }
    protected void btnTim_Click(object sender, EventArgs e)
    {
        //Lấy ra danh sách hóa đơn theo mã hóa đơn ( tìm kiếm )
        string sql = "select * from HoaDon where MaHD='" + txtTim.Text + "' or TenNguoiDat like'%" + txtTim.Text + "%'";
        m.ConvertToDataTable(sql, ref x);
        GridView1.DataSource = x;
        GridView1.DataBind();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        //phân trang và số dòng
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