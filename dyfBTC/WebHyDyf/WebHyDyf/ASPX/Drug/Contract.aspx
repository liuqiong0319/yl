<%@ Page Title="" Language="C#" MasterPageFile="~/ASPX/index.Master" AutoEventWireup="true" CodeBehind="Contract.aspx.cs" Inherits="WebHyDyf.ASPX.Drug.Contract" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .HT_R {
            line-height: 30px;
            font-size: 15px;
            color: #555;
            text-align: right;
            padding-right: 30px;
        }

        .HT_R_TX {
            border: 1px solid #fff;
            border-bottom: 1px solid #555;
            background-color: #fff;
            text-indent: 0.5em;
            margin-right: 30px;
            width: 200px;
            margin-left: 5px;
            line-height: 22px;
            height: 22px;
            font-size: 15px;
        }

        .HT_L {
            line-height: 30px;
            font-size: 15px;
            color: #555;
            text-align: left;
            text-indent: 2em;
            float: left;
        }

        div {
            margin-bottom: 3px;
        }

        .HT_B {
            /*padding-left: 20px;*/
        }

        .St_table {
            width: 900px;
            border-collapse: collapse;
        }

            .St_table th {
                border: 1px solid #808080;
                line-height: 20px;
                font-size: 14px;
                padding: 5px;
                font-weight: bolder;
                background-color: #f1f1f1;
            }

            .St_table td {
                border: 1px solid #808080;
                line-height: 20px;
                font-size: 13px;
                padding: 5px;
            }

        .Button_App {
            width: 200px;
            height: 30px;
            font-size: 14px;
            color: #fff;
            background-color: #ff6a00;
            border: 1px solid #ff6a00;
            margin-top: 10px;
            margin-bottom: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="IN" style="width: 900px;">
        <h1 style="width: 900px; text-align: center; line-height: 60px; border-bottom: 1px dotted #808080">药品交易服务合同</h1>
        <div class="HT_R">合同编号：0000015</div>
        <div style="clear: both"></div>
        <div class="HT_L">供方： 安徽华源大药房连锁有限公司</div>
        <div class="HT_R">需方：<asp:Label ID="LabXF" runat="server"></asp:Label></div>
        <div style="clear: both"></div>
        <div class="HT_L">
            签定时间：<asp:Label ID="LabQDSJ" runat="server"></asp:Label>
        </div>
        <%--<div class="HT_R">签定地点：<asp:Label ID="LabQDDD" runat="server" Text="Label"></asp:Label></div>--%>
        <div style="clear: both"></div>
        <div class="HT_L" style="margin-top: 30px;"><b class="HT_B">根据中华人民共和国经济合同法及有关条例，经双方协商一致签定本合同。</b></div>
        <div style="clear: both"></div>
        <div class="HT_L"><b class="HT_B">一．品名、数量、价格（人民币）</b></div>
        <div style="clear: both"></div>
        <div>
            <asp:Repeater ID="rp_list" runat="server">
                <HeaderTemplate>
                    <table class="St_table">
                        <tr>
                            <th>品名</th>
                            <th>生产厂家</th>
                            <th>规格</th>
                            <th>批号</th>
                            <th>包装</th>
                            <th>数量</th>
                            <th>单价</th>
                            <th>金额</th>
                            <th>采购日期</th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("ypmc") %></td>
                        <td><%# Eval("cdmc") %></td>
                        <td><%# Eval("gg") %></td>
                        <td><%# Eval("ph") %></td>
                        <td><%# Eval("bz") %></td>
                        <td><%# Eval("sl") %></td>
                        <td><%# Eval("dj") %></td>
                        <td><%# Eval("je") %></td>
                        <td><%# Eval("inserttime") %></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
            <div>
                合计人民币：<span style="font-weight: bolder;"><asp:Label runat="server" ID="lblJE"></asp:Label></span>元&nbsp;&nbsp;&nbsp;
            </div>

        </div>
        <div class="HT_L">
            <b class="HT_B">二．网上发布交易药品必须真实有效，供方应按照合同中买方规定的时间，配送药品并提供伴随服务。所供药品的数量、品名、规格、生产厂家、供货与计划不符即违约，买方有权退货，供方在收到通知七天内应更换所退药品。</b>
        </div>
        <div style="clear: both"></div>
        <div class="HT_L">
            <b class="HT_B">三．因网络安全问题导致信息错误，丢失造成用户利益受损，供方等价赔偿买方受损利益。</b>
        </div>
        <div style="clear: both"></div>





        <div class="HT_L">
            <b class="HT_B">四．交易药品质量符合国家药品质量，管理法规，供方所供药品因药品质量不符合有关规定而造成后果，按有关法律规定处理。</b>
        </div>
        <div style="clear: both"></div>
        <div class="HT_L">
            <b class="HT_B">五．结算方式：先款后货。</b>
        </div>
        <div style="clear: both"></div>
        <div class="HT_L">
            <b class="HT_B">六．运输方式：A、火车 B、汽车 C、其他方式</b>
        </div>
        <div style="clear: both"></div>
        <div class="HT_L">
            <b class="HT_B">运费负担：A、供方 B、需方 C、交货地点</b>
        </div>
        <div style="clear: both"></div>
        <div class="HT_L">
            <b class="HT_B">七、解决合同纠纷方式，双方协商解决。</b>
        </div>
        <div style="clear: both"></div>
        <div class="HT_L">
            <b class="HT_B">八、本合同在确认双方委托代理人合法身份后，签字，盖章生效。</b>
        </div>
        <div style="clear: both"></div>
        <div class="HT_L" style="position: absolute; z-index: 3">
            <img src="/images/YINzhang.png" style="width: 240px; height: 240px;" />

        </div>
        <%-- <div class="HT_R">
            需方<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        </div>--%>
        <div style="clear: both"></div>
        <div class="HT_L">单位名称：安徽华源医药股份有限公司</div>
        <div class="HT_R">单位名称：<asp:Label ID="LabDWMC" runat="server"></asp:Label></div>
        <div style="clear: both"></div>
        <div class="HT_L">委托代理人：张桂龙</div>
        <div class="HT_R">委托代理人：<asp:Label ID="LabXFDLR" runat="server"></asp:Label></div>
        <div style="clear: both"></div>
        <div class="HT_L">有效期限：<asp:Label ID="LabXQKS" runat="server"></asp:Label>至<asp:Label ID="LabXQJS" runat="server"></asp:Label></div>
        <div style="clear: both"></div>


    </div>
    <div class="IN" style="width: 200px;">
        <asp:Button ID="BtnQR" runat="server" Text="同意" CssClass="Button_App" Style="margin-top: 100px;" OnClick="BtnQR_Click" />

    </div>

</asp:Content>
