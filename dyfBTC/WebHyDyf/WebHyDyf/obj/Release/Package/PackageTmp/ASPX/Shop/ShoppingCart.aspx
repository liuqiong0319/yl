﻿<%@ Page Title="" Language="C#" MasterPageFile="~/ASPX/index.Master" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="WebHyDyf.ASPX.Shop.ShoppingCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        table tr:nth-child(odd) {
            background: #fafafa;
        }

        table td:nth-child(even) {
        }

        /*table tr:nth-child(5) {
            background: #73B1E0;
            color: #FFF;
        }*/
    </style>

    <script type="text/javascript" src="/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="/js/menu.js"></script>

    <script type="text/javascript" src="/js/n_nav.js"></script>
    <script type="text/javascript" src="/js/num.js">
    	var jq = jQuery.noConflict();
    </script>

    <script type="text/javascript" src="js/shade.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="i_bg">
        <div class="content mar_20">
            <img src="/images/img1.jpg" />
        </div>

        <!--Begin 第一步：查看购物车 Begin -->
        <div class="content mar_20">
            <asp:Repeater runat="server" ID="rp_cart" OnItemDataBound="rp_cart_ItemDataBound">
                <HeaderTemplate>
                    <table border="0" class="car_tab" style="width: 1200px; margin-bottom: 50px;" cellspacing="0" cellpadding="0">
                        <tr>
                            <td class="car_th" width="490">商品名称</td>
                            <td class="car_th" width="140">批号</td>
                            <td class="car_th" width="140">库存</td>
                            <td class="car_th" width="140">购买数量</td>
                            <td class="car_th" width="100">单价</td>
                            <td class="car_th" width="130">小计</td>
                            <td class="car_th" width="100">操作</td>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <div class="c_s_img">
                                <img src='<%# Eval("yptp1") %>' runat="server" width="73" height="73" />
                            </div>
                            <span><b>
                                <asp:Label ID="labYpmc" Text='<%# Eval("ypmc") %>' runat="server"></asp:Label>
                            </b></span>
                            <br />
                            <asp:HiddenField ID="hiddID" Value='<%# Eval("id") %>' runat="server" />
                            <asp:HiddenField ID="hiddYksl" Value='<%# Eval("yksl") %>' runat="server" />
                            <span>产地：<asp:Label ID="labCdmc" Text='<%# Eval("cdmc") %>' runat="server"></asp:Label>
                            </span>
                            <br />
                            <span style="padding-left: 15px; display: none;">包装：<asp:Label ID="lblBz" runat="server" Text='<%# Eval("bz") %>'></asp:Label></span><span style="padding-left: 15px; display: none;">中包装：<asp:Label ID="lblZbz" runat="server" Text='<%# Eval("zbz") %>'></asp:Label></span><span>规格：
                                    <asp:Label ID="labGG" Text='<%# Eval("gg") %>' runat="server"></asp:Label>
                            </span></td>
                        <td align="center">
                            <asp:Label runat="server" ID="labPh" Text='<%# Eval("ph") %>'></asp:Label>
                        </td>

                        <td align="center" style="color: #ff0000">
                            <asp:Label runat="server" ID="lblkc" Text='<%# Eval("kc") %>'></asp:Label>
                        </td>
                        <td align="center">
                            <div class="c_num" style="float: left;">
                                <asp:Button ID="btnJian" runat="server" CommandName='<%# Eval("gwcid") %>' OnClick="btnJian_Click" class="car_btn_1" />
                                <%--<input type="button"  value="" onclick="jianUpdate1(jq(this));" class="car_btn_1" />--%>
                                <asp:TextBox ID="txtSL" Text='<%# GetKC(Eval("sl").ToString(),Eval("zbz").ToString())%>' runat="server" class="car_ipt"></asp:TextBox>
                                <%--<input type="text" value="1" name="" class="car_ipt" />--%>
                                <asp:Button ID="btnJia" runat="server" CommandName='<%# Eval("gwcid") %>' class="car_btn_2" OnClick="btnJia_Click" />
                                <%--                                <input type="button" value="" onclick="addUpdate1(jq(this));" class="car_btn_2" />--%>
                            </div>
                            <div style="float: left; margin-left: 5px;"><%# Eval("dw") %></div>
                            <div style="clear: both"></div>

                        </td>
                        <td align="center">
                            <asp:Label ID="lblDj" runat="server" Text='<%# Eval("dj") %>'></asp:Label></td>
                        <td align="center" style="color: #ff4e00;">
                            <asp:Label ID="lblje" Text='<%# GetJe(Eval("sl").ToString(),Eval("dj").ToString(),Eval("zbz").ToString())%>' runat="server"></asp:Label></td>

                        <td align="center">
                            <asp:LinkButton ID="LinkButton3" OnClick="LinkButton3_Click" CommandArgument='<%# Eval("gwcid") %>' runat="server">删除</asp:LinkButton>&nbsp;</td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>

            <div style="height: 70px;">
                <div style="font-family: 'Microsoft YaHei'; border-bottom: 0;">
                    <%--<div class="r_rad">
                        <input type="checkbox" name="clear" checked="checked" />
                    </div>
                    <label class="r_txt">清空购物车</label>--%>
                    <span class="fr">商品总价：<b style="font-size: 22px; color: #ff4e00;">￥<asp:Label runat="server" ID="lblsumje"></asp:Label></b></span>
                </div>
            </div>
            <div valign="top" height="150">
                <div colspan="6" align="right">
                    <a href="#">
                        <%--<img src="/images/buy1.gif" /></a>&nbsp; &nbsp;--%>
                        <asp:ImageButton runat="server" ID="imgJS" OnClick="imgJS_Click" ImageUrl="/images/buy2.gif" />
                </div>
            </div>


        </div>
        <!--End 第一步：查看购物车 End-->


        <%-- <!--Begin 弹出层-删除商品 Begin-->
        <div id="fade" class="black_overlay"></div>
        <div id="MyDiv" class="white_content">
            <div class="white_d">
                <div class="notice_t">
                    <span class="fr" style="margin-top: 10px; cursor: pointer;" onclick="CloseDiv('MyDiv','fade')">
                        <img src="images/close.gif" /></span>
                </div>
                <div class="notice_c">

                    <table border="0" align="center" style="font-size: 16px;" cellspacing="0" cellpadding="0">
                        <tr valign="top">
                            <td>您确定要把该商品移除购物车吗？</td>
                        </tr>
                        <tr height="50" valign="bottom">
                            <td><a href="#" class="b_sure">确定</a><a href="#" class="b_buy">取消</a></td>
                        </tr>
                    </table>

                </div>
            </div>
        </div>
        <!--End 弹出层-删除商品 End-->--%>
    </div>
    </a>
</asp:Content>
