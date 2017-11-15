<%@ Page Title="" Language="C#" MasterPageFile="~/ASPX/index.Master" AutoEventWireup="true" CodeBehind="Submit.aspx.cs" Inherits="WebHyDyf.ASPX.Shop.Submit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 550px;
        }

        .Sr_Dz {
            width: 395px;
            border-width: 0px;
            border: 0px solid #ffffff;
            padding: 0px;
            margin: 0px;
            height: 46px;
            line-height: 46px;
            font-size: 13px;
            text-indent: 0.5em;
            color: #555;
        }

        .Qren_dingdan {
            background-image: url(/images/btn_sure.gif);
            width: 180px;
            height: 45px;
            border: 0px solid #ff4e00;
            border-width: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div class="i_bg">
            <div class="content mar_20">
                <img src="/images/img2.jpg" />
            </div>

            <!--Begin 第二步：确认订单信息 Begin -->
            <div class="content mar_20">
                <div class="two_bg">
                    <div class="two_t">
                        商品列表
                    </div>
                    <asp:Repeater ID="rp_list" runat="server">
                        <HeaderTemplate>
                            <table border="0" class="car_tab" style="width: 1110px;" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td class="car_th" style="width: 550px">商品名称</td>
                                    <td class="car_th" width="140">批号</td>
                                    <td class="car_th" width="150">购买数量</td>
                                    <td class="car_th" width="140">单价</td>
                                    <td class="car_th" width="130">小计</td>

                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td style="vertical-align: middle;" class="auto-style1">
                                    <div class="c_s_img" style="float: left;">
                                        <img src='<%# Eval("yptp1") %>' width="73" height="73" />
                                    </div>
                                    <div style="float: left; height: 73px; width: 405px;">
                                        <span style="height: 100%; width: 100%"><b>
                                            <asp:Label ID="lblYpmc" runat="server" Text='<%# Eval("ypmc") %>'></asp:Label>
                                        </b>
                                            <asp:Label ID="lblCdmc" runat="server" Text='<%# Eval("cdmc") %>'></asp:Label>
                                        </span>
                                        <br />
                                        <span style="display: none;">包装：
                                            <asp:Label ID="lblBz" runat="server" Text='<%# Eval("bz") %>'></asp:Label>
                                        </span><span style="padding-left: 15px; display: none;">中包装：<asp:Label ID="lblZbz" runat="server" Text='<%# Eval("zbz") %>'></asp:Label>
                                        </span><span style="padding-left: 0px;">规格：<asp:Label ID="lblGG" runat="server" Text='<%# Eval("gg") %>'></asp:Label>
                                        </span>
                                    </div>
                                    <div style="clear: both"></div>

                                </td>
                                <td align="center">
                                    <asp:Label ID="lblPh" runat="server" Text='<%# Eval("ph") %>'></asp:Label>
                                </td>
                                <td align="center">
                                    <asp:Label ID="lblSl" runat="server" Text='<%# Eval("sl") %>'></asp:Label>
                                </td>
                                <td align="center"><b>
                                    <asp:Label ID="lblDj" runat="server" Text='<%# Eval("dj") %>'></asp:Label>
                                </b></td>

                                <td align="center" style="color: #ff4e00;">￥<b><asp:Label ID="lblJe" runat="server" Text='<%# Eval("je") %>'></asp:Label></b></td>

                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                    <div style="clear: both;"></div>
                    <div class="two_t">
                        收货人信息
                    </div>
                    <table border="0" class="peo_tab" style="width: 1110px;" cellspacing="0" cellpadding="0">
                        <tr>
                            <td class="p_td" width="160"><span style="color: red">*</span>收货人</td>
                            <td width="395" style="padding: 0px;">
                                <asp:TextBox ID="txtShr" runat="server" CssClass="Sr_Dz" placeholder="请输入收货人姓名"></asp:TextBox></td>
                            <td class="p_td" width="160"><span style="color: red"></span>固定电话</td>
                            <td width="395" style="padding: 0px;">
                                <asp:TextBox runat="server" ID="txtMobile" CssClass="Sr_Dz"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td class="p_td"><span style="color: red">*</span>收货地址</td>
                            <td style="padding: 0px;">
                                <asp:TextBox ID="txtAdd" runat="server" CssClass="Sr_Dz" placeholder="请输入收货地址"></asp:TextBox></td>
                            <td class="p_td">邮政编码</td>
                            <td style="padding: 0px;">
                                <asp:TextBox ID="txtPose" runat="server" CssClass="Sr_Dz"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="p_td"><span style="color: red">*</span>手机号码</td>
                            <td style="padding: 0px;">
                                <asp:TextBox runat="server" ID="txtPhone" CssClass="Sr_Dz" placeholder="请输入手机号码"></asp:TextBox></td>
                            <td class="p_td">备注</td>
                            <td style="padding: 0px;">
                                <asp:TextBox runat="server" ID="txtBz" CssClass="Sr_Dz"></asp:TextBox></td>
                        </tr>
                        <asp:HiddenField runat="server" ID="hiddOid" />
                    </table>
                    <div visible="false" runat="server" id="DivWuLiu">
                        <div class="two_t">
                            物流信息
                        </div>

                        <table border="0" class="peo_tab" style="width: 1110px;" cellspacing="0" cellpadding="0">
                            <tr>
                                <td class="p_td" width="125">物流</td>
                                <td width="430" style="padding: 0px; text-indent: 0.6em;">
                                    <asp:Label ID="LabWLXX" runat="server" Text="Label"></asp:Label>
                                </td>
                                <td class="p_td" width="125">物流状态</td>
                                <td width="430" style="padding: 0px; text-indent: 0.6em;">
                                    <asp:Label ID="LabWLZT" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>



                    <table border="0" style="width: 900px; margin-top: 20px;" cellspacing="0" cellpadding="0">

                        <tr height="70">
                            <td align="right">
                                <b style="font-size: 14px;">应付款金额：<span style="font-size: 22px; color: #ff0000;">￥<asp:Label ID="lblZje" runat="server"></asp:Label>
                                </span></b>
                            </td>
                        </tr>
                        <tr height="70">
                            <td align="right" style="display: none;">
                                <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" CssClass="Qren_dingdan" /></td>
                            <td style="padding: 0px;"></td>
                        </tr>
                    </table>
                </div>
            </div>
            <!--End 第二步：确认订单信息 End-->


        </div>
    </div>
</asp:Content>
