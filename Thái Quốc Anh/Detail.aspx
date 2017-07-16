<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Detail.aspx.cs" Inherits="Detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/listproducts.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="listproduct">
        <h3>Sản phẩm mới</h3>
        <asp:DataList ID="DataList1" runat="server" Width="1000px" GridLines="Both" RepeatColumns="5" RepeatDirection="Horizontal" BorderColor="white">
            <ItemTemplate>            
                <div class="view">
                    <a href='Product.aspx?id=<%#Eval("MaHang") %>'>
                    <div class="detail">
                        <div class="hinh"><img src='<%#Eval("HinhAnh") %>'/></div>
                        <div class="ten"><%#Eval("TenHang") %></div>
                        <div class="gia"><%#String.Format("{0:0,0}",Eval("DonGia")) + " đ"%></div>
                    </div></a>
                   
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>

