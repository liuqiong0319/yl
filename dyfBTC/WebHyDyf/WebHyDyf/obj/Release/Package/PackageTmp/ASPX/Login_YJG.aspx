<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login_YJG.aspx.cs" Inherits="WebHyDyf.ASPX.Login_YJG" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>市场监管登录</title>
    <style type="text/css"></style>
    <link type="text/css" rel="stylesheet" href="/css/style.css" />

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <!--Begin Header Begin-->
            <div class="soubg">
            </div>
            <!--End Header End-->
            <!--Begin Login Begin-->
            <div class="log_bg" style="background: url(/images/bodybg.jpg) no-repeat; background-size: 100%;">

                <div class="login" style="margin-top: 0PX;">

                    <div style="border: 0px solid #00a1fd; margin-left: auto; margin-right: auto; float: none; width: 485px; height: 380px; -moz-border-radius: 15px; -webkit-border-radius: 15px; border-radius: 15px;">

                        <table border="0" style="width: 400px; font-size: 14px; margin-top: 30px;" cellspacing="0" cellpadding="0">
                            <tr height="50" valign="top">
                            </tr>
                            <tr style="height: 70px;">
                                <td style="color: #ffffff; width: 200px;">管理员账号</td>
                                <td>
                                    <asp:TextBox ID="txtJGUserName" runat="server" class="l_user"></asp:TextBox>
                                </td>
                            </tr>
                            <tr style="height: 70px;">
                                <td style="color: #ffffff;">管理员密码</td>
                                <td>
                                    <asp:TextBox ID="txtJGPassword" runat="server" class="l_pwd" TextMode="Password"></asp:TextBox>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td><a href="/ASPX/index.aspx" style="line-height: 24px; font-size: 13px; color: #ffffff;">返回首页</a></td>
                            </tr>
                            <tr height="60">
                                <td>&nbsp;</td>
                                <td>
                                    <asp:Button ID="btnJGDL" runat="server" Text="登录" OnClick="btnDL_Click" Style="color: #0059fd; background-color: #ffffff; width: 320px; height: 40px; font-size: 14px; -moz-border-radius: 10px; -webkit-border-radius: 10px; border-radius: 10px;" /></td>
                            </tr>
                        </table>

                    </div>
                </div>
            </div>
            <!--End Login End-->
            <!--Begin Footer Begin-->
            <div style="border-bottom: 2px solid #00a1fd; margin-bottom: 10px;"></div>
            <div class="btm">
                安徽华源大药房连锁有限公司&nbsp; &nbsp; &nbsp;管理中心             
            <!--End Footer End -->

            </div>
    </form>
</body>
</html>

