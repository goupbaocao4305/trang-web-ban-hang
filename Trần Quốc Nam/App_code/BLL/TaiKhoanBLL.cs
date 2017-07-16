using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;

/// <summary>
/// Summary description for TaiKhoanBLL
/// </summary>
public class TaiKhoanBLL
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ToString()); 
	public TaiKhoanBLL()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public bool dangNhap(string username, string pass)
    {
        bool kq = false;
        conn.Open();
        string sql = "select * from TaiKhoan where Username=@username and Pass=@pass";
        SqlCommand cmd = new SqlCommand(sql, conn);
        SqlParameter[] par = new SqlParameter[]{
            new SqlParameter("username",SqlDbType.NVarChar),
            new SqlParameter("pass",SqlDbType.NVarChar)};
        par[0].Value = username;
        par[1].Value = pass;
        cmd.Parameters.AddRange(par);
        SqlDataReader dr =  cmd.ExecuteReader();
        if (dr.HasRows)
            kq = true;
        else
            kq = false;
        dr.Close();
        conn.Close();
        return kq;
    }
    public int layQuyen(string username)
    {
        int quyen = 2;
        string sql = "select MaQuyen from TaiKhoan where Username=@username";
        SqlCommand cmd = new SqlCommand(sql, conn);
        SqlParameter[] par = new SqlParameter[]{
            new SqlParameter("@username",SqlDbType.NVarChar)};
        par[0].Value = username;
        cmd.Parameters.AddRange(par);
        conn.Open();
        quyen = (int)cmd.ExecuteScalar();
        conn.Close();
        return quyen;
    }
    public int dangKy(TaiKhoanInfo tk)
    {
        conn.Open();
        SqlCommand cmd = new SqlCommand("dangKy", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlParameter[] par = new SqlParameter[]{
            new SqlParameter("@username",SqlDbType.NVarChar),
            new SqlParameter("@pass",SqlDbType.NVarChar),
            new SqlParameter("@hoten",SqlDbType.NVarChar),
            new SqlParameter("@email",SqlDbType.NVarChar),
            new SqlParameter("@sdt",SqlDbType.NVarChar),
            new SqlParameter("@province",SqlDbType.NVarChar),
            new SqlParameter("@district",SqlDbType.NVarChar),
            new SqlParameter("@ward",SqlDbType.NVarChar),
            new SqlParameter("@diachi",SqlDbType.NVarChar),
            new SqlParameter("@maquyen",SqlDbType.Int)};
        par[0].Value = tk.Username;
        par[1].Value = tk.Password;
        par[2].Value = tk.HoTen;
        par[3].Value = tk.Email;
        par[4].Value = tk.SDT;
        par[5].Value = tk.Province;
        par[6].Value = tk.District;
        par[7].Value = tk.Ward;
        par[8].Value = tk.DiaChi;
        par[9].Value = tk.MaQuyen;
        cmd.Parameters.AddRange(par);
        int i = cmd.ExecuteNonQuery();
        conn.Close();
        return i;
    }
    public bool test_trungUsername(string username)
    {
        bool kq = false;
        conn.Open();
        string sql = "select * from TaiKhoan where Username=@username";
        SqlCommand cmd = new SqlCommand(sql, conn);
        SqlParameter[] par = new SqlParameter[]{
            new SqlParameter("@username",SqlDbType.Char)};
        par[0].Value = username;
        cmd.Parameters.AddRange(par);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
            kq = false;
        else
            kq = true;
        dr.Close();
        conn.Close();
        return kq;
    }
    public IList showUserinfo()
    {
        conn.Open();
        string sql = "select * from TaiKhoan";
        SqlCommand cmd = new SqlCommand(sql, conn);
        ArrayList lst = new ArrayList();
        TaiKhoanInfo hh;
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            hh = new TaiKhoanInfo();
            if (!dr.IsDBNull(0)) hh.MaUser = dr.GetInt32(0);
            if (!dr.IsDBNull(1)) hh.Username = dr.GetString(1);
            if (!dr.IsDBNull(2)) hh.Password = dr.GetString(2);
            if (!dr.IsDBNull(3)) hh.HoTen = dr.GetString(3);
            if (!dr.IsDBNull(4)) hh.Email = dr.GetString(4);
            if (!dr.IsDBNull(5)) hh.SDT = dr.GetString(5);
            if (!dr.IsDBNull(6)) hh.Province = dr.GetString(6);
            if (!dr.IsDBNull(7)) hh.District = dr.GetString(7);
            if (!dr.IsDBNull(8)) hh.Ward = dr.GetString(8);
            if (!dr.IsDBNull(9)) hh.DiaChi = dr.GetString(9);
            if (!dr.IsDBNull(10)) hh.MaQuyen = dr.GetInt32(10);

            lst.Add(hh);
        }
        dr.Close();
        conn.Close();
        return lst;
    }
    public bool updateUser(TaiKhoanInfo ti)
    {
        bool rs = true;
        conn.Open();
        SqlCommand cmd = new SqlCommand("update_user", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlParameter[] par = new SqlParameter[]{
            new SqlParameter("@hoten",SqlDbType.NVarChar),
            new SqlParameter("@province",SqlDbType.NVarChar),
            new SqlParameter("@district",SqlDbType.NVarChar),
            new SqlParameter("@ward",SqlDbType.NVarChar),
            new SqlParameter("@diachi",SqlDbType.NVarChar),
            new SqlParameter("@sdt",SqlDbType.NVarChar),
            new SqlParameter("@email",SqlDbType.NVarChar),
            new SqlParameter("@username",SqlDbType.NVarChar)};
        par[0].Value = ti.HoTen;
        par[1].Value = ti.Province;
        par[2].Value = ti.District;
        par[3].Value = ti.Ward;
        par[4].Value = ti.DiaChi;
        par[5].Value = ti.SDT;
        par[6].Value = ti.Email;
        par[7].Value = ti.Username;
        cmd.Parameters.AddRange(par);
        int i = cmd.ExecuteNonQuery();
        if (i > 0)
            rs = true;
        else
            rs = false;
        conn.Close();
        return rs;
    }
    public int xoaUser(int MaUser)
    {
        conn.Open();
        SqlCommand cmd = new SqlCommand("delete from TaiKhoan where MaUser=@MaUser", conn);
        SqlParameter[] par = new SqlParameter[]{
            new SqlParameter("@MaUser",SqlDbType.Int)};
        par[0].Value = MaUser;
        cmd.Parameters.AddRange(par);
        int i = cmd.ExecuteNonQuery();
        conn.Close();
        return i;
    }
    public int capQuyen(int MaUser, int MaQuyen)
    {
        conn.Open();
        SqlCommand cmd = new SqlCommand("update TaiKhoan set MaQuyen=@MaQuyen where MaUser=@MaUser", conn);
        SqlParameter[] par = new SqlParameter[]{
            new SqlParameter("@MaQuyen",SqlDbType.Int),
            new SqlParameter("@MaUser",SqlDbType.Int)};
        par[0].Value = MaQuyen;
        par[1].Value = MaUser;
        cmd.Parameters.AddRange(par);
        int i = cmd.ExecuteNonQuery();
        conn.Close();
        return i;
    }
}