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

public partial class CartInfo : System.Web.UI.Page
{
    ASP.global_asax m = new ASP.global_asax();
    DataTable myCart = new DataTable();
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Cart"] != null)
            {
                myCart = (DataTable)Session["Cart"];
                if (myCart.Rows.Count == 0)
                    Response.Redirect("Default.aspx");
                else
                {
                    if (Session["Username"] != null)
                    {
                        showProvince();
                        loadInfo();
                    }
                    else
                    {
                        showProvince();
                        ddlDistrict.Items.Add(new ListItem("Chọn Quận/Huyện", "0"));
                        ddlWard.Items.Add(new ListItem("Chọn Phường/Xã", "0"));
                    }
                }
            }
            else
                Response.Redirect("Default.aspx");
        }
    }
    void loadInfo()
    {
        //nếu đã đăng nhập( thành viên) thì sẻ hiển thị thông tin ở form Thông tin người đặt hàng !
        conn.Open();
        string sql = "select * from TaiKhoan where Username='" + Session["Username"].ToString() + "'";
        string province = "";
        string district = "";
        string ward = "";
        SqlCommand cmd = new SqlCommand(sql, conn);
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            txtHoTen.Text = dr["HoTen"].ToString();
            txtEmail.Text = dr["Email"].ToString();
            txtDiaChi.Text = dr["DiaChi"].ToString();
            txtSDT.Text = dr["SDT"].ToString();
            province = dr["ProvinceID"].ToString();
            district = dr["DistrictID"].ToString();
            ward = dr["WardID"].ToString();
        }
        dr.Close();
        ddlDistrict.Items.Clear();
        //hiển thị danh sách phường xã tỉnh thành phố khi đã đký và đăng nhập
        ddlDistrict.Items.Add(new ListItem("Chọn Quận/Huyện", "0"));
        SqlDataAdapter ad = new SqlDataAdapter("Select * from District where ProvinceID = " + province, conn);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddlDistrict.Items.Add(new ListItem(dt.Rows[i]["DistrictName"].ToString(), dt.Rows[i]["DistrictID"].ToString()));
            }
        }
        ddlWard.Items.Clear();
        ddlWard.Items.Add(new ListItem("Chọn Phường/Xã", "0"));
        SqlDataAdapter ad2 = new SqlDataAdapter("Select * from Ward where DistrictID = " + district, conn);
        DataTable dt2 = new DataTable();
        ad2.Fill(dt2);
        if (dt2.Rows.Count > 0)
        {
            for (int i = 0; i < dt2.Rows.Count; i++)
            {
                ddlWard.Items.Add(new ListItem(dt2.Rows[i]["WardName"].ToString(), dt2.Rows[i]["WardID"].ToString()));
            }
        }
        conn.Close();
        ddlProvince.SelectedValue = province;
        ddlDistrict.SelectedValue = district;
        ddlWard.SelectedValue = ward;
    }
    private void showProvince()
    {
        ddlProvince.Items.Clear();
        ddlProvince.Items.Add(new ListItem("Chọn Tỉnh/Thành Phố", "0"));
        SqlDataAdapter ad = new SqlDataAdapter("Select * from Province", conn);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddlProvince.Items.Add(new ListItem(dt.Rows[i]["ProvinceName"].ToString(), dt.Rows[i]["ProvinceID"].ToString()));
            }
        }
    }
    private void showDistrict()
    {
        //lấy ra danh sách  Tỉnh quận huyện xã theo danh sách và ID đã được gán trong DB => theo Form Đặt Hàng
        ddlDistrict.Items.Clear();
        ddlDistrict.Items.Add(new ListItem("Chọn Quận/Huyện", "0"));
        SqlDataAdapter ad = new SqlDataAdapter("Select * from District where ProvinceID = " + ddlProvince.SelectedValue, conn);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddlDistrict.Items.Add(new ListItem(dt.Rows[i]["DistrictName"].ToString(), dt.Rows[i]["DistrictID"].ToString()));
            }
        }
    }
    private void showWard()
    {
        ddlWard.Items.Clear();
        ddlWard.Items.Add(new ListItem("Chọn Phường/Xã", "0"));
        SqlDataAdapter ad = new SqlDataAdapter("Select * from Ward where DistrictID = " + ddlDistrict.SelectedValue, conn);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddlWard.Items.Add(new ListItem(dt.Rows[i]["WardName"].ToString(), dt.Rows[i]["WardID"].ToString()));
            }
        }
    }
    protected void ddlProvince_SelectedIndexChanged(object sender, EventArgs e)
    {
        showDistrict();
    }
    protected void ddlDistrict_SelectedIndexChanged(object sender, EventArgs e)
    {
        showWard();
    }
    protected void ddlProvince2_SelectedIndexChanged(object sender, EventArgs e)
    {
        showDistrict2();
    }
    protected void ddlDistrict2_SelectedIndexChanged(object sender, EventArgs e)
    {
        showWard2();
    }
    private void showProvince2()
    {
        //lấy ra danh sách  Tỉnh quận huyện xã theo danh sách và ID đã được gán trong DB => theo Form Nhận Hàng
        ddlProvince2.Items.Clear();
        ddlProvince2.Items.Add(new ListItem("Chọn Tỉnh/Thành Phố", "0"));
        SqlDataAdapter ad = new SqlDataAdapter("Select * from Province", conn);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddlProvince2.Items.Add(new ListItem(dt.Rows[i]["ProvinceName"].ToString(), dt.Rows[i]["ProvinceID"].ToString()));
            }
        }
    }
    private void showDistrict2()
    {
        ddlDistrict2.Items.Clear();
        ddlDistrict2.Items.Add(new ListItem("Chọn Quận/Huyện", "0"));
        SqlDataAdapter ad = new SqlDataAdapter("Select * from District where ProvinceID = " + ddlProvince2.SelectedValue, conn);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddlDistrict2.Items.Add(new ListItem(dt.Rows[i]["DistrictName"].ToString(), dt.Rows[i]["DistrictID"].ToString()));
            }
        }
    }
    private void showWard2()
    {
        ddlWard2.Items.Clear();
        ddlWard2.Items.Add(new ListItem("Chọn Phường/Xã", "0"));
        SqlDataAdapter ad = new SqlDataAdapter("Select * from Ward where DistrictID = " + ddlDistrict2.SelectedValue, conn);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddlWard2.Items.Add(new ListItem(dt.Rows[i]["WardName"].ToString(), dt.Rows[i]["WardID"].ToString()));
            }
        }
    }
    protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox2.Checked)
        {
            //Gán Checkbox bằng true để chọn và nhập lại thông tin người nhận hàng
            Panel1.Visible = true;
            showProvince2();
            ddlDistrict2.Items.Clear();
            ddlWard2.Items.Clear();
            ddlDistrict2.Items.Add(new ListItem("Chọn Quận/Huyện", "0"));
            ddlWard2.Items.Add(new ListItem("Chọn Phường/Xã", "0"));
        }
        else Panel1.Visible = true;
    }
    protected void btnTiepTuc_Click(object sender, EventArgs e)
    {
        //Button tiếp tục sẻ gửi dữ liệu đã được nhập đến trang xác nhận
        Session["DiaChi"] = txtDiaChi.Text;
        Session["HoTen"] = txtHoTen.Text;
        Session["Province"] = ddlProvince.SelectedItem;
        Session["District"] = ddlDistrict.SelectedItem;
        Session["Ward"] = ddlWard.SelectedItem;
        Session["SDT"] = txtSDT.Text;
        Session["Email"] = txtEmail.Text;
        if (txtDiaChi2.Text != null) Session["DiaChi2"] = txtDiaChi2.Text;
        if (txtHoTen2.Text != null) Session["HoTen2"] = txtHoTen2.Text;
        if (ddlProvince2.SelectedIndex != 0) Session["Province2"] = ddlProvince2.SelectedItem;
        if (ddlDistrict2.SelectedIndex != 0) Session["District2"] = ddlDistrict2.SelectedItem;
        if (ddlWard2.SelectedIndex != 0) Session["Ward2"] = ddlWard2.SelectedItem;
        if (txtSDT2.Text != null) Session["SDT2"] = txtSDT2.Text;
        if (txtEmail2.Text != null) Session["Email2"] = txtEmail2.Text;
        Response.Redirect("XacNhan.aspx");
    }
}