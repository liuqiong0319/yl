<%@ Page Language="C#" MasterPageFile="~/ASPX/HouTai/HouT.Master" AutoEventWireup="true" CodeBehind="DrugSJ.aspx.cs" Inherits="WebHyDyf.ASPX.HouTai.DrugSJ" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .XianS {
            font-weight: 500;
            color: #555;
        }

        .TP_SC {
            margin-top: 10px;
            color: #ffffff;
            font-weight: bolder;
            margin-top: 0px;
            margin-bottom: 20px;
            height: 24px;
            background-color: #ff6a00;
            border: 1px solid #ff6a00;
            width: 120px;
        }
    </style>
    <link href="/css/HouTai.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <div class="HouTai_DIV_R">
        <div class="HouTai_TOP">上传商品</div>
        <!--右侧内容的HTML引进这个DIV里面开始-->
        <div class="HouTai_IN">
            <div class="HouTai_IN_01">
                <div class="HouTai_IN_01_top">
                    药品基本信息
                </div>
                <!--类型-->

                <!--类型-->
                <!--标题-->
                <div class="HouTai_IN_01_01">
                    药品名称：<asp:Label ID="lblYpmc" runat="server" CssClass="XianS"></asp:Label>&nbsp;&nbsp;&nbsp; 生产企业：<asp:Label ID="lblCdmc" runat="server" CssClass="XianS"></asp:Label>&nbsp;&nbsp;&nbsp; 药品规格：<asp:Label ID="lblGG" runat="server" CssClass="XianS"></asp:Label>&nbsp;&nbsp;&nbsp; 药品包装：<asp:Label ID="lblBz" runat="server" CssClass="XianS"></asp:Label>&nbsp;&nbsp;&nbsp; 药品中包装：<asp:Label ID="lblZbz" runat="server" CssClass="XianS"></asp:Label>
                </div>

                <!--剂型-->
                <div class="HouTai_IN_01_01">
                    <div class="HouTai_IN_01_01a">
                        <span style="color: #f00;">*</span>药品批号：<br />
                        <span style="color: #f00;">*</span>药品数量：<br />
                        <span style="color: #f00;">*</span>药品单价：<br />
                        <span style="color: #f00;">*</span>药品生产日期：<br />
                        <span style="color: #f00;">*</span>药品有效期：
                    </div>
                    <div class="HouTai_IN_01_01b">
                        <asp:TextBox ID="txtPh" runat="server" Class="Shu_botton" Width="100"></asp:TextBox><br />
                        <asp:TextBox ID="txtSL" runat="server" Class="Shu_botton" Width="100"></asp:TextBox><br />
                        <asp:TextBox ID="txtDj" runat="server" Class="Shu_botton" Width="100"></asp:TextBox><br />
                        <asp:TextBox ID="txtScrq" runat="server" Class="Shu_botton" Width="100"></asp:TextBox><br />
                        <asp:TextBox ID="txtYxq" runat="server" Class="Shu_botton" Width="100"></asp:TextBox><br />

                    </div>
                    <div class="HouTai_IN_01_01a" style="text-align: left; margin-left: 10px; width: 300px;">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="[1]请填写药品批号" ForeColor="Red" ControlToValidate="txtPh" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="[2]请填写药品数量" ForeColor="Red" ControlToValidate="txtSL" SetFocusOnError="True"></asp:RequiredFieldValidator> <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="[3]请填写药品单价" ForeColor="Red" ControlToValidate="txtDj" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="[4]请填写药品生产日期" ForeColor="Red" ControlToValidate="txtScrq" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="[5]请填写药品有效期" ForeColor="Red" ControlToValidate="txtYxq" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </div>

                    <div style="clear: both"></div>
                </div>
            </div>

            <div style="width: 400px; margin-left: auto; margin-right: auto; margin-top: 15px;">
                <asp:Button ID="btnSave" runat="server" Text="提交" Class="TP_SC" OnClick="btnSave_Click" Style="margin-right: 30px;" />
            </div>
        </div>
        <!--右侧内容的HTML引进这个DIV里面结束-->
    </div>
    <div style="clear: both"></div>

</asp:Content>
