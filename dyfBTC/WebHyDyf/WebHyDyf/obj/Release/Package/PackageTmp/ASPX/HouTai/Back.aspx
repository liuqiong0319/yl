<%@ Page Title="" Language="C#" MasterPageFile="~/ASPX/HouTai/HouT.Master" AutoEventWireup="true" CodeBehind="Back.aspx.cs" Inherits="WebHyDyf.ASPX.HouTai.Back" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="HouTai_DIV_R" style="width: 990px;">
        <div class="HouTai_TOP">备份</div>
        <!--右侧内容的HTML引进这个DIV里面开始-->
        <div class="HouTai_IN">
            <table>
                <tr>
                    <td style="width: 100px"><span style="font-size: 9pt">操 作 数 据 库</span></td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" Font-Size="9pt" Width="124px"></asp:DropDownList></td>
                    <td style="width: 100px"></td>
                </tr>
                <tr>
                    <td style="width: 100px"><span style="font-size: 9pt">备份名称和位置</span></td>
                    <td style="width: 100px">
                        <asp:TextBox ID="TextBox1" runat="server" Font-Size="9pt" Width="117px"></asp:TextBox></td>
                    <td style="width: 100px"><span style="font-size: 9pt; color: #ff3300">（如D:\beifen）</span></td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:Button ID="Button1" runat="server" Font-Size="9pt" OnClick="Button1_Click" Text="备份数据库" /></td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
