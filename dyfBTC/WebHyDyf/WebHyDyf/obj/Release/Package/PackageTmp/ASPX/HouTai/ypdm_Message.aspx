<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ypdm_Message.aspx.cs" Inherits="WebHyDyf.ASPX.HouTai.ypdm_Message" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>

    <link href="/css/qxadmini.css" rel="stylesheet" />
    <style type="text/css">
        #xqDiv {
            width: 600px;
            /*height: 500px;*/
        }

            #xqDiv img {
                width: 550px;
                max-width: 550px;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table border="0" cellspacing="0" cellpadding="0" width="100%" class="houtai-table-01">
            <tr>
                <td class="houtai-table-01-TD-A">药品名称:</td>
                <td class="houtai-table-01-TD-B">
                    <asp:Label ID="lblYpmc" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td class="houtai-table-01-TD-A">产地名称:</td>
                <td class="houtai-table-01-TD-B">
                    <asp:Label ID="lblCdmc" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td class="houtai-table-01-TD-A">规格:</td>
                <td class="houtai-table-01-TD-B">
                    <asp:Label ID="lblGG" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td class="houtai-table-01-TD-A">剂型:</td>
                <td class="houtai-table-01-TD-B">
                    <asp:Label ID="lblJx" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td class="houtai-table-01-TD-A">包装:</td>
                <td class="houtai-table-01-TD-B">
                    <asp:Label ID="lblBz" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td class="houtai-table-01-TD-A">中包装:</td>
                <td class="houtai-table-01-TD-B">
                    <asp:Label ID="lblZbz" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td class="houtai-table-01-TD-A">单位:</td>
                <td class="houtai-table-01-TD-B">
                    <asp:Label ID="lblDw" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td class="houtai-table-01-TD-A">批准文号:</td>
                <td class="houtai-table-01-TD-B">
                    <asp:Label ID="lblPzwh" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td class="houtai-table-01-TD-A">最高零售价:</td>
                <td class="houtai-table-01-TD-B">
                    <asp:Label ID="lblLsj" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td class="houtai-table-01-TD-A">产品图片1:</td>
                <td class="houtai-table-01-TD-B">
                    <asp:Image ID="imgTp1" Width="500px" Height="500px" runat="server" />

                    <%--<asp:Label ID="labTp1" runat="server" Text=""></asp:Label>--%>
                </td>
            </tr>
            <tr>
                <td class="houtai-table-01-TD-A">产品图片2:</td>
                <td class="houtai-table-01-TD-B">
                    <asp:Image ID="imgTp2" Width="500px" Height="500px" runat="server" />
                    <%-- <asp:Label ID="Label6" runat="server" Text=""></asp:Label>--%>
                </td>
            </tr>
            <tr>
                <td class="houtai-table-01-TD-A">产品图片3:</td>
                <td class="houtai-table-01-TD-B">
                    <asp:Image ID="imgTp3" Width="500px" Height="500px" runat="server" />
                    <%-- <asp:Label ID="Label7" runat="server" Text=""></asp:Label>--%>

                </td>
            </tr>
            <tr>
                <td class="houtai-table-01-TD-A">产品图片4:</td>
                <td class="houtai-table-01-TD-B">
                    <asp:Image ID="imgTp4" Width="500px" Height="500px" runat="server" />
                    <%-- <asp:Label ID="Label8" runat="server" Text=""></asp:Label>--%>

                </td>
            </tr>
            <tr>
                <td class="houtai-table-01-TD-A">产片图片5:</td>
                <td class="houtai-table-01-TD-B">
                    <asp:Image ID="imgTp5" Width="500px" Height="500px" runat="server" />
                    <%-- <asp:Label ID="Label9" runat="server" Text=""></asp:Label>--%>

                </td>
            </tr>

            <tr>
                <td class="houtai-table-01-TD-A">首营资料:</td>
                <td class="houtai-table-01-TD-B">
                    <div style="display: none">
                        <asp:Literal ID="litSyzl" runat="server"></asp:Literal>
                    </div>
                    (1)药品生产注册批件：<br />
                    <asp:Image ID="ImgSY01" Width="500px" Height="500px" runat="server" />
                    (2)药品生产再注册批件：<br />
                    <asp:Image ID="ImgSY02" Width="500px" Height="500px" runat="server" />
                    (3)药品质量标准：<br />
                    <asp:Image ID="ImgSY03" Width="500px" Height="500px" runat="server" />
                    (4)物价批文：<br />
                    <asp:Image ID="ImgSY04" Width="500px" Height="500px" runat="server" />
                    (5)说明书：<br />
                    <asp:Image ID="ImgSY05" Width="500px" Height="500px" runat="server" />
                    (6)标签：<br />
                    <asp:Image ID="ImgSY06" Width="500px" Height="500px" runat="server" />
                    (7)最小包装盒实样：<br />
                    <asp:Image ID="ImgSY07" Width="500px" Height="500px" runat="server" />
                    (8)质检报告书:<br />
                    <asp:Image ID="ImgSY08" Width="500px" Height="500px" runat="server" />

                    <%-- <asp:Label ID="labJszl" runat="server" Text=""></asp:Label>--%></td>
            </tr>

            <tr>
                <td class="houtai-table-01-TD-A">产品审核状态:</td>
                <td class="houtai-table-01-TD-B">
                    <asp:Label ID="lblShbs" runat="server" Text=""></asp:Label></td>
            </tr>

            <tr>
                <td class="houtai-table-01-TD-A">产品发布时间:</td>
                <td class="houtai-table-01-TD-B">
                    <asp:Label ID="lblTjrq" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td class="houtai-table-01-TD-A">药品介绍:</td>
                <td class="houtai-table-01-TD-B">
                    <%--<asp:Label ID="labXq" runat="server" Text=""></asp:Label>--%>
                    <asp:Literal ID="litYpxq" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td class="houtai-table-01-TD-A">宣传图片1:</td>
                <td class="houtai-table-01-TD-B">
                    <asp:Image ID="imgXc1" Width="500px" Height="500px" runat="server" />

                    <%--<asp:Label ID="labTp1" runat="server" Text=""></asp:Label>--%>
                </td>
            </tr>
            <tr>
                <td class="houtai-table-01-TD-A">宣传图片2:</td>
                <td class="houtai-table-01-TD-B">
                    <asp:Image ID="imgXc2" Width="500px" Height="500px" runat="server" />

                    <%--<asp:Label ID="labTp1" runat="server" Text=""></asp:Label>--%>
                </td>
            </tr>
            <tr>
                <td class="houtai-table-01-TD-A">宣传图片3:</td>
                <td class="houtai-table-01-TD-B">
                    <asp:Image ID="imgXc3" Width="500px" Height="500px" runat="server" />

                    <%--<asp:Label ID="labTp1" runat="server" Text=""></asp:Label>--%>
                </td>
            </tr>
            <tr>
                <td class="houtai-table-01-TD-A">宣传图片4:</td>
                <td class="houtai-table-01-TD-B">
                    <asp:Image ID="imgXc4" Width="500px" Height="500px" runat="server" />

                    <%--<asp:Label ID="labTp1" runat="server" Text=""></asp:Label>--%>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
