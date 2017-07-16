<%@ Page Title="Đăng ký tài khoản" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="DangKy.aspx.cs" Inherits="DangKy" %>

<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 132px;
        }
        .auto-style2 {
            width: 300px;
        }
        #btn {
            margin:20px 0 20px 150px;
        }
        #btn input {
            border-style: none;
            border-color: inherit;
            border-width: medium;
            background: #000066;
            border-radius: 3px;
            color: white;
            font-weight: bold;
            padding: 5px 10px;
            box-shadow: 2px 2px 3px #999;
            cursor:pointer;
            margin-left:5px;
        }
            #btn input:hover {
                background: #00918D;
            }
        .auto-style3 {
            width: 132px;
            height: 26px;
        }
        .auto-style4 {
            width: 300px;
            height: 26px;
        }
        .auto-style5 {
            height: 26px;
        }
        .auto-style6 {
            color: #FFFFFF;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3 style="padding-bottom:5px; margin-top:20px; padding-left:5px; text-align: center; background-color: #000066; font-size: x-large;" class="auto-style6">Đăng ký tài khoản</h3>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table style="width: 100%;">
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style2">
                        (Vui lòng nhập đầy đủ thông tin)</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">Tên tài khoản:</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtTaiKhoan" runat="server" Width="300px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="lblThongBao" runat="server" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTaiKhoan" Display="Dynamic" ErrorMessage="* Nhập tên tài khoản" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtTaiKhoan" Display="Dynamic" ErrorMessage="Tài khoản phải từ 6-20 kí tự" ForeColor="Red" ValidationExpression=".{6,20}"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Mật khẩu:</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtMatKhau" runat="server" Width="300px" TextMode="Password" OnPreRender="txtMatKhau_PreRender"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtMatKhau" Display="Dynamic" ErrorMessage="* Nhập mật khẩu" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtMatKhau" Display="Dynamic" ErrorMessage="Mật khẩu phải từ 6-20 kí tự" ForeColor="Red" ValidationExpression=".{6,20}"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Nhập lại mật khẩu:</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtMatKhau2" runat="server" Width="300px" TextMode="Password" OnPreRender="txtMatKhau2_PreRender"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtMatKhau2" Display="Dynamic" ErrorMessage="* Nhập lại mật khẩu" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtMatKhau" ControlToValidate="txtMatKhau2" Display="Dynamic" ErrorMessage="Mật khẩu chưa khớp" ForeColor="Red"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Họ tên:</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtHoTen" runat="server" Width="300px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtHoTen" Display="Dynamic" ErrorMessage="* Nhập họ tên" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Email:</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtEmail" runat="server" Width="300px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="* Nhập Email" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Email không hợp lệ" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Số điện thoại:</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtSDT" runat="server" Width="300px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtSDT" Display="Dynamic" ErrorMessage="* Nhập số điện thoại" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtSDT" ErrorMessage="Số điện thoại không hợp lệ" ForeColor="Red" ValidationExpression="0\d{1,11}"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Tỉnh/Thành phố:</td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlProvince" runat="server" Width="304px" Height="24px" OnSelectedIndexChanged="ddlProvince_SelectedIndexChanged" AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="ddlProvince" ErrorMessage="* Chọn Tỉnh/Thành phố" ForeColor="Red" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Quận/Huyện:</td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlDistrict" runat="server" Width="304px" Height="24px" OnSelectedIndexChanged="ddlDistrict_SelectedIndexChanged" AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToValidate="ddlDistrict" ErrorMessage="* Chọn Quận/Huyện" ForeColor="Red" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Phường/Xã:</td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlWard" runat="server" Width="304px" Height="24px">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:CompareValidator ID="CompareValidator4" runat="server" ControlToValidate="ddlWard" ErrorMessage="* Chọn Phường/Xã" ForeColor="Red" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Địa chỉ:</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtDiaChi" runat="server" Width="300px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtDiaChi" Display="Dynamic" ErrorMessage="* Nhập địa chỉ" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtCaptcha" runat="server" Width="300px" Visible="False"></asp:TextBox>
                    </td>
                    <td class="auto-style5">
                        <asp:Label ID="lblTB" runat="server" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style2">
                        <cc1:CaptchaControl ID="cc" runat="server" CaptchaLineNoise="Low" CaptchaWidth="300" Visible="False" />
                    </td>
                    <td>
                        <asp:ImageButton ID="rfCaptcha" runat="server" ImageUrl="~/image/Refresh.png" Width="30" title="Refresh Captcha" CausesValidation="False" OnClick="rfCaptcha_Click" Visible="False"/>
                    </td>
                </tr>
            </table>
    <div id="btn">
        <asp:Button ID="btnDangky" runat="server" Text="Đăng ký" OnClick="btnDangky_Click" Width="76px" />
        <asp:Button ID="btnNull" runat="server" Text="Nhập lại" CausesValidation="False" OnClick="btnNull_Click" Width="77px" />
    </div>
          </ContentTemplate>
    </asp:UpdatePanel>
    </asp:Content>

