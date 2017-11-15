<%@ Page Title="" Language="C#" MasterPageFile="~/ASPX/HouTai/HouT.Master" AutoEventWireup="true" CodeBehind="ShangC_YP.aspx.cs" Inherits="WebHyDyf.ASPX.HouTai.ShangC_YP" %>

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
    <div class="HouTai_DIV_R">
        <div class="HouTai_TOP">上传药品</div>
        <!--右侧内容的HTML引进这个DIV里面开始-->
        <div class="HouTai_IN">
            <div class="ShenHe">
                <div class="SouS_SH">
                    <%--<div class="SouS_SH_A">
                        <asp:TextBox ID="TextBox1" runat="server" Class="SouS_SH_A_01" placeholder="请输入搜索关键字"></asp:TextBox>
                    </div>--%>
                    <div class="SouS_SH;" style="border-bottom: 0px;">

                        <div class="SouS_SH_A">
                            药品名称：<asp:TextBox ID="txtYPMC" runat="server" Class="SouS_SH_A_01 " Style="width: 85px;"></asp:TextBox>
                        </div>
                        <div class="SouS_SH_A">
                            产地名称：<asp:TextBox ID="txtCDMC" runat="server" Class="SouS_SH_A_01 " Style="width: 85px;"></asp:TextBox>
                        </div>
                        <div class="SouS_SH_A">
                            规格：<asp:TextBox ID="txtGG" runat="server" Class="SouS_SH_A_01 " Style="width: 85px;"></asp:TextBox>
                        </div>
                        <div class="SouS_SH_A">
                            审核状态：<asp:DropDownList ID="ddlSH" runat="server">
                                <asp:ListItem Value="0" Text="未审核" Selected="True">
                                </asp:ListItem>
                                <asp:ListItem Value="1" Text="已审核">
                                </asp:ListItem>
                                <asp:ListItem Value="2" Text="审核不通过"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="SouS_SH_B">
                            <asp:Button ID="BtnCX" runat="server" Text="查询" Class="SouS_SH_A_02 " Style="height: 22px; max-height: 22px; margin-left: 30px;" OnClick="BtnCX_Click" />
                            <%-- <asp:Button ID="Button2" runat="server" OnClick="Button1_Click"/>--%>
                            <asp:Button ID="BtnSCYP" runat="server" Text="上传药品" Class="SouS_SH_A_02 " Style="height: 22px; max-height: 22px; margin-left: 20px;" OnClick="BtnSCYP_Click" />
                        </div>

                        <div style="clear: both"></div>
                    </div>
                    <div style="clear: both"></div>
                </div>
                <div style="width: 990px; margin-left: auto; margin-right: auto">
                    <asp:Repeater runat="server" ID="rp_List">
                        <HeaderTemplate>
                            <table class="ShenHe-Table">
                                <tr>
                                    <th style="width: 60px;">药品编码</th>
                                    <th style="width: 160px;">药品名称</th>
                                    <th style="width: 180px;">产地名称</th>
                                    <th style="width: 80px;">规格</th>
                                    <th style="width: 60px;">剂型</th>
                                    <th style="width: 50px;">包装</th>
                                    <th style="width: 50px;">中包装</th>
                                    <th style="width: 50px;">单位</th>
                                    <th style="width: 80px;">批准文号</th>
                                    <th style="width: 80px;">审核状态</th>
                                    <th style="">操作</th>
                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td style="width: 60px;">
                                    <asp:Label ID="Label10" runat="server" Text='<%# Eval("id") %>'></asp:Label></td>
                                <td style="width: 180px;">
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ypmc") %>'></asp:Label></td>
                                <td style="width: 180px;">
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("cdmc") %>'></asp:Label></td>
                                <td>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("gg") %>'></asp:Label></td>
                                <td>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("jx") %>'></asp:Label></td>
                                <td>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("bz") %>'></asp:Label></td>
                                <td>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("zbz") %>'></asp:Label></td>
                                <td>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("dw") %>'></asp:Label></td>
                                <td>
                                    <asp:Label ID="Label8" runat="server" Text='<%# Eval("pzwh") %>'></asp:Label></td>
                                <td>
                                    <asp:Label ID="Label9" runat="server" Text='<%# Eval("shbs") %>'></asp:Label></td>
                                <td>
                                    <%--<a href="#" style="cursor: pointer;">删除</a>&nbsp;--%>
                                    <asp:LinkButton runat="server" ID="lbDelete" CommandArgument='<%# Eval("id") %>' OnClick="lbDelete_Click">删除</asp:LinkButton>
                                    <a href="/ASPX/HouTai/HouTaiADM.aspx?id=<%# Eval("id") %>">修改</a>
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
                            <asp:Button ID="btnJmp" runat="server" Text="确定" OnClick="btnJmp_Click" CssClass="button01 In_Yp_An01" /><div style="clear: both"></div>
                        </div>
                    </div>


                </div>
            </div>
        </div>
    </div>
</asp:Content>
