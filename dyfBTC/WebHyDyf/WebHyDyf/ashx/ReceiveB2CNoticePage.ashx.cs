using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace WebHyDyf.ashx
{
    /// <summary>
    /// ReceiveB2CNoticePage 的摘要说明
    /// </summary>
    public class ReceiveB2CNoticePage : IHttpHandler
    {
        private WebHyDyf.ashx.DoNetHelper.Request request = null;
        private object response = null;

        public void ProcessRequest(HttpContext context)
        {
            try
            {
                request = new WebHyDyf.ashx.DoNetHelper.Request(context);
                PaymentEnvironment.initialize(context.Server.MapPath("/WEB-INF/config/payment"));
                string cn = this.GetType().FullName;
                // 获得参数
                //WebHyDyf.ashx.DoNetHelper.logger.info(cn, "---------- Begin ReceiveB2CNoticePage ----------");
                String merchantNo = context.Request["merchantNo"];
                String orderNo = context.Request["orderNo"];
                String orderSeq = context.Request["orderSeq"];
                String cardTyp = context.Request["cardTyp"];
                String payTime = context.Request["payTime"];
                String orderStatus = context.Request["orderStatus"];
                String payAmount = context.Request["payAmount"];
                String acctNo = context.Request["acctNo"];
                String holderName = context.Request["holderName"];
                String ibknum = context.Request["ibknum"];
                String orderIp = context.Request["orderIp"];
                String orderRefer = context.Request["orderRefer"];
                String bankTranSeq = context.Request["bankTranSeq"];
                String returnActFlag = context.Request["returnActFlag"];
                String phoneNum = context.Request["phoneNum"];
                String custTranId = context.Request["custTranId"]; //商户交易流水（分行特色需要获取该项）
                String signData = context.Request["signData"];
                //WebHyDyf.ashx.DoNetHelper.logger.info(cn, "[merchantNo]=[" + merchantNo + "]");
                //WebHyDyf.ashx.DoNetHelper.logger.info(cn, "[orderNo]=[" + orderNo + "]");
                //WebHyDyf.ashx.DoNetHelper.logger.info(cn, "[orderSeq]=[" + orderSeq + "]");
                //WebHyDyf.ashx.DoNetHelper.logger.info(cn, "[cardTyp]=[" + cardTyp + "]");
                //WebHyDyf.ashx.DoNetHelper.logger.info(cn, "[payTime]=[" + payTime + "]");
                //WebHyDyf.ashx.DoNetHelper.logger.info(cn, "[orderStatus]=[" + orderStatus + "]");
                //WebHyDyf.ashx.DoNetHelper.logger.info(cn, "[payAmount]=[" + payAmount + "]");
                //WebHyDyf.ashx.DoNetHelper.logger.info(cn, "[acctNo]=[" + acctNo + "]");
                //WebHyDyf.ashx.DoNetHelper.logger.info(cn, "[holderName]=[" + holderName + "]");
                //WebHyDyf.ashx.DoNetHelper.logger.info(cn, "[ibknum]=[" + ibknum + "]");
                //WebHyDyf.ashx.DoNetHelper.logger.info(cn, "[orderIp]=[" + orderIp + "]");
                //WebHyDyf.ashx.DoNetHelper.logger.info(cn, "[orderRefer]=[" + orderRefer + "]");
                //WebHyDyf.ashx.DoNetHelper.logger.info(cn, "[bankTranSeq]=[" + bankTranSeq + "]");
                //WebHyDyf.ashx.DoNetHelper.logger.info(cn, "[returnActFlag]=[" + returnActFlag + "]");
                //WebHyDyf.ashx.DoNetHelper.logger.info(cn, "[phoneNum]=[" + phoneNum + "]");
                //WebHyDyf.ashx.DoNetHelper.logger.info(cn, "[custTranId]=[" + custTranId + "]");
                //WebHyDyf.ashx.DoNetHelper.logger.info(cn, "[signData]=[" + signData + "]");

                //对返回数据进行签名验证
                //组织签名原文merchantNo|orderNo|orderSeq|cardTyp|payTime|orderStatus|payAmount
                StringBuilder plainTextBuilder = new StringBuilder();
                plainTextBuilder.Append(merchantNo).Append("|")
                                 .Append(orderNo).Append("|")
                                 .Append(orderSeq).Append("|")
                                 .Append(cardTyp).Append("|")
                                 .Append(payTime).Append("|")
                                 .Append(orderStatus).Append("|")
                                 .Append(payAmount);
                String plainText = plainTextBuilder.ToString();
                //WebHyDyf.ashx.DoNetHelper.logger.debug(cn, "[plainText]=[" + plainText + "]");
                //获取验签根证书，对P7验签使用二级根证书
                WebHyDyf.ashx.DoNetHelper.InputStream fis4cer = new WebHyDyf.ashx.DoNetHelper.FileInputStream(PaymentEnvironment.verifyCerFile);
                PKCSTool tool = PKCSTool.getVerifier(fis4cer, null);
                //验证签名,验证失败将抛出异常
                tool.p7Verify(signData, UTF8Encoding.UTF8.GetBytes(plainText));
                //WebHyDyf.ashx.DoNetHelper.logger.info(cn, "[VERIFY OK]");
                //WebHyDyf.ashx.DoNetHelper.logger.info(cn, "---------- End ReceiveB2CNoticePage ----------");
                //根据业务逻辑处理
                if ("1".Equals(orderStatus))
                {
                    request.setAttribute("result", "支付成功");
                    string sql = "update dyf_order set state=1 where id=" + orderNo + "";
                    int num = HyeyClass.DBUtility.DbHelperSQL.ExecuteSql(sql);
                    if (num > 0)
                    {
                        string sql1 = "update dyf_orderDe set bs=1 where orderid=" + orderNo + "";
                        HyeyClass.DBUtility.DbHelperSQL.ExecuteSql(sql1);
                    }

                }
                else if ("5".Equals(orderStatus))
                {
                    request.setAttribute("result", "支付失败");
                }
                else
                {
                    request.setAttribute("result", "结果未明");
                }
                // 结果展示页面
                request.getRequestDispatcher("/aspx/ResultDisplay.aspx").forward(request, response);
            }
            catch (Exception e)
            {
                //WebHyDyf.ashx.DoNetHelper.logger.error(this.GetType().FullName, e);
                request.setAttribute("errorMessage", e.Message);
                request.getRequestDispatcher("/aspx/ErrorDefault.aspx").forward(request, response);
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}