<%@ Page Title="" Language="C#" MasterPageFile="~/ASPX/index.Master" AutoEventWireup="true" CodeBehind="Help.aspx.cs" Inherits="WebHyDyf.ASPX.Help" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/css/Help.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="IN">
        <div class="IN_F">
            <div class="Help_Top">常见问题</div>
            <ul id="faq" class="Chang">
                <li>
                    <dl>
                        <dt>了解我们</dt>
                        <dd style="display: none;"><a href="#">安全承诺</a></dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt>新手上路</dt>
                        <dd style="display: none;"><a href="#">注册流程</a></dd>
                        <dd style="display: none;"><a href="#">售后流程</a></dd>
                        <dd style="display: none;"><a href="#">购物流程</a></dd>
                        <dd style="display: none;"><a href="#">订购方式</a></dd>
                        <dd style="display: none;"><a href="#">隐私声明</a></dd>
                        <dd style="display: none;"><a href="#">推荐分享说明</a></dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt>配送与支付</dt>
                        <dd style="display: none;"><a href="#">货到付款区域</a></dd>
                        <dd style="display: none;"><a href="#">配送支付查询</a></dd>
                        <dd style="display: none;"><a href="#">支付方式说明</a></dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt>会员中心</dt>
                        <dd style="display: none;"><a href="#">资金管理</a></dd>
                        <dd style="display: none;"><a href="#">我的收藏</a></dd>
                        <dd style="display: none;"><a href="#">我的订单</a></dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt>服务保证</dt>
                        <dd style="display: none;"><a href="#">退换货原则</a></dd>
                        <dd style="display: none;"><a href="#">售后服务保证</a></dd>
                        <dd style="display: none;"><a href="#">产品质量保证</a></dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt>服务保证</dt>
                        <dd style="display: none;"><a href="#">退换货原则</a></dd>
                        <dd style="display: none;"><a href="#">售后服务保证</a></dd>
                        <dd style="display: none;"><a href="#">产品质量保证</a></dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt>联系我们</dt>
                        <dd style="display: none;"><a href="#">关于我们</a></dd>
                        <dd style="display: none;"><a href="#">联系客服</a></dd>
                    </dl>
                </li>












            </ul>
            <div style="height: 20px;"></div>
        </div>
        <div class="IN_R"></div>
        <div class="CL"></div>
    </div>




    <script type="text/javascript">
    var lastFaqClick = null;
    window.onload = function () {
        var faq = document.getElementById("faq");
        var dls = faq.getElementsByTagName("dl");
        for (var i = 0, dl; dl = dls[i]; i++) {
            var dt = dl.getElementsByTagName("dt")[0];//取得标题
            dt.id = "faq_dt_" + (Math.random() * 100);
            dt.onclick = function () {
                var p = this.parentNode;//取得父节点
                if (lastFaqClick != null && lastFaqClick.id != this.id) {
                    var dds = lastFaqClick.parentNode.getElementsByTagName("dd");
                    for (var i = 0, dd; dd = dds[i]; i++)
                        dd.style.display = 'none';
                }
                lastFaqClick = this;
                var dds = p.getElementsByTagName("dd");//取得对应子节点，也就是说明部分
                var tmpDisplay = 'none';
                if (gs(dds[0], 'display') == 'none')
                    tmpDisplay = 'block';
                for (var i = 0; i < dds.length; i++)
                    dds[i].style.display = tmpDisplay;
            }
        }
    }
    function gs(d, a) {
        if (d.currentStyle) {
            var curVal = d.currentStyle[a]
        } else {
            var curVal = document.defaultView.getComputedStyle(d, null)[a]
        }
        return curVal;
    }
    </script>
</asp:Content>

