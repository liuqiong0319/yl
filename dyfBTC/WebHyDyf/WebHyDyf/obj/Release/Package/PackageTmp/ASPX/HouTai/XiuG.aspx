<%@ Page Title="" Language="C#" MasterPageFile="~/ASPX/HouTai/HouT.Master" AutoEventWireup="true" CodeBehind="XiuG.aspx.cs" Inherits="WebHyDyf.ASPX.HouTai.XiuG" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="HouTai_DIV_R" style="width: 990px;">
        <div class="HouTai_TOP">修改密码</div>
        <!--右侧内容的HTML引进这个DIV里面开始-->
        <div class="HouTai_IN">
            <div class="HouTai_IN_01">
                <div class="HouTai_IN_01_top">
                    修改密码
                </div>
                <div class="HouTai_IN_01_01">
                    <div class="HouTai_IN_01_01a">
                        <span style="color: #f00;">*</span>老密码：<br />
                        <span style="color: #f00;">*</span>新密码：<br />
                        <span style="color: #f00;">*</span>确认新密码：<br />
                    </div>
                    <div class="HouTai_IN_01_01b">
                        <asp:TextBox ID="txtOpassWord" runat="server" TextMode="Password" Class="Shu_botton" Style="width: 200px;"></asp:TextBox>&nbsp;
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="[1]请输入现在的密码" ForeColor="Red" ControlToValidate="txtOpassWord" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                        <asp:TextBox ID="txtNpassWord" runat="server" TextMode="Password" Class="Shu_botton" Style="width: 200px;"></asp:TextBox>&nbsp;
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="[2]请输入新密码" ForeColor="Red" ControlToValidate="txtNpassWord" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                        <asp:TextBox ID="txtNpassWord2" runat="server" TextMode="Password" Class="Shu_botton" Style="width: 200px;"></asp:TextBox>&nbsp;
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="[3]请再次输入新密码" ForeColor="Red" ControlToValidate="txtNpassWord2" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                    </div>
                </div>
                <div style="width: 400px; margin-left: 200px; margin-top: 15px;">
                    <asp:Button ID="MMSave" runat="server" Text="提交修改" Class="TP_SC" OnClick="MMSave_Click" Style="margin-right: 30px; width: 120px; border: 1px solid #ff4400; background-color: #ff4400;" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
