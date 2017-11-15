
<%@ Page Title="" Language="C#" MasterPageFile="~/ASPX/HouTai/HouT.Master" AutoEventWireup="true" CodeBehind="SalesList.aspx.cs" Inherits="WebHyDyf.ASPX.HouTai.SalesList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .In_Yp {
            width: 192px;
            float: left;
        }

        .In_Yp_img {
            width: 160px;
            height: 160px;
        }

        .In_Yp_An {
            width: 120px;
            border: 1px solid #ff6a00;
            border-width: 1px;
            background-color: #ff6a00;
            color: #ffffff;
            margin: 5px auto;
            margin-left: 30px;
        }

        .In_Yp_In {
            padding: 0px 10px;
            margin-left: 10px;
            font-size: 13px;
            line-height: 18px;
            margin-bottom: 5px;
        }

        .In_Yp_An01 {
            width: 60px;
            border: 1px solid #ff6a00;
            border-width: 1px;
            background-color: #ffe2cd;
            color: #ff6a00;
            float: left;
            margin-left: 5px;
            margin-right: 5px;
            line-height: 20px;
            margin-top: 2px;
        }
    </style>
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
                            药品名称：<asp:TextBox ID="txtMC" runat="server" Class="SouS_SH_A_01 "></asp:TextBox>
                        </div>
                        <div class="SouS_SH_A">
                            产地：<asp:TextBox ID="txtCD" runat="server" Class="SouS_SH_A_01 "></asp:TextBox>
                        </div>
                        <div class="SouS_SH_B">
                            <asp:Button ID="Button2" runat="server" Text="查询" Class="SouS_SH_A_02 " Style="height: 22px; max-height: 22px; margin-left: 60px;" OnClick="Button2_Click" />
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
                <asp:Repeater ID="rp_list" runat="server">
                    <HeaderTemplate>
                        <table class="ShenHe-Table">
                            <tr>
                                <th style="width: auto;">订单号</th>
                                <th style="width: 140px;">药品名称</th>
                                <th style="width: 120px;">产地</th>
                                <th style="width: 100px;">规格</th>
                                <th style="width: 100px;">批号</th>
                                <th style="width: 70px;">单价</th>
                                <th style="width: 70px;">数量</th>
                                <th style="width: 100px;">记账日期</th>
                                <th style="width: 70px;">金额</th>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <asp:Label ID="LabDBH" runat="server" Text='<%# Eval("orderid") %>'></asp:Label>
                            </td>
                            <td style="width: 140px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">
                                <asp:Label ID="LabMC" runat="server" Text='<%# Eval("ypmc") %>'></asp:Label></td>
                            <td style="width: 120px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">
                                <asp:Label ID="LabCD" runat="server" Text='<%# Eval("cdmc") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="LabGG" runat="server" Text='<%# Eval("gg") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="LabPH" runat="server" Text='<%# Eval("ph") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="LabDJ" runat="server" Text='<%# Eval("dj") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="LabSL" runat="server" Text='<%# Eval("sl") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="LabJZRQ" runat="server" Text='<%# Eval("inserttime") %>'></asp:Label>
                            </td>
                            <td style="color: #f00;">
                                <asp:Label ID="LabDDJE" runat="server" Text='<%# Eval("je") %>' Style="color: #f00;"></asp:Label></td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
                <div style="height: 30px; line-height: 30px; vertical-align: middle; margin-top: 20px; margin-bottom: 20px">
                    <div style="float: right">
                        <asp:Button ID="btnPrev" runat="server" Text="上一页" OnClick="btnPrev_Click" CssClass="button01 In_Yp_An01" />
                        <asp:Button ID="btnNext" runat="server" Text="下一页" OnClick="btnNext_Click" CssClass="button01 In_Yp_An01" />
                        <div style="float: left; margin-top: -2px">
                            &nbsp 第
                 <asp:Label ID="lblCurrentPage" runat="server" Text="1"></asp:Label>
                            页&nbsp 共
      <asp:Label ID="lblTotalPage" runat="server"></asp:Label>页 &nbsp 
                        去&nbsp
                                            <asp:TextBox ID="txtPageSize" runat="server" Width="40px" Height="20px"></asp:TextBox>&nbsp 页 &nbsp
                        </div>
                        <asp:Button ID="btnJmp" runat="server" Text="确定" OnClick="btnJmp_Click" CssClass="button01 In_Yp_An01" />
                        <div style="clear: both"></div>
                    </div>
                </div>
            </div>
            <!--列表内容-->
            <!--防翻页的地方-->
            <div style=""></div>
            <!--防翻页的地方-->

        </div>


    </div>
</asp:Content>
