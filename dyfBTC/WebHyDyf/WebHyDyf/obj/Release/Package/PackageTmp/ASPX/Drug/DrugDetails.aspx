<%@ Page Title="" Language="C#" MasterPageFile="~/ASPX/index.Master" AutoEventWireup="true" CodeBehind="DrugDetails.aspx.cs" Inherits="WebHyDyf.ASPX.Drug.DrugDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .Ys {
            background-image: url(/images/j_car.png);
            width: 180px;
            height: 45px;
            border: 0px;
        }
    </style>
    <link type="text/css" rel="stylesheet" href="/css/style.css" />

    <link rel="stylesheet" type="text/css" href="/css/ShopShow.css" />
    <link rel="stylesheet" type="text/css" href="/css/MagicZoom.css" />

    <script type="text/javascript" src="/js/num.js">
    	var jq = jQuery.noConflict();
    </script>
    <script type="text/javascript" src="/js/menu.js"></script>
    <script type="text/javascript" src="/js/lrscroll_1.js"></script>
    <script type="text/javascript" src="/js/n_nav.js"></script>
    <script type="text/javascript" src="/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="/js/p_tab.js"></script>
    <script type="text/javascript" src="/js/shade.js"></script>
    <script type="text/javascript" src="/js/ShopShow.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="i_bg">
        <%-- <div class="postion">
            <span class="fl">全部 > 搜索 > 测试药品 > 测试药品01</span>
        </div>--%>
        <div class="content" style="margin-top: 20px;">

            <div id="tsShopContainer" style="margin-left: 50px;">
                <div id="tsImgS">
                    <a href="/images/ZZTP_B.jpg" title="Images" runat="server" class="MagicZoom" id="MagicZoom">
                        <img id="dtu" runat="server" src="/images/ZZTP_B.jpg" width="390" height="390" /></a>
                </div>
                <div id="tsPicContainer">
                    <div id="tsImgSArrL" onclick="tsScrollArrLeft()"></div>
                    <div id="tsImgSCon">
                        <ul style="width: 500px;">
                            <li onclick="showPic(0)" rel="MagicZoom" class="tsSelectImg">
                                <img id="img1" runat="server" src="/images/ZZTP.jpg" tsimgs="/images/gs3.jpg" width="79" height="79" /></li>
                            <li onclick="showPic(1)" rel="MagicZoom">
                                <img id="img2" runat="server" src="/images/ZZTP.jpg" tsimgs="/images/ps2.jpg" width="79" height="79" /></li>
                            <li onclick="showPic(2)" rel="MagicZoom">
                                <img id="img3" runat="server" src="/images/ZZTP.jpg" tsimgs="/images/gs3.jpg" width="79" height="79" /></li>
                            <li onclick="showPic(3)" rel="MagicZoom">
                                <img id="img4" runat="server" src="/images/ZZTP.jpg" tsimgs="/images/ps2.jpg" width="79" height="79" /></li>
                            <li onclick="showPic(4)" rel="MagicZoom">
                                <img id="img5" runat="server" src="/images/ZZTP.jpg" tsimgs="/images/ps2.jpg" width="79" height="79" /></li>

                        </ul>
                    </div>
                    <div id="tsImgSArrR" onclick="tsScrollArrRight()"></div>
                </div>
                <img class="MagicZoomLoading" width="16" height="16" src="/images/loading.gif" alt="Loading..." />
            </div>

            <div class="pro_des" style="width: 720px; margin-top: 10px;">
                <div class="des_name" style="margin-left: 40px; line-height: 25px;">
                    <b style="padding-right: 40px; font-size: 18px; color: #3e3e3e;"><span id="spYpmc" runat="server"></span></b>
                    <br />
                    <span id="spCdmc" runat="server"></span>
                </div>
                <div style="width: 660px; margin: 5px auto; border-top: 1px dotted #aaa"></div>
                <div class="des_price" style="height: 230px; margin-left: 40px; width: 670px;">
                    <div>
                        <div style="float: left; width: 310px; line-height: 40px;">
                            规格：<span style="font-weight: 700;" id="spGG" runat="server"></span><br />
                            <span style="display: none">包装：<span id="spBz" runat="server"></span><br />
                            </span>
                            数量：<span id="spSl" runat="server"></span>
                            <br />
                            <span style="display: none">国家零售价：<span style="font-weight: 700;" id="spLSJ" runat="server"></span><br />
                            </span>
                            <span style="font-size: 16px; font-weight: bolder;">价格：<span id="spDj" runat="server" style="color: #f00"></span></span>
                        </div>

                        <div style="float: left; width: 300px; line-height: 40px;">
                            批号：<span id="spPh" runat="server"></span><br />
                            <span style="display: none">中包装：<span id="spZBZ" runat="server"></span><br />
                            </span>
                            有效期：<span id="spYXQ" runat="server"></span><br />

                            批准文号：<span id="spPzwh" runat="server"></span>
                        </div>
                        <div style="clear: both"></div>
                    </div>

                </div>

                <div class="des_join" style="margin-left: 150px;">
                    <div class="j_nums">
                        <asp:TextBox ID="txtSl" Text="1" runat="server" class="n_ipt"></asp:TextBox>
                        <%-- <input type="text" value="1" name="" class="n_ipt" />--%>
                        <asp:Button ID="btnJia" runat="server" class="n_btn_1" OnClick="btnJia_Click" />
                        <%--<input type="button" value="" runat="server" onclick="" class="n_btn_1" />--%>
                        <asp:Button ID="btnJian" runat="server" class="n_btn_2" OnClick="btnJian_Click" />
                        <%--<input type="button" value="" onclick="jianUpdate(jq(this));" class="n_btn_2" />--%>
                    </div>
                    <span class="fl">
                        <asp:Button ID="btnJoin" runat="server" OnClick="btnJoin_Click" CssClass="Ys" Text="&nbsp;" /></span>

                </div>
                <div style="clear: both"></div>
            </div>

            <%--            <div class="s_brand">
                <div class="s_brand_img">
                    <img src="/images/DP_logo.jpg" width="188" height="132" />
                </div>
                <div class="s_brand_c"><a href="#">进入店铺</a></div>
            </div>--%>
        </div>
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
                <%--  <div class="des_border">
                    <div class="des_tit">
                        <ul>
                            <li class="current">推荐搭配</li>
                        </ul>
                    </div>
                    <div class="team_list">
                        <div class="img">
                            <a href="#">
                                <img src="/images/gs1.jpg" width="160" height="140" /></a>
                        </div>
                        <div class="name"><a href="#">测试药品01</a></div>
                        <div class="price">
                            <div class="checkbox">
                                <input type="checkbox" name="zuhe" checked="checked" />
                            </div>
                            <font>￥<span>768.00</span></font>&nbsp; 1ml*10支
                        </div>
                    </div>
                    <div class="team_icon">
                        <img src="/images/jia_b.gif" />
                    </div>
                    <div class="team_list">
                        <div class="img">
                            <a href="#">
                                <img src="/images/gs1.jpg" width="160" height="140" /></a>
                        </div>
                        <div class="name"><a href="#">测试药品01</a></div>
                        <div class="price">
                            <div class="checkbox">
                                <input type="checkbox" name="zuhe" />
                            </div>
                            <font>￥<span>749.00</span></font>&nbsp;1ml*10支
                        </div>
                    </div>
                    <div class="team_icon">
                        <img src="/images/jia_b.gif" />
                    </div>
                    <div class="team_list">
                        <div class="img">
                            <a href="#">
                                <img src="/images/gs1.jpg" width="160" height="140" /></a>
                        </div>
                        <div class="name"><a href="#">测试药品01</a></div>
                        <div class="price">
                            <div class="checkbox">
                                <input type="checkbox" name="zuhe" checked="checked" />
                            </div>
                            <font>￥<span>749.00</span></font>&nbsp; 1ml*10支
                        </div>
                    </div>
                    <div class="team_icon">
                        <img src="/images/equl.gif" />
                    </div>
                    <div class="team_sum">
                        套餐价：￥<span>1517</span><br />
                        <input type="text" value="1" class="sum_ipt" /><br />
                        <a href="#">
                            <img src="/images/z_buy.gif" /></a>
                    </div>

                </div>
                <div class="des_border">
                    <div class="des_tit">
                        <ul>
                            <li class="current"><a href="#p_attribute">商品属性</a></li>
                            <li><a href="#p_details">商品详情</a></li>
                            <li><a href="#p_comment">商品评论</a></li>
                        </ul>
                    </div>
                    <div class="des_con" id="p_attribute">

                        <table border="0" align="center" style="width: 100%; font-family: '宋体'; margin: 5px auto; line-height: 40px;" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>药品名称：测试药品01</td>
                                <td>药品编号：1546211</td>
                                <td>品牌：测试药品01</td>
                                <td>药品产地：河南润弘制药股份有限公司(原郑州羚锐)</td>
                            </tr>
                            <tr>
                                <td>药品规格：160.00g</td>
                                <td>批准文号：H41020822</td>
                                <td>上架时间：2016-09-06 09:19:09</td>
                                <td>&nbsp;</td>
                            </tr>

                        </table>


                    </div>
                </div>--%>

                <div class="des_border" id="p_details">
                    <div class="des_t">商品详情</div>
                    <div class="des_con">
                        <%--<table border="0" align="center" style="width: 745px; font-size: 14px; font-family: '宋体';" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="265">
                                    <img src="/images/de1.jpg" width="206" height="412" /></td>
                                <td>
                                    <b>迪奥真我香水(Q版)</b><br />
                                    【商品规格】：5ml<br />
                                    【商品质地】：液体<br />
                                    【商品日期】：与专柜同步更新<br />
                                    【商品产地】：法国<br />
                                    【商品包装】：无外盒 无塑封<br />
                                    【商品香调】：花束花香调<br />
                                    【适用人群】：适合女性（都市白领，性感，有女人味的成熟女性）<br />
                                </td>
                            </tr>
                        </table>--%>
                        <p id="ms" runat="server"></p>
                        <p id="xq" runat="server" align="center">
                        </p>

                    </div>
                </div>




            </div>
        </div>


        <!--Begin 弹出层-收藏成功 Begin-->
        <div id="fade" class="black_overlay"></div>
        <div id="MyDiv" class="white_content">
            <div class="white_d">
                <div class="notice_t">
                    <span class="fr" style="margin-top: 10px; cursor: pointer;" onclick="CloseDiv('MyDiv','fade')">
                        <img src="/images/close.gif" /></span>
                </div>
                <div class="notice_c">

                    <table border="0" align="center" style="margin-top: ;" cellspacing="0" cellpadding="0">
                        <tr valign="top">
                            <td width="40">
                                <img src="/images/suc.png" /></td>
                            <td>
                                <span style="color: #3e3e3e; font-size: 18px; font-weight: bold;">您已成功收藏该商品</span><br />
                                <a href="#">查看我的关注 >></a>
                            </td>
                        </tr>
                        <tr height="50" valign="bottom">
                            <td>&nbsp;</td>
                            <td><a href="#" class="b_sure">确定</a></td>
                        </tr>
                    </table>

                </div>
            </div>
        </div>
        <!--End 弹出层-收藏成功 End-->


        <!--Begin 弹出层-加入购物车 Begin-->
        <div id="fade1" class="black_overlay"></div>
        <div id="MyDiv1" class="white_content">
            <div class="white_d">
                <div class="notice_t">
                    <span class="fr" style="margin-top: 10px; cursor: pointer;" onclick="CloseDiv_1('MyDiv1','fade1')">
                        <img src="/images/close.gif" /></span>
                </div>
                <div class="notice_c">

                    <table border="0" align="center" style="margin-top: ;" cellspacing="0" cellpadding="0">
                        <tr valign="top">
                            <td width="40">
                                <img src="/images/suc.png" /></td>
                            <td>
                                <span style="color: #3e3e3e; font-size: 18px; font-weight: bold;">宝贝已成功添加到购物车</span><br />
                                购物车共有1种宝贝（3件） &nbsp; &nbsp; 合计：1120元
                            </td>
                        </tr>
                        <tr height="50" valign="bottom">
                            <td>&nbsp;</td>
                            <td><a href="#" class="b_sure">去购物车结算</a><a href="#" class="b_buy">继续购物</a></td>
                        </tr>
                    </table>

                </div>
            </div>
        </div>
        <!--End 弹出层-加入购物车 End-->




    </div>
</asp:Content>
