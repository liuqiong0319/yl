<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Regist.aspx.cs" Inherits="WebHyDyf.ASPX.Regist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>注册连锁大药房</title>
    <link href="/css/style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <!--Begin Header Begin-->

            <!--End Header End-->
            <!--Begin Login Begin-->
            <div class="log_bg" style="background-color: #ffffff;">
                <div class="top">
                    <div class="logo">
                        <a href="/ASPX/Index.aspx">
                            <img src="/images/logo.png" /></a>
                    </div>
                </div>
                <div class="regist">
                    <div class="log_img">
                        <img src="/images/l_img.png" width="611" height="425" />
                    </div>
                    <div class="reg_c" style="border: 1px solid #d1d1d1;">

                        <table border="0" style="width: 420px; font-size: 14px; margin-top: 20px;" cellspacing="0" cellpadding="0">
                            <tr height="50" valign="top">
                                <td width="95">&nbsp;</td>
                                <td>
                                    <span class="fl" style="font-size: 24px;">注册</span>
                                    <span class="fr">已有商城账号，<a href="Login.aspx" style="color: #ff4e00;">我要登录</a></span>
                                </td>
                            </tr>
                            <tr height="50">
                                <td align="right"><font color="#ff4e00">*</font>&nbsp;用户名 &nbsp;</td>
                                <td>
                                    <asp:TextBox ID="txtUsername" class="l_user" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr height="50">
                                <td align="right"><font color="#ff4e00">*</font>&nbsp;密码 &nbsp;</td>
                                <td>
                                    <asp:TextBox ID="txtuserpassword" TextMode="Password" class="l_pwd" runat="server"></asp:TextBox></td>


                            </tr>
                            <tr height="20">
                                <td style="line-height: 16px; color: #ff0000; font-size: 12px; padding-left: 100px; padding-top: 2px; padding-bottom: 2px;" colspan="2">*密码必须包括大写字母，小写字母与数字的组合，不允许出现特殊字符，密码长度8-10位。</td>
                            </tr>
                            <tr height="50">
                                <td align="right"><font color="#ff4e00">*</font>&nbsp;确认密码 &nbsp;</td>
                                <td>
                                    <asp:TextBox ID="txtuserpassword2" TextMode="Password" class="l_pwd" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr height="50">
                                <td align="right"><font color="#ff4e00">*</font>&nbsp;姓名 &nbsp;</td>
                                <td>
                                    <asp:TextBox ID="txtUname" runat="server" class="l_user"></asp:TextBox></td>
                            </tr>
                            <tr height="50">
                                <td align="right"><font color="#ff4e00">*</font>&nbsp;手机 &nbsp;</td>
                                <td>
                                    <asp:TextBox ID="txtPhone" runat="server" class="l_tel"></asp:TextBox></td>
                            </tr>

                            <%--                            <tr height="50">
                                <td align="right"><font color="#ff4e00">*</font>&nbsp;验证码 &nbsp;</td>
                                <td>
                                    <input type="text" value="" class="l_ipt" />
                                    <a href="#" style="font-size: 12px; font-family: '宋体';">换一张</a>
                                </td>
                            </tr>--%>
                            <%-- <tr>
                                <td>&nbsp;</td>
                                <td style="font-size: 12px; padding-top: 20px;">
                                    <span style="font-family: '宋体';" class="fl">
                                        <label class="r_rad">
                                            <input type="checkbox" /></label><label class="r_txt">我已阅读并接受《用户协议》</label>
                                    </span>
                                </td>
                            </tr>--%>
                            <tr height="60">
                                <td>&nbsp;</td>
                                <td>
                                    <asp:Button ID="Button1" runat="server" Text="注册" class="log_btn" OnClick="Button1_Click" />
                                </td>
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
