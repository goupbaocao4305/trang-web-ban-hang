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

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString != null)
        {
            //window load thông báo Đăng ký Tài KHoản Thành Công
            if (Request.QueryString["mess"] == "reg-done")
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "Thông báo", "<script>alert('Đăng ký tài khoản thành công!')</script>");
        }
        //Hiển Thị Danh Sách 6 List ở trang chủ qua DataList
        load(DataList1,"1");
        load(DataList2,"5");
        load(DataList3,"2");
        load(DataList4,"4");
        load(DataList5,"3");
        load(DataList6,"6");
    }
    void load(DataList x,string maloai)
    {
        //Lấy ra số lượng hàng theo từng loại hàng 
        HangBLL hb = new HangBLL();
        ArrayList lst = new ArrayList();
        lst = (ArrayList)hb.showHang("select top 5 * from Hang where maloai="+maloai+"order by MaHang desc");
        x.DataSource = lst;
        x.DataBind();
    }
}