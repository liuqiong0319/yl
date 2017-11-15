<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebHyDyf.ASPX.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
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
            <div class="log_bg" style="background-color: #ffffff;">
                <div class="top">
                    <div class="logo">
                        <a href="/ASPX/Index.aspx">
                            <img src="/images/logo.png" /></a>
                    </div>
                </div>
                <div class="login">
                    <div class="log_img">
                        <img src="/images/l_img.png" width="611" height="425" />
                    </div>
                    <div class="log_c" style="border: 1px solid #ff4e00">

                        <table border="0" style="width: 370px; font-size: 14px; margin-top: 30px;" cellspacing="0" cellpadding="0">
                            <tr height="50" valign="top">
                                <td width="55">&nbsp;</td>
                                <td>
                                    <span class="fl" style="font-size: 24px;">登录</span>
                                    <span class="fr">还没有商城账号，<a href="Regist.aspx" style="color: #ff4e00;">立即注册</a></span>
                                </td>
                            </tr>
                            <tr height="70">
                                <td>用户名</td>
                                <td>
                                    <asp:TextBox ID="txtUserName" runat="server" class="l_user"></asp:TextBox>
                                </td>
                            </tr>
                            <tr height="70">
                                <td>密&nbsp; &nbsp; 码</td>
                                <td>
                                    <asp:TextBox ID="txtPassword" runat="server" class="l_pwd" TextMode="Password"></asp:TextBox>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td style="font-size: 12px; padding-top: 20px;">
                                    <span class="fl"><a href="/ASPX/index.aspx" style="color: #ff4e00;">退出登录</a></span>
                                    <span class="fr"><a href="/ASPX/HouTai/ZhaoH_2.0.aspx" style="color: #ff4e00;">忘记密码</a></span>
                                </td>
                            </tr>
                            <tr height="60">
                                <td>&nbsp;</td>
                                <td>
                                    <asp:Button ID="btnDL" runat="server" Text="登录" OnClick="btnDL_Click" class="log_btn" /></td>
                            </tr>
                        </table>

                    </div>
                </div>
            </div>
            <!--End Login End-->
            <!--Begin Footer Begin-->
            <div style="border-bottom: 2px solid #ff4e00; margin-bottom: 10px;"></div>
            <div class="btm">
                版权所有：安徽华源大药房连锁有限公司    系统维护：安徽华源医药电子商务有限公司
            <br />
                地址：太和县沙河东路168号    邮编：236600     电话：0558-8615688
            <br />
                <a href="../Certificate/JYXK.png" target="_blank">药品经营许可证：皖CA5580123 </a><a href="../Certificate/LTXK.png" target="_blank" style="padding-left: 20px;">食品流通许可证：SP3412221410001130</a><br />
                <a href="../Certificate/XXFW.png" target="_blank">互联网药品信息服务资格证书：(皖)-非经营性-2016-0006 </a><a href="../Certificate/YYZZ.png" target="_blank" style="padding-left: 20px;">营业执照：91341222087574401G</a><br />
                <a href="../Certificate/BAPZ.png" target="_blank">第二类医疗器械经营备案凭证：皖阜食药监械经营备20160723号</a>
            </div>
            <!--End Footer End -->

        </div>
    </form>
</body>
</html>
