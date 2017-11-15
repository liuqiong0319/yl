<%@ Page Title="" Language="C#" MasterPageFile="~/ASPX/HouTai/HouT.Master" AutoEventWireup="true" CodeBehind="Log.aspx.cs" Inherits="WebHyDyf.ASPX.HouTai.Log" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .In_Yp
        {
            width: 192px;
            float: left;
        }

        .In_Yp_img
        {
            width: 160px;
            height: 160px;
        }

        .In_Yp_An
        {
            width: 120px;
            border: 1px solid #ff6a00;
            border-width: 1px;
            background-color: #ff6a00;
            color: #ffffff;
            margin: 5px auto;
            margin-left: 30px;
        }

        .In_Yp_In
        {
            padding: 0px 10px;
            margin-left: 10px;
            font-size: 13px;
            line-height: 18px;
            margin-bottom: 5px;
        }

        .In_Yp_An01
        {
            width: 60px;
            border: 1px solid #ff6a00;
            border-width: 1px;
            background-color: #ffe2cd;
            color: #ff6a00;
            float: left;
            margin-left: 5px;
            margin-right: 5px;
            line-height: 20px;
            margin-top: 2px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="HouTai_DIV_R" style="width: 990px;">
        <div class="HouTai_TOP">日志</div>

        <!--查询条件-->
        <div class="HouTai_IN">
            
            <!--查询条件-->
            <!--列表内容-->
            <div>
                <asp:Repeater ID="rp_list" runat="server">
                    <HeaderTemplate>
                        <table class="ShenHe-Table">
                            <tr>
                                <th>用户名</th>
                                <th>访问页面</th>
                                <th>IP地址</th>
                                <th>访问时间</th>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <asp:Label ID="LabTSWT" runat="server" Text='<%# Eval("username") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="LabTSNR" runat="server" Text='<%# Eval("Lcontent") %>'></asp:Label></td>
                            <td>
                                <asp:Label ID="LabTSSJ" runat="server" Text='<%# Eval("Lip") %>'></asp:Label>
                            </td>

                            <td>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("inserttime") %>'></asp:Label>
                            </td>

                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
                <div style="height: 30px; line-height: 30px; vertical-align: middle; margin-top: 20px; margin-bottom: 20px">
                    <div style="float: right">
                        <asp:Button ID="btnPrev" runat="server" Text="上一页" OnClick="btnPrev_Click" CssClass="button01 In_Yp_An01" />
                        <asp:Button ID="btnNext" runat="server" Text="下一页" OnClick="btnNext_Click" CssClass="button01 In_Yp_An01" />
                        <div style="float: left; margin-top: -2px">
                            &nbsp 第
                 <asp:Label ID="lblCurrentPage" runat="server" Text="1"></asp:Label>
                            页&nbsp 共
      <asp:Label ID="lblTotalPage" runat="server"></asp:Label>页 &nbsp 
                        去&nbsp
                                            <asp:TextBox ID="txtPageSize" runat="server" Width="40px" Height="20px"></asp:TextBox>&nbsp 页 &nbsp
                        </div>
                        <asp:Button ID="btnJmp" runat="server" Text="确定" OnClick="btnJmp_Click" CssClass="button01 In_Yp_An01" />
                        <div style="clear: both"></div>
                    </div>
                </div>
            </div>
            <!--列表内容-->
            <!--防翻页的地方-->
            <div style=""></div>
            <!--防翻页的地方-->

        </div>


    </div>
</asp:Content>
