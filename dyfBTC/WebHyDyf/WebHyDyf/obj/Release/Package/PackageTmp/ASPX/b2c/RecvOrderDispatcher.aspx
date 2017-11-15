<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecvOrderDispatcher.aspx.cs" Inherits="WebHyDyf.ASPX.b2c.RecvOrderDispatcher" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title></title>
    <script language="javascript" type="text/javascript">
        function goBocnet() {
            document.form1.submit();
        }
    </script>
</head>
<body onload="goBocnet();">
    <!--  发送网上银行支付订单（普通B2C商户）（RecvOrder.do） -->
    <form name="form1" method="post" action="<%=Request.Form["action"] %>">
    <!-- 商户号 -->
    <!-- 必填 -->
    <input type="hidden" name="merchantNo" value="<%=Request.Form["merchantNo"] %>" /><br />
    <!-- 支付类型 -->
    <!-- 必填 -->
    <input type="hidden" name="payType" value="<%=Request.Form["payType"] %>" />
    <br />
    <!-- 商户订单号 -->
    <!-- 必填 -->
    <input type="hidden" name="orderNo" value="<%=Request.Form["orderNo"] %>" /><br />
    <!-- 订单币种 -->
    <!-- 必填 -->
    <input type="hidden" name="curCode" value="<%=Request.Form["curCode"] %>" /><br />
    <!-- 订单金额 -->
    <!-- 必填 -->
    <input type="hidden" name="orderAmount" value="<%=Request.Form["orderAmount"] %>" /><br />
    <!-- 订单时间 -->
    <!-- 必填 -->
    <input type="hidden" name="orderTime" value="<%=Request.Form["orderTime"] %>" /><br />
    <!-- 订单说明-->
    <!-- 必填 -->
    <input type="hidden" name="orderNote" value="<%=Request.Form["orderNote"] %>" /><br />
    <!-- 商户接收通知URL-->
    <!-- 必填 -->
    <input type="hidden" name="orderUrl" value="<%=Request.Form["orderUrl"] %>" /><br />
    <!-- 超时时间 -->
    <!-- 选填 -->
    <input type="hidden" name="orderTimeoutDate" value="<%=Request.Form["orderTimeoutDate"] %>" /><br />
    <!-- 商户获取的客户IP地址 -->
    <!-- 选填 -->
    <input type="hidden" name="mchtCustIP" value="<%=Request.Form["mchtCustIP"] %>" /><br />
    <!-- 签名数据 -->
    <!-- 必填 -->
    <input type="hidden" name="signData" value="<%=Request.Form["signData"] %>" /><br />
    </form>
</body>
</html>
