<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Product.aspx.cs" Inherits="Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/listproducts.css" rel="stylesheet" />
    <style>
        #box {
            width:100%;
            margin-top:10px;
        }
        #img {
            width:258px;
            height:258px;
            border:solid 1px #DDD;
            text-align:center;
            float:left;
            margin-right:10px;
            position:relative;
        }
            #img img {
                max-width:258px;
                max-height:258px;
                bottom: 0;
                left: 0;
                margin: auto;
                position: absolute;
                right: 0;
                top: 0;
            }
        #des {
            width:720px;
            float:left;
        }
            #des h2 {
                margin:10px 0;
                color:#000066;
            }
            #des #gia {
                margin-bottom:20px;
            font-size: large;
        }
            #des span#cost {
                color:#FF0000;
                font-weight:bold;
            }
            #des input {
                border-style: none;
            border-color: inherit;
            border-width: medium;
            border-radius:3px;
                background:#000066 url('../image/cart_white.png') no-repeat left 50%;
                padding:10px 10px 10px 35px;
                color:white;
                font-weight:bold;
                box-shadow:2px 2px 3px #808080;
                cursor:pointer;
                margin:20px 0 0 20px;
            }
                #des input:hover {
                     background:url(../image/cart_white.png) no-repeat left #00918D;
                }
        #detail {
            margin-bottom:20px;
        }
        #ContentPlaceHolder1_DataList1_lblHet_0 {
            color:red;
            font-weight:bold;
            padding:10px;
            border:solid 1px red;
        }
        .auto-style2 {
            text-align: center;
            font-size: x-large;
            font-weight: 700;
            color: #FFFFFF;
            background-color: #009933;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DataList ID="DataList1" runat="server" Width="100%">
        <ItemTemplate>
            <div id="box">
                <div id="img">
                    <img src='<%#x.Rows[i]["HinhAnh"]%>' />
                </div>
                <div id="des">
                    <h2><%#x.Rows[i]["TenHang"]%></h2>
                    <div id="gia">
                        <label><b>Giá bán: </b></label><span id="cost"><%#String.Format("{0:0,0}",x.Rows[i]["DonGia"])+" đ" %></span>
                    </div>
                    <div id="detail">
                        <%#x.Rows[i]["MoTa"]%>
                    </div>
                    <asp:Button ID="btnThemVaoGio" runat="server" Text="Mua hàng" CommandArgument='<%#i%>'  OnClick="btnThemVaoGio_Click" 
                        CausesValidation="False" Enabled='<%#(int.Parse(x.Rows[i]["SoLuong"].ToString()) == 0)?false:true%>'
                        Visible='<%#(int.Parse(x.Rows[i]["SoLuong"].ToString()) == 0)?false:true%>'/>
                    <asp:Label ID="lblHet" runat="server" Text="Sản phẩm hiện tại đã hết hàng. Xin Quý Khách vui lòng quay lại sau" 
                        Visible='<%#(int.Parse(x.Rows[i]["SoLuong"].ToString()) == 0)?true:false%>'></asp:Label>
                </div>
            </div>
        </ItemTemplate>
    </asp:DataList>
    <br />
     <div class="listproduct">
         <div class="auto-style2">
             Sản phẩm cùng loại</div>
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
</asp:Content>

