<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/listproducts.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            text-align: center;
            font-size: large;
            color: #000000;
            background-color: #009933;
        }
        .auto-style2 {
            color: #FFFFCC;
        }
        .auto-style3 {
            font-size: large;
            color: #FFFFFF;
        }
        .auto-style4 {
            text-align: center;
            background-color: #009933;
        }
        .auto-style6 {
            text-align: center;
            font-weight: 700;
            color: #FFFFFF;
            background-color: #009933;
        }
        .auto-style7 {
            text-align: center;
            background-color: #009933;
        }
        .auto-style9 {
            text-align: center;
            font-weight: 700;
            font-size: large;
            color: #FFFFFF;
            background-color: #009933;
        }
        .auto-style10 {
            text-align: center;
            font-size: large;
            color: #FFFFFF;
            background-color: #009933;
        }
        .auto-style11 {
            color: #FFFFFF;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="listproduct">
        <div class="auto-style1">
            <a href="Detail.aspx?dm=1"><strong><span class="auto-style2">Bia</span></strong></a></div>
        <asp:DataList ID="DataList1" runat="server" BorderColor="white" GridLines="Both" RepeatColumns="5" RepeatDirection="Horizontal" Width="1000px">
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

    <div class="listproduct">
        <div class="auto-style4">
        <a href="Detail.aspx?dm=5"><span class="auto-style3"><strong> Đồ Chơi</strong></span></a></div>
        <asp:DataList ID="DataList2" runat="server" Width="1000px" GridLines="Both" RepeatColumns="5" RepeatDirection="Horizontal" BorderColor="white">
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

    <div class="listproduct">
        <div class="auto-style6">
        <a href="Detail.aspx?dm=2"><strong><span class="auto-style3">Bánh Kẹo</span></strong></a></div>
        <asp:DataList ID="DataList3" runat="server" Width="1000px" GridLines="Both" RepeatColumns="5" RepeatDirection="Horizontal" BorderColor="white">
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

    <div class="listproduct">
        <div class="auto-style10">
        <a href="Detail.aspx?dm=4"><strong><span class="auto-style11">Quần Aó</span></strong></a></div>
        <asp:DataList ID="DataList4" runat="server" Width="1000px" GridLines="Both" RepeatColumns="5" RepeatDirection="Horizontal" BorderColor="white">
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

    <div class="listproduct">
        <div class="auto-style9">
        <a href="Detail.aspx?dm=3"><span class="auto-style3">Sữa</span></a></div>
        <asp:DataList ID="DataList5" runat="server" Width="1000px" GridLines="Both" RepeatColumns="5" RepeatDirection="Horizontal" BorderColor="white">
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

    <div class="listproduct">
        <div class="auto-style7">
        <a href="Detail.aspx?dm=6"><strong><span class="auto-style3">Đồ Khô</span></strong></a></div>
        <asp:DataList ID="DataList6" runat="server" Width="1000px" GridLines="Both" RepeatColumns="5" RepeatDirection="Horizontal" BorderColor="white">
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

