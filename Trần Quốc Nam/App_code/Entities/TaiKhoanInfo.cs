using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for TaiKhoanInfo
/// </summary>
public class TaiKhoanInfo
{
	public TaiKhoanInfo()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    int mauser;
    string username;
    string password;
    string hoten;
    string email;
    string sdt;
    string province;
    string district;
    string ward;
    string diachi;
    int maquyen;

    public int MaUser
    {
        set { mauser = value; }
        get { return mauser; }
    }
    public string Username
    {
        set { username = value; }
        get { return username; }
    }
    public string Password
    {
        set { password = value; }
        get { return password; }
    }
    public string HoTen
    {
        set { hoten = value; }
        get { return hoten; }
    }
    public string Email
    {
        set { email = value; }
        get { return email; }
    }
    public string SDT
    {
        set { sdt = value; }
        get { return sdt; }
    }
    public string Province
    {
        set { province = value; }
        get { return province; }
    }
    public string District
    {
        set { district = value; }
        get { return district; }
    }
    public string Ward
    {
        set { ward = value; }
        get { return ward; }
    }
    public string DiaChi
    {
        set { diachi = value; }
        get { return diachi; }
    }
    public int MaQuyen
    {
        set { maquyen = value; }
        get { return maquyen; }
    }
}