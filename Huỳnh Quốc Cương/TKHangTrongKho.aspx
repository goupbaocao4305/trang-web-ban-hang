<%@ Page Title="Thống kê hàng trong kho" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="TKHangTrongKho.aspx.cs" Inherits="TKHangTrongKho" %>

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
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
    Sắp xếp:
    <asp:DropDownList ID="ddtSapXep" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddtSapXep_SelectedIndexChanged">
        <asp:ListItem Value="0">Số lượng tăng dần</asp:ListItem>
        <asp:ListItem Value="1">Số lượng giảm dần</asp:ListItem>
    </asp:DropDownList>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="5" GridLines="Vertical" DataKeyNames="MaHang" AllowPaging="True" PageSize="20" OnPageIndexChanging="GridView1_PageIndexChanging">
        <AlternatingRowStyle BackColor="#DCDCDC" />
        <Columns>
            <asp:TemplateField HeaderText="STT">
                <ItemTemplate><%#get_stt() %></ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Mã hàng">
                <ItemTemplate><%#Eval("MaHang") %></ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tên hàng">
                <ItemTemplate><%#Eval("TenHang") %></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Số lượng còn">
                <ItemTemplate><%#Eval("SoLuong") %></ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Đơn giá">
                <ItemTemplate><%#String.Format("{0:0,0}",Eval("DonGia")) %></ItemTemplate>
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
        </ContentTemplate>
    </asp:UpdatePanel>
    <div id="btn">
        <a href="ThongKeBaoCao.aspx">Trở về</a>
        <asp:Button ID="btnIn" runat="server" Text="In báo cáo"/>
    </div>
</asp:Content>


