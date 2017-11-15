<%@ Page Title="" Language="C#" MasterPageFile="~/ASPX/HouTai/HouT.Master" AutoEventWireup="true" CodeBehind="Complain.aspx.cs" Inherits="WebHyDyf.ASPX.HouTai.Complain" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .Dl_01 {
            width: 900px;
            margin-left: auto;
            margin-right: auto;
            line-height: 24px;
            font-size: 14px;
            color: #555;
            padding-top: 15px;
        }

        .Dl_A {
            border: 1px solid #aaa;
            text-indent: 0.5em;
            line-height: 24px;
            color: #555;
            font-size: 14px;
            width: 500px;
        }

        .button_000 {
            width: 150px;
            color: #fff;
            height: 30px;
            border: 1px solid #ff4e00;
            background-color: #ff4e00;
            font-size: 16px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="HouTai_DIV_R" style="width: 990px;">
        <div class="HouTai_TOP">投诉</div>
        <div class="HouTai_IN" id="div_kh" runat="server">
            <div class="Dl_01">
                投诉标题：<asp:TextBox ID="TextTSWT" runat="server" Class="Dl_A"></asp:TextBox>
            </div>
            <div class="Dl_01">
                <div style="float: left">投诉内容：</div>
                <div>
                    <textarea id="TextTSNR" runat="server" cols="20" rows="2" class="Dl_A" style="height: 300px;"></textarea>
                </div>
                <div style="clear: both"></div>
            </div>
            <div class="Dl_01" style="margin-left: 115px;">
                <asp:Button ID="BtnTS" runat="server" Text="投诉" CssClass="button_000" OnClick="BtnTS_Click" />
            </div>
            <div class="Dl_01"></div>
        </div>
        <div class="HouTai_IN" id="div_ht" runat="server">
            <div class="Dl_01">
                投诉标题：<asp:Label ID="LabTSWT" runat="server" ></asp:Label>
            </div>
            <div class="Dl_01">
                投诉内容：<asp:Literal ID="LabTSNR" runat="server"></asp:Literal>
            </div>
            <div class="Dl_01">
                <div style="float: left">处理结果：</div>
                <div>
                    <textarea id="TextCLJG"  runat="server" cols="20" rows="2" class="Dl_A" style="height: 300px;"></textarea>
                </div>
                <div style="clear: both"></div>
            </div>
            <div class="Dl_01" style="margin-left: 115px;">
                <asp:Button ID="BtnCL" runat="server" Text="处理" CssClass="button_000" OnClick="BtnCL_Click" />
            </div>
            <div class="Dl_01"></div>
        </div>
    </div>
</asp:Content>
