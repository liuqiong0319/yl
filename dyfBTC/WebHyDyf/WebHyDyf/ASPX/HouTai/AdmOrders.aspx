<%@ Page Title="" Language="C#" MasterPageFile="~/ASPX/HouTai/HouT.Master" AutoEventWireup="true" CodeBehind="AdmOrders.aspx.cs" Inherits="WebHyDyf.ASPX.HouTai.AdmOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .In_Yp
        {
            width: 192px;
            float: left;
        }

        .In_Yp_img
        {
            width: 160px;
            height: 160px;
        }

        .In_Yp_An
        {
            width: 120px;
            border: 1px solid #ff6a00;
            border-width: 1px;
            background-color: #ff6a00;
            color: #ffffff;
            margin: 5px auto;
            margin-left: 30px;
        }

        .In_Yp_In
        {
            padding: 0px 10px;
            margin-left: 10px;
            font-size: 13px;
            line-height: 18px;
            margin-bottom: 5px;
        }

        .In_Yp_An01
        {
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
        <div class="HouTai_TOP">订单管理</div>

        <!--查询条件-->
        <div class="HouTai_IN">
            <div class="ShenHe">
                <div class="SouS_SH">
                    <%--<div class="SouS_SH_A">
                        <asp:TextBox ID="TextBox1" runat="server" Class="SouS_SH_A_01" placeholder="请输入搜索关键字"></asp:TextBox>
                    </div>--%>
                    <div class="SouS_SH;" style="border-bottom: 0px;">

                        <div class="SouS_SH_A">
                            订单号<asp:TextBox ID="txtDDH" runat="server" Class="SouS_SH_A_01 "></asp:TextBox>
                        </div>
                        <div class="SouS_SH_A">
                            收货人：<asp:TextBox ID="txtSHR" runat="server" Class="SouS_SH_A_01 "></asp:TextBox>
                        </div>
                        <div class="SouS_SH_A">
                            联系电话：<asp:TextBox ID="txtLXDH" runat="server" Class="SouS_SH_A_01 "></asp:TextBox>
                        </div>
                        <div class="SouS_SH_A">
                            审核状态：<asp:DropDownList ID="ddlSH" runat="server">
                                <asp:ListItem Value="-1" Text="所有订单" Selected="True">
                                </asp:ListItem>
                                <asp:ListItem Value="0" Text="未付款">
                                </asp:ListItem>
                                <asp:ListItem Value="1" Text="已付款">
                                     
                                </asp:ListItem>
                                <asp:ListItem Value="2" Text="取消订单"></asp:ListItem>
                                <asp:ListItem Value="3" Text="已发货"></asp:ListItem>
                            </asp:DropDownList>


                        </div>
                        <div class="SouS_SH_B">
                            <asp:Button ID="Button2" runat="server" Text="查询" OnClick="Button2_Click" Class="SouS_SH_A_02 " Style="height: 22px; max-height: 22px; margin-left: 60px;" />
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
                <asp:Repeater ID="rp_List" OnItemDataBound="rp_List_ItemDataBound" runat="server">
                    <HeaderTemplate>
                        <table class="ShenHe-Table">
                            <tr>
                                <th style="width: 140px;">订单号</th>
                                <th style="width: 80px;">收货人</th>
                                <th style="width: 120px;">联系电话</th>
                                <th style="width: 160px;">收货地址</th>
                                <th style="width: 80px;">订单状态</th>
                                <th>订单金额</th>
                                <th style="width: 200px;">物流信息</th>
                                <th style="width: 220px;">操作</th>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <asp:Label ID="lblID" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                            </td>
                            <td style="max-width: 80px; white-space: nowrap; overflow: hidden;">
                                <asp:Label ID="lblUname" runat="server" Text='<%# Eval("uname") %>'></asp:Label></td>

                            <td style="max-width: 120px; white-space: nowrap; overflow: hidden;">
                                <asp:Label ID="lblPhone" runat="server" Text='<%# Eval("phone") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblAdress" runat="server" Text='<%# Eval("adress") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblState" runat="server" Text='<%# GetState(Eval("state").ToString())%>'></asp:Label>
                                <asp:HiddenField ID="hiddState" runat="server" Value='<%# Eval("state") %>' />
                            </td>
                            <td style="color: #f00; max-width: 120px; white-space: nowrap; overflow: hidden;">
                                <asp:Label ID="lblJe" runat="server" Text='<%# Eval("je") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("ltitle") %>'></asp:Label>&nbsp<asp:Label ID="lblBeizhu" runat="server" Text='<%# Eval("logistics") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:LinkButton ID="LinkButton3" OnClick="LinkButton3_Click" CommandArgument='<%# Eval("id") %>' runat="server">取消订单</asp:LinkButton>&nbsp;<asp:LinkButton ID="LinkButton2" OnClick="LinkButton2_Click" CommandArgument='<%# Eval("id") %>' runat="server">查看详情</asp:LinkButton>&nbsp;<asp:LinkButton ID="clickhere" CommandArgument='<%# Eval("id") %>' OnClick="LinkButton1_Click" runat="server" Text="发货"></asp:LinkButton>&nbsp;<asp:Label ID="lblWc" runat="server" Text="已完成"></asp:Label></td>
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
