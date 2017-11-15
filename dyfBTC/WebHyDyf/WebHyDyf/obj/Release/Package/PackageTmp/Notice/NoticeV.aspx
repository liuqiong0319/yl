<%@ Page Title="" Language="C#" MasterPageFile="~/ASPX/index.Master" AutoEventWireup="true" CodeBehind="NoticeV.aspx.cs" Inherits="WebHyDyf.Notice.NoticeV" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>新闻详情</title>
    <style type="text/css">
        .news_top {
            width: 900px;
            margin-left: auto;
            margin-right: auto;
            margin-top: 10px;
            line-height: 40px;
            font-size: 16px;
            font-weight: bolder;
            text-align: center;
            font-family: 'Microsoft YaHei UI' 'Microsoft YaHei';
        }

        .news_in {
            width: 900px;
            text-indent: 2em;
            margin-left: auto;
            margin-right: auto;
            margin-bottom: 10px;
            line-height: 30px;
            font-size: 14px;
            text-align: left;
            font-family: 'Microsoft YaHei UI' 'Microsoft YaHei';
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="divTitle" runat="server" class="news_top">
    </div>
    <div id="divCotent" runat="server" class="news_in" style="min-height:600px;">
    </div>
</asp:Content>
