using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;

/// <summary>
/// Summary description for HoaDonBLL
/// </summary>
public class HoaDonBLL
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ToString()); 
	public HoaDonBLL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public int themHoaDon(HoaDonInfo hd)
    {
        conn.Open();
        SqlCommand cmd = new SqlCommand("insert_hoaDon", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlParameter[] par = new SqlParameter[]{
            new SqlParameter("@MaHD",SqlDbType.NVarChar),
            new SqlParameter("@TenNguoiDat",SqlDbType.NVarChar),
            new SqlParameter("@DiaChiNguoiDat",SqlDbType.NVarChar),
            new SqlParameter("@SDTNguoiDat",SqlDbType.NVarChar),
            new SqlParameter("@EmailNguoiDat",SqlDbType.NVarChar),
            new SqlParameter("@TenNguoiNhan",SqlDbType.NVarChar),
            new SqlParameter("@DiaChiNguoiNhan",SqlDbType.NVarChar),
            new SqlParameter("@SDTNguoiNhan",SqlDbType.NVarChar),
            new SqlParameter("@EmailNguoiNhan",SqlDbType.NVarChar),
            new SqlParameter("@NgayDatHang",SqlDbType.DateTime)};
        par[0].Value = hd.Mahd;
        par[1].Value = hd.Tennguoidat;
        par[2].Value = hd.Diachinguoidat;
        par[3].Value = hd.SDTnguoidat;
        par[4].Value = hd.Emailnguoidat;
        par[5].Value = hd.Tennguoinhan;
        par[6].Value = hd.Diachinguoinhan;
        par[7].Value = hd.SDTnguoinhan;
        par[8].Value = hd.Emailnguoinhan;
        par[9].Value = hd.Ngaydathang;
        cmd.Parameters.AddRange(par);
        int i = cmd.ExecuteNonQuery();
        conn.Close();
        return i;
    }

    public int themCTHoaDon(HoaDonInfo hd)
    {
        conn.Open();
        SqlCommand cmd = new SqlCommand("insert_CTHoaDon", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlParameter[] par = new SqlParameter[]{
            new SqlParameter("@MaHD",SqlDbType.NVarChar),
            new SqlParameter("@MaHang",SqlDbType.Int),
            new SqlParameter("@SoLuong",SqlDbType.Int)};
        par[0].Value = hd.Mahd;
        par[1].Value = hd.Mahang;
        par[2].Value = hd.Soluong;
        cmd.Parameters.AddRange(par);
        int i = cmd.ExecuteNonQuery();
        conn.Close();
        return i;
    }
    public IList showHoaDon()
    {
        conn.Open();
        string sql = "select * from HoaDon order by NgayDatHang desc";
        SqlCommand cmd = new SqlCommand(sql, conn);
        ArrayList lst = new ArrayList();
        HoaDonInfo hh;
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            hh = new HoaDonInfo();
            if (!dr.IsDBNull(0)) hh.Mahd = dr.GetString(0);
            if (!dr.IsDBNull(1)) hh.Tennguoidat = dr.GetString(1);
            if (!dr.IsDBNull(2)) hh.Diachinguoidat = dr.GetString(2);
            if (!dr.IsDBNull(3)) hh.SDTnguoidat = dr.GetString(3);
            if (!dr.IsDBNull(4)) hh.Emailnguoidat = dr.GetString(4);
            if (!dr.IsDBNull(5)) hh.Tennguoinhan = dr.GetString(5);
            if (!dr.IsDBNull(6)) hh.Diachinguoinhan = dr.GetString(6);
            if (!dr.IsDBNull(7)) hh.SDTnguoinhan = dr.GetString(7);
            if (!dr.IsDBNull(8)) hh.Emailnguoinhan = dr.GetString(8);
            if (!dr.IsDBNull(9)) hh.Ngaydathang = dr.GetDateTime(9);
            if (!dr.IsDBNull(10)) hh.Trangthai = dr.GetString(10);

            lst.Add(hh);
        }
        dr.Close();
        conn.Close();
        return lst;
    }
    public int xoaCTHD(string MaHD)
    {
        conn.Open();
        SqlCommand cmd = new SqlCommand("delete from CTHoaDon where MaHD=@MaHD", conn);
        SqlParameter[] par = new SqlParameter[]{
            new SqlParameter("@MaHD",SqlDbType.NVarChar)};
        par[0].Value = MaHD;
        cmd.Parameters.AddRange(par);
        int i = cmd.ExecuteNonQuery();
        conn.Close();
        return i;
    }
    public int xoaHD(string MaHD)
    {
        conn.Open();
        SqlCommand cmd = new SqlCommand("delete from HoaDon where MaHD=@MaHD", conn);
        SqlParameter[] par = new SqlParameter[]{
            new SqlParameter("@MaHD",SqlDbType.NVarChar)};
        par[0].Value = MaHD;
        cmd.Parameters.AddRange(par);
        int i = cmd.ExecuteNonQuery();
        conn.Close();
        return i;
    }
    public int capNhatTrangThai(string MaHD, string TrangThai)
    {
        conn.Open();
        SqlCommand cmd = new SqlCommand("update HoaDon set TrangThai=@TrangThai where MaHD=@MaHD", conn);
        SqlParameter[] par = new SqlParameter[]{
            new SqlParameter("@MaHD",SqlDbType.NVarChar),
            new SqlParameter("@TrangThai",SqlDbType.NVarChar)};
        par[0].Value = MaHD;
        par[1].Value = TrangThai;
        cmd.Parameters.AddRange(par);
        int i = cmd.ExecuteNonQuery();
        conn.Close();
        return i;
    }
}