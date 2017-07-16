<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="TrangCaNhan.aspx.cs" Inherits="TrangCaNhan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            width: 107px;
        }
        .auto-style9 {
        }
        .auto-style10 {
            width: 397px;
        }
        .auto-style12 {
            width: 107px;
            height: 26px;
        }
        .auto-style13 {
            width: 397px;
            height: 26px;
        }
        #box {
            float: left;
            width:100%;
        }
        #left {
            float: left;
            width: 50%;
        }
        #right {
            float: right;
            width: 50%;
        }
        input[type=submit] {
            border-style: none;
            border-color: inherit;
            border-width: medium;
            background: #000066;
            border-radius: 3px;
            color: white;
            font-weight: bold;
            padding: 5px 15px;
            box-shadow: 2px 2px 3px #999;
            cursor:pointer;
            margin-left:5px;
        }
            input[type=submit]:hover {
                background: #00918D;
            }
        .auto-style14 {
            width: 217px;
        }
        .auto-style15 {
            width: 110px;
        }
        .auto-style16 {
            color: #FFFFFF;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <br />
    <i style="color:blue; height:10px"><asp:Label ID="Label2" runat="server" style="text-align: center; font-weight: 700; font-size: xx-large; color: #0000FF; text-decoration: underline;" Text="✔ Thông Tin Cá Nhân" Width="100%"></asp:Label>
    <br />
    <br />
    <br />
    </i>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="box">
                <div id="left">
                <table style="width: 100%;">
                        <tr>
                            <td class="auto-style12">Họ tên:</td>
                            <td class="auto-style13">
                                <asp:TextBox ID="txtHoTen" runat="server" required="" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">Tỉnh/Thành phố:</td>
                            <td class="auto-style10">
                                <asp:DropDownList ID="ddlProvince" runat="server" Height="24px" Width="204px" AutoPostBack="True" OnSelectedIndexChanged="ddlProvince_SelectedIndexChanged">
                                </asp:DropDownList>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="ddlProvince" Display="Dynamic" ErrorMessage="Chọn Tỉnh/TP" ForeColor="Red" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">Quận/Huyện:</td>
                            <td class="auto-style10">
                                <asp:DropDownList ID="ddlDistrict" runat="server" Height="24px" Width="204px" AutoPostBack="True" OnSelectedIndexChanged="ddlDistrict_SelectedIndexChanged">
                                </asp:DropDownList>
                                <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="ddlDistrict" Display="Dynamic" ErrorMessage="Chọn Quận/Huyện" ForeColor="Red" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">Phường/Xã:</td>
                            <td class="auto-style10">
                                <asp:DropDownList ID="ddlWard" runat="server" Height="24px" Width="204px">
                                </asp:DropDownList>
                                <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToValidate="ddlWard" Display="Dynamic" ErrorMessage="Chọn Phường/Xã" ForeColor="Red" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">Địa chỉ:</td>
                            <td class="auto-style10">
                                <asp:TextBox ID="txtDiaChi" runat="server" required="" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">Số điện thoại:</td>
                            <td class="auto-style10">
                                <asp:TextBox ID="txtSDT" runat="server" required="" Width="200px"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtSDT" Display="Dynamic" ErrorMessage="SĐT không hợp lệ" ForeColor="Red" ValidationExpression="0\d{1,11}"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">Email:</td>
                            <td class="auto-style10">
                                <asp:TextBox ID="txtEmail" runat="server" required="" type="email" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style10">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style10">
                                <asp:Button ID="btnCapNhat" runat="server" Text="Cập nhật" OnClick="btnCapNhat_Click" />
                                <asp:Label ID="lblThongBao2" runat="server" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
                            </td>
                        </tr>
                </table>
                </div>
                <div id="right">
                    <asp:CheckBox ID="CheckBox1" runat="server" Font-Bold="True" Font-Italic="False" OnCheckedChanged="CheckBox1_CheckedChanged" Text="Đổi mật khẩu" AutoPostBack="True" />
                    <asp:Panel ID="Panel1" runat="server" Visible="true">
                        <table style="width: 100%;">
                            <tr>
                                <td class="auto-style15">Mật khẩu cũ:</td>
                                <td class="auto-style14">
                                    <asp:TextBox ID="txtMKCu" runat="server" required="" type="password" Width="200px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtMKCu" Display="Dynamic" ErrorMessage="Mật khẩu phải từ 6-20 kí tự" ForeColor="Red" ValidationExpression=".{6,20}"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style15">Mật khẩu mới:</td>
                                <td class="auto-style14">
                                    <asp:TextBox ID="txtMKMoi" runat="server" required="" type="password" Width="200px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtMKMoi" Display="Dynamic" ErrorMessage="Mật khẩu phải từ 6-20 kí tự" ForeColor="Red" ValidationExpression=".{6,20}"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style15">Nhập lại mật khẩu:</td>
                                <td class="auto-style14">
                                    <asp:TextBox ID="txtMKMoi2" runat="server" required="" type="password" Width="200px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:CompareValidator ID="CompareValidator4" runat="server" ControlToCompare="txtMKMoi" ControlToValidate="txtMKMoi2" ErrorMessage="Mật khẩu chưa khớp" ForeColor="Red"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style15">&nbsp;</td>
                                <td class="auto-style14">
                                    &nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style15">&nbsp;</td>
                                <td class="auto-style9" colspan="2">
                                    <asp:Button ID="btnDoiMK" runat="server" OnClick="btnDoiMK_Click" Text="Đổi mật khẩu" />
                                    <asp:Label ID="lblThongBao" runat="server" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </div>
                <br />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

