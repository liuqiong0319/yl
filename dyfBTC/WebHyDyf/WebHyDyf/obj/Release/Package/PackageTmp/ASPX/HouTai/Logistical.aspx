<%@ Page Title="" Language="C#" MasterPageFile="~/ASPX/HouTai/HouT.Master" AutoEventWireup="true" CodeBehind="Logistical.aspx.cs" Inherits="WebHyDyf.ASPX.HouTai.Logistical" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="HouTai_DIV_R" style="width: 990px;">
        <div class="HouTai_TOP">
            发货
        </div>
        <div class="HouTai_IN">
            <div class="ShenHe">
                <div class="SouS_SH">
                    <%--<div class="SouS_SH_A">
                        <asp:TextBox ID="TextBox1" runat="server" Class="SouS_SH_A_01" placeholder="请输入搜索关键字"></asp:TextBox>
                    </div>--%>
                    <div class="SouS_SH;" style="border-bottom: 0px;">

                        <div class="SouS_SH_A">
                            物流：<asp:TextBox ID="txtWLXX" runat="server" Class="SouS_SH_A_01 "></asp:TextBox>
                        </div>
                        <div class="SouS_SH_A">
                            物流状态：<asp:TextBox ID="txtWLZT" runat="server" Class="SouS_SH_A_01 "></asp:TextBox>
                        </div>
                        <div class="SouS_SH_B">
                            <asp:Button ID="Button2" runat="server" Text="发货" OnClick="Button2_Click" Class="SouS_SH_A_02 " Style="height: 22px; max-height: 22px; margin-left: 60px;" />
                            <%-- <asp:Button ID="Button2" runat="server" OnClick="Button1_Click"/>--%>
                        </div>

                        <div style="clear: both"></div>
                    </div>
                    <div style="clear: both"></div>
                </div>

                <div style="clear: both"></div>
            </div>
        </div>
    </div>
</asp:Content>
