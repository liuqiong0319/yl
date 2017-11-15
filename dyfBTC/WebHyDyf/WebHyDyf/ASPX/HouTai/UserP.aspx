<%@ Page Title="" Language="C#" MasterPageFile="~/ASPX/HouTai/HouT.Master" AutoEventWireup="true" CodeBehind="UserP.aspx.cs" Inherits="WebHyDyf.ASPX.HouTai.UserP" %>

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

        .LIN
        {
            width: 60px;
        }

        .TD
        {
            white-space: nowrap;
            overflow: hidden;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="HouTai_DIV_R" style="width: 990px;">
        <div class="HouTai_TOP">用户列表</div>

        <!--查询条件-->
        <div class="HouTai_IN">
            <div class="ShenHe">
                <div class="SouS_SH">
                    <%--<div class="SouS_SH_A">
                        <asp:TextBox ID="TextBox1" runat="server" Class="SouS_SH_A_01" placeholder="请输入搜索关键字"></asp:TextBox>
                    </div>--%>
                    <div class="SouS_SH;" style="border-bottom: 0px;">

                        <div class="SouS_SH_A">
                            用户名：<asp:TextBox ID="txtUsername" runat="server" Class="SouS_SH_A_01 "></asp:TextBox>
                        </div>
                        <div class="SouS_SH_A">
                            姓名：<asp:TextBox ID="txtUname" runat="server" Class="SouS_SH_A_01 "></asp:TextBox>
                        </div>
                        <div class="SouS_SH_A">
                            手机：<asp:TextBox ID="txtPhone" runat="server" Class="SouS_SH_A_01 "></asp:TextBox>
                        </div>

                        <div class="SouS_SH_B">
                            <asp:Button ID="Button2" runat="server" Text="查询" OnClick="Button2_Click" Class="SouS_SH_A_02 " Style="height: 22px; max-height: 22px; margin-left: 60px;" />
                            <asp:Button ID="Button4" runat="server" Text="添加管理员" OnClick="Button4_Click" Class="SouS_SH_A_02 " Style="height: 22px; max-height: 22px; margin-left: 60px;" />
                            <%-- <asp:Button ID="Button2" runat="server" OnClick="Button1_Click"/>--%>
                        </div>

                        <div style="clear: both"></div>
                    </div>
                    <div style="clear: both"></div>
                </div>

                <div style="clear: both"></div>
            </div>
            <!--查询条件-->
            <!--列表内容-->
            <div>
                <asp:Repeater ID="rp_List" runat="server">
                    <HeaderTemplate>
                        <table class="ShenHe-Table">
                            <tr>
                                <th>用户名</th>
                                <%--<th>密码</th>--%>
                                <th>姓名</th>
                                <th>手机</th>
                                <th>用户类型</th>
                                <th>注册时间</th>
                                <th>状态</th>
                                <th style="width: 100px;">到期时间</th>
                                <th style="width: 205px;">操作</th>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td style="text-indent: 0em;">
                                <asp:Label ID="lblID" runat="server" Text='<%# Eval("userName") %>'></asp:Label>
                            </td>
                            <%-- <td style="text-indent: 0em;">
                                <asp:Label ID="lblUname" runat="server" Text='<%# Eval("mwPassword") %>'></asp:Label></td>--%>


                            <td style="text-indent: 0em;">
                                <asp:Label ID="lblPhone" runat="server" Text='<%# Eval("Uname") %>'></asp:Label>
                            </td>
                            <td style="text-indent: 0em;">
                                <asp:Label ID="lblAdress" runat="server" Text='<%# Eval("uPhone") %>'></asp:Label>
                            </td>
                            <td style="text-indent: 0em;">
                                <asp:Label ID="lblState" runat="server" Text='<%# GetState(Eval("Utype").ToString())%>'></asp:Label>
                            </td>
                            <td style="color: #f00; text-indent: 0em;">
                                <asp:Label ID="lblJe" runat="server" Text='<%# Eval("inserttime") %>'></asp:Label>
                            </td>
                            <td style="text-indent: 0em;">
                                <asp:Label ID="Label1" runat="server" Text='<%# GetsState(Eval("state").ToString())%>'></asp:Label>
                            </td>
                            <td class="TD" style="text-indent: 0em;">
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("expireDate") %>'></asp:Label>
                            </td>
                            <td style="text-indent: 0em; width: 190px;">
                                <asp:Button runat="server" ID="btnT" Class="SouS_SH_A_02 LIN" OnClick="btnT_Click" Text="禁用" CommandArgument='<%# Eval("id") %>' />
                                <asp:Button runat="server" ID="Button1" Class="SouS_SH_A_02 LIN" OnClick="Button1_Click" Text="解禁" CommandArgument='<%# Eval("id") %>' />
                                <asp:Button runat="server" ID="Button3" Class="SouS_SH_A_02 LIN" OnClick="Button3_Click" Text="延期一年" CommandArgument='<%# Eval("id") %>' />
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
