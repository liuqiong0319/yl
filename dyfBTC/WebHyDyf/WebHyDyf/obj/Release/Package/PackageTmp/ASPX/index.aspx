<%@ Page Title="" Language="C#" MasterPageFile="~/ASPX/index.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebHyDyf.ASPX.index1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript" src="/js/jquery-1.11.1.min_044d0927.js"></script>
    <script type="text/javascript" src="/js/jquery.bxslider_e88acd1b.js"></script>

    <script type="text/javascript" src="/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="/js/menu.js"></script>

    <script type="text/javascript" src="/js/select.js"></script>

    <script type="text/javascript" src="/js/lrscroll.js"></script>

    <script type="text/javascript" src="/js/iban.js"></script>
    <script type="text/javascript" src="/js/fban.js"></script>
    <script type="text/javascript" src="/js/f_ban.js"></script>
    <script type="text/javascript" src="/js/mban.js"></script>
    <script type="text/javascript" src="/js/bban.js"></script>
    <script type="text/javascript" src="/js/hban.js"></script>
    <script type="text/javascript" src="/js/tban.js"></script>

    <script type="text/javascript" src="js/lrscroll_1.js"></script>
    <style>
        #XianS {
            display: inline;
            display: block;
        }

        .news_table {
            width: 200px;
            margin-left: 15px;
            font-size: 12px;
            line-height: 21px;
            color: #555;
            margin-top: 2px;
        }

            .news_table tr td {
                white-space: nowrap;
                overflow: hidden;
                width: 195px;
                max-width: 195px;
                overflow-x: hidden;
            }
    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="i_bg bg_color">
        <div class="i_ban_bg">
            <!--Begin Banner Begin-->
            <div style="width: 1200px; margin-left: auto; margin-right: auto;">
                <!--悬浮QQ对话-->
                <div style="position: fixed; left: 50%; text-align: center; margin-left: 610px; top: 230px; width: 120px; height: 193px; border: 1px solid #d9d9d9; background-color: #ffffff;">
                    <div style="margin-top: 8px;"><span style="font-size: 14px; font-family: FangSong; color: #ff4e00; font-weight: 600">华源连锁大药房</span></div>
                    <div style="height: 80px; margin-top: 3px; border-top: 1px dotted #d9d9d9; line-height: 25px;">
                        <div style="margin-top: 10px;">
                            <a href="http://wpa.qq.com/msgrd?v=3&uin=2925906631&site=qq&menu=yes">
                                <div style="float: left; margin-left: 15px;">
                                    <img border="0" src="http://wpa.qq.com/pa?p=2:2925906631:52" alt="点击这里给我发消息" title="点击这里给我发消息" />
                                </div>
                                <div style="float: left">客服咨询01</div>
                                <div style="clear: both"></div>
                            </a>
                        </div>
                        <div style="margin-top: 10px;">
                            <a href="http://wpa.qq.com/msgrd?v=3&uin=3245711502&site=qq&menu=yes">
                                <div style="float: left; margin-left: 15px;">
                                    <img border="0" src="http://wpa.qq.com/pa?p=2:3245711502:52" alt="点击这里给我发消息" title="点击这里给我发消息" />
                                </div>
                                <div style="float: left">客服咨询02</div>
                                <div style="clear: both"></div>
                            </a>
                        </div>
                        <%--  <div style="margin-top: 10px;">
                            <a  href="http://wpa.qq.com/msgrd?v=3&uin=15856899780&site=qq&menu=yes">
                                <div style="float: left; margin-left: 15px;">
                                    <img border="0" src="http://wpa.qq.com/pa?p=2:15856899780:52" alt="点击这里给我发消息" title="点击这里给我发消息" />
                                </div>

                                <div style="float: left">客服咨询03</div>
                                <div style="clear: both"></div>
                            </a>
                        </div>
                        <div style="margin-top: 10px;">
                            <a  href="http://wpa.qq.com/msgrd?v=3&uin=13225580890&site=qq&menu=yes">
                                <div style="float: left; margin-left: 15px;">
                                    <img border="0" src="http://wpa.qq.com/pa?p=2:13225580890:52" alt="点击这里给我发消息" title="点击这里给我发消息" />
                                </div>

                                <div style="float: left">客服咨询04</div>
                                <div style="clear: both"></div>
                            </a>
                        </div>--%>
                        <div style="margin-top: 20px; border-top: 1px dotted #d9d9d9;">
                            <span style="color: #ee1c24">广告招商热线<br />
                                0558-8615688</span>
                        </div>
                        <div style="clear: both"></div>

                    </div>
                    <%--  华源物流热线<br />
                        0558-8619799<br />--%>
                    <div style="clear: both"></div>
                </div>

            </div>
            <!--悬浮QQ对话-->

            <div style="float: left">
            </div>
            <div class="banner">

                <div class="top_slide_wrap">
                    <ul class="slide_box bxslider">
                        <li>
                            <img src="/images/111111.jpg" width="740" height="401" /></li>
                        <li>
                            <img src="/images/111112.jpg" width="740" height="401" /></li>
                        <li>
                            <img src="/images/111113.jpg" width="740" height="401" /></li>
                    </ul>
                    <div class="op_btns clearfix">
                        <a href="#" class="op_btn op_prev"><span></span></a>
                        <a href="#" class="op_btn op_next"><span></span></a>
                    </div>
                </div>
            </div>
            <script type="text/javascript">
                //var jq = jQuery.noConflict();
                (function () {
                    $(".bxslider").bxSlider({
                        auto: true,
                        prevSelector: jq(".top_slide_wrap .op_prev")[0], nextSelector: jq(".top_slide_wrap .op_next")[0]
                    });
                })();
            </script>
            <!--End Banner End-->
            <div class="inews">
                <div class="news_t">
                    新闻资讯
                </div>
                <asp:Repeater runat="server" ID="rp_List">
                    <HeaderTemplate>
                        <table class="news_table">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <a href="/Notice/NoticeV.aspx?id=<%# Eval("id") %>"><%# Eval("title") %></a>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
        </div>
        <!--Begin 热门商品 Begin-->
        <div class="content mar_10">
            <div class="h_l_img">
                <a href="/ASPX/Drug/DrugDetails.aspx?id=13">
                    <div class="img" title="华素片">

                        <img src="/images/00001.png" width="188" height="188" />
                    </div>
                    <div class="pri_bg">
                        <span class="price fl" style="padding-left: 12px; padding-right: 12px;">8.00元/瓶</span>

                    </div>
                </a>
            </div>
            <div class="hot_pro">
                <div id="featureContainer">
                    <div id="feature">
                        <div id="block">
                            <div id="botton-scroll">
                                <ul class="featureUL">
                                    <li class="featureBox">
                                        <div class="box">
                                            <div class="h_icon">
                                                <img src="/images/hot.png" width="50" height="50" />
                                            </div>
                                            <div class="imgbg">
                                                <a href="/ASPX/Drug/DrugDetails.aspx?id=24">
                                                    <img src="/images/index/0000.jpg" width="160" height="136" /></a>
                                            </div>
                                            <div class="name">
                                                <a href="/ASPX/Drug/DrugDetails.aspx?id=24" title="小儿氨酚烷胺颗粒(优卡丹)">
                                                    <h2>小儿氨酚烷胺颗粒(优卡丹)</h2>
                                                    规格：6g*10袋
                                                </a>
                                            </div>
                                            <div class="price">
                                                <font><span>9.00元/盒</span></font>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="featureBox">
                                        <div class="box">
                                            <div class="h_icon">
                                                <img src="/images/hot.png" width="50" height="50" />
                                            </div>
                                            <div class="imgbg">
                                                <a href="/ASPX/Drug/DrugDetails.aspx?id=23">
                                                    <img src="/images/index/0001.jpg" width="160" height="136" /></a>
                                            </div>
                                            <div class="name">
                                                <a href="/ASPX/Drug/DrugDetails.aspx?id=23" title="维生素AD滴剂(伊可新)（胶囊型）　">
                                                    <h2>维生素AD滴剂(伊可新)（胶囊型）　</h2>
                                                    规格：2000单位*30s
                                                </a>
                                            </div>
                                            <div class="price">
                                                <font><span>35.00元/盒</span></font>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="featureBox">
                                        <div class="box">
                                            <div class="h_icon">
                                                <img src="/images/hot.png" width="50" height="50" />
                                            </div>
                                            <div class="imgbg">
                                                <a href="/ASPX/Drug/DrugDetails.aspx?id=22">
                                                    <img src="/images/index/0002.jpg" width="160" height="136" /></a>
                                            </div>
                                            <div class="name">
                                                <a href="/ASPX/Drug/DrugDetails.aspx?id=22" title="小孩健胃消食片">
                                                    <h2>小孩健胃消食片</h2>
                                                    规格：0.51g*12s*3板
                                                </a>
                                            </div>
                                            <div class="price">
                                                <font><span>8.00元/盒</span></font>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="featureBox">
                                        <div class="box">
                                            <div class="h_icon">
                                                <img src="/images/hot.png" width="50" height="50" />
                                            </div>
                                            <div class="imgbg">
                                                <a href="#">
                                                    <img src="/images/index/0003.jpg" width="160" height="136" /></a>
                                            </div>
                                            <div class="name">
                                                <a href="#" title="小儿善存片">
                                                    <h2>小儿善存片</h2>
                                                    规格：30s
                                                </a>
                                            </div>
                                            <div class="price">
                                                <font><span>34.00元/瓶</span></font>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <a class="h_prev" href="javascript:void();">Previous</a>
                        <a class="h_next" href="javascript:void();">Next</a>
                    </div>
                </div>
            </div>
        </div>
        <!--Begin 限时特卖 Begin-->
        <div class="i_t mar_10">
            <span class="fl">限时特卖</span>

        </div>
        <%--<div class="content">
            <div class="i_sell">
                <div id="imgPlay">
                    <ul class="imgs" id="actor">
                        <li><a href="#">
                            <img src="/images/tm_r.jpg" width="211" height="357" /></a></li>
                        <li><a href="#">
                            <img src="/images/tm_r.jpg" width="211" height="357" /></a></li>
                        <li><a href="#">
                            <img src="/images/tm_r.jpg" width="211" height="357" /></a></li>
                    </ul>
                    <div class="previ">上一张</div>
                    <div class="nexti">下一张</div>
                </div>
            </div>
            <div class="sell_right">
                <div class="sell_1">
                    <div class="s_img">
                        <a href="#" title="测试药品 名字一定要长看看效果是否隐藏">
                            <img src="/images/tm_11.jpg" width="185" height="155" /></a>
                    </div>
                    <div class="s_price">￥<span>89</span></div>
                    <div class="s_name">
                        <h2><a href="#">测试药品 名字一定要长看看效果是否隐藏</a></h2>
                        倒计时：<span>1200</span> 时 <span>30</span> 分 <span>28</span> 秒
                    </div>
                </div>
                <div class="sell_2">
                    <div class="s_img">
                        <a href="#" title="测试药品 名字一定要长看看效果是否隐藏">
                            <img src="/images/tm_11.jpg" width="185" height="155" /></a>
                    </div>
                    <div class="s_price">￥<span>289</span></div>
                    <div class="s_name">
                        <h2><a href="#">测试药品 名字一定要长看看效果是否隐藏</a></h2>
                        倒计时：<span>1200</span> 时 <span>30</span> 分 <span>28</span> 秒
                    </div>
                </div>
                <div class="sell_b1">
                    <div class="sb_img">
                        <a href="#" title="测试药品 名字一定要长看看效果是否隐藏">
                            <img src="/images/tm_b11.jpg" width="242" height="356" /></a>
                    </div>
                    <div class="s_price">￥<span>289</span></div>
                    <div class="s_name">
                        <h2><a href="#">测试药品 名字一定要长看看效果是否隐藏</a></h2>
                        倒计时：<span>1200</span> 时 <span>30</span> 分 <span>28</span> 秒
                    </div>
                </div>
                <div class="sell_3">
                    <div class="s_img">
                        <a href="#" title="测试药品 名字一定要长看看效果是否隐藏">
                            <img src="/images/tm_11.jpg" width="185" height="155" /></a>
                    </div>
                    <div class="s_price">￥<span>289</span></div>
                    <div class="s_name">
                        <h2><a href="#">测试药品 名字一定要长看看效果是否隐藏</a></h2>
                        倒计时：<span>1200</span> 时 <span>30</span> 分 <span>28</span> 秒
                    </div>
                </div>
                <div class="sell_4">
                    <div class="s_img">
                        <a href="#" title="测试药品 名字一定要长看看效果是否隐藏">
                            <img src="/images/tm_11.jpg" width="185" height="155" /></a>
                    </div>
                    <div class="s_price">￥<span>289</span></div>
                    <div class="s_name">
                        <h2><a href="#">测试药品 名字一定要长看看效果是否隐藏</a></h2>
                        倒计时：<span>1200</span> 时 <span>30</span> 分 <span>28</span> 秒
                    </div>
                </div>
                <div class="sell_b2">
                    <div class="sb_img">
                        <a href="#">
                            <img src="/images/tm_b11.jpg" width="242" height="356" /></a>
                    </div>
                    <div class="s_price">￥<span>289</span></div>
                    <div class="s_name">
                        <h2><a href="#">测试药品 名字一定要长看看效果是否隐藏</a></h2>
                        倒计时：<span>1200</span> 时 <span>30</span> 分 <span>28</span> 秒
                    </div>
                </div>
            </div>
        </div>--%>
        <div class="IN">
            <table class="Tui_TA">
                <tr>
                    <td><a href="/ASPX/Drug/DrugDetails.aspx?id=24" title="#" class="Tui_TA_C">
                        <img src="/images/index/0000.jpg" class="Tui_IMG" />
                        <div class="Tui_TA_AD">
                            小儿氨酚烷胺颗粒(优卡丹)<br />
                            <span style="line-height: 20px; font-size: 13px;">价格：<b style="color: #ff0000;">9.00元/盒</b></span>
                        </div>
                    </a>
                    </td>
                    <td><a href="/ASPX/Drug/DrugDetails.aspx?id=23" title="#" class="Tui_TA_C">
                        <img src="/images/index/0001.jpg" class="Tui_IMG" />
                        <div class="Tui_TA_AD">
                            维生素AD滴剂(伊可新)（胶囊型）
                            <br />
                            <span style="line-height: 20px; font-size: 13px;">价格：<b style="color: #ff0000;">35.00元/盒 </b></span>
                        </div>
                    </a>
                    </td>
                    <td><a href="#" title="#" class="Tui_TA_C">
                        <img src="/images/index/0002.jpg" class="Tui_IMG" />
                        <div class="Tui_TA_AD">
                            小孩健胃消食片<br />
                            <span style="line-height: 20px; font-size: 13px;">价格：<b style="color: #ff0000;">8.00元/盒</b></span>
                        </div>
                    </a>
                    </td>
                    <td><a href="#" title="#" class="Tui_TA_C">
                        <img src="/images/index/0003.jpg" class="Tui_IMG" />
                        <div class="Tui_TA_AD">
                            小儿善存片<br />
                            <span style="line-height: 20px; font-size: 13px;">价格：<b style="color: #ff0000;">34.00元/瓶</b></span>
                        </div>
                    </a>
                    </td>
                    <td><a href="/ASPX/Drug/DrugDetails.aspx?id=20" title="#" class="Tui_TA_C">
                        <img src="/images/index/0004.jpg" class="Tui_IMG" />
                        <div class="Tui_TA_AD">
                            小儿感冒颗粒<br />
                            <span style="line-height: 20px; font-size: 13px;">价格：<b style="color: #ff0000;">12.00元/盒</b></span>
                        </div>
                    </a>
                    </td>
                    <td><a href="/ASPX/Drug/DrugDetails.aspx?id=19" title="#" class="Tui_TA_C">
                        <img src="/images/index/0005.jpg" class="Tui_IMG" />
                        <div class="Tui_TA_AD">
                            小儿氨酚黄那敏颗粒(999)<br />
                            <span style="line-height: 20px; font-size: 13px;">价格：<b style="color: #ff0000;">10.00元/盒</b></span>
                        </div>
                    </a>
                    </td>





                </tr>

                <tr>

                    <td><a href="/ASPX/Drug/DrugDetails.aspx?id=10" title="#" class="Tui_TA_C">
                        <img src="/images/index/0007.jpg" class="Tui_IMG" />
                        <div class="Tui_TA_AD">
                            复方锌布颗粒剂(臣功再欣)<br />
                            <span style="line-height: 20px; font-size: 13px;">价格：<b style="color: #ff0000;">13.00元/盒</b></span>
                        </div>
                    </a>
                    </td>
                    <td><a href="/ASPX/Drug/DrugDetails.aspx?id=12" title="#" class="Tui_TA_C">
                        <img src="/images/index/0008.jpg" class="Tui_IMG" />
                        <div class="Tui_TA_AD">
                            复方氨酚烷胺胶囊(快克)<br />
                            <span style="line-height: 20px; font-size: 13px;">价格：<b style="color: #ff0000;">10.00元/盒</b></span>
                        </div>
                    </a>
                    </td>
                    <td><a href="/ASPX/Drug/DrugDetails.aspx?id=13" title="#" class="Tui_TA_C">
                        <img src="/images/index/0009.jpg" class="Tui_IMG" />
                        <div class="Tui_TA_AD">
                            西地碘含片(华素片)<br />
                            <span style="line-height: 20px; font-size: 13px;">价格：<b style="color: #ff0000;">8.00元/盒  </b></span>
                        </div>
                    </a>
                    </td>

                    <td><a href="#" title="#" class="Tui_TA_C">
                        <img src="/images/index/0011.jpg" class="Tui_IMG" />
                        <div class="Tui_TA_AD">
                            复方铝酸铋片<br />
                            <span style="line-height: 20px; font-size: 13px;">价格：<b style="color: #ff0000;">15.00元/盒</b></span>
                        </div>
                    </a>
                    </td>
                    <td></td>
                    <td></td>




                </tr>
            </table>
        </div>
        <!--End 限时特卖 End-->
        <div class="content mar_20">
            <img src="/images/gg.jpg" width="1200" height="110" />
        </div>
        <!--Begin 进口 生鲜 Begin-->
        <div class="i_t mar_10">
            <span class="floor_num">1F</span>
            <span class="fl">
                <!--进口 <b>·</b> 生鲜-->
                外用药</span>

        </div>
        <div class="IN">
            <table class="Tui_TA">
                <tr>
                    <td><a href="/ASPX/Drug/DrugDetails.aspx?id=41" title="#" class="Tui_TA_C">
                        <img src="/images/index/11.jpg" class="Tui_IMG" />
                        <div class="Tui_TA_AD">
                            云南白药酊(套盒)<br />
                            <span style="line-height: 20px; font-size: 13px;">价格：
                                <b style="color: #ff0000;">15.00元/瓶</b></span>
                        </div>
                    </a>
                    </td>
                    <td><a href="/ASPX/Drug/DrugDetails.aspx?id=31" title="#" class="Tui_TA_C">
                        <img src="/images/index/01.jpg" class="Tui_IMG" />
                        <div class="Tui_TA_AD">
                            硝酸咪康唑乳膏(达克宁)<br />
                            <span style="line-height: 20px; font-size: 13px;">价格：
                                <b style="color: #ff0000;">17.00元/盒</b></span>
                        </div>
                    </a>
                    </td>
                    <td><a href="/ASPX/Drug/DrugDetails.aspx?id=32" title="#" class="Tui_TA_C">
                        <img src="/images/index/02.jpg" class="Tui_IMG" />
                        <div class="Tui_TA_AD">
                            复方门冬维甘滴眼液(闪亮）<br />
                            <span style="line-height: 20px; font-size: 13px;">价格：
                                <b style="color: #ff0000;">13.00元</b></span>
                        </div>
                    </a>
                    </td>
                    <td><a href="/ASPX/Drug/DrugDetails.aspx?id=33" title="#" class="Tui_TA_C">
                        <img src="/images/index/03.jpg" class="Tui_IMG" />
                        <div class="Tui_TA_AD">
                            肛泰栓<br />
                            <span style="line-height: 20px; font-size: 13px;">价格：
                                <b style="color: #ff0000;">15.00元/盒</b></span>
                        </div>
                    </a>
                    </td>
                    <td><a href="/ASPX/Drug/DrugDetails.aspx?id=34" title="#" class="Tui_TA_C">
                        <img src="/images/index/04.jpg" class="Tui_IMG" />
                        <div class="Tui_TA_AD">
                            马应龙麝香痔疮膏<br />
                            <span style="line-height: 20px; font-size: 13px;">价格：
                                <b style="color: #ff0000;">10.00元/支</b></span>
                        </div>
                    </a>
                    </td>
                    <td><a href="/ASPX/Drug/DrugDetails.aspx?id=35" title="#" class="Tui_TA_C">
                        <img src="/images/index/05.jpg" class="Tui_IMG" />
                        <div class="Tui_TA_AD">
                            尿素乳膏<br />
                            <span style="line-height: 20px; font-size: 13px;">价格：<b style="color: #ff0000;">2.00元/支</b></span>
                        </div>
                    </a>
                    </td>





                </tr>

                <tr>

                    <td><a href="/ASPX/Drug/DrugDetails.aspx?id=37" title="#" class="Tui_TA_C">
                        <img src="/images/index/07.jpg" class="Tui_IMG" />
                        <div class="Tui_TA_AD">
                            曲咪新乳膏<br />
                            <span style="line-height: 20px; font-size: 13px;">价格：
                                <b style="color: #ff0000;">3.00元/支</b></span>
                        </div>
                    </a>
                    </td>
                    <td><a href="/ASPX/Drug/DrugDetails.aspx?id=38" title="#" class="Tui_TA_C">
                        <img src="/images/index/08.jpg" class="Tui_IMG" />
                        <div class="Tui_TA_AD">
                            烧烫伤膏<br />
                            <span style="line-height: 20px; font-size: 13px;">价格：
                                <b style="color: #ff0000;">13.00元/支</b></span>
                        </div>
                    </a>
                    </td>
                    <td><a href="/ASPX/Drug/DrugDetails.aspx?id=39" title="#" class="Tui_TA_C">
                        <img src="/images/index/09.jpg" class="Tui_IMG" />
                        <div class="Tui_TA_AD">
                            麝香壮骨膏<br />
                            <span style="line-height: 20px; font-size: 13px;">价格：
                                <b style="color: #ff0000;">5.00元/盒</b></span>
                        </div>
                    </a>
                    </td>
                    <td><a href="/ASPX/Drug/DrugDetails.aspx?id=40" title="#" class="Tui_TA_C">
                        <img src="/images/index/10.jpg" class="Tui_IMG" />
                        <div class="Tui_TA_AD">
                            鱼石脂软膏<br />
                            <span style="line-height: 20px; font-size: 13px;">价格：
                                <b style="color: #ff0000;">7.00元/盒</b></span>
                        </div>
                    </a>
                    </td>
                    <td></td>
                    <td></td>




                </tr>
            </table>
        </div>
        <!--End 进口 生鲜 End-->

        <!--Begin 食品饮料 Begin-->
        <div class="i_t mar_10">
            <span class="floor_num">2F</span>
            <span class="fl">
                <!--食品饮料-->
                西药</span>

        </div>
        <div class="IN">
            <table class="Tui_TA">
                <tr>
                    <td><a href="/ASPX/Drug/DrugDetails.aspx?id=10" title="#" class="Tui_TA_C">
                        <img src="/images/index/0007.jpg" class="Tui_IMG" />
                        <div class="Tui_TA_AD">
                            复方锌布颗粒剂(臣功再欣)<br />
                            <span style="line-height: 20px; font-size: 13px;">价格：<b style="color: #ff0000;">13.00元/盒</b></span>
                        </div>
                    </a>
                    </td>
                    <td><a href="/ASPX/Drug/DrugDetails.aspx?id=12" title="#" class="Tui_TA_C">
                        <img src="/images/index/0008.jpg" class="Tui_IMG" />
                        <div class="Tui_TA_AD">
                            复方氨酚烷胺胶囊(快克)<br />
                            <span style="line-height: 20px; font-size: 13px;">价格：<b style="color: #ff0000;">10.00元/盒</b></span>
                        </div>
                    </a>
                    </td>
                    <td><a href="/ASPX/Drug/DrugDetails.aspx?id=13" title="#" class="Tui_TA_C">
                        <img src="/images/index/0009.jpg" class="Tui_IMG" class="Tui_IMG" />
                        <div class="Tui_TA_AD">
                            西地碘含片(华素片)<br />
                            <span style="line-height: 20px; font-size: 13px;">价格：<b style="color: #ff0000;">8.00元/盒 </b></span>
                        </div>
                    </a>
                    </td>

                    <td><a href="#" title="#" class="Tui_TA_C">
                        <img src="/images/index/0011.jpg" class="Tui_IMG" />
                        <div class="Tui_TA_AD">
                            复方铝酸铋片<br />
                            <span style="line-height: 20px; font-size: 13px;">价格：<b style="color: #ff0000;">15.00元/盒</b></span>
                        </div>
                    </a>
                    </td>
                    <td><a href="/ASPX/Drug/DrugDetails.aspx?id=16" title="#" class="Tui_TA_C">
                        <img src="/images/index/0012.jpg" class="Tui_IMG" />
                        <div class="Tui_TA_AD">
                            地衣芽孢杆菌活菌胶囊(整肠生)<br />
                            <span style="line-height: 20px; font-size: 13px;">价格：<b style="color: #ff0000;">9.00元/盒</b></span>
                        </div>
                    </a>
                    </td>
                    <td><a href="#" title="#" class="Tui_TA_C">
                        <img src="/images/index/17.jpg" class="Tui_IMG" />
                        <div class="Tui_TA_AD">
                            羧甲司坦片<br />
                            <span style="line-height: 20px; font-size: 13px;">价格：
                                <b style="color: #ff0000;">3.00元/盒</b></span>
                        </div>
                    </a>
                    </td>




                </tr>

                <tr>
                    <td><a href="/ASPX/Drug/DrugDetails.aspx?id=42" title="#" class="Tui_TA_C">
                        <img src="/images/index/12.jpg" class="Tui_IMG" />
                        <div class="Tui_TA_AD">
                            北豆根片<br />
                            <span style="line-height: 20px; font-size: 13px;">价格：
                                <b style="color: #ff0000;">5.00元/盒</b></span>
                        </div>
                    </a>
                    </td>
                    <td><a href="/ASPX/Drug/DrugDetails.aspx?id=43" title="#" class="Tui_TA_C">
                        <img src="/images/index/13.jpg" class="Tui_IMG" />
                        <div class="Tui_TA_AD">
                            复方左炔诺孕酮片<br />
                            <span style="line-height: 20px; font-size: 13px;">价格：
                                <b style="color: #ff0000;">5.00元/盒</b></span>
                        </div>
                    </a>
                    </td>
                    <td><a href="#" title="#" class="Tui_TA_C">
                        <img src="/images/index/14.jpg" class="Tui_IMG" />
                        <div class="Tui_TA_AD">
                            藿香正气片<br />
                            <span style="line-height: 20px; font-size: 13px;">价格：
                                <b style="color: #ff0000;">3.00元/盒</b></span>
                        </div>
                    </a>
                    </td>
                    <td><a href="/ASPX/Drug/DrugDetails.aspx?id=47" title="#" class="Tui_TA_C">
                        <img src="/images/index/15.jpg" class="Tui_IMG" />
                        <div class="Tui_TA_AD">
                            氯雷他定片(毕研通)<br />
                            <span style="line-height: 20px; font-size: 13px;">价格：
                                <b style="color: #ff0000;">5.00元/盒</b></span>
                        </div>
                    </a>
                    </td>
                    <td><a href="/ASPX/Drug/DrugDetails.aspx?id=46" title="#" class="Tui_TA_C">
                        <img src="/images/index/16.jpg" class="Tui_IMG" />
                        <div class="Tui_TA_AD">
                            氢溴酸右美沙芬片（中大）<br />
                            <span style="line-height: 20px; font-size: 13px;">价格：
                                <b style="color: #ff0000;">10.00元/盒</b></span>
                        </div>
                    </a>
                    </td>
                    <td></td>





                </tr>
            </table>
        </div>
        <!--End 食品饮料 End-->
        <!--Begin 维生素钙 Begin-->
        <div class="i_t mar_10">
            <span class="floor_num">3F</span>
            <span class="fl">
                <!--维生素钙-->
                中成药</span>

        </div>
        <div class="IN">
            <table class="Tui_TA">
                <tr>
                    <td><a href="/ASPX/Drug/DrugDetails.aspx?id=17" title="#" class="Tui_TA_C">
                        <img src="/images/index/0013.jpg" class="Tui_IMG" />
                        <div class="Tui_TA_AD">
                            安神补脑片(薄膜衣)<br />
                            <span style="line-height: 20px; font-size: 13px;">价格：<b style="color: #ff0000;">6.00元/盒</b></span>
                        </div>
                    </a>
                    </td>
                    <td><a href="/ASPX/Drug/DrugDetails.aspx?id=18" title="#" class="Tui_TA_C">
                        <img src="/images/index/0014.jpg" class="Tui_IMG" />
                        <div class="Tui_TA_AD">
                            儿童维D钙咀嚼片(迪巧)<br />
                            <span style="line-height: 20px; font-size: 13px;">价格：<b style="color: #ff0000;">34.00元/瓶</b></span>
                        </div>
                    </a>
                    </td>
                    <td><a href="/ASPX/Drug/DrugDetails.aspx?id=24" title="#" class="Tui_TA_C">
                        <img src="/images/index/0000.jpg" class="Tui_IMG" />
                        <div class="Tui_TA_AD">
                            小儿氨酚烷胺颗粒(优卡丹)<br />
                            <span style="line-height: 20px; font-size: 13px;">价格：<b style="color: #ff0000;">9.00元/盒</b></span>
                        </div>
                    </a>
                    </td>
                    <td><a href="/ASPX/Drug/DrugDetails.aspx?id=23" title="#" class="Tui_TA_C">
                        <img src="/images/index/0001.jpg" class="Tui_IMG" />
                        <div class="Tui_TA_AD">
                            维生素AD滴剂(伊可新)（胶囊型）
                            <br />
                            <span style="line-height: 20px; font-size: 13px;">价格：<b style="color: #ff0000;">35.00元/盒 </b></span>
                        </div>
                    </a>
                    </td>
                    <td><a href="/ASPX/Drug/DrugDetails.aspx?id=22" title="#" class="Tui_TA_C">
                        <img src="/images/index/0002.jpg" class="Tui_IMG" />
                        <div class="Tui_TA_AD">
                            小孩健胃消食片<br />
                            <span style="line-height: 20px; font-size: 13px;">价格：<b style="color: #ff0000;">8.00元/盒</b></span>
                        </div>
                    </a>
                    </td>
                    <td><a href="#" title="#" class="Tui_TA_C">
                        <img src="/images/index/0003.jpg" class="Tui_IMG" />
                        <div class="Tui_TA_AD">
                            小儿善存片<br />
                            <span style="line-height: 20px; font-size: 13px;">价格：<b style="color: #ff0000;">34.00元/瓶</b></span>
                        </div>
                    </a>
                    </td>





                </tr>

                <tr>
                    <td><a href="/ASPX/Drug/DrugDetails.aspx?id=20" title="#" class="Tui_TA_C">
                        <img src="/images/index/0004.jpg" class="Tui_IMG" />
                        <div class="Tui_TA_AD">
                            小儿感冒颗粒<br />
                            <span style="line-height: 20px; font-size: 13px;">价格：<b style="color: #ff0000;">12.00元/盒</b></span>
                        </div>
                    </a>
                    </td>
                    <td><a href="/ASPX/Drug/DrugDetails.aspx?id=19" title="#" class="Tui_TA_C">
                        <img src="/images/index/0005.jpg" class="Tui_IMG" />
                        <div class="Tui_TA_AD">
                            小儿氨酚黄那敏颗粒(999)<br />
                            <span style="line-height: 20px; font-size: 13px;">价格：<b style="color: #ff0000;">10.00元/盒</b></span>
                        </div>
                    </a>
                    </td>

                    <td><a href="/ASPX/Drug/DrugDetails.aspx?id=26" title="#" class="Tui_TA_C">
                        <img src="/images/index/0016.jpg" class="Tui_IMG" />
                        <div class="Tui_TA_AD">
                            蒲地蓝消炎片<br />
                            <span style="line-height: 20px; font-size: 13px;">价格：<b style="color: #ff0000;">6.00元/盒</b></span>
                        </div>
                    </a>
                    </td>

                    <td><a href="/ASPX/Drug/DrugDetails.aspx?id=29" title="#" class="Tui_TA_C">
                        <img src="/images/index/0018.jpg" class="Tui_IMG" />
                        <div class="Tui_TA_AD">
                            气滞胃痛颗粒<br />
                            <span style="line-height: 20px; font-size: 13px;">价格：<b style="color: #ff0000;">18.00元/盒</b></span>
                        </div>
                    </a>
                    </td>
                    <td></td>
                    <td></td>
                </tr>
            </table>
        </div>
        <!--End 维生素钙 End-->


        <div style="height: 30px;"></div>
        <!--End 母婴 End-->
        <!--Begin 家居生活 Begin-->
        <%-- <div class="i_t mar_10">
            <span class="floor_num">5F</span>
            <span class="fl">
                <!--家居生活-->
                医疗器械</span>






            <span class="i_mores fr"><a href="#">检测器材</a>&nbsp; &nbsp;  &nbsp;<a href="#">家庭常备药</a>&nbsp; &nbsp;  &nbsp;<a href="#">康复理疗仪</a>&nbsp; &nbsp; &nbsp;<a href="#">护具系列</a>&nbsp; &nbsp;  &nbsp;<a href="#">更多</a></span>
        </div>
        <div class="content">
            <div class="home_left">
                <div class="home_ban">
                    <div id="imgPlay5">
                        <ul class="imgs" id="actor5">
                            <li><a href="#">
                                <img src="/images/fre_r05.jpg" width="211" height="286" /></a></li>
                            <li><a href="#">
                                <img src="/images/fre_r05.jpg" width="211" height="286" /></a></li>
                            <li><a href="#">
                                <img src="/images/fre_r05.jpg" width="211" height="286" /></a></li>
                        </ul>
                        <div class="prev_h">上一张</div>
                        <div class="next_h">下一张</div>
                    </div>
                </div>
                <div class="fresh_txt">
                    <div class="fresh_txt_c">
                        <a href="#">检测器材</a><a href="#">家庭常备药</a><a href="#">康复理疗仪</a><a href="#">护具系列</a><a href="#">母婴检测仪
                        </a><a href="#">呼吸道用具</a><a href="#">辅助器材</a><a href="#">辅助理疗</a>
                    </div>
                </div>
            </div>
            <div class="fresh_mid">
                <ul>
                    <li>
                        <div class="name"><a href="#">测试药品 名字一定要长看看效果是否隐藏</a></div>
                        <div class="price">
                            <font>￥<span>2160.00</span></font>&nbsp; 50R
                        </div>
                        <div class="img">
                            <a href="#" title="测试药品 名字一定要长看看效果是否隐藏">
                                <img src="/images/tm_11.jpg" width="185" height="155" /></a>
                        </div>
                    </li>
                    <li>
                        <div class="name"><a href="#">测试药品 名字一定要长看看效果是否隐藏</a></div>
                        <div class="price">
                            <font>￥<span>2160.00</span></font>&nbsp; 50R
                        </div>
                        <div class="img">
                            <a href="#" title="测试药品 名字一定要长看看效果是否隐藏">
                                <img src="/images/tm_11.jpg" width="185" height="155" /></a>
                        </div>
                    </li>
                    <li>
                        <div class="name"><a href="#">测试药品 名字一定要长看看效果是否隐藏</a></div>
                        <div class="price">
                            <font>￥<span>2160.00</span></font>&nbsp; 50R
                        </div>
                        <div class="img">
                            <a href="#" title="测试药品 名字一定要长看看效果是否隐藏">
                                <img src="/images/tm_11.jpg" width="185" height="155" /></a>
                        </div>
                    </li>
                    <li>
                        <div class="name"><a href="#">测试药品 名字一定要长看看效果是否隐藏</a></div>
                        <div class="price">
                            <font>￥<span>2160.00</span></font>&nbsp; 50R
                        </div>
                        <div class="img">
                            <a href="#" title="测试药品 名字一定要长看看效果是否隐藏">
                                <img src="/images/tm_11.jpg" width="185" height="155" /></a>
                        </div>
                    </li>
                    <li>
                        <div class="name"><a href="#">测试药品 名字一定要长看看效果是否隐藏</a></div>
                        <div class="price">
                            <font>￥<span>2160.00</span></font>&nbsp; 50R
                        </div>
                        <div class="img">
                            <a href="#" title="测试药品 名字一定要长看看效果是否隐藏">
                                <img src="/images/tm_11.jpg" width="185" height="155" /></a>
                        </div>
                    </li>
                    <li>
                        <div class="name"><a href="#">测试药品 名字一定要长看看效果是否隐藏</a></div>
                        <div class="price">
                            <font>￥<span>2160.00</span></font>&nbsp; 50R
                        </div>
                        <div class="img">
                            <a href="#" title="测试药品 名字一定要长看看效果是否隐藏">
                                <img src="/images/tm_11.jpg" width="185" height="155" /></a>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="fresh_right">
                <ul>
                    <li><a href="#">
                        <img src="/images/fre_b09.jpg" width="260" height="220" /></a></li>
                    <li><a href="#">
                        <img src="/images/fre_b10.jpg" width="260" height="220" /></a></li>
                </ul>
            </div>
        </div>
        <!--End 家居生活 End-->
        <!--Begin 数码家电 Begin-->
        <div class="i_t mar_10">
            <span class="floor_num">6F</span>
            <span class="fl">
                <!--数码家电-->
                药妆个护</span>
            <span class="i_mores fr"><a href="#">美妆护理</a>&nbsp; &nbsp; &nbsp;<a href="#">身体护理</a>&nbsp; &nbsp;&nbsp;<a href="#">女性护理</a>&nbsp; &nbsp; &nbsp;<a href="#">孕产妇护理</a>&nbsp;&nbsp; &nbsp;<a href="#">更多</a></span>
        </div>
        <div class="content">
            <div class="tel_left">
                <div class="tel_ban">
                    <div id="imgPlay6">
                        <ul class="imgs" id="actor6">
                            <li><a href="#">
                                <img src="/images/fre_r06.jpg" width="211" height="286" /></a></li>
                            <li><a href="#">
                                <img src="/images/fre_r06.jpg" width="211" height="286" /></a></li>
                            <li><a href="#">
                                <img src="/images/fre_r06.jpg" width="211" height="286" /></a></li>
                        </ul>
                        <div class="prev_t">上一张</div>
                        <div class="next_t">下一张</div>
                    </div>
                </div>
                <div class="fresh_txt">
                    <div class="fresh_txt_c">
                        <a href="#">身体护理</a><a href="#">女性护理</a><a href="#">孕产妇护理</a><a href="#">口腔护理</a><a href="#">沐浴洗发</a><a href="#">婴幼儿用品</a><a href="#">生活用品</a><a href="#">季节性用品</a>
                    </div>
                </div>
            </div>
            <div class="fresh_mid">
                <ul>
                    <li>
                        <div class="name"><a href="#">测试药品 名字一定要长看看效果是否隐藏</a></div>
                        <div class="price">
                            <font>￥<span>2160.00</span></font>&nbsp; 25R
                        </div>
                        <div class="img">
                            <a href="#" title="测试药品 名字一定要长看看效果是否隐藏">
                                <img src="/images/tm_11.jpg" width="185" height="155" /></a>
                        </div>
                    </li>
                    <li>
                        <div class="name"><a href="#">测试药品 名字一定要长看看效果是否隐藏</a></div>
                        <div class="price">
                            <font>￥<span>2160.00</span></font>&nbsp; 25R
                        </div>
                        <div class="img">
                            <a href="#" title="测试药品 名字一定要长看看效果是否隐藏">
                                <img src="/images/tm_11.jpg" width="185" height="155" /></a>
                        </div>
                    </li>
                    <li>
                        <div class="name"><a href="#">测试药品 名字一定要长看看效果是否隐藏</a></div>
                        <div class="price">
                            <font>￥<span>2160.00</span></font>&nbsp; 25R
                        </div>
                        <div class="img">
                            <a href="#" title="测试药品 名字一定要长看看效果是否隐藏">
                                <img src="/images/tm_11.jpg" width="185" height="155" /></a>
                        </div>
                    </li>
                    <li>
                        <div class="name"><a href="#">测试药品 名字一定要长看看效果是否隐藏</a></div>
                        <div class="price">
                            <font>￥<span>2160.00</span></font>&nbsp; 25R
                        </div>
                        <div class="img">
                            <a href="#" title="测试药品 名字一定要长看看效果是否隐藏">
                                <img src="/images/tm_11.jpg" width="185" height="155" /></a>
                        </div>
                    </li>
                    <li>
                        <div class="name"><a href="#">测试药品 名字一定要长看看效果是否隐藏</a></div>
                        <div class="price">
                            <font>￥<span>2160.00</span></font>&nbsp; 25R
                        </div>
                        <div class="img">
                            <a href="#" title="测试药品 名字一定要长看看效果是否隐藏">
                                <img src="/images/tm_11.jpg" width="185" height="155" /></a>
                        </div>
                    </li>
                    <li>
                        <div class="name"><a href="#">测试药品 名字一定要长看看效果是否隐藏</a></div>
                        <div class="price">
                            <font>￥<span>2160.00</span></font>&nbsp; 25R
                        </div>
                        <div class="img">
                            <a href="#" title="测试药品 名字一定要长看看效果是否隐藏">
                                <img src="/images/tm_11.jpg" width="185" height="155" /></a>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="fresh_right">
                <ul>
                    <li><a href="#">
                        <img src="/images/fre_b11.jpg" width="260" height="220" /></a></li>
                    <li><a href="#">
                        <img src="/images/fre_b12.jpg" width="260" height="220" /></a></li>
                </ul>
            </div>
        </div>--%>
        <!--End 数码家电 End-->
        <!--Begin 猜你喜欢 Begin-->
        <%-- <div class="i_t mar_10">
            <span class="fl">猜你喜欢</span>
        </div>
        <div class="like">
            <div id="featureContainer1">
                <div id="feature1">
                    <div id="block1">
                        <div id="botton-scroll1">
                            <ul class="featureUL">
                                <li class="featureBox">
                                    <div class="box">
                                        <div class="imgbg">
                                            <a href="#">
                                                <img src="/images/hot01.jpg" width="160" height="136" /></a>
                                        </div>
                                        <div class="name">
                                            <a href="#" title="测试药品 名字一定要长看看效果是否隐藏">
                                                <h2>测试药品 名字一定要长看看效果是否隐藏</h2>
                                                测试药品 名字一定要长看看效果是否隐藏
                                            </a>
                                        </div>
                                        <div class="price">
                                            <font>￥<span>189</span></font>&nbsp; 26R
                                        </div>
                                    </div>
                                </li>
                                <li class="featureBox">
                                    <div class="box">
                                        <div class="imgbg">
                                            <a href="#">
                                                <img src="/images/hot01.jpg" width="160" height="136" /></a>
                                        </div>
                                        <div class="name">
                                            <a href="#" title="测试药品 名字一定要长看看效果是否隐藏">
                                                <h2>测试药品 名字一定要长看看效果是否隐藏</h2>
                                                测试药品 名字一定要长看看效果是否隐藏
                                            </a>
                                        </div>
                                        <div class="price">
                                            <font>￥<span>5288</span></font>&nbsp; 25R
                                        </div>
                                    </div>
                                </li>
                                <li class="featureBox">
                                    <div class="box">
                                        <div class="imgbg">
                                            <a href="#">
                                                <img src="/images/hot01.jpg" width="160" height="136" /></a>
                                        </div>
                                        <div class="name">
                                            <a href="#" title="测试药品 名字一定要长看看效果是否隐藏">
                                                <h2>测试药品 名字一定要长看看效果是否隐藏</h2>
                                                测试药品 名字一定要长看看效果是否隐藏
                                            </a>
                                        </div>
                                        <div class="price">
                                            <font>￥<span>368</span></font>&nbsp; 18R
                                        </div>
                                    </div>
                                </li>
                                <li class="featureBox">
                                    <div class="box">
                                        <div class="imgbg">
                                            <a href="#">
                                                <img src="/images/hot01.jpg" width="160" height="136" /></a>
                                        </div>
                                        <div class="name">
                                            <a href="#" title="测试药品 名字一定要长看看效果是否隐藏">
                                                <h2>测试药品 名字一定要长看看效果是否隐藏</h2>
                                                测试药品 名字一定要长看看效果是否隐藏
                                            </a>
                                        </div>
                                        <div class="price">
                                            <font>￥<span>280</span></font>&nbsp; 30R
                                        </div>
                                    </div>
                                </li>
                                <li class="featureBox">
                                    <div class="box">
                                        <div class="imgbg">
                                            <a href="#">
                                                <img src="/images/hot01.jpg" width="160" height="136" /></a>
                                        </div>
                                        <div class="name">
                                            <a href="#" title="测试药品 名字一定要长看看效果是否隐藏">
                                                <h2>测试药品 名字一定要长看看效果是否隐藏</h2>
                                                测试药品 名字一定要长看看效果是否隐藏
                                            </a>
                                        </div>
                                        <div class="price">
                                            <font>￥<span>280</span></font>&nbsp; 30R
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <a class="l_prev" href="javascript:void();">Previous</a>
                    <a class="l_next" href="javascript:void();">Next</a>
                </div>
            </div>
        </div>--%>
        <!--End 猜你喜欢 End-->

        <!--Begin Footer Begin -->



        <!--End Footer End -->
    </div>

</asp:Content>
