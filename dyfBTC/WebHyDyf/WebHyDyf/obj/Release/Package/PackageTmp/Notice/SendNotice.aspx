<%@ Page Title="" Language="C#" MasterPageFile="~/ASPX/HouTai/HouT.Master" AutoEventWireup="true" CodeBehind="SendNotice.aspx.cs" Inherits="WebHyDyf.Notice.SendNotice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <style type="text/css">
        .marginr {
            margin-right: 5px;
        }

        #Panel3_Form3_ctl06_ctl00_content1 {
            margin-top: 80px;
        }

        div {
            width: 100%;
        }

        .news_SR {
            width: 980px;
            float: right;
        }

        .news_SR_A {
            line-height: 30px;
            font-size: 14px;
        }

        .news_SR_A_B {
            text-indent: 0.5px;
            width: 600px;
            border-color: #aaa;
            font-size: 12px;
        }

        .button01 {
            width: 140px;
            border: 1px solid #ff4e00;
            background-color: #ff4e00;
            font-size: 15px;
            height: 28px;
            color: #fff;
            margin-left: 0px;
        }
    </style>
    <script src="/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="/ueditor/lang/zh-cn/zh-cn.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="news_SR">
        <table style="margin-top: 10px;">
            <tr>
                <td colspan="2">标题：<asp:TextBox runat="server" ID="txtTitle" class="news_SR_A_B ">
                </asp:TextBox><br />
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <textarea id="editor" type="text/plain" runat="server" style="width: 1024px; height: 500px;" cols="20" rows="2"></textarea>
                </td>
            </tr>
            <tr>
                <td colspan="2">&nbsp;<br />
                    <asp:Button ID="Button2" runat="server" OnClick="Button1_Click" Text="发布" CssClass="button01" />
                </td>
            </tr>
        </table>

        <script type="text/javascript">
            var ue = UE.getEditor('editor');
        </script>
    </div>
    <div style="clear: both"></div>
</asp:Content>


