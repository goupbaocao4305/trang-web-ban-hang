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

public partial class Cart : System.Web.UI.Page
{
    public int i = 0;
    DataTable myCart = new DataTable();
    DataTable x = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //với cart null khi trong giỏ hàng không có sản phẩm và trả về default
            if (Session["Cart"] != null)
            {
                myCart = (DataTable)Session["Cart"];
                if (myCart.Rows.Count == 0)
                    Response.Redirect("Default.aspx");
                else
                    //Ngược lại nếu card có sản phẩm thì giá trị tiển sẻ được + lên theo số lượng
                {
                    GridView1.DataSource = myCart;
                    GridView1.DataBind();
                    lblTongTien.Text = String.Format("{0:0,0}", TongTien(myCart)) + " đ";
                }
            }
            else Response.Redirect("Default.aspx");
        }

    }
    Decimal TongTien(DataTable DT)
    {
        //Sum tổng tiền hàng trong giỏ hàng
        Decimal S = 0;
        foreach (DataRow DR in DT.Rows)
            S += Decimal.Parse(DR["Sum"].ToString());
        return S;
    }

    protected void btnMuaTiep_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
    protected void btnCapNhat_Click(object sender, ImageClickEventArgs e)
    {
        // cập nhật giỏ hàng
        HangBLL hb = new HangBLL();
        DataTable myCart = (DataTable)Session["Cart"];
        foreach (GridViewRow r in GridView1.Rows)
        {
            foreach (DataRow dr in myCart.Rows)
            {
                if (GridView1.DataKeys[r.DataItemIndex].Value.ToString() == dr["Product"].ToString())
                {
                    //Sum số lượng cần cập nhật
                    int sl = hb.laySLHang(dr["Product"].ToString());
                    TextBox t = (TextBox)r.Cells[3].FindControl("txtSoLuong");
                    if (int.Parse(t.Text) <= sl)
                    {
                        if (int.Parse(t.Text) <= 0)
                        {
                            myCart.Rows.Remove(dr);
                            Response.Redirect("Default.aspx");
                        }
                        else
                        {
                            dr["Quantity"] = t.Text;
                            dr["Sum"] = int.Parse(dr["Quantity"].ToString()) * double.Parse(dr["Cost"].ToString());
                            lblThongBao.Visible = false;
                        }
                    }
                    else
                    {
                        //ngược lại nếu hết hàng hoặc còn ít hàng thì sẻ trả về thông báo
                        lblThongBao.Visible = true;
                        lblThongBao.Text = "Sản phẩm bạn vừa chọn hiện chỉ còn " + sl.ToString() + " cái";
                    }
                }
            }
        }
        //số lượng sau khi cập nhật xong sẻ đc sum lại thành tiền
        GridView1.DataSource = myCart;
        GridView1.DataBind();
        lblTongTien.Text = String.Format("{0:0,0}", TongTien(myCart)) + " đ";
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int chiso = int.Parse(e.CommandArgument.ToString());
        try
        {
            //xóa sản phẩm trong giỏ hàng
            DataTable dt = (DataTable)Session["Cart"];
            dt.Rows.RemoveAt(chiso);
            Session["Cart"] = dt;
            Response.Redirect("Cart.aspx");
        }
        catch
        {
            //cập nhật lại giỏ hàng
            Response.Redirect("Cart.aspx");
        }
    }
    protected void btnTiepTuc_Click(object sender, EventArgs e)
    {
        //button click đến thông tin giỏ hàng
        Response.Redirect("CartInfo.aspx");
    }
}