using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
namespace WebHyDyf.ashx
{
    /// <summary>
    /// RecvOrder 的摘要说明
    /// </summary>
    public class RecvOrder : IHttpHandler
    {
        private WebHyDyf.ashx.DoNetHelper.Request request = null;
        private object response = null;

        public void ProcessRequest(HttpContext context)
        {
            try
            {
                request = new WebHyDyf.ashx.DoNetHelper.Request(context);
                string cn = this.GetType().FullName;
                // 取得参数
                PaymentEnvironment.initialize(context.Server.MapPath("/WEB-INF/config/payment"));
                String merchantNo = context.Request["merchantNo"];
                String payType = "1";
                String orderNo = context.Request["orderNo"];
                String curCode = context.Request["curCode"];
                String orderAmount = context.Request["orderAmount"];
                String orderTime = context.Request["orderTime"];
                String orderNote = context.Request["orderNote"];
                String orderUrl = context.Request["orderUrl"];
                String orderTimeoutDate = context.Request["orderTimeoutDate"];
                String mchtCustIP = context.Request["mchtCustIP"];

                //加签 
                //orderNo|orderTime|curCode|orderAmount|merchantNo
                StringBuilder plainTextBuilder = new StringBuilder();
                plainTextBuilder.Append(orderNo).Append("|")
                                .Append(orderTime).Append("|")
                                .Append(curCode).Append("|")
                                .Append(orderAmount).Append("|")
                                .Append(merchantNo);
                //如果使用B2C订单防篡改功能则获取客户IP地址，并作为加签内容，否则不上送该字段
                if (mchtCustIP != null && mchtCustIP.Trim().Length != 0) plainTextBuilder.Append("|").Append(mchtCustIP);

                String plainText = plainTextBuilder.ToString();
                // WebHyDyf.ashx.DoNetHelper.logger.debug(cn, "[plainText]=[" + plainText + "]");
                byte[] plainTextByte = UTF8Encoding.UTF8.GetBytes(plainText);
                //获取私钥证书
                PKCSTool tool = PKCSTool.getSigner(PaymentEnvironment.signKeyFile, PaymentEnvironment.signkeyPassword, PaymentEnvironment.signkeyPassword, "PKCS7");
                //签名
                String signData = tool.p7Sign(plainTextByte);

                //WebHyDyf.ashx.DoNetHelper.logger.info(cn, "---------- RecvOrder send message ----------");
                //WebHyDyf.ashx.DoNetHelper.logger.info(cn, "[merchantNo]=[" + merchantNo + "]");
                //WebHyDyf.ashx.DoNetHelper.logger.info(cn, "[payType]=[" + payType + "]");
                //WebHyDyf.ashx.DoNetHelper.logger.info(cn, "[orderNo]=[" + orderNo + "]");
                //WebHyDyf.ashx.DoNetHelper.logger.info(cn, "[curCode]=[" + curCode + "]");
                //WebHyDyf.ashx.DoNetHelper.logger.info(cn, "[orderAmount]=[" + orderAmount + "]");
                //WebHyDyf.ashx.DoNetHelper.logger.info(cn, "[orderTime]=[" + orderTime + "]");
                //WebHyDyf.ashx.DoNetHelper.logger.info(cn, "[orderNote]=[" + orderNote + "]");
                //WebHyDyf.ashx.DoNetHelper.logger.info(cn, "[orderUrl]=[" + orderUrl + "]");
                //WebHyDyf.ashx.DoNetHelper.logger.info(cn, "[orderTimeoutDate]=[" + orderTimeoutDate + "]");
                //WebHyDyf.ashx.DoNetHelper.logger.info(cn, "[mchtCustIP]=[" + mchtCustIP + "]");
                //WebHyDyf.ashx.DoNetHelper.logger.info(cn, "[signData]=[" + signData + "]");

                String action = PaymentEnvironment.pgwPortalUrl + "/" + "RecvOrder.do";
                //WebHyDyf.ashx.DoNetHelper.logger.info(cn, "[action]=[" + action + "]");
                // 将参数放置到request对象
                request.setAttribute("merchantNo", merchantNo);
                request.setAttribute("payType", payType);
                request.setAttribute("orderNo", orderNo);
                request.setAttribute("curCode", curCode);
                request.setAttribute("orderAmount", orderAmount);
                request.setAttribute("orderTime", orderTime);
                request.setAttribute("orderNote", orderNote);
                request.setAttribute("orderUrl", orderUrl);
                request.setAttribute("orderTimeoutDate", orderTimeoutDate);
                request.setAttribute("mchtCustIP", mchtCustIP);
                request.setAttribute("signData", signData);
                request.setAttribute("action", action);

                // 转向跳转页面，发送请求到银行
                request.getRequestDispatcher("/aspx/b2c/RecvOrderDispatcher.aspx").forward(request, response);
            }
            catch (Exception e)
            {
                //WebHyDyf.ashx.DoNetHelper.logger.error(this.GetType().FullName, e);
                processException(request, response, e.Message);
            }
        }

        private void processException(WebHyDyf.ashx.DoNetHelper.Request request, object response, String errorMessage)
        {
            try
            {
                request.setAttribute("errorMessage", errorMessage);
                request.getRequestDispatcher("/aspx/ErrorDefault.aspx").forward(request, response);
            }
            catch
            {
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