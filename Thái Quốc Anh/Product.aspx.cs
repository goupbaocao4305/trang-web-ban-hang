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

public partial class Product : System.Web.UI.Page
{
    public DataTable x,y, myCart;
    DataRow DR;
    public int i = 0;
    ASP.global_asax m = new ASP.global_asax();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString != null)
            {
                //Hiển thị thông tin chi tiết mặt hàng đã chọn theo Mã Hàng
                int mahang = int.Parse(Request.QueryString["id"].ToString()); 
                m.ConvertToDataTable("select * from Hang where MaHang=" + mahang + "", ref x);
                DataList1.DataSource = x;
                DataList1.DataBind();
                Session["DT"] = x;
                myCart = (DataTable)Session["Cart"];
                if (myCart == null) Session["Cart"] = m.MakeCart();
                int maloai = int.Parse(x.Rows[0]["MaLoai"].ToString());
                //Lấy Ra danh sách các mặt hàng cùng loại
                m.ConvertToDataTable("select top 5 * from Hang where MaLoai=" + maloai + " and MaHang!=" + mahang + " order by NEWID()", ref y);
                DataList2.DataSource = y;
                DataList2.DataBind();
            }
            else
                Response.Redirect("Default.aspx");
        }
    }
    protected void btnThemVaoGio_Click(object sender, EventArgs e)
    {
        //Thêm Vào Giỏ hàng
        Button b = (Button)sender as Button;
        int k = int.Parse(b.CommandArgument);
        x = (DataTable)Session["DT"];
        myCart = (DataTable)Session["Cart"];
        bool rs = true;
        foreach (DataRow DR in myCart.Rows)
        {
            if ((String)myCart.Rows[i]["Product"] == (String)x.Rows[k]["TenHang"])
            {
                myCart.Rows[i]["Quantity"] = (Int32)myCart.Rows[i]["Quantity"] + 1;
                myCart.Rows[i]["Sum"] = (Int32)myCart.Rows[i]["Quantity"] * Double.Parse(myCart.Rows[i]["Cost"].ToString());
                rs = false;
            }

        }
        //Hiển thị tên hàng, hình ảnh, đơn giá và mã hàng
        if(rs==true)
            m.AddToCart(ref myCart, x.Rows[k]["TenHang"].ToString(), (String)x.Rows[k]["HinhAnh"], 1, Decimal.Parse(x.Rows[k]["DonGia"].ToString()), x.Rows[k]["MaHang"].ToString());   
        Session["Cart"] = myCart;
        Response.Redirect("Cart.aspx");
    }
}