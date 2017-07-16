<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        #gio {
            width: 70%;
        }
        #gio img {
            max-height:50px;
            max-width:50px;
        }
        #gio input[type=text]{
            float: left;
            margin-left:5px;
        }
        #gio table {
            margin:20px 0;
        }
            #gio h3 {
                color:white;
                font-weight:bold;
                padding-left:5px; 
            text-align: center;
            padding-right: 0;
            padding-top: 5px;
            padding-bottom: 5px;
            background-color: #000066;
            width: 995px;
        }
        #sum{
            float: right;
            font-weight: bold;
            font-size: large;
        }
        #ContentPlaceHolder1_lblTongTien {
            color:#ED9B47;
        }
        #btn {
            float:right;
            margin:10px 0 0 20px;
            padding-bottom:20px;
        }
            #btn input[type=submit]{
                border-style: none;
            border-color: inherit;
            border-width: medium;
            background: #000066;
            border-radius: 3px;
                color: white;
                font-weight: bold;
                padding: 5px 10px;
                box-shadow: 2px 2px 3px #999;
                cursor:pointer;
            }
                #btn input[type=submit]:hover {
                    background:#00918D;
                }
        .auto-style1 {
            font-size: 20pt;
        color: #FFFFFF;
        text-align: center;
        background-color: #000066;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    &nbsp;<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <br />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
    <div id="gio">
        <h3 class="auto-style1">Thông tin giỏ hàng</h3>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="white" BorderColor="#3366CC" BorderStyle="None" 
        BorderWidth="1px" CellPadding="4" Width="143%" DataKeyNames="Product" OnRowCommand="GridView1_RowCommand" >
        <Columns>
            <asp:TemplateField HeaderText="STT">
                <ItemTemplate><%=++i %></ItemTemplate>
                <ItemStyle HorizontalAlign="Center"/>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Sản phẩm">
                <ItemTemplate><%#Eval("Product") %></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Hình ảnh">
                <ItemTemplate><img src='<%#Eval("Image") %>' /></ItemTemplate>
                <ItemStyle HorizontalAlign="Center"/>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Số lượng">
                <ItemTemplate>
                    <asp:TextBox ID="txtSoLuong" runat="server" Text='<%#Eval("Quantity") %>' Width="25px"></asp:TextBox>
                    <asp:ImageButton ID="btnCapNhat" runat="server" ImageUrl="~/image/Refresh.png" Width="25px" Height="25px" style="float:left;"
                        title="Cập nhật" OnClick="btnCapNhat_Click" CommandArgument='<%#Eval("Product") %>'/>
                </ItemTemplate>
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
            <asp:CommandField DeleteText="Xóa" ShowDeleteButton="True" ItemStyle-HorizontalAlign="Center">
            <ItemStyle HorizontalAlign="Center" />
            </asp:CommandField>
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
            <asp:Label ID="lblTongTien" runat="server" Text="" style="color: #FF0000"></asp:Label>
        </div>
        <asp:Label ID="lblThongBao" runat="server" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
        <br style="clear:both;"/>
        <div id="btn">
            <asp:Button ID="btnMuaTiep" runat="server" Text="Mua thêm" OnClick="btnMuaTiep_Click" />
            <asp:Button ID="btnTiepTuc" runat="server" Text="Tiếp tục" OnClick="btnTiepTuc_Click" />
        </div>
    </div>
            </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

