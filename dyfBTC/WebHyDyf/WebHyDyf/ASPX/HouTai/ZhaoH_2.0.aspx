<%@ Page Title="" Language="C#" MasterPageFile="~/ASPX/index.Master" AutoEventWireup="true" CodeBehind="ZhaoH_2.0.aspx.cs" Inherits="WebHyDyf.ASPX.HouTai.ZhaoH_2__0" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/css/style.css" rel="stylesheet" />
    <link href="/css/HouTai.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="HouTai_DIV_R" style="width: 1200px; margin-left: auto; margin-right: auto; float: none;">
        <div class="HouTai_TOP" style="width: 1200px;">找回密码</div>
        <!--右侧内容的HTML引进这个DIV里面开始-->
        <div class="HouTai_IN">
            <div class="HouTai_IN_01" style="margin-left: 200px; margin-bottom: 20px;">
                <div class="HouTai_IN_01_top">
                    找回密码
                </div>
                <div class="HouTai_IN_01_01">
                    <div class="HouTai_IN_01_01a">
                        用户名：<br />
                        姓名：<br />
                        手机号：<br />
                    </div>
                    <div class="HouTai_IN_01_01b">
                        <asp:TextBox ID="TextYHM" runat="server" Class="Shu_botton" Style="width: 200px;"></asp:TextBox>&nbsp;
                        <br />
                        <asp:TextBox ID="TextXM" runat="server" Class="Shu_botton" Style="width: 200px;"></asp:TextBox>&nbsp;
                        <br />
                        <asp:TextBox ID="TextSJH" runat="server" Class="Shu_botton" Style="width: 200px;"></asp:TextBox>&nbsp;
                        <br />
                    </div>
                </div>
                <div style="clear: both"></div>
                <div style="width: 400px; margin-left: 200px; margin-top: 15px;">
                    <asp:Button ID="ZHSave" runat="server" Text="找回密码" Class="TP_SC" OnClick="ZHSave_Click" Style="margin-right: 30px; width: 120px; border: 1px solid #ff4400; background-color: #ff4400;" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
