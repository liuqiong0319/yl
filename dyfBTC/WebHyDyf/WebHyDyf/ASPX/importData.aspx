<%@ Page Title="" Language="C#" MasterPageFile="~/ASPX/HouTai/HouT.Master" AutoEventWireup="true" CodeBehind="importData.aspx.cs" Inherits="WebHyDyf.ASPX.importData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .anniun {
            width: 120px;
            border: 1px solid #ff4e00;
            background-color: #ffd1bd;
            color: #ff4e00;
            line-height: 24px;
            height: 22px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-top: 10px; margin-left: 20px; float: left; width: 960px; max-width: 960px;">
        <asp:FileUpload ID="fu_excel" Font-Names="Calibri" Font-Size="Small" Height="30px" Width="270px" runat="server" />
        <asp:Button ID="btn_save" runat="server" Text="导入" OnClick="btn_save_Click" Width="100" />
        <asp:Label ID="lblMes" runat="server" Text="" Style="margin-left: 20px"></asp:Label>
    </div>
    <div style="clear: both"></div>
</asp:Content>
