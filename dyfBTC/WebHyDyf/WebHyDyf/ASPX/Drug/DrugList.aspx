<%@ Page Title="" Language="C#" MasterPageFile="~/ASPX/index.Master" AutoEventWireup="true" CodeBehind="DrugList.aspx.cs" Inherits="WebHyDyf.ASPX.Drug.DrugList" %>

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
    <div class="i_bg">
        <%--<div class="postion">
            <span class="fl">全部 ></span>
            <span class="n_ch">
                <span class="fl">厂商：<font>云南白药</font></span>
                <a href="#">
                    <img src="/images/s_close.gif" /></a>
            </span>
        </div>--%>
        <!--Begin 筛选条件 Begin-->
        <%--<div class="content mar_10">
            <table border="0" class="choice" style="width: 100%; font-family: '宋体'; margin: 0 auto;" cellspacing="0" cellpadding="0">
                <tr valign="top">
                    <td width="70">&nbsp; 厂商：</td>
                    <td class="td_a"><a href="#" class="now">测试厂商01 </a><a href="#">测试厂商02 </a><a href="#">测试厂商03 </a><a href="#">测试厂商04 </a><a href="#">测试厂商05 </a><a href="#">测试厂商06 </a><a href="#">测试厂商07 </a><a href="#">测试厂商08 </a><a href="#">测试厂商09 </a><a href="#">测试厂商10 </a><a href="#">测试厂商11 </a><a href="#">测试厂商12 </a><a href="#">测试厂商13 </a><a href="#">测试厂商14 </a><a href="#">测试厂商15</a><a href="#">测试厂商16 </a></td>
                </tr>
                <tr valign="top">
                    <td>&nbsp; 价格：</td>
                    <td class="td_a"><a href="#">0-199</a><a href="#" class="now">200-399</a><a href="#">400-599</a><a href="#">600-899</a><a href="#">900-1299</a><a href="#">1300-1399</a><a href="#">1400以上</a></td>
                </tr>
                <tr>
                    <td>&nbsp; 类型：</td>
                    <td class="td_a"><a href="#">片剂</a><a href="#">粉针剂</a><a href="#">水剂</a><a href="#">基药</a><a href="#">胶囊</a><a href="#">其它</a></td>
                </tr>
                <tr>
                    <td>&nbsp; 规格：</td>
                    <td class="td_a"><a href="#">拆零</a><a href="#">整件</a><a href="#">其他</a></td>
                </tr>
            </table>
        </div>--%>
        <!--End 筛选条件 End-->

        <div class="content mar_20">
            <div class="l_history">

                <div class="fav_t" style="border-top: 2px solid #ff6a00; line-height: 38px; height: 38px; font-size: 14px; color: #ff6a00;">推荐药品</div>
                <ul>
                    <li>
                        <div class="img">
                            <a href="/ASPX/Drug/DrugDetails.aspx?id=24">
                                <img src="/images/index/0000.jpg" width="185" height="162" /></a>
                        </div>
                        <div class="name"><a href="/ASPX/Drug/DrugDetails.aspx?id=24">小儿氨酚烷胺颗粒(优卡丹)</a></div>
                        <div class="price">
                            <font><span>8.30元/盒</span></font>&nbsp; 6g*10袋 
                        </div>
                    </li>
                    <li>
                        <div class="img">
                            <a href="/ASPX/Drug/DrugDetails.aspx?id=23">
                                <img src="/images/index/0001.jpg" width="185" height="162" /></a>
                        </div>
                        <div class="name"><a href="/ASPX/Drug/DrugDetails.aspx?id=23">维生素AD滴剂(伊可新)（胶囊型）　</a></div>
                        <div class="price">
                            <font><span>8.80元/盒</span></font>&nbsp;2000单位*30s 
                        </div>
                    </li>
                    <li>
                        <div class="img">
                            <a href="/ASPX/Drug/DrugDetails.aspx?id=22">
                                <img src="/images/index/0002.jpg" width="185" height="162" /></a>
                        </div>
                        <div class="name"><a href="/ASPX/Drug/DrugDetails.aspx?id=22">小孩健胃消食片</a></div>
                        <div class="price">
                            <font><span>6.50元/盒</span></font>&nbsp;0.51g*12s*3板 
                        </div>
                    </li>
                    <li>
                        <div class="img">
                            <a href="#">
                                <img src="/images/index/0003.jpg" width="185" height="162" /></a>
                        </div>
                        <div class="name"><a href="#">小儿善存片</a></div>
                        <div class="price">
                            <font><span>30.78元/瓶</span></font>&nbsp;30s
                        </div>
                    </li>
                </ul>
            </div>
            <div class="l_list">
                <div style="border-top: 2px solid #ff6a00; color: #ff6a00; line-height: 38px; height: 38px; text-indent: 1em; font-size: 14px; background-color: #f6f6f6;">搜索结果</div>

                <div>
                    <asp:Repeater ID="rp_drug" runat="server">
                        <HeaderTemplate>
                            <div>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <div class="In_Yp" style="margin-top: 10px;">
                                <div class="img In_Yp_img">
                                    <a href="/ASPX/Drug/DrugDetails.aspx?id=<%# Eval("id") %>">
                                        <img src='<%# Eval("yptp1") %>' width="160" height="160" /></a>
                                </div>
                                <div class="price In_Yp_In" style="width: 156px; white-space: nowrap; overflow: hidden; height: 20px;">
                                    <font>￥<span><%# Eval("dj") %></span></font>&nbsp; <%# Eval("gg") %>
                                </div>
                                <div class="name In_Yp_In" style="width: 156px; white-space: nowrap; overflow: hidden; height: 20px;"><a href="#"><%# Eval("ypmc") %></a></div>
                                <div class="carbg" style="width: 190px; margin-bottom: 20px;">
                                    <asp:Button Text="加入购物车" runat="server" OnClick="btnJoin_Click" ID="btnJoin" CommandArgument='<%# Eval("id") %>' CssClass="In_Yp_An" />
                                </div>
                            </div>
                        </ItemTemplate>
                        <FooterTemplate>
                            <div style="clear: both"></div>
                            </div>
                        </FooterTemplate>
                    </asp:Repeater>
                    <div style="height: 30px; line-height: 30px; vertical-align: middle; margin-top: 20px; margin-bottom: 20px">
                        <div style="float: right;">
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

            </div>
        </div>

        <!--Begin Footer Begin -->

        <!--End Footer End -->
    </div>
</asp:Content>
