<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CartInfo.aspx.cs" Inherits="CartInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/ecmascript">
        function backtop() {
            $('html,body').animate({ scrollTop: 0 }, 500);
        };
    </script>
    <style type="text/css">
        #btn {
            text-align:center;
            margin-top:20px;
        }
        #btn input,#btn a {
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
            #btn input:hover,#btn a:hover {
                background: #00918D;
            }
        #left {
            float: left;
            width: 50%;
            height:250px;
        }
        #right {
            float: right;
            width: 50%;
            height:250px;
        }
        .auto-style1 {
            width: 102px;
        }
        .auto-style3 {
            width: 210px;
        }
        .auto-style6 {
            width: 591px;
        }
        a#login {
            color:#FF0000;
            cursor:pointer;
        }
            a#login:hover {
                color:#DC7913;
            }
        .auto-style7 {
            color: #FFFFFF;
            font-size: x-large;
        }
        .auto-style8 {
            width: 100%;
        }
        .auto-style9 {
            color: #FFFFFF;
            text-align: center;
            font-size: large;
        }
        .auto-style10 {
            width: 591px;
            background-color: #009933;
        }
        .auto-style11 {
            width: 210px;
            background-color: #009933;
        }
        .auto-style12 {
            background-color: #009933;
        }
        .auto-style13 {
            font-size: large;
            font-weight: 700;
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    &nbsp;<h3 style="padding-bottom:5px; margin-top:20px; padding-left:5px; text-align: center; background-color: #000066;" class="auto-style7">Thông tin đặt hàng</h3>
    <p>Mời quý khách <b><a onclick="backtop()" id="login">Đăng nhập</a></b> nếu là thành viên, hoặc điền đầy đủ thông tin bên dưới để chúng tôi liên lạc và giao hàng:</p>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="left">
                <b>Thông Tin Người Đặt Hàng !</b>
                <table style="width: 100%;">
                        <tr>
                            <td class="auto-style1">Họ tên:</td>
                            <td class="auto-style3">
                                <asp:TextBox ID="txtHoTen" runat="server" required="" Width="200px"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style1">Tỉnh/Thành phố:</td>
                            <td class="auto-style3">
                                <asp:DropDownList ID="ddlProvince" runat="server" Height="24px" Width="204px" AutoPostBack="True" OnSelectedIndexChanged="ddlProvince_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="ddlProvince" Display="Dynamic" ErrorMessage="Chọn Tỉnh/Thành phố" ForeColor="Red" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">Quận/Huyện:</td>
                            <td class="auto-style3">
                                <asp:DropDownList ID="ddlDistrict" runat="server" Height="24px" Width="204px" AutoPostBack="True" OnSelectedIndexChanged="ddlDistrict_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="ddlDistrict" Display="Dynamic" ErrorMessage="Chọn Quận/Huyện" ForeColor="Red" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">Phường/Xã:</td>
                            <td class="auto-style3">
                                <asp:DropDownList ID="ddlWard" runat="server" Height="24px" Width="204px">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToValidate="ddlWard" Display="Dynamic" ErrorMessage="Chọn Phường/Xã" ForeColor="Red" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">Địa chỉ:</td>
                            <td class="auto-style3">
                                <asp:TextBox ID="txtDiaChi" runat="server" required="" Width="200px"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style1">Số điện thoại:</td>
                            <td class="auto-style3">
                                <asp:TextBox ID="txtSDT" runat="server" required="" Width="200px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtSDT" Display="Dynamic" ErrorMessage="SĐT không hợp lệ" ForeColor="Red" ValidationExpression="0\d{1,11}"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">Email:</td>
                            <td class="auto-style3">
                                <asp:TextBox ID="txtEmail" runat="server" required="" type="email" Width="200px"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style1">&nbsp;</td>
                            <td class="auto-style3">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                </table>
            </div>
            <div id="right">
                <b><asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="True" Text="Nhập Thông Tin Người Nhận Hàng !" OnCheckedChanged="CheckBox2_CheckedChanged" /></b>
                <asp:Panel ID="Panel1" runat="server" Visible="true">
                <table style="width: 100%;">
                    <tr>
                        <td class="auto-style1">Họ tên:</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="txtHoTen2" required="" runat="server" Width="200px"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Tỉnh/Thành phố:</td>
                        <td class="auto-style3">
                            <asp:DropDownList ID="ddlProvince2" runat="server" Height="24px" Width="204px" AutoPostBack="True" OnSelectedIndexChanged="ddlProvince2_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:CompareValidator ID="CompareValidator4" runat="server" ControlToValidate="ddlProvince2" ErrorMessage="Chọn Tỉnh/Thành phố" ForeColor="Red" Operator="NotEqual" ValueToCompare="0" Display="Dynamic"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Quận/Huyện:</td>
                        <td class="auto-style3">
                            <asp:DropDownList ID="ddlDistrict2" runat="server" Height="24px" Width="204px" AutoPostBack="True" OnSelectedIndexChanged="ddlDistrict2_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:CompareValidator ID="CompareValidator5" runat="server" ControlToValidate="ddlDistrict2" ErrorMessage="Chọn Quận/Huyện" ForeColor="Red" Operator="NotEqual" ValueToCompare="0" Display="Dynamic"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Phường/Xã:</td>
                        <td class="auto-style3">
                            <asp:DropDownList ID="ddlWard2" runat="server" Height="24px" Width="204px">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:CompareValidator ID="CompareValidator6" runat="server" ControlToValidate="ddlWard2" ErrorMessage="Chọn Phường/Xã" ForeColor="Red" Operator="NotEqual" ValueToCompare="0" Display="Dynamic"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Địa chỉ:</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="txtDiaChi2" required="" runat="server" Width="200px"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Số điện thoại:</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="txtSDT2" required="" runat="server" Width="200px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtSDT2" ErrorMessage="SĐT không hợp lệ" ForeColor="Red" ValidationExpression="0\d{1,11}" Display="Dynamic"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Email:</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="txtEmail2" required="" type="email" runat="server" Width="200px"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style1">&nbsp;</td>
                        <td class="auto-style3">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
                </asp:Panel>
            </div>
            <u style="color:red; "><asp:Label ID="Label1" runat="server" CssClass="auto-style13" Text="✔ Hình Thức Mua Hàng và Thanh Toán"></asp:Label></u>
            <asp:Image ID="Image2" runat="server" Height="219px" ImageUrl="~/image/huongdanmuahang.jpg" Width="100%" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <table style="width: 100%; border-color:#000066;" cellpadding="5" cellspacing="0" border="1">
        <tr style="background:#00918D; color:white; font-weight:bold; text-align:center;">
            <td class="auto-style11">Phương thức thanh toán</td>
            <td class="auto-style10">Mô tả</td>
            <td class="auto-style12">Thanh toán</td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Image ID="Image1" runat="server" Height="92px" ImageUrl="~/image/giaohangtannoi.jpg" Width="210px" />
            </td>
            <td class="auto-style6"><strong>Hueic bookstore sẻ chuyển hàng đến tận nơi cho bạn với hình thức nhận hàng và thanh toán trực tiếp ngay tại nhà !</strong></td>
            <td style="text-align:center;">
                <asp:RadioButton ID="RadioButton1" runat="server" Checked="True" Text=" " />
            </td>
        </tr>
        </table>
    <div id="btn">
        <a href="Cart.aspx">Trở về</a>
        <asp:Button ID="btnTiepTuc" runat="server" Text="Tiếp tục" OnClick="btnTiepTuc_Click" />
    </div>
    </asp:Content>

