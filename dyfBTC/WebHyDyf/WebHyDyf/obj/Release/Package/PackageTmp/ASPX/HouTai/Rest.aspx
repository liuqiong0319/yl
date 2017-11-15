<%@ Page Title="" Language="C#" MasterPageFile="~/ASPX/HouTai/HouT.Master" AutoEventWireup="true" CodeBehind="Rest.aspx.cs" Inherits="WebHyDyf.ASPX.HouTai.Rest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="HouTai_DIV_R" style="width: 990px;">
        <div class="HouTai_TOP">还原</div>
        <!--右侧内容的HTML引进这个DIV里面开始-->
        <div class="HouTai_IN">
            <table>
                <tr>
                    <td style="width: 100px; height: 21px"><span style="font-size: 9pt">操 作 数 据 库</span></td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" Font-Size="9pt" Width="124px"></asp:DropDownList></td>
                    <td style="width: 100px; height: 21px"></td>
                </tr>
                <tr>
                    <td style="width: 100px"><span style="font-size: 9pt">操 作 数 据 库</span></td>
                    <td style="width: 100px">
                        <asp:FileUpload ID="FileUpload1" runat="server" Font-Size="9pt" Width="190px" /></td>
                    <td style="width: 100px"></td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:Button ID="Button1" runat="server" Font-Size="9pt" OnClick="Button1_Click" Text="还原数据库" /></td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>

