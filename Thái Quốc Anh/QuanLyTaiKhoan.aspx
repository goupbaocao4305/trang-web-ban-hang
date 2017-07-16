<%@ Page Title=" " Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="QuanLyTaiKhoan.aspx.cs" Inherits="QuanLyTaiKhoan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:TextBox ID="txtTim" runat="server" placeholder="Nhập Username cần tìm" Width="300px"></asp:TextBox>
    <asp:Button ID="btnTim" runat="server" Text="Tìm" OnClick="btnTim_Click" />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" DataKeyNames="MaUser" OnRowDeleting="GridView1_RowDeleting" OnRowCommand="GridView1_RowCommand" AllowPaging="True" PageSize="20" OnPageIndexChanging="GridView1_PageIndexChanging">
        <AlternatingRowStyle BackColor="#DCDCDC" />
        <Columns>
            <asp:TemplateField HeaderText="STT">
                <ItemTemplate><%#get_stt() %></ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ID">
                <ItemTemplate><%#Eval("MaUser") %></ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Username">
                <ItemTemplate><%#Eval("Username") %></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Họ Tên">
                <ItemTemplate><%#Eval("HoTen") %></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email">
                <ItemTemplate><%#Eval("Email") %></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="SĐT">
                <ItemTemplate><%#Eval("SDT") %></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Địa Chỉ">
                <ItemTemplate><%#Eval("DiaChi") %></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Quyền">
                <ItemTemplate>
                    <asp:DropDownList ID="ddlQuyen" runat="server" SelectedValue='<%#Eval("MaQuyen") %>'>
                        <asp:ListItem Value="1">Admin</asp:ListItem>
                        <asp:ListItem Value="2">User</asp:ListItem>
                    </asp:DropDownList>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="">
                <ItemTemplate>
                    <asp:LinkButton ID="btnCapQuyen" runat="server" CommandArgument='<%#Eval("MaUser") %>' CommandName="CapQuyen"
                         onclientclick="return confirm('Bạn muốn cấp quyền cho người này?');" Text="Cấp quyền"></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />           
            </asp:TemplateField>
            <asp:TemplateField HeaderText="">
                <ItemTemplate> 
                    <asp:LinkButton ID="Button1" runat="server" CommandName="Delete" onclientclick="return confirm('Bạn có muốn xóa không?');" Text="Xóa"/> 
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

