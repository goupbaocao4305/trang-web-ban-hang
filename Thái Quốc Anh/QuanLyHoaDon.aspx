<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="QuanLyHoaDon.aspx.cs" Inherits="QuanLyHoaDon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        a {
            color: #140160;
            font-weight:bold;
        }
            a:hover {
                color:#ff6a00;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    Xem hóa đơn:
    <asp:DropDownList ID="ddlTrThai" runat="server">
        <asp:ListItem Value="0">Tất cả hóa đơn</asp:ListItem>
        <asp:ListItem Value="Chưa duyệt">Chưa duyệt</asp:ListItem>
        <asp:ListItem Value="Đang chuyển hàng">Đang chuyển hàng</asp:ListItem>
        <asp:ListItem Value="Chưa thanh toán">Chưa thanh toán</asp:ListItem>
        <asp:ListItem Value="Đã thanh toán">Đã thanh toán</asp:ListItem>
    </asp:DropDownList>
    <asp:Button ID="btnLoc" runat="server" Text="Lọc" OnClick="btnLoc_Click" />
    hoặc
    <asp:TextBox ID="txtTim" runat="server" placeholder="Nhập Mã Hóa Đơn Cần Tìm" Width="300px"></asp:TextBox>
    <asp:Button ID="btnTim" runat="server" Text="Tìm" OnClick="btnTim_Click"  />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="5" GridLines="Vertical" DataKeyNames="MaHD" OnRowCommand="GridView1_RowCommand" AllowPaging="True" PageSize="20" OnPageIndexChanging="GridView1_PageIndexChanging">
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
                <ItemTemplate>
                    <asp:DropDownList ID="ddlTrangThai" runat="server" SelectedValue='<%#Eval("TrangThai").ToString() %>'>
                        <asp:ListItem Value="Chưa duyệt">Chưa duyệt</asp:ListItem>
                        <asp:ListItem Value="Đang giao hàng">Đang giao hàng</asp:ListItem>
                        <asp:ListItem Value="Chưa thanh toán">Chưa thanh toán</asp:ListItem>
                        <asp:ListItem Value="Đã thanh toán">Đã thanh toán</asp:ListItem>
                    </asp:DropDownList>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="btnCapNhat" runat="server" CommandArgument='<%#Eval("MaHD") %>' CommandName="CapNhat"
                         onclientclick="return confirm('Bạn muốn chuyển trạng thái?');" Text="Cập nhật"></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" /> 
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
</asp:Content>

