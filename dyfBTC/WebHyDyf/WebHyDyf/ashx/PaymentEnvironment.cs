using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace WebHyDyf.ashx
{
    public class PaymentEnvironment
    {
        public static void initialize(String s)
        {
            try
            {
                head();
                String s1 = Path.Combine(s, "payment.ini");
                //System.out.println(s1);
                Properties properties = new Properties();
                properties.load(s1);
                //请求PGWPortal地址
                pgwPortalUrl = properties.getProperty("PGWPortal.url");
                //请求bocnetExpressUrl地址
                bocnetExpressUrl = properties.getProperty("BocnetExpress.url");
                //文件下载保存路径
                downloadDir = properties.getProperty("download.dir");
                //上传的文件
                uploadFile = properties.getProperty("upload.file");
                //证书信息
                signKeyFile = s + "\\" + properties.getProperty("keystore.filename");
                signkeyPassword = properties.getProperty("keystore.password");
                verifyCerFile = s + "\\" + properties.getProperty("certificate.filename");

            }
            catch (Exception exception)
            {
                System.Diagnostics.Debug.Print("Failed to initialize the payment environment.");
                System.Diagnostics.Debug.Print(exception.StackTrace);
                throw exception;
            }
        }

        private static void head()
        {
            System.Diagnostics.Debug.Print("========================================");
            System.Diagnostics.Debug.Print("BOC Payment Demo 1.0");
            System.Diagnostics.Debug.Print("========================================");
        }

        public static readonly String SYS_CONFIG_FILE = "payment.ini";
        public static String pgwPortalUrl;
        public static String bocnetExpressUrl;
        public static String signKeyFile;
        public static String signkeyPassword;
        public static String verifyCerFile;
        public static String downloadDir;
        public static String uploadFile;
    }
}