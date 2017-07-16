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
using System.IO;


public partial class Admin : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            loadHang();
            showLoai(); //hiển thị loại hàng
            showThuongHieu(); // hiển thị thương hiệu
        }
    }
    protected void btnThem_Click(object sender, EventArgs e)
    {
        string ext = Path.GetExtension(txtHinhanh.PostedFile.FileName);
        if (ext == ".png" || ext == ".jpg") //gán hình ảnh được thêm có định dạng đuôi jpg hoặc png
        {
            string now = DateTime.Now.Day.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Year.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Millisecond.ToString();
            txtHinhanh.SaveAs(Server.MapPath("~/image/hang/") + "\\" + now + ext); // đường dẫn đến Thư Mục Chứa hình ảnh hàng được nhập
            HangInfo hh = new HangInfo();
            //Thêm Mới Hàng
            hh.Maloai = int.Parse(ddlMaloai.SelectedValue);
            hh.Mathuonghieu = int.Parse(ddlMathuonghieu.SelectedValue);
            hh.Tenhang = txtTenhang.Text;
            hh.Soluong = int.Parse(txtSoluong.Text);
            hh.Dongia = Int64.Parse(txtDongia.Text);
            hh.Hinhanh = "../image/hang/" + now + ext;
            hh.Mota = txtMota.Value;
            HangBLL hb = new HangBLL();
            int i = hb.nhapHang(hh);
            if (i > 0)
            {
                //Thêm Mới Thành công nếu thông tin nhập chính xác và đầy đủ
                lblThongBao.Visible = true;
                lblThongBao.Text = "Thêm mới thành công!";
                loadHang();
            }
            else
            {
                //ngược lại lỗi nếu sai
                lblThongBao.Visible = true;
                lblThongBao.Text = "Kiểm tra dữ liệu nhập vào!";
            }
        }
        else
        {
            //ảnh sai định dạng
            lblThongBao.Visible = true;
            lblThongBao.Text = "Ảnh không không hợp lệ!";
        }

    }
    void loadHang()
    {
        //lấy ra mã hàng của bảng hàng
        HangBLL hb = new HangBLL();
        ArrayList lst = new ArrayList();
        lst = (ArrayList)hb.showHang("select * from Hang order by MaHang desc");
        GridView1.DataSource = lst;
        GridView1.DataBind();
    }
    protected void btnNull_Click(object sender, EventArgs e)
    {
        //làm trống các form yêu cầu nhập lại nội dung cần thêm
        txtDongia.Text = null;
        txtMota.Value = null;
        txtSoluong.Text = null;
        txtTenhang.Text = null;
        lblThongBao.Visible = false;
        ddlMaloai.SelectedIndex = 0;
        ddlMathuonghieu.SelectedIndex = 0;
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        //xóa sản phẩm
        int Mahang = int.Parse(GridView1.DataKeys[e.RowIndex].Value.ToString());
        HangBLL hb = new HangBLL();
        hb.xoaHang(Mahang);
        loadHang();
        lblThongBao.Visible = true;
        lblThongBao.Text = "Xóa thành công!";
    }
    private void showLoai()
    {
        //Lấy Ra theo Loại
        ddlMaloai.Items.Clear();
        ddlMaloai.Items.Add(new ListItem("Chọn loại", "0"));
        SqlDataAdapter ad = new SqlDataAdapter("select * from Loai", conn);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddlMaloai.Items.Add(new ListItem(dt.Rows[i]["TenLoai"].ToString(), dt.Rows[i]["MaLoai"].ToString()));
            }
        }
    }
    private void showThuongHieu()
    {
        // Lấy ra thông tin hàng theo thương hiệu
        ddlMathuonghieu.Items.Clear();
        ddlMathuonghieu.Items.Add(new ListItem("Chọn thương hiệu", "0"));
        SqlDataAdapter ad = new SqlDataAdapter("select * from ThuongHieu", conn);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddlMathuonghieu.Items.Add(new ListItem(dt.Rows[i]["TenThuongHieu"].ToString(), dt.Rows[i]["MaThuongHieu"].ToString()));
            }
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        int trang_thu = e.NewPageIndex;
        int so_dong = GridView1.PageSize;
        stt = trang_thu * so_dong + 1;
        loadHang();
    }
    int stt = 1;
    public string get_stt()
    {
        return Convert.ToString(stt++);
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        //cập nhật thông tin hàng
        if (e.CommandName == "CapNhat")
        {
            foreach (GridViewRow r in GridView1.Rows)
            {
                if (GridView1.DataKeys[r.DataItemIndex].Value.ToString() == e.CommandArgument.ToString())
                {
                    TextBox txtSoLuong = (TextBox)r.Cells[3].FindControl("txtSoLuong");
                    int soluong = int.Parse(txtSoLuong.Text);
                    TextBox txtGia = (TextBox)r.Cells[4].FindControl("txtGia");
                    Int64 gia = Int64.Parse(txtGia.Text);
                    HangBLL hb = new HangBLL();
                    hb.capNhatHang(int.Parse(e.CommandArgument.ToString()),soluong,gia);
                    string scr = "<script>alert('Cập nhật thành công.')</script>";
                    Page.ClientScript.RegisterStartupScript(Page.GetType(), "Thông báo", scr);
                }
            }
        }
    }
}