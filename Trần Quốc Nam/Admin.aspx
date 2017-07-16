<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 93px;
        }
        .auto-style2 {
        }
        .auto-style3 {
            width: 93px;
            height: 19px;
        }
        .auto-style5 {
            width: 342px;
        }
        .auto-style6 {
            width: 93px;
            height: 85px;
        }
        #ContentPlaceHolder1_GridView1 a {
            font-weight:bold;
            margin:0 5px;
        }
            #ContentPlaceHolder1_GridView1 a:hover {
                color: #ff6a00;
            }
        #ContentPlaceHolder1_GridView1 > tbody > tr:nth-child(7) span {
            font-weight: bold;
            color: #ff6a00;
            margin:0 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%;">
        <tr>
            <td class="auto-style1">Loại:</td>
            <td class="auto-style5">
                <asp:DropDownList ID="ddlMaloai" runat="server" Width="200px"></asp:DropDownList>
            </td>
            <td>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="ddlMaloai" ErrorMessage="* Chọn loại" ForeColor="Red" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">Thương hiệu:</td>
            <td class="auto-style5">
                <asp:DropDownList ID="ddlMathuonghieu" runat="server" Width="200px"></asp:DropDownList>
            </td>
            <td>
                <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="ddlMathuonghieu" ErrorMessage="* Chọn thương hiệu" ForeColor="Red" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">Tên hàng:</td>
            <td class="auto-style5">
                <asp:TextBox ID="txtTenhang" runat="server" Width="320px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTenhang" Display="Dynamic" ErrorMessage="* Nhập tên hàng" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">Số lượng</td>
            <td class="auto-style5">
                <asp:TextBox ID="txtSoluong" runat="server" Width="320px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtSoluong" Display="Dynamic" ErrorMessage="* Nhập số lượng" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtSoluong" Display="Dynamic" ErrorMessage="Không hợp lệ" ForeColor="Red" ValidationExpression="\d{0,9}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">Đơn giá:</td>
            <td class="auto-style5">
                <asp:TextBox ID="txtDongia" runat="server" Width="320px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtDongia" Display="Dynamic" ErrorMessage="* Nhập đơn giá" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtDongia" Display="Dynamic" ErrorMessage="Không hợp lệ" ForeColor="Red" ValidationExpression="\d{0,9}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">Hình ảnh:</td>
            <td class="auto-style5">
                <asp:FileUpload ID="txtHinhanh" runat="server" Width="325px" />
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtHinhanh" Display="Dynamic" ErrorMessage="* Chọn hình ảnh" ForeColor="Red"></asp:RequiredFieldValidator>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtMota" Display="Dynamic" ErrorMessage="* Nhập mô tả" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style2" rowspan="12" colspan="2">
                <FCKeditorV2:FCKeditor ID="txtMota" runat="server" BasePath="~/fckeditor/" Height="300px"></FCKeditorV2:FCKeditor>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">Mô tả:</td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3"></td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style6"></td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style5">
                <asp:Button ID="btnThem" runat="server" Text="Thêm mới" OnClick="btnThem_Click" Width="100px" />
&nbsp;
                <asp:Button ID="btnNull" runat="server" Text="Nhập lại" Width="90px" CausesValidation="False" OnClick="btnNull_Click" />
            &nbsp;
                </td>
            <td>
                <asp:Label ID="lblThongBao" runat="server" Font-Bold="True" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
                </td>
        </tr>
    </table>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="100%" OnRowDeleting="GridView1_RowDeleting" DataKeyNames="MaHang" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="5" OnRowCommand="GridView1_RowCommand" >
        <Columns>
            <asp:TemplateField HeaderText="STT">
                <ItemTemplate><%#get_stt() %></ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Mã hàng" InsertVisible="False">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("MaHang") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tên hàng">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("TenHang") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="SL">
                <ItemTemplate>
                    <asp:TextBox ID="txtSoLuong" runat="server" Text='<%# Eval("SoLuong") %>' Width="50px"></asp:TextBox>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Đơn giá">
                <ItemTemplate>
                    <asp:TextBox ID="txtGia" runat="server" Text='<%# Eval("DonGia") %>' Width="80px"></asp:TextBox>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Hình ảnh">
                <ItemTemplate>
                    <img src='<%# Eval("HinhAnh") %>' width="200"/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Mô tả">
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Eval("MoTa") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="">
                <ItemTemplate> 
                    <asp:LinkButton ID="Button1" runat="server" CommandName="CapNhat" CommandArgument='<%# Eval("MaHang") %>'
                            onclientclick="return confirm('Bạn có muốn cập nhật không?');" Text="Update" CausesValidation="False" /> 
                 </ItemTemplate>
            </asp:TemplateField> 
            <asp:TemplateField HeaderText="">
                <ItemTemplate> 
                    <asp:LinkButton ID="Button2" runat="server" CommandName="Delete"
                            onclientclick="return confirm('Bạn có muốn xóa không?');" Text="Xóa" CausesValidation="False" /> 
                 </ItemTemplate>
            </asp:TemplateField> 
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Center" />
        <RowStyle ForeColor="#000066" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>
</asp:Content>

