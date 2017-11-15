<%@ Page Title="" Language="C#" MasterPageFile="/ASPX/HouTai/HouT.Master" AutoEventWireup="true" CodeBehind="HYZX.aspx.cs" Inherits="WebHyDyf.ASPX.HYZX" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="m_right">
        
        <div class="mem_t">账号信息</div>
        <table border="0" class="acc_tab" style="width: 870px;" cellspacing="0" cellpadding="0">
            <tr>
                <td class="td_l">用户ID： </td>
                <td><asp:Label ID="lblUsername" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="td_l">姓名： </td>
                <td><asp:Label ID="lblUname" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="td_l b_none">电  话：</td>
                <td><asp:Label runat="server" ID="lblPhone"></asp:Label></td>
            </tr>
            <tr>
                <td class="td_l b_none">注册时间：</td>
                <td><asp:Label ID="lblInserttime" runat="server"></asp:Label></td>
            </tr>
            
        </table>


    </div>
</asp:Content>
