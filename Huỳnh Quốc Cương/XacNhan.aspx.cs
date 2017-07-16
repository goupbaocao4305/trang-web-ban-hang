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

public partial class XacNhan : System.Web.UI.Page
{
    public int i = 0;
    DataTable myCart = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Cart"] != null)
            {
                //lấy thông tin họ địa chỉ, họ tên tỉnh quận/huyện xã form 2
                if (Session["DiaChi"] != null && Session["HoTen"] != null && Session["Province"] != null && Session["District"] != null && Session["Ward"] != null &&
                    Session["SDT"] != null && Session["Email"] != null)
                {
                    //Hiển thị ra form người đặt hàng thông tin chi tiết
                    lblDiaChi.Text = Session["DiaChi"].ToString();
                    lblHoTen.Text = Session["HoTen"].ToString();
                    lblProvince.Text = Session["Province"].ToString();
                    lblDistrict.Text = Session["District"].ToString();
                    lblWard.Text = Session["Ward"].ToString();
                    lblSDT.Text = Session["SDT"].ToString();
                    lblEmail.Text = Session["Email"].ToString();
                }
                //lấy thông tin họ địa chỉ, họ tên tỉnh quận/huyện xã  form 2
                if (Session["DiaChi2"] != null && Session["HoTen2"] != null && Session["Province2"] != null && Session["District2"] != null && Session["Ward2"] != null &&
                    Session["SDT2"] != null && Session["Email2"] != null)
                {
                    //Hiển thị ra form người nhận hàng thông tin chi tiết
                    lblDiaChi2.Text = Session["DiaChi2"].ToString();
                    lblHoTen2.Text = Session["HoTen2"].ToString();
                    lblProvince2.Text = Session["Province2"].ToString();
                    lblDistrict2.Text = Session["District2"].ToString();
                    lblWard2.Text = Session["Ward2"].ToString();
                    lblSDT2.Text = Session["SDT2"].ToString();
                    lblEmail2.Text = Session["Email2"].ToString();
                }
                else
                {
                    //ngược lại thông tin người đặt hàng không đổi thì sẻ show ra ở form nhận hàng là người đặt hàng
                    lblDiaChi2.Text = Session["DiaChi"].ToString();
                    lblHoTen2.Text = Session["HoTen"].ToString();
                    lblProvince2.Text = Session["Province"].ToString();
                    lblDistrict2.Text = Session["District"].ToString();
                    lblWard2.Text = Session["Ward"].ToString();
                    lblSDT2.Text = Session["SDT"].ToString();
                    lblEmail2.Text = Session["Email"].ToString();
                }
                //Tổng số tiền mà cart hiện có khi đã thanh toán từ giỏ hàng
                myCart = (DataTable)Session["Cart"];
                GridView1.DataSource = myCart;
                GridView1.DataBind();
                lblTongTien.Text = String.Format("{0:0,0}", TongTien(myCart)) + " đ";
            }
            else 
                Response.Redirect("Default.aspx");
        }
    }
    Decimal TongTien(DataTable DT)
    {
        //sum tính tổng tiền 
        Decimal S = 0;
        foreach (DataRow DR in DT.Rows)
            S += Decimal.Parse(DR["Sum"].ToString());
        return S;
    }
    protected void btnXacNhan_Click(object sender, EventArgs e)
    {
        //xác nhận đặt hàng
        cc.ValidateCaptcha(txtCaptCha.Text);
        if (cc.UserValidated)
        {
            bool kq = false;
            string mahd = DateTime.Now.Day.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Year.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Millisecond.ToString();
            HoaDonInfo hd = new HoaDonInfo();
            hd.Mahd = mahd;
            hd.Tennguoidat = lblHoTen.Text;
            hd.Diachinguoidat = lblDiaChi.Text + " - " + lblWard.Text + " - " + lblDistrict.Text + " - " + lblProvince.Text;
            hd.SDTnguoidat = lblSDT.Text;
            hd.Emailnguoidat = lblEmail.Text;
            hd.Tennguoinhan = lblHoTen2.Text;
            hd.Diachinguoinhan = lblDiaChi2.Text + " - " + lblWard2.Text + " - " + lblDistrict2.Text + " - " + lblProvince2.Text;
            hd.SDTnguoinhan = lblSDT2.Text;
            hd.Emailnguoinhan = lblEmail2.Text;
            hd.Ngaydathang = DateTime.Now;
            HoaDonBLL hb = new HoaDonBLL();
            int i = hb.themHoaDon(hd);
            if (i > 0)
            {
                myCart = myCart = (DataTable)Session["Cart"];
                foreach (DataRow dr in myCart.Rows)
                {
                    hd.Mahang = int.Parse(dr["ID"].ToString());
                    hd.Soluong = int.Parse(dr["Quantity"].ToString());
                    int k = hb.themCTHoaDon(hd);
                    if (k > 0)
                    {
                        kq = true;
                    }
                    else
                    {
                        Response.Write("<script>alert('Lỗi')</script>");
                    }
                }
            }
            else
            {
                Response.Write("<script>alert('Lỗi')</script>");
            }
            if (kq == true)
            {
                //trả về kết quả đặt hàng thành công => đi đến trang thành công
                Session["MaHD"] = hd.Mahd;
                Session["Email"] = hd.Emailnguoidat;
                Response.Redirect("ThanhCong.aspx");
            }
        }
        else
        {
            lblTB.Visible = true;
            lblTB.Text = "Mã bảo vệ chưa đúng";
        }
    }
    protected void rfCaptCha_Click(object sender, ImageClickEventArgs e)
    {
        txtCaptCha.Text = null;
    }
}