<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="ChiTietHoaDon.aspx.cs" Inherits="ChiTietHoaDon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style6 {
            width: 350px;
        }
        #sum{
            float: right;
            font-weight: bold;
        }
        #ContentPlaceHolder1_lblTongTien {
            color:#ED9B47;
        }
        #btn {
            text-align:right;
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
        .auto-style8 {
            width: 90px;
        }
        .auto-style9 {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DataList ID="DataList1" runat="server" Width="100%">
        <ItemTemplate>
    <h3 style="color:#00918D; padding-bottom:5px; border-bottom:solid 2px #00918D; margin-top:20px;"><span class="auto-style9">Mã hóa đơn:</span> 
        <asp:Label ID="lblMaHD" runat="server" Text='<%#Eval("MaHD") %>' style="color: #FF0000"></asp:Label>
    </h3>
    <table style="width:100%;" cellpadding="5">
        <tr>
            <td colspan="2"><p><b>Thông tin người đặt hàng</b></p></td>
            <td colspan="2"><p><b>Thông tin người nhận hàng</b></p></td>
        </tr>
        <tr style="background-color:#b8daff;">
            <td class="auto-style8">Họ tên:</td>
            <td class="auto-style6">
                <asp:Label ID="lblHoTen" runat="server" Text='<%#Eval("TenNguoiDat") %>' Font-Bold="True" ForeColor="#000066"></asp:Label>
            </td>
            <td class="auto-style8">Họ tên:</td>
            <td class="auto-style6">
                <asp:Label ID="lblHoTen2" runat="server" Text='<%#Eval("TenNguoiNhan") %>' Font-Bold="True" ForeColor="#000066"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style8">Địa chỉ:</td>
            <td class="auto-style6">
                <asp:Label ID="lblDiaChi" runat="server" Text='<%#Eval("DiaChiNguoiDat") %>' Font-Bold="True" ForeColor="#000066"></asp:Label>
            </td>
            <td class="auto-style8">Địa chỉ:</td>
            <td class="auto-style6">
                <asp:Label ID="lblDiaChi2" runat="server" Text='<%#Eval("DiaChiNguoiNhan") %>' Font-Bold="True" ForeColor="#000066"></asp:Label>
            </td>
        </tr>
        <tr style="background-color:#b8daff;">
            <td class="auto-style8">Số điện thoại:</td>
            <td class="auto-style6">
                <asp:Label ID="lblSDT" runat="server" Text='<%#Eval("SDTNguoiDat") %>' Font-Bold="True" ForeColor="#000066"></asp:Label>
            </td>
            <td class="auto-style8">Số điện thoại:</td>
            <td class="auto-style6">
                <asp:Label ID="lblSDT2" runat="server" Text='<%#Eval("SDTNguoiNhan") %>' Font-Bold="True" ForeColor="#000066"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style8">Email:</td>
            <td class="auto-style6">
                <asp:Label ID="lblEmail" runat="server" Text='<%#Eval("EmailNguoiDat") %>' Font-Bold="True" ForeColor="#000066"></asp:Label>
            </td>
            <td class="auto-style8">Email:</td>
            <td class="auto-style6">
                <asp:Label ID="lblEmail2" runat="server" Text='<%#Eval("EmailNguoiNhan") %>' Font-Bold="True" ForeColor="#000066"></asp:Label>
            </td>
        </tr>
    </table>
        </ItemTemplate>
    </asp:DataList>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="3" GridLines="Vertical" Width="100%" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px">
        <AlternatingRowStyle BackColor="#DCDCDC" />
        <Columns>
            <asp:TemplateField HeaderText="STT">
                <ItemTemplate><%# Container.DataItemIndex + 1%></ItemTemplate> 
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tên hàng">
                <ItemTemplate><%#Eval("TenHang") %></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Số lượng">
                <ItemTemplate><%#Eval("SoLuong") %></ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Đơn giá">
                <ItemTemplate><%#String.Format("{0:0,0}",Eval("DonGia")) %></ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Thành tiền">
                <ItemTemplate><%#String.Format("{0:0,0}",Eval("ThanhTien")) %></ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#0000A9" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#000065" />
    </asp:GridView>
    <div id="sum">
        <b>Tổng tiền: </b>
        <asp:Label ID="lblTongTien" runat="server" Text="" style="color: #FF0000"></asp:Label>
    </div>
    <br style="clear:both;"/>
    <div id="btn">
        <asp:Button ID="btnTroVe" runat="server" Text="Trở về" OnClick="btnTroVe_Click"/>
        <asp:Button ID="btnIn" runat="server" Text="In hóa đơn"/>
        <asp:Button ID="btnHuy" runat="server" Text="Hủy hóa đơn" OnClick="btnHuy_Click" OnClientClick='return confirm("Bạn muốn hủy hóa đơn này?")'/>
    </div>
</asp:Content>

