<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Thanhcong.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            font-size: x-large;
            text-align: center;
            color: #FFFFFF;
            height: 33px;
        }
        .auto-style3 {
            color: #FF0000;
        }
        .auto-style4 {
            text-align: center;
            font-size: large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style2" style="background-color: #009933"><strong>THÔNG BÁO</strong></td>
        </tr>
        <tr>
            <td class="auto-style4"><span class="auto-style3"><strong>Chúc Mừng Bạn Đã Đặt Hàng Thành Công !</strong></span><strong><br class="auto-style3" />
                </strong><span class="auto-style3"><strong>Sản Phẩm Của Bạn Sẻ Được Giao Hàng Sớm Nhất !!<br />
                <br />
                <br />
                <asp:Button ID="Button1" runat="server" ForeColor="White" Height="38px" PostBackUrl="~/Default.aspx" style="font-weight: 700; background-color: #0000CC" Text="Tiếp Tục Mua Hàng" Width="153px" />
                <br />
                </strong></span></td>
        </tr>
    </table>
</asp:Content>

