<%@ Control Language="C#" AutoEventWireup="true" CodeFile="top.ascx.cs" Inherits="control_top" %>

<asp:Panel ID="pnl_guest" runat="server">
    <asp:TextBox ID="txtUsername" runat="server" placeholder="Tài khoản"></asp:TextBox>
    <asp:TextBox ID="txtPass" runat="server" placeholder="Mật khẩu" TextMode="Password"></asp:TextBox>
    <asp:LinkButton ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Đăng nhập" CausesValidation="False" />
    <a href="../DangKy.aspx">Đăng ký</a>
</asp:Panel>

<asp:Panel ID="pnl_user" runat="server">
    <asp:Label ID="lblChao" runat="server" Text="Label" ForeColor="White"></asp:Label>
    <asp:LinkButton ID="btnAdmin" runat="server" Text="Trang Quản Trị" OnClick="btnAdmin_Click" />
    <a href="TrangCaNhan.aspx">Thông tin cá nhân</a>
    <asp:LinkButton ID="btnLogout" runat="server" Text="Thoát" OnClick="btnLogout_Click" CausesValidation="False" />
</asp:Panel>