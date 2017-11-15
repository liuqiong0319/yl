<%@ Page Title="" Language="C#" MasterPageFile="~/ASPX/HouTai/HouT.Master" AutoEventWireup="true" CodeBehind="AddAdmin.aspx.cs" Inherits="WebHyDyf.ASPX.HouTai.AddAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="HouTai_DIV_R" style="width: 990px;">
        <div class="HouTai_TOP">修改密码</div>
        <!--右侧内容的HTML引进这个DIV里面开始-->
        <div class="HouTai_IN">
            <div class="HouTai_IN_01">
                <div class="HouTai_IN_01_top">
                    添加管理员
                </div>
                <div class="HouTai_IN_01_01">
                    <div class="HouTai_IN_01_01a">
                        <span style="color: #f00;">*</span>用户名：<br />
                        <span style="color: #f00;">*</span>密码：<br />
                        <span style="color: #f00;">*</span>确认密码：<br />
                        <span style="color: #f00;">*</span>姓名：<br />
                        <span style="color: #f00;">*</span>手机：<br />
                    </div>
                    <div class="HouTai_IN_01_01b">
                        <asp:TextBox ID="txtUsername" runat="server"  Class="Shu_botton" Style="width: 200px;"></asp:TextBox>&nbsp;
                        <br />
                        <asp:TextBox ID="txtNpassWord" runat="server" TextMode="Password" Class="Shu_botton" Style="width: 200px;"></asp:TextBox>&nbsp;
                        <br />
                        <asp:TextBox ID="txtNpassWord2" runat="server" TextMode="Password" Class="Shu_botton" Style="width: 200px;"></asp:TextBox>&nbsp;
                        <br />
                        <asp:TextBox ID="txtUname" runat="server"  Class="Shu_botton" Style="width: 200px;"></asp:TextBox>&nbsp;
                        <br />
                        <asp:TextBox ID="txtPhone" runat="server"  Class="Shu_botton" Style="width: 200px;"></asp:TextBox>&nbsp;
                        <br />
                        
                    </div>
                </div>
                <div style="clear: both"></div>
                <div style="width: 400px; margin-left: 200px; margin-top: 15px;">
                    <asp:Button ID="MMSave" runat="server" Text="提交" Class="TP_SC" OnClick="MMSave_Click" Style="margin-right: 30px; width: 120px; border: 1px solid #ff4400; background-color: #ff4400;" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
