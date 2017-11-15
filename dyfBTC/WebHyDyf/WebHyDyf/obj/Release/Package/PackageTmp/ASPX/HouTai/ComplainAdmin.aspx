<%@ Page Title="" Language="C#" MasterPageFile="~/ASPX/HouTai/HouT.Master" AutoEventWireup="true" CodeBehind="ComplainAdmin.aspx.cs" Inherits="WebHyDyf.ASPX.HouTai.ComplainAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .In_Yp {
            width: 192px;
            float: left;
        }

        .In_Yp_img {
            width: 160px;
            height: 160px;
        }

        .In_Yp_An {
            width: 120px;
            border: 1px solid #ff6a00;
            border-width: 1px;
            background-color: #ff6a00;
            color: #ffffff;
            margin: 5px auto;
            margin-left: 30px;
        }

        .In_Yp_In {
            padding: 0px 10px;
            margin-left: 10px;
            font-size: 13px;
            line-height: 18px;
            margin-bottom: 5px;
        }

        .In_Yp_An01 {
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
        <div class="HouTai_TOP">投诉列表</div>

        <!--查询条件-->
        <div class="HouTai_IN">
            <div class="ShenHe">
                <div class="SouS_SH">
                    <%--<div class="SouS_SH_A">
                        <asp:TextBox ID="TextBox1" runat="server" Class="SouS_SH_A_01" placeholder="请输入搜索关键字"></asp:TextBox>
                    </div>--%>
                    <div class="SouS_SH;" style="border-bottom: 0px;">

                        <div class="SouS_SH_A">
                            投诉标题：<asp:TextBox ID="TextTSWT" runat="server" Class="SouS_SH_A_01" Style="width: 200px;"></asp:TextBox>
                        </div>
                        <div class="SouS_SH_A">
                            投诉人：<asp:TextBox ID="TxtTSR" runat="server" Class="SouS_SH_A_01" Style="width: 200px;"></asp:TextBox>
                        </div>

                        <div class="SouS_SH_B">
                            <asp:Button ID="BtnCX" runat="server" Text="查询" Class="SouS_SH_A_02 " Style="height: 22px; max-height: 22px; margin-left: 10px;" OnClick="BtnCX_Click" />
                            <%-- <asp:Button ID="Button2" runat="server" OnClick="Button1_Click"/>--%>
                        </div>
                        <%--<div class="SouS_SH_B">
                            <asp:Button ID="BtnWYTS" runat="server" Text="我要投诉" Class="SouS_SH_A_02 " Style="height: 22px; max-height: 22px; margin-left: 20px; border: 1px solid #ff4e00; color: #ff4e00; background-color: #ffd9c9" />
                        </div>--%>
                        <div style="clear: both"></div>
                    </div>
                    <div style="clear: both"></div>
                </div>

                <div style="clear: both"></div>
            </div>
            <!--查询条件-->
            <!--列表内容-->
            <div>
                <asp:Repeater runat="server" ID="rp_list" OnItemDataBound="rp_list_ItemDataBound">
                    <HeaderTemplate>
                        <table class="ShenHe-Table">
                            <tr>
                                <th style="width: auto;">投诉标题</th>
                                <th style="width: auto;">投诉人</th>
                                <th style="width: 250px;">投诉内容</th>
                                <th style="width: 80px;">投诉时间</th>
                                <th style="width: 250px;">处理内容</th>
                                <th style="width: 80px;">处理时间</th>
                                <th style="width: 50px;">操作</th>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <asp:Label ID="LabTSWT" runat="server" Text='<%# Eval("tBT") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="LabTSR" runat="server" Text='<%# Eval("tUsername") %>'></asp:Label>
                            </td>
                            <td style="width: 250px;">
                                <asp:Label ID="LabTSNR" runat="server" Text='<%# Eval("tQuestion") %>'></asp:Label></td>


                            <td>
                                <asp:Label ID="LabTSSJ" runat="server" Text='<%# Eval("tsDate") %>'></asp:Label>
                            </td>
                            <td style="width: 250px;">
                                <asp:Label ID="LabCLSJ" runat="server" Text='<%# Eval("tAnswer") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("clDate") %>'></asp:Label>
                            </td>
                            
                            <td><asp:LinkButton ID="lkbtnCl" runat="server" Text="去处理" CommandName='<%# Eval("state") %>' CommandArgument='<%# Eval("id") %>' OnClick="lkbtnCl_Click"></asp:LinkButton><asp:Label ID="lblCl" runat="server" Text="已处理"></asp:Label></td>
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
