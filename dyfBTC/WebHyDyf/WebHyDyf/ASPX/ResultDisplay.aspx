<%@ Page Title="" Language="C#" MasterPageFile="~/ASPX/index.Master" AutoEventWireup="true" CodeBehind="ResultDisplay.aspx.cs" Inherits="WebHyDyf.ASPX.ResultDisplay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>支付示例</title>
    <link rel="stylesheet" type="text/css" href="../css/Common.css">
    <link rel="stylesheet" type="text/css" href="../css/Form.css">
    <link rel="stylesheet" type="text/css" href="../css/Table.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%
        string result = Request.Form["result"] == null ? "" : Request.Form["result"];
    %>
    <div class="content mar_20">

        <!--Begin 银行卡支付 Begin -->
        <div class="warning" style="margin-top: 0px;">

            <table border="0" style="width: 1000px; text-align: center;" cellspacing="0" cellpadding="0">
                <tr height="35">
                    <td style="font-size: 18px;">交易返回信息显示</td>
                </tr>
                <tr>
                    <td class="head" height="24" colspan="2">
                        <%=result %>
                    </td>
                </tr>


            </table>
        </div>
        <!--Begin 银行卡支付 Begin -->

        <!--Begin 支付宝支付 Begin -->

        <!--Begin 支付宝支付 Begin -->




    </div>

</asp:Content>




