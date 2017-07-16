using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for HoaDonInfo
/// </summary>
public class HoaDonInfo
{
	public HoaDonInfo()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    string mahd;
    string tennguoidat;
    string diachinguoidat;
    string sdtnguoidat;
    string emailnguoidat;
    string tennguoinhan;
    string diachinguoinhan;
    string sdtnguoinhan;
    string emailnguoinhan;
    string trangthai;
    DateTime ngaydathang;
    int mahang;
    int soluong;

    public string Mahd
    {
        set { mahd = value; }
        get { return mahd; }
    }
    public string Tennguoidat
    {
        set { tennguoidat = value; }
        get { return tennguoidat; }
    }
    public string Diachinguoidat
    {
        set { diachinguoidat = value; }
        get { return diachinguoidat; }
    }
    public string SDTnguoidat
    {
        set { sdtnguoidat = value; }
        get { return sdtnguoidat; }
    }
    public string Emailnguoidat
    {
        set { emailnguoidat = value; }
        get { return emailnguoidat; }
    }
    public string Tennguoinhan
    {
        set { tennguoinhan = value; }
        get { return tennguoinhan; }
    }
    public string Diachinguoinhan
    {
        set { diachinguoinhan = value; }
        get { return diachinguoinhan; }
    }
    public string SDTnguoinhan
    {
        set { sdtnguoinhan = value; }
        get { return sdtnguoinhan; }
    }
    public string Emailnguoinhan
    {
        set { emailnguoinhan = value; }
        get { return emailnguoinhan; }
    }
    public int Mahang
    {
        set { mahang = value; }
        get { return mahang; }
    }
    public int Soluong
    {
        set { soluong = value; }
        get { return soluong; }
    }
    public DateTime Ngaydathang
    {
        set { ngaydathang = value; }
        get { return ngaydathang; }
    }
    public string Trangthai
    {
        set { trangthai = value; }
        get { return trangthai; }
    }
}