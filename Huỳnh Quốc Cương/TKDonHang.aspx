<%@ Page Title="Thống kê đơn hàng" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="TKDonHang.aspx.cs" Inherits="TKDonHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:TextBox ID="txtNgay" runat="server" placeholder="Nhập ngày" type="date"></asp:TextBox>
    <asp:Button ID="btnLoc" runat="server" Text="Lọc" OnClick="btnLoc_Click" />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="5" GridLines="Vertical" DataKeyNames="MaHD" AllowPaging="True" PageSize="20" OnPageIndexChanging="GridView1_PageIndexChanging">
        <AlternatingRowStyle BackColor="#DCDCDC" />
        <Columns>
            <asp:TemplateField HeaderText="STT">
                <ItemTemplate><%#get_stt() %></ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Mã HĐ">
                <ItemTemplate><%#Eval("MaHD") %></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tên người đặt">
                <ItemTemplate><%#Eval("TenNguoiDat") %></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="SĐT người đặt">
                <ItemTemplate><%#Eval("SDTNguoiDat") %></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Ngày đặt hàng">
                <ItemTemplate><%#String.Format("{0:dd/MM/yyyy}", Eval("NgayDatHang")) %></ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Trạng thái">
                <ItemTemplate><%#Eval("TrangThai")%></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="">
                <ItemTemplate> 
                    <a href='ChiTietHoaDon.aspx?id=<%#Eval("MaHD") %>'>Chi tiết</a>
                 </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
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
    <div id="btn">
        <a href="ThongKeBaoCao.aspx">Trở về</a>
        <asp:Button ID="btnIn" runat="server" Text="In báo cáo"/>
    </div>
</asp:Content>

