<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="ThongKeBaoCao.aspx.cs" Inherits="ThongKeBaoCao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .link {
            text-align: center;
            width:100%;
        }
            .link img {
                width:200px;
            }
           
        #content a {
            color: #032169;
            float:left;
            margin:20px 60px;
        }
            #content a:hover {
                color:#ff6a00;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="link">
        <a href="TKHangBanChay.aspx">
            <img src="image/thongke.png" />
            <h3>Thống kê hàng bán chạy nhất</h3>
        </a>
    </div>
    <div class="link">
        <a href="TKDonHang.aspx">
            <img src="image/thongke.png" />
            <h3>Thống kê đơn hàng</h3>
        </a>
    </div>
    <div class="link">
        <a href="TKHangTrongKho.aspx">
            <img src="image/thongke.png" />
            <h3>Thống kê hàng còn trong kho</h3>
        </a>
    </div>
    
</asp:Content>

