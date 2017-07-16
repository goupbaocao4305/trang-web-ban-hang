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

public partial class QuanLyTaiKhoan : System.Web.UI.Page
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
        TaiKhoanBLL tb = new TaiKhoanBLL();
        ArrayList lst = new ArrayList();
        lst = (ArrayList)tb.showUserinfo();
        GridView1.DataSource = lst;
        GridView1.DataBind();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        // xóa tài khoản
        int MaUser = int.Parse(GridView1.DataKeys[e.RowIndex].Value.ToString());
        TaiKhoanBLL tb = new TaiKhoanBLL();
        tb.xoaUser(MaUser);
        load();
        string scr = "<script>alert('Xóa thành công.')</script>";
        Page.ClientScript.RegisterStartupScript(Page.GetType(), "Thông báo", scr);
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        // cấp quyền người dùng và admin
        if (e.CommandName == "CapQuyen")
        {
            foreach (GridViewRow r in GridView1.Rows)
            {
                if (GridView1.DataKeys[r.DataItemIndex].Value.ToString() == e.CommandArgument.ToString())
                {
                    DropDownList ddl = (DropDownList)r.Cells[6].FindControl("ddlQuyen");
                    int MaQuyen = int.Parse(ddl.SelectedValue.ToString());
                    TaiKhoanBLL tb = new TaiKhoanBLL();
                    int MaUser = int.Parse(e.CommandArgument.ToString());
                    tb.capQuyen(MaUser, MaQuyen);//quyền theo mã
                    load();
                    Session["Quyen"] = tb.layQuyen(Session["Username"].ToString());//cấp theo admin và user
                    string scr = "<script>alert('Cấp quyền thành công.')</script>"; //Thông báo windowload thành công
                    Page.ClientScript.RegisterStartupScript(Page.GetType(), "Thông báo", scr);
                }
            }
        }
    }
    protected void btnTim_Click(object sender, EventArgs e)
    {
        //tìm kiếm tài khoản theo họ tên
        string sql = "select * from TaiKhoan where Username like'%" + txtTim.Text + "%' or HoTen like'%" + txtTim.Text + "%'";
        m.ConvertToDataTable(sql, ref x);
        GridView1.DataSource = x;
        GridView1.DataBind();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        //Số dòng và số trang
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