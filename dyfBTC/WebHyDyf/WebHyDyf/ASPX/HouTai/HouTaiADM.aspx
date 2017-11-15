<%@ Page Title="" Language="C#" MasterPageFile="~/ASPX/HouTai/HouT.Master" ValidateRequest="false" AutoEventWireup="true" CodeBehind="HouTaiADM.aspx.cs" Inherits="WebHyDyf.ASPX.HouTai.HouTaiADM" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .ShangCzl {
            margin-left: 18px;
            Width: 100px;
        }

        /*.SR_01 {
            width: 120px;
            background-color: #ff4e00;
            border: 1px solid #ff4e00;
        }*/
    </style>
    <script src="/js/jquery-1.8.2.min.js"></script>
    <link href="/css/HouTai.css" rel="stylesheet" />
    <script src="/js/layer/layer.js"></script>
    <link rel="stylesheet" href="/kindeditor/themes/default/default.css" />
    <script src="/kindeditor/kindeditor-min.js"></script>
    <link rel="stylesheet" href="/kindeditor/plugins/code/prettify.css" />
    <script charset="utf-8" src="/kindeditor/lang/zh_CN.js"></script>
    <script charset="utf-8" src="/kindeditor/plugins/code/prettify.js"></script>
    <script type="text/javascript">
        KindEditor.ready(function (K) {
            <%--  var editor1 = K.create('#<%=TextBox1.ClientID%>', {
                cssPath: '/kindeditor/plugins/code/prettify.css',
                uploadJson: '/kindeditor/asp.net/upload_json.ashx',
                fileManagerJson: '/kindeditor/asp.net/file_manager_json.ashx',
                allowFileManager: true,
                afterCreate: function () {
                    var self = this;
                    K.ctrl(document, 13, function () {
                        self.sync();
                        K('form[name=example]')[0].submit();
                    });
                    K.ctrl(self.edit.doc, 13, function () {
                        self.sync();
                        K('form[name=example]')[0].submit();
                    });
                }
            }); --%>
            //prettyPrint();

            var uploadbutton = K.uploadbutton({
                button: K('#<%=Button1.ClientID %>')[0],
                fieldName: 'imgFile',
                url: '/kindeditor/asp.net/upload_json.ashx',
                afterUpload: function (data) {

                    if (data.error === 0) {

                        var url = K.formatUrl(data.url, 'absolute');

                        $("#<%=Image1.ClientID %>").attr("src", url);
                        $("#<%=hfImg1.ClientID %>").val(url);

                        layer.msg('图片上传成功！');
                    } else {
                        alert(data.message);
                    }
                },
                afterError: function (str) {
                    //alert('自定义错误信息: ' + str);
                }
            });
            uploadbutton.fileBox.change(function (e) {
                uploadbutton.submit();
            });

            var uploadbutton2 = K.uploadbutton({
                button: K('#<%=Button2.ClientID %>')[0],
                fieldName: 'imgFile',
                url: '/kindeditor/asp.net/upload_json.ashx',
                afterUpload: function (data) {
                    if (data.error === 0) {
                        var url = K.formatUrl(data.url, 'absolute');

                        $("#<%=Image2.ClientID %>").attr("src", url);
                        $("#<%=hfImg2.ClientID %>").val(url);
                        layer.msg('图片上传成功！');
                    } else {
                        alert(data.message);
                    }
                },
                afterError: function (str) {
                    //alert('自定义错误信息: ' + str);
                }
            });
            uploadbutton2.fileBox.change(function (e) {
                uploadbutton2.submit();
            });

            var uploadbutton3 = K.uploadbutton({
                button: K('#<%=Button3.ClientID %>')[0],
                fieldName: 'imgFile',
                url: '/kindeditor/asp.net/upload_json.ashx',
                afterUpload: function (data) {
                    if (data.error === 0) {
                        var url = K.formatUrl(data.url, 'absolute');

                        $("#<%=Image3.ClientID %>").attr("src", url);
                        $("#<%=hfImg3.ClientID %>").val(url);
                        layer.msg('图片上传成功！');

                    } else {
                        alert(data.message);
                    }
                },
                afterError: function (str) {
                    //alert('自定义错误信息: ' + str);
                }
            });
            uploadbutton3.fileBox.change(function (e) {
                uploadbutton3.submit();
            });

            var uploadbutton4 = K.uploadbutton({
                button: K('#<%=Button4.ClientID %>')[0],
                fieldName: 'imgFile',
                url: '/kindeditor/asp.net/upload_json.ashx',
                afterUpload: function (data) {
                    if (data.error === 0) {
                        var url = K.formatUrl(data.url, 'absolute');

                        $("#<%=Image4.ClientID %>").attr("src", url);
                        $("#<%=hfImg4.ClientID %>").val(url);
                        layer.msg('图片上传成功！');

                    } else {
                        alert(data.message);
                    }
                },
                afterError: function (str) {
                    //alert('自定义错误信息: ' + str);
                }
            });
            uploadbutton4.fileBox.change(function (e) {
                uploadbutton4.submit();
            });

            var uploadbutton5 = K.uploadbutton({
                button: K('#<%=Button5.ClientID %>')[0],
                fieldName: 'imgFile',
                url: '/kindeditor/asp.net/upload_json.ashx',
                afterUpload: function (data) {
                    if (data.error === 0) {
                        var url = K.formatUrl(data.url, 'absolute');

                        $("#<%=Image5.ClientID %>").attr("src", url);
                        $("#<%=hfImg5.ClientID %>").val(url);
                        layer.msg('图片上传成功！');

                    } else {
                        alert(data.message);
                    }
                },
                afterError: function (str) {
                    //alert('自定义错误信息: ' + str);
                }
            });
            uploadbutton5.fileBox.change(function (e) {
                uploadbutton5.submit();
            });

            
            //宣传图片上传
            var uploadbutton10 = K.uploadbutton({
                button: K('#<%=Button6.ClientID %>')[0],
                fieldName: 'imgFile',
                url: '/kindeditor/asp.net/upload_json.ashx',
                afterUpload: function (data) {
                    if (data.error === 0) {
                        var url = K.formatUrl(data.url, 'absolute');

                        $("#<%=Image6.ClientID %>").attr("src", url);
                        $("#<%=xcImg1.ClientID %>").val(url);

                        layer.msg('图片上传成功！');
                    } else {
                        alert(data.message);
                    }
                },
                afterError: function (str) {
                    //alert('自定义错误信息: ' + str);
                }
            });
            uploadbutton10.fileBox.change(function (e) {
                uploadbutton10.submit();
            });
            var uploadbutton11 = K.uploadbutton({
                button: K('#<%=Button7.ClientID %>')[0],
                fieldName: 'imgFile',
                url: '/kindeditor/asp.net/upload_json.ashx',
                afterUpload: function (data) {
                    if (data.error === 0) {
                        var url = K.formatUrl(data.url, 'absolute');

                        $("#<%=Image7.ClientID %>").attr("src", url);
                        $("#<%=xcImg2.ClientID %>").val(url);

                        layer.msg('图片上传成功！');
                    } else {
                        alert(data.message);
                    }
                },
                afterError: function (str) {
                    //alert('自定义错误信息: ' + str);
                }
            });
            uploadbutton11.fileBox.change(function (e) {
                uploadbutton11.submit();
            });
            var uploadbutton12 = K.uploadbutton({
                button: K('#<%=Button8.ClientID %>')[0],
                fieldName: 'imgFile',
                url: '/kindeditor/asp.net/upload_json.ashx',
                afterUpload: function (data) {
                    if (data.error === 0) {
                        var url = K.formatUrl(data.url, 'absolute');

                        $("#<%=Image8.ClientID %>").attr("src", url);
                        $("#<%=hfImg3.ClientID %>").val(url);

                        layer.msg('图片上传成功！');
                    } else {
                        alert(data.message);
                    }
                },
                afterError: function (str) {
                    //alert('自定义错误信息: ' + str);
                }
            });
            uploadbutton12.fileBox.change(function (e) {
                uploadbutton12.submit();
            });
            var uploadbutton13 = K.uploadbutton({
                button: K('#<%=Button9.ClientID %>')[0],
                fieldName: 'imgFile',
                url: '/kindeditor/asp.net/upload_json.ashx',
                afterUpload: function (data) {
                    if (data.error === 0) {
                        var url = K.formatUrl(data.url, 'absolute');

                        $("#<%=Image9.ClientID %>").attr("src", url);
                        $("#<%=xcImg4.ClientID %>").val(url);

                        layer.msg('图片上传成功！');
                    } else {
                        alert(data.message);
                    }
                },
                afterError: function (str) {
                    //alert('自定义错误信息: ' + str);
                }
            });
            uploadbutton13.fileBox.change(function (e) {
                uploadbutton13.submit();
            });
            //首营资料
            var uploadbutton14 = K.uploadbutton({
                button: K('#<%=BtnSY01.ClientID %>')[0],
                 fieldName: 'imgFile',
                 url: '/kindeditor/asp.net/upload_json.ashx',
                 afterUpload: function (data) {
                     if (data.error === 0) {
                         var url = K.formatUrl(data.url, 'absolute');

                         $("#<%=ImgSY01.ClientID %>").attr("src", url);
                        $("#<%=SyImg01.ClientID %>").val(url);
                        layer.msg('图片上传成功！');
                    } else {
                        alert(data.message);
                    }
                },
                 afterError: function (str) {
                     //alert('自定义错误信息: ' + str);
                 }
             });
            uploadbutton14.fileBox.change(function (e) {
                uploadbutton14.submit();
            });

            var uploadbutton15 = K.uploadbutton({
                button: K('#<%=BtnSY02.ClientID %>')[0],
                fieldName: 'imgFile',
                url: '/kindeditor/asp.net/upload_json.ashx',
                afterUpload: function (data) {
                    if (data.error === 0) {
                        var url = K.formatUrl(data.url, 'absolute');

                        $("#<%=ImgSY02.ClientID %>").attr("src", url);
                         $("#<%=SyImg02.ClientID %>").val(url);
                         layer.msg('图片上传成功！');
                     } else {
                         alert(data.message);
                     }
                 },
                afterError: function (str) {
                    //alert('自定义错误信息: ' + str);
                }
            });
            uploadbutton15.fileBox.change(function (e) {
                uploadbutton15.submit();
            });

            var uploadbutton16 = K.uploadbutton({
                button: K('#<%=BtnSY03.ClientID %>')[0],
                fieldName: 'imgFile',
                url: '/kindeditor/asp.net/upload_json.ashx',
                afterUpload: function (data) {
                    if (data.error === 0) {
                        var url = K.formatUrl(data.url, 'absolute');

                        $("#<%=ImgSY03.ClientID %>").attr("src", url);
                         $("#<%=SyImg03.ClientID %>").val(url);
                         layer.msg('图片上传成功！');
                     } else {
                         alert(data.message);
                     }
                 },
                afterError: function (str) {
                    //alert('自定义错误信息: ' + str);
                }
            });
            uploadbutton16.fileBox.change(function (e) {
                uploadbutton16.submit();
            });

            var uploadbutton17 = K.uploadbutton({
                button: K('#<%=BtnSY04.ClientID %>')[0],
                fieldName: 'imgFile',
                url: '/kindeditor/asp.net/upload_json.ashx',
                afterUpload: function (data) {
                    if (data.error === 0) {
                        var url = K.formatUrl(data.url, 'absolute');

                        $("#<%=ImgSY04.ClientID %>").attr("src", url);
                        $("#<%=SyImg04.ClientID %>").val(url);
                        layer.msg('图片上传成功！');
                    } else {
                        alert(data.message);
                    }
                },
                afterError: function (str) {
                    //alert('自定义错误信息: ' + str);
                }
            });
            uploadbutton17.fileBox.change(function (e) {
                uploadbutton17.submit();
            });

            var uploadbutton18 = K.uploadbutton({
                button: K('#<%=BtnSY05.ClientID %>')[0],
                fieldName: 'imgFile',
                url: '/kindeditor/asp.net/upload_json.ashx',
                afterUpload: function (data) {
                    if (data.error === 0) {
                        var url = K.formatUrl(data.url, 'absolute');

                        $("#<%=ImgSY05.ClientID %>").attr("src", url);
                        $("#<%=SyImg05.ClientID %>").val(url);
                        layer.msg('图片上传成功！');
                    } else {
                        alert(data.message);
                    }
                },
                afterError: function (str) {
                    //alert('自定义错误信息: ' + str);
                }
            });
            uploadbutton18.fileBox.change(function (e) {
                uploadbutton18.submit();
            });

            var uploadbutton19 = K.uploadbutton({
                button: K('#<%=BtnSY06.ClientID %>')[0],
                fieldName: 'imgFile',
                url: '/kindeditor/asp.net/upload_json.ashx',
                afterUpload: function (data) {
                    if (data.error === 0) {
                        var url = K.formatUrl(data.url, 'absolute');

                        $("#<%=ImgSY06.ClientID %>").attr("src", url);
                        $("#<%=SyImg06.ClientID %>").val(url);
                        layer.msg('图片上传成功！');
                    } else {
                        alert(data.message);
                    }
                },
                afterError: function (str) {
                    //alert('自定义错误信息: ' + str);
                }
            });
            uploadbutton19.fileBox.change(function (e) {
                uploadbutton19.submit();
            });

            var uploadbutton20 = K.uploadbutton({
                button: K('#<%=BtnSY07.ClientID %>')[0],
                fieldName: 'imgFile',
                url: '/kindeditor/asp.net/upload_json.ashx',
                afterUpload: function (data) {
                    if (data.error === 0) {
                        var url = K.formatUrl(data.url, 'absolute');

                        $("#<%=ImgSY07.ClientID %>").attr("src", url);
                        $("#<%=SyImg07.ClientID %>").val(url);
                        layer.msg('图片上传成功！');
                    } else {
                        alert(data.message);
                    }
                },
                afterError: function (str) {
                    //alert('自定义错误信息: ' + str);
                }
            });
            uploadbutton20.fileBox.change(function (e) {
                uploadbutton20.submit();
            });

            var uploadbutton21 = K.uploadbutton({
                button: K('#<%=BtnSY08.ClientID %>')[0],
                 fieldName: 'imgFile',
                 url: '/kindeditor/asp.net/upload_json.ashx',
                 afterUpload: function (data) {
                     if (data.error === 0) {
                         var url = K.formatUrl(data.url, 'absolute');

                         $("#<%=ImgSY08.ClientID %>").attr("src", url);
                        $("#<%=SyImg08.ClientID %>").val(url);
                        layer.msg('图片上传成功！');
                    } else {
                        alert(data.message);
                    }
                },
                 afterError: function (str) {
                     //alert('自定义错误信息: ' + str);
                 }
             });
            uploadbutton21.fileBox.change(function (e) {
                uploadbutton21.submit();
            });

        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <div class="HouTai_DIV_R" style="width: 990px;">
        <div class="HouTai_TOP">上传商品</div>
        <!--右侧内容的HTML引进这个DIV里面开始-->
        <div class="HouTai_IN">
            <div class="HouTai_IN_01">
                <div class="HouTai_IN_01_top">
                    1.药品基本信息
                </div>
                <!--类型-->

                <!--类型-->
                <!--标题-->
                <div class="HouTai_IN_01_01">
                    <div class="HouTai_IN_01_01a">
                        <span style="color: #f00;">*</span>药品名称：<br />
                        <span style="color: #f00;">*</span>生产企业：<br />
                        <span style="color: #f00;">*</span>药品规格：<br />
                        <span style="color: #f00;">*</span>药品剂型：<br />
                        <span style="color: #f00;">*</span>药品类型：<br />
                        <span style="color: #f00;">*</span>药品包装：<br />
                        <span style="color: #f00;">*</span>药品中包装：<br />
                        <span style="color: #f00;">*</span>药品单位：<br />
                        <span style="color: #f00;">*</span>批准文号：<br />
                        <span style="color: #f00;">*</span>最高零售价：
                        <%--<span style="color: #f00;">*</span>首营资料：<br />--%>
                    </div>
                    <div class="HouTai_IN_01_01b">
                        <asp:TextBox ID="txtYPMC" runat="server" Class="Shu_botton"></asp:TextBox>&nbsp;
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="[1]请填写药品名称" ForeColor="Red" ControlToValidate="txtYPMC" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                        <asp:TextBox ID="txtCDMC" runat="server" Class="Shu_botton"></asp:TextBox>&nbsp; 
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="[2]请填写生产企业" ForeColor="Red" ControlToValidate="txtCDMC" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                        <asp:TextBox ID="txtGG" runat="server" Class="Shu_botton" Width="100"></asp:TextBox>&nbsp;&nbsp;&nbsp; 
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="[3]请填写规格" ForeColor="Red" ControlToValidate="txtGG" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                        <asp:TextBox ID="txtJX" runat="server" Class="Shu_botton" Width="100"></asp:TextBox>&nbsp;&nbsp;&nbsp;
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="[4]请填写剂型" ForeColor="Red" ControlToValidate="txtJX" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" Style="margin-left: 18px;"></asp:DropDownList>&nbsp;&nbsp;&nbsp;
                      <br />
                        <asp:TextBox ID="txtBZ" runat="server" Class="Shu_botton" Width="100"></asp:TextBox>&nbsp;&nbsp;&nbsp;
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="[5]请设置药品包装" ForeColor="Red" ControlToValidate="txtBZ" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                        <asp:TextBox ID="txtZBZ" runat="server" Class="Shu_botton" Width="100"></asp:TextBox>&nbsp;&nbsp;&nbsp;
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="[6]请设置药品中包装" ForeColor="Red" ControlToValidate="txtZBZ" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                        <asp:TextBox ID="txtDW" runat="server" Class="Shu_botton" Width="100"></asp:TextBox>&nbsp;&nbsp;&nbsp;
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="[7]请设置药品单位" ForeColor="Red" ControlToValidate="txtDW" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                        <asp:TextBox ID="txtPZWH" runat="server" Class="Shu_botton" Width="100"></asp:TextBox>&nbsp;&nbsp;&nbsp; 
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="[8]请设置药品批准文号" ForeColor="Red" ControlToValidate="txtPZWH" SetFocusOnError="True"></asp:RequiredFieldValidator><br />

                        <asp:TextBox ID="txtLSJ" runat="server" Class="Shu_botton" Width="100"></asp:TextBox>&nbsp;元&nbsp;
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="[9]请设置药品最高零售价" ForeColor="Red" ControlToValidate="txtLSJ" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <%--<div style="display: none;">
                            <asp:TextBox ID="TextBox10" runat="server" Width="100" Style="margin-left: 18px;" Class="Shu_botton"></asp:TextBox>&nbsp;&nbsp;&nbsp; 
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="[10]请上传首营资料" ForeColor="Red" ControlToValidate="TextBox10" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                            <br />
                            <asp:Button ID="Button10" runat="server" Text="上传资料" class="ShangCzl" />
                        </div>--%>
                    </div>
                    <div style="clear: both"></div>
                </div>
                <!--首营资料开始-->
                <div>
                    <div class="HouTai_IN_01_01" style="float: left;"><span style="color: #f00;">*</span>首营图片：</div>
                    <div class="YaoPin_img">
                        <!--药品图片01-->
                        <div style="line-height: 30px; font-size: 13px; color: #555; margin-left: 0px; margin-top: 5px; margin-bottom: 10px;">
                            (1)请上传药品生产注册批件：
                        </div>
                        <div class="YaoPin_img_in" style="margin-left: 0px;">
                            <asp:Image ID="ImgSY01" Width="120px" Height="120px" ImageUrl="/images/SCT_01.jpg" runat="server" />
                            <div style="margin-left: 10px;">
                                <asp:HiddenField ID="SyImg01" runat="server" />
                            </div>
                            <asp:Button ID="BtnSY01" runat="server" Text="上传图片" Class="TP_SC SR_01" />
                        </div>
                        <!--药品图片01-->
                        <div style="clear: both"></div>
                        <!--药品图片02-->
                        <div style="line-height: 30px; font-size: 13px; color: #555; margin-left: 0px; margin-top: 5px; margin-bottom: 10px;">
                            (2)请上传药品生产再注册批件：                           
                        </div>
                        <div class="YaoPin_img_in" style="margin-left: 0px;">
                            <asp:Image ID="ImgSY02" Width="120px" Height="120px" ImageUrl="/images/SCT_01.jpg" runat="server" />
                            <asp:HiddenField ID="SyImg02" runat="server" />
                            <asp:Button ID="BtnSY02" runat="server" Text="上传图片" Class="TP_SC SR_01" />
                        </div>
                        <!--药品图片02-->
                        <div style="clear: both"></div>
                        <div style="line-height: 30px; font-size: 13px; color: #555; margin-left: 0px; margin-top: 5px; margin-bottom: 10px;">
                            (3)请上传药品质量标准：                            
                        </div>
                        <!--药品图片03-->
                        <div class="YaoPin_img_in" style="margin-left: 0px;">
                            <asp:Image ID="ImgSY03" Width="120px" Height="120px" ImageUrl="/images/SCT_01.jpg" runat="server" />
                            <asp:HiddenField ID="SyImg03" runat="server" />
                            <asp:Button ID="BtnSY03" runat="server" Text="上传图片" Class="TP_SC SR_01" />
                        </div>
                        <!--药品图片03-->
                        <div style="clear: both"></div>
                        <div style="line-height: 30px; font-size: 13px; color: #555; margin-left: 0px; margin-top: 5px; margin-bottom: 10px;">
                            (4)请上传物价批文：
                        </div>
                        <!--药品图片04-->
                        <div class="YaoPin_img_in" style="margin-left: 0px;">
                            <asp:Image ID="ImgSY04" Width="120px" Height="120px" ImageUrl="/images/SCT_01.jpg" runat="server" />
                            <asp:HiddenField ID="SyImg04" runat="server" />
                            <asp:Button ID="BtnSY04" runat="server" Text="上传图片" Class="TP_SC SR_01" />
                        </div>
                        <!--药品图片04-->
                        <div style="clear: both"></div>
                        <div style="line-height: 30px; font-size: 13px; color: #555; margin-left: 0px; margin-top: 5px; margin-bottom: 10px;">
                            (5)请上传说明书：                           
                        </div>
                        <!--药品图片05-->
                        <div class="YaoPin_img_in" style="margin-left: 0px;">
                            <asp:Image ID="ImgSY05" Width="120px" Height="120px" ImageUrl="/images/SCT_01.jpg" runat="server" />
                            <asp:HiddenField ID="SyImg05" runat="server" />
                            <asp:Button ID="BtnSY05" runat="server" Text="上传图片" Class="TP_SC SR_01" />
                        </div>
                        <!--药品图片05-->
                        <div style="clear: both"></div>
                        <div style="line-height: 30px; font-size: 13px; color: #555; margin-left: 0px; margin-top: 5px; margin-bottom: 10px;">
                            (6)请上传标签：                            
                        </div>
                        <!--药品图片06-->
                        <div class="YaoPin_img_in" style="margin-left: 0px;">
                            <asp:Image ID="ImgSY06" Width="120px" Height="120px" ImageUrl="/images/SCT_01.jpg" runat="server" />
                            <asp:HiddenField ID="SyImg06" runat="server" />
                            <asp:Button ID="BtnSY06" runat="server" Text="上传图片" Class="TP_SC SR_01" />
                        </div>
                        <!--药品图片06-->
                        <div style="clear: both"></div>
                        <div style="line-height: 30px; font-size: 13px; color: #555; margin-left: 0px; margin-top: 5px; margin-bottom: 10px;">
                            (7)请上传最小包装盒实样：                            
                        </div>
                        <!--药品图片07-->
                        <div class="YaoPin_img_in" style="margin-left: 0px;">
                            <asp:Image ID="ImgSY07" Width="120px" Height="120px" ImageUrl="/images/SCT_01.jpg" runat="server" />
                            <asp:HiddenField ID="SyImg07" runat="server" />
                            <asp:Button ID="BtnSY07" runat="server" Text="上传图片" Class="TP_SC SR_01" />
                        </div>
                        <!--药品图片07-->
                        <div style="clear: both"></div>
                        <div style="line-height: 30px; font-size: 13px; color: #555; margin-left: 0px; margin-top: 5px; margin-bottom: 10px;">
                            (8)请上传与药品实物对应批号的出厂合格质检报告书或该品种药品检验机构近期检验合格的质检报告书：
                        </div>
                        <!--药品图片08-->
                        <div class="YaoPin_img_in" style="margin-left: 0px;">
                            <asp:Image ID="ImgSY08" Width="120px" Height="120px" ImageUrl="/images/SCT_01.jpg" runat="server" />
                            <asp:HiddenField ID="SyImg08" runat="server" />
                            <asp:Button ID="BtnSY08" runat="server" Text="上传图片" Class="TP_SC SR_01" />
                        </div>
                        <!--药品图片08-->
                    </div>
                    <div style="line-height: 30px; font-size: 13px; color: #555; margin-left: 110px; margin-top: 5px; margin-bottom: 10px;">
                        提示：药品图片格式为png、jpg、jpeg、gif,最大为2M
                    </div>
                    <div style="clear: both"></div>
                </div>
                <!--首营资料结束-->






                <!--标题-->
                <!--产地-->

                <!--最高零售价-->
                <!--药品图片-->
                <div>
                    <div class="HouTai_IN_01_01" style="float: left;"><span style="color: #f00;">*</span>药品图片：</div>
                    <div class="YaoPin_img">
                        <!--药品图片01-->
                        <div class="YaoPin_img_in" style="margin-left: 0px;">
                            <asp:Image ID="Image1" Width="120px" Height="120px" ImageUrl="/images/SCT_01.jpg" runat="server" />
                            <div style="margin-left: 10px;">
                                <asp:HiddenField ID="hfImg1" runat="server" />
                            </div>
                            <asp:Button ID="Button1" runat="server" Text="上传图片" Class="TP_SC SR_01" />
                        </div>
                        <!--药品图片01-->

                        <!--药品图片02-->
                        <div class="YaoPin_img_in">
                            <asp:Image ID="Image2" Width="120px" Height="120px" ImageUrl="/images/SCT_01.jpg" runat="server" />
                            <asp:HiddenField ID="hfImg2" runat="server" />
                            <asp:Button ID="Button2" runat="server" Text="上传图片" Class="TP_SC SR_01" />
                        </div>
                        <!--药品图片02-->

                        <!--药品图片03-->
                        <div class="YaoPin_img_in">
                            <asp:Image ID="Image3" Width="120px" Height="120px" ImageUrl="/images/SCT_01.jpg" runat="server" />
                            <asp:HiddenField ID="hfImg3" runat="server" />
                            <asp:Button ID="Button3" runat="server" Text="上传图片" Class="TP_SC SR_01" />
                        </div>
                        <!--药品图片03-->

                        <!--药品图片04-->
                        <div class="YaoPin_img_in">
                            <asp:Image ID="Image4" Width="120px" Height="120px" ImageUrl="/images/SCT_01.jpg" runat="server" />
                            <asp:HiddenField ID="hfImg4" runat="server" />
                            <asp:Button ID="Button4" runat="server" Text="上传图片" Class="TP_SC SR_01" />
                        </div>
                        <!--药品图片04-->

                        <!--药品图片05-->
                        <div class="YaoPin_img_in">
                            <asp:Image ID="Image5" Width="120px" Height="120px" ImageUrl="/images/SCT_01.jpg" runat="server" />
                            <asp:HiddenField ID="hfImg5" runat="server" />
                            <asp:Button ID="Button5" runat="server" Text="上传图片" Class="TP_SC SR_01" />
                        </div>
                        <!--药品图片05-->
                    </div>
                    <div style="line-height: 30px; font-size: 13px; color: #555; margin-left: 110px; margin-top: 5px; margin-bottom: 10px;">
                        提示：药品图片格式为png、jpg、jpeg、gif,最大为2M
                    </div>
                    <div style="clear: both"></div>
                </div>
                <!--药品图片-->
            </div>
            <div style="height: 20px;"></div>
            <div class="HouTai_IN_01">
                <div class="HouTai_IN_01_top">
                    2.额外信息设置
                </div>

                <!--介绍-->
                <div>
                    <div class="HouTai_IN_01_01" style="float: left;"><span></span>药品介绍：</div>
                    <div class="YaoPin_img" style="margin-left: -5px;">

                        <textarea style="width: 500px; height: 350px; line-height: 22px; font-size: 14px;" id="TextArea1" runat="server" cols="20" class="ypJS"></textarea>
                    </div>
                    <div style="clear: both">
                    </div>

                </div>
                <!--介绍-->
                <!--图介绍-->
                <div>
                    <div class="HouTai_IN_01_01" style="float: left;"><span></span>宣传图片：</div>
                    <div class="YaoPin_img">
                        <!--药品图片01-->
                        <div class="YaoPin_img_in" style="margin-left: 0px;">
                            <asp:Image ID="Image6" Width="120px" Height="120px" ImageUrl="/images/SCT_01.jpg" runat="server" />
                            <asp:HiddenField ID="xcImg1" runat="server" />
                            <asp:Button ID="Button6" runat="server" Text="上传图片" Class="TP_SC SR_01" />
                        </div>
                        <!--药品图片01-->

                        <!--药品图片02-->
                        <div class="YaoPin_img_in">
                            <asp:Image ID="Image7" Width="120px" Height="120px" ImageUrl="/images/SCT_01.jpg" runat="server" />
                            <asp:HiddenField ID="xcImg2" runat="server" />
                            <asp:Button ID="Button7" runat="server" Text="上传图片" Class="TP_SC SR_01" />
                        </div>
                        <!--药品图片02-->

                        <!--药品图片03-->
                        <div class="YaoPin_img_in">
                            <asp:Image ID="Image8" Width="120px" Height="120px" ImageUrl="/images/SCT_01.jpg" runat="server" />
                            <asp:HiddenField ID="xcImg3" runat="server" />
                            <asp:Button ID="Button8" runat="server" Text="上传图片" Class="TP_SC SR_01" />
                        </div>
                        <!--药品图片03-->

                        <!--药品图片04-->
                        <div class="YaoPin_img_in">
                            <asp:Image ID="Image9" Width="120px" Height="120px" ImageUrl="/images/SCT_01.jpg" runat="server" />
                            <asp:HiddenField ID="xcImg4" runat="server" />
                            <asp:Button ID="Button9" runat="server" Text="上传图片" Class="TP_SC SR_01" />
                        </div>
                        <!--药品图片04-->


                        <div style="clear: both"></div>
                        <div><span>(宣传图片显示宽度为1000px，请上传宽度为1000的图片。单张大小控制在3M内。)</span></div>
                    </div>
                    <div style="clear: both"></div>
                </div>
                <!--图介绍-->
            </div>
            <div style="width: 400px; margin-left: auto; margin-right: auto; margin-top: 15px;">
                <asp:Button ID="btnSave" runat="server" Text="提交" Class="TP_SC" OnClick="btnSave_Click" Style="margin-right: 30px; width: 120px; border: 1px solid #ff4400; background-color: #ff4400;" />
            </div>

            <!--右侧内容的HTML引进这个DIV里面结束-->

            <div style="clear: both"></div>
        </div>
    </div>
</asp:Content>
