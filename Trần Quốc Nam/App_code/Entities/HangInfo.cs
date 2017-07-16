using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for HangInfo
/// </summary>
public class HangInfo
{
	public HangInfo()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    int mahang;
    int maloai;
    int mathuonghieu;
    string tenhang;
    int soluong;
    Int64 dongia;
    string hinhanh;
    string mota;
    DateTime ngaynhap;

    public int Mahang
    {
        set { mahang = value; }
        get { return mahang; }
    }
    public int Maloai
    {
        set { maloai = value; }
        get { return maloai; }
    }
    public int Mathuonghieu
    {
        set { mathuonghieu = value; }
        get { return mathuonghieu; }
    }
    public string Tenhang
    {
        set { tenhang = value; }
        get { return tenhang; }
    }
    public int Soluong
    {
        set { soluong = value; }
        get { return soluong; }
    }
    public Int64 Dongia
    {
        set { dongia = value; }
        get { return dongia; }
    }
    public string Hinhanh
    {
        set { hinhanh = value; }
        get { return hinhanh; }
    }
    public string Mota
    {
        set { mota = value; }
        get { return mota; }
    }
    public DateTime Ngaynhap
    {
        set { ngaynhap = value; }
        get { return ngaynhap; }
    }
}