using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;


/// <summary>
/// Summary description for HangBLL
/// </summary>
public class HangBLL
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ToString());
	public HangBLL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public int nhapHang(HangInfo hh)
    {
        conn.Open();
        SqlCommand cmd = new SqlCommand("insert_hang", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlParameter[] par = new SqlParameter[]{
            new SqlParameter("@Maloai",SqlDbType.Int),
            new SqlParameter("@Mathuonghieu",SqlDbType.Int),
            new SqlParameter("@Tenhang",SqlDbType.NVarChar),
            new SqlParameter("@Soluong",SqlDbType.Int),
            new SqlParameter("@Dongia",SqlDbType.BigInt),
            new SqlParameter("@Hinhanh",SqlDbType.NVarChar),
            new SqlParameter("@Mota",SqlDbType.NText)};
        par[0].Value = hh.Maloai;
        par[1].Value = hh.Mathuonghieu;
        par[2].Value = hh.Tenhang;
        par[3].Value = hh.Soluong;
        par[4].Value = hh.Dongia;
        par[5].Value = hh.Hinhanh;
        par[6].Value = hh.Mota;
        cmd.Parameters.AddRange(par);
        int i = cmd.ExecuteNonQuery();
        conn.Close();
        return i;
    }

    public IList showHang(string Sql)
    {
        conn.Open();
        string sql = Sql;
        SqlCommand cmd = new SqlCommand(sql, conn);
        ArrayList lst = new ArrayList();
        HangInfo hh;
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            hh = new HangInfo();
            if (!dr.IsDBNull(0)) hh.Mahang = dr.GetInt32(0);
            if (!dr.IsDBNull(1)) hh.Maloai = dr.GetInt32(1);
            if (!dr.IsDBNull(2)) hh.Mathuonghieu = dr.GetInt32(2);
            if (!dr.IsDBNull(3)) hh.Tenhang = dr.GetString(3);
            if (!dr.IsDBNull(4)) hh.Soluong = dr.GetInt32(4);
            if (!dr.IsDBNull(5)) hh.Dongia = dr.GetInt64(5);
            if (!dr.IsDBNull(6)) hh.Hinhanh = dr.GetString(6);
            if (!dr.IsDBNull(7)) hh.Mota = dr.GetString(7);
            if (!dr.IsDBNull(8)) hh.Ngaynhap = dr.GetDateTime(8);

            lst.Add(hh);
        }
        dr.Close();
        conn.Close();
        return lst;
    }
    public int xoaHang(int Mahang)
    {
        conn.Open();
        SqlCommand cmd = new SqlCommand("delete_hang", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlParameter[] par = new SqlParameter[]{
            new SqlParameter("@Mahang",SqlDbType.Int)};
        par[0].Value = Mahang;
        cmd.Parameters.AddRange(par);
        int i = cmd.ExecuteNonQuery();
        conn.Close();
        return i;
    }
    public int laySLHang(string TenHang)
    {
        conn.Open();
        string sql = "select SoLuong from Hang where TenHang=N'" + TenHang + "'";
        SqlCommand cmd = new SqlCommand(sql, conn);
        Object obj = cmd.ExecuteScalar();
        conn.Close();
        return int.Parse(obj.ToString());
    }
    public int capNhatHang(int MaHang, int SoLuong, Int64 Gia)
    {
        conn.Open();
        SqlCommand cmd = new SqlCommand("update Hang set SoLuong=@SoLuong,DonGia=@Gia where MaHang=@MaHang", conn);
        SqlParameter[] par = new SqlParameter[]{
            new SqlParameter("@MaHang",SqlDbType.Int),
            new SqlParameter("@SoLuong",SqlDbType.Int),
            new SqlParameter("@Gia",SqlDbType.BigInt)};
        par[0].Value = MaHang;
        par[1].Value = SoLuong;
        par[2].Value = Gia;
        cmd.Parameters.AddRange(par);
        int i = cmd.ExecuteNonQuery();
        conn.Close();
        return i;
    }
}