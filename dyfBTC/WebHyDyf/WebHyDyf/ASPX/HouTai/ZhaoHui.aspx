<%@ Page Title="" Language="C#" MasterPageFile="~/ASPX/HouTai/HouT.Master" AutoEventWireup="true" CodeBehind="ZhaoHui.aspx.cs" Inherits="WebHyDyf.ASPX.HouTai.ZhaoHui" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="HouTai_DIV_R" style="width: 990px;">
        <div class="HouTai_TOP">找回密码</div>
        <!--右侧内容的HTML引进这个DIV里面开始-->
        <div class="HouTai_IN">
            <div class="HouTai_IN_01">
                <div class="HouTai_IN_01_top">
                    找回密码
                </div>
                <div class="HouTai_IN_01_01">
                    <div class="HouTai_IN_01_01a">
                        <span style="color: #f00;">*</span>用户名：<br />
                        <span style="color: #f00;">*</span>姓名：<br />
                        <span style="color: #f00;">*</span>手机号：<br />
                    </div>
                    <div class="HouTai_IN_01_01b">
                        <asp:TextBox ID="TextBox1" runat="server" Class="Shu_botton" Style="width: 200px;"></asp:TextBox>&nbsp;
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="[1]请输入要找回的用户名" ForeColor="Red" ControlToValidate="txtLMM" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                        <asp:TextBox ID="TextBox2" runat="server" Class="Shu_botton" Style="width: 200px;"></asp:TextBox>&nbsp;
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="[2]请输入注册时输入的姓名" ForeColor="Red" ControlToValidate="txtXMM" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                        <asp:TextBox ID="TextBox3" runat="server" Class="Shu_botton" Style="width: 200px;"></asp:TextBox>&nbsp;
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="[2]请输入注册时的手机号" ForeColor="Red" ControlToValidate="txtXMM" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                    </div>
                </div>
                <div style="width: 400px; margin-left: 200px; margin-top: 15px;">
                    <asp:Button ID="MMSave" runat="server" Text="找回密码" Class="TP_SC" OnClick="btnSave_Click" Style="margin-right: 30px; width: 120px; border: 1px solid #ff4400; background-color: #ff4400;" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
