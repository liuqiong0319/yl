<%@ Page Title="" Language="C#" MasterPageFile="~/ASPX/HouTai/HouT.Master" AutoEventWireup="true" CodeBehind="SalesInquiries .aspx.cs" Inherits="WebHyDyf.ASPX.HouTai.SalesInquiries" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="HouTai_DIV_R" style="width: 990px;">
        <div class="HouTai_TOP">销售查询</div>

        <!--查询条件-->
        <div class="HouTai_IN">
            <div class="ShenHe">
                <div class="SouS_SH">
                    <%--<div class="SouS_SH_A">
                        <asp:TextBox ID="TextBox1" runat="server" Class="SouS_SH_A_01" placeholder="请输入搜索关键字"></asp:TextBox>
                    </div>--%>
                    <div class="SouS_SH;" style="border-bottom: 0px;">

                        <div class="SouS_SH_A">
                            订单号：<asp:TextBox ID="txtDDH" runat="server" Class="SouS_SH_A_01 "></asp:TextBox>
                        </div>
                        <div class="SouS_SH_A">
                            名称：<asp:TextBox ID="txtMC" runat="server" Class="SouS_SH_A_01 "></asp:TextBox>
                        </div>
                        <div class="SouS_SH_A">
                            产地：<asp:TextBox ID="txtCD" runat="server" Class="SouS_SH_A_01 "></asp:TextBox>
                        </div>
                        <div class="SouS_SH_B">
                            <asp:Button ID="Button2" runat="server" Text="查询" Class="SouS_SH_A_02 " Style="height: 22px; max-height: 22px; margin-left: 60px;" />
                            <%-- <asp:Button ID="Button2" runat="server" OnClick="Button1_Click"/>--%>
                        </div>

                        <div style="clear: both"></div>
                    </div>
                    <div style="clear: both"></div>
                </div>

                <div style="clear: both"></div>
            </div>
            <!--查询条件-->
            <!--列表内容-->
            <div>
                <table class="ShenHe-Table">
                    <tr>
                        <th style="width: auto;">订单号</th>

                        <th style="width: 140px;">名称</th>
                        <th style="width: 120px;">产地</th>
                        <th style="width: 100px;">规格</th>
                        <th style="width: 100px;">批号</th>
                        <th style="width: 70px;">单价</th>
                        <th style="width: 70px;">数量</th>
                        <th style="width: 100px;">记账日期</th>
                        <th style="width: 70px;">订单金额</th>

                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LabDBH" runat="server" Text="54564564658"></asp:Label>
                        </td>
                        <td style="width: 140px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">
                            <asp:Label ID="LabMC" runat="server" Text="阿莫西林颗粒"></asp:Label></td>


                        <td style="width: 120px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">
                            <asp:Label ID="LabCD" runat="server" Text="四川依科制药有限公司"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="LabGG" runat="server" Text="0.25g*10s"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="LabPH" runat="server" Text="H51020246"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="LabDJ" runat="server" Text="180"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="LabSL" runat="server" Text="500"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="LabJZRQ" runat="server" Text="2016-02-06"></asp:Label>
                        </td>
                        <td style="color: #f00;">
                            <asp:Label ID="LabDDJE" runat="server" Text="1660" Style="color: #f00;"></asp:Label></td>
                    </tr>
                </table>
            </div>
            <!--列表内容-->
            <!--防翻页的地方-->
            <div style=""></div>
            <!--防翻页的地方-->

        </div>


    </div>
</asp:Content>
