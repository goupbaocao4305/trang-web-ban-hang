<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="XacNhan.aspx.cs" Inherits="XacNhan" %>

<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 120px;
        }
        .auto-style2 {
            width: 380px;
        }
        .auto-style3 {
            width: 120px;
        }
        .auto-style4 {
            width: 380px;
        }
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
        #note {
            background:#E3E3E3;
            border:solid 1px #00918D;
            padding:10px;
            border-radius:5px;
            text-align:justify;
            margin-top:20px;
        }
            #note span {
                color:red;
                font-weight:bold;
                font-size:14px;
            }
        #sum{
            float: right;
            font-weight: bold;
            margin-top:10px;
            font-size: large;
        }
        #ContentPlaceHolder1_lblTongTien {
            color:#ED9B47;
        }
        .auto-style6 {
            color: #FFFFFF;
            text-align: center;
            font-weight: normal;
            margin-top: 20px;
            padding-left: 5px;
            padding-bottom: 5px;
            background-color: #0000CC;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    &nbsp;<h3 class="auto-style6"><strong style="font-size: x-large">Thông tin giỏ hàng</strong></h3>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" 
        BorderWidth="1px" CellPadding="4" Width="100%">
        <Columns>
            <asp:TemplateField HeaderText="STT">
                <ItemTemplate><%=++i %></ItemTemplate>
                <ItemStyle HorizontalAlign="Center"/>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Sản phẩm">
                <ItemTemplate><%#Eval("Product") %></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Hình ảnh">
                <ItemTemplate><img src='<%#Eval("Image") %>' style="max-height:50px; max-width:50px;" /></ItemTemplate>
                <ItemStyle HorizontalAlign="Center"/>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Số lượng">
                <ItemTemplate><%#Eval("Quantity") %></ItemTemplate>
                <ItemStyle HorizontalAlign="Center"/>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Đơn giá">
                <ItemTemplate><%#String.Format("{0:0,0}",Eval("Cost")) %></ItemTemplate>
                <ItemStyle HorizontalAlign="Right"/>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Thành tiền">
                <ItemTemplate><%#String.Format("{0:0,0}",Eval("Sum")) %></ItemTemplate>
                <ItemStyle HorizontalAlign="Right"/>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
        <RowStyle ForeColor="#003399" BackColor="White" />
        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <SortedAscendingCellStyle BackColor="#EDF6F6" />
        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
        <SortedDescendingCellStyle BackColor="#D6DFDF" />
        <SortedDescendingHeaderStyle BackColor="#002876" />
    </asp:GridView>
        <div id="sum">
            <b>Tổng tiền: </b>
            <asp:Label ID="lblTongTien" runat="server" Text="" style="color: #CC0000"></asp:Label>
        </div><br /><br />
    <asp:Label ID="Label1" runat="server" style="text-align: center; font-weight: 700; font-size: x-large; color: #FF0000; font-style: italic; text-decoration: underline" Text="✔ Thông Tin Đặt Hàng Và Nhận Hàng !" Width="100%"></asp:Label>
    <table style="width: 100%;" cellpadding="5">
        <tr>
            <td colspan="2"><p><b style="font-size: medium">Thông tin người đặt hàng</b></p></td>
            <td colspan="2"><p><b style="font-size: medium">Thông tin người nhận hàng</b></p></td>
        </tr>
        <tr style="background-color:#b8daff;">
            <td class="auto-style1">Họ tên:</td>
            <td class="auto-style2">
                <asp:Label ID="lblHoTen" runat="server" Text="Label" Font-Bold="True" ForeColor="#000066"></asp:Label>
            </td>
            <td class="auto-style1">Họ tên:</td>
            <td>
                <asp:Label ID="lblHoTen2" runat="server" Text="Label" Font-Bold="True" ForeColor="#000066"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Địa chỉ:</td>
            <td class="auto-style4">
                <asp:Label ID="lblDiaChi" runat="server" Text="Label" Font-Bold="True" ForeColor="#000066"></asp:Label>
            </td>
            <td class="auto-style3">Địa chỉ:</td>
            <td class="auto-style4">
                <asp:Label ID="lblDiaChi2" runat="server" Text="Label" Font-Bold="True" ForeColor="#000066"></asp:Label>
            </td>
        </tr>
        <tr style="background-color:#b8daff;">
            <td class="auto-style1">Phường/Xã:</td>
            <td class="auto-style2">
                <asp:Label ID="lblWard" runat="server" Text="Label" Font-Bold="True" ForeColor="#000066"></asp:Label>
            </td>
            <td class="auto-style1">Phường/Xã:</td>
            <td>
                <asp:Label ID="lblWard2" runat="server" Text="Label" Font-Bold="True" ForeColor="#000066"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">Quận/Huyện:</td>
            <td class="auto-style2">
                <asp:Label ID="lblDistrict" runat="server" Text="Label" Font-Bold="True" ForeColor="#000066"></asp:Label>
            </td>
            <td class="auto-style1">Quận/Huyện:</td>
            <td>
                <asp:Label ID="lblDistrict2" runat="server" Text="Label" Font-Bold="True" ForeColor="#000066"></asp:Label>
            </td>
        </tr>
        <tr style="background-color:#b8daff;">
            <td class="auto-style1">Tỉnh/Thành phố:</td>
            <td class="auto-style2">
                <asp:Label ID="lblProvince" runat="server" Text="Label" Font-Bold="True" ForeColor="#000066"></asp:Label>
            </td>
            <td class="auto-style1">Tỉnh/Thành phố:</td>
            <td>
                <asp:Label ID="lblProvince2" runat="server" Text="Label" Font-Bold="True" ForeColor="#000066"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">Số điện thoại:</td>
            <td class="auto-style2">
                <asp:Label ID="lblSDT" runat="server" Text="Label" Font-Bold="True" ForeColor="#000066"></asp:Label>
            </td>
            <td class="auto-style1">Số điện thoại:</td>
            <td>
                <asp:Label ID="lblSDT2" runat="server" Text="Label" Font-Bold="True" ForeColor="#000066"></asp:Label>
            </td>
        </tr>
        <tr style="background-color:#b8daff;">
            <td class="auto-style1">Email:</td>
            <td class="auto-style2">
                <asp:Label ID="lblEmail" runat="server" Text="Label" Font-Bold="True" ForeColor="#000066"></asp:Label>
            </td>
            <td class="auto-style1">Email:</td>
            <td>
                <asp:Label ID="lblEmail2" runat="server" Text="Label" Font-Bold="True" ForeColor="#000066"></asp:Label>
            </td>
        </tr>
    </table>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
    <table style="margin-top:10px;">
        <tr>
            <td>&nbsp;</td>
            <td><asp:TextBox ID="txtCaptCha" runat="server" Visible="False"></asp:TextBox></td>
            <td><asp:Label ID="lblTB" runat="server" Text="" Visible="False" ForeColor="Red"></asp:Label></td>          
        </tr>
        <tr>
            <td></td>
            <td><cc1:CaptchaControl ID="cc" runat="server" CaptchaLineNoise="Low" Visible="False" /></td>
            <td><asp:ImageButton ID="rfCaptCha" runat="server" title="Refresh Captcha" CausesValidation="false" ImageUrl="~/image/Refresh.png" Width="30" OnClick="rfCaptCha_Click" Visible="False"/></td>
        </tr>
    </table>
    <div id="btn">
        <a href="CartInfo.aspx">Trở về</a>
        <asp:Button ID="btnXacNhan" runat="server" Text="Xác nhận" OnClick="btnXacNhan_Click"/>
    </div>
          </ContentTemplate>
    </asp:UpdatePanel>
    <%--<div id="note">
        <span>Chú ý:</span><br/>
        Sau khi khách hàng nhấn vào nút xác nhận thanh toán, sẽ xuất hiện thông báo "Khách hàng đã đặt hàng thành công,  sẽ liên lạc với khách hàng qua điện thoại để xác nhận thời gian chuyển hàng".<br />
        Đối với khách hàng thanh toán bằng Ngân Lượng, Bảo Kim hoặc các công cụ thanh toán khác, ngoài thông báo trên, sẽ có thêm thông báo: "Khách hàng sẽ được chuyển sang ví điện tử Ngânlượng.vn, baokim.vn (hoặc khác) để thực hiện thanh toán".
    </div>--%>
</asp:Content>

