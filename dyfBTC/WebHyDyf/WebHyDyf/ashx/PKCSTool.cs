using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Security;
using System.Security.Cryptography;
using System.Security.Cryptography.Pkcs;
using System.Security.Cryptography.X509Certificates;
using System.IO;

namespace WebHyDyf.ashx
{
    public class PKCSTool
    {
        public static byte[] GetBytesFromSignData(string signData)
        {
            FromBase64Transform myTransform = new FromBase64Transform(FromBase64TransformMode.IgnoreWhiteSpaces);

            byte[] myOutputBytes = new byte[myTransform.OutputBlockSize];

            System.IO.MemoryStream ms = new System.IO.MemoryStream();

            //Retrieve the file contents into a byte array.
            byte[] myInputBytes = UTF8Encoding.UTF8.GetBytes(signData);

            System.IO.MemoryStream outputDataStream = new System.IO.MemoryStream(myInputBytes.Length);

            //Transform the data in chunks the size of InputBlockSize.
            int i = 0;
            int inputBlockSize = 4;
            while (myInputBytes.Length - i > inputBlockSize)
            {
                int nOutput = myTransform.TransformBlock(myInputBytes, i, inputBlockSize, myOutputBytes, 0);
                i += inputBlockSize;
                if (nOutput > 0)
                {
                    outputDataStream.Write(myOutputBytes, 0, nOutput);
                }
            }

            //Transform the final block of data.
            myOutputBytes = myTransform.TransformFinalBlock(myInputBytes, i, myInputBytes.Length - i);
            outputDataStream.Write(myOutputBytes, 0, myOutputBytes.Length);

            //Free up any used resources.
            myTransform.Clear();

            outputDataStream.Position = 0;
            byte[] outputData = new byte[outputDataStream.Length];
            outputDataStream.Read(outputData, 0, (int)outputDataStream.Length);
            outputDataStream.Close();

            return outputData;
        }

        public static Boolean Verify(byte[] sig, byte[] msg, string dn = null)
        {
            Boolean b = true;
            try
            {
                ContentInfo signedData = new ContentInfo(msg);
                SignedCms cms = new SignedCms(signedData, true);
                cms.Decode(sig);
                //Check Signature
                cms.CheckSignature(true);
                //Check dn
                if (cms.Certificates.Count > 0)
                {
                    X509Certificate2 cert = cms.Certificates[0];
                    if (!string.IsNullOrEmpty(dn) && !dn.Equals(cert.Subject))
                    {
                        b = false;
                    }
                }

                byte[] data = cms.Encode();
            }
            catch (Exception e)
            {
                b = false;
            }
            return b;
        }

        public static string SignatureMessage1(string certFileName, string password, byte[] dataTobeSign)
        {
            byte[] pfxCert = System.IO.File.ReadAllBytes(certFileName);
            //  byte[] dataTobeSign = File.ReadAllBytes(dataFileName);
            SecureString pwd = new SecureString();
            char[] pwdCharArray = password.ToCharArray();
            for (int i = 0; i < pwdCharArray.Length; i++)
            {
                pwd.AppendChar(pwdCharArray[i]);
            }
            X509Certificate2 cert = new X509Certificate2(pfxCert, pwd);
            CmsSigner signer = new CmsSigner(cert);
            signer.DigestAlgorithm = new Oid("1.3.14.3.2.26", "sha1");

            signer.IncludeOption = X509IncludeOption.EndCertOnly;

            ContentInfo signedData = new ContentInfo(dataTobeSign);
            SignedCms cms = new SignedCms(signedData, true);
            cms.ComputeSignature(signer);
            byte[] signature = cms.Encode();

            //base64
            ToBase64Transform base64Transform = new ToBase64Transform();
            byte[] inputBytes = signature;
            byte[] outputBytes = new byte[base64Transform.OutputBlockSize];
            int inputOffset = 0;
            int inputBlockSize = base64Transform.InputBlockSize;
            System.IO.MemoryStream outputDataStream = new System.IO.MemoryStream();
            while (inputBytes.Length - inputOffset > inputBlockSize)
            {
                base64Transform.TransformBlock(inputBytes, inputOffset, inputBytes.Length - inputOffset, outputBytes, 0);

                inputOffset += base64Transform.InputBlockSize;
                outputDataStream.Write(outputBytes, 0, base64Transform.OutputBlockSize);
            }
            outputBytes = base64Transform.TransformFinalBlock(inputBytes, inputOffset, inputBytes.Length - inputOffset);
            outputDataStream.Write(outputBytes, 0, outputBytes.Length);

            outputDataStream.Position = 0;
            byte[] outputData = new byte[outputDataStream.Length];
            outputDataStream.Read(outputData, 0, (int)outputDataStream.Length);
            outputDataStream.Close();
            string outputStr = System.Text.UTF8Encoding.UTF8.GetString(outputData);
            return outputStr;
        }



        private static PKCSTool tool = new PKCSTool();

        public static PKCSTool getSigner(string p, string p_2, string p_3, string p_4)
        {
            return tool;
        }

         #region 生成密文
        /// <summary>
        /// 生成密文
        /// </summary>
        /// <param name="certFileName"></param>
        /// <param name="password"></param>
        /// <param name="dataTobeSign"></param>
        /// <param name="outputFileName"></param>
        /// <returns></returns>
        public static string SignatureMessage(string certFileName, string password, byte[] dataTobeSign)
        {
            byte[] pfxCert = File.ReadAllBytes(certFileName);
            SecureString pwd = new SecureString();
            char[] pwdCharArray = password.ToCharArray();
            for (int i = 0; i < pwdCharArray.Length; i++)
            {
                pwd.AppendChar(pwdCharArray[i]);
            }
            X509Certificate2 cert = new X509Certificate2(pfxCert, pwd, X509KeyStorageFlags.MachineKeySet);
            CmsSigner signer = new CmsSigner(cert);
            signer.DigestAlgorithm = new Oid("1.3.14.3.2.26", "sha1");

            signer.IncludeOption = X509IncludeOption.EndCertOnly;

            ContentInfo signedData = new ContentInfo(dataTobeSign);
            SignedCms cms = new SignedCms(signedData, true);
            cms.ComputeSignature(signer);
            byte[] signature = cms.Encode();

            ToBase64Transform base64Transform = new ToBase64Transform();
            byte[] inputBytes = signature;
            byte[] outputBytes = new byte[base64Transform.OutputBlockSize];
            int inputOffset = 0;
            int inputBlockSize = base64Transform.InputBlockSize;
            MemoryStream outputDataStream = new MemoryStream();
            while (inputBytes.Length - inputOffset > inputBlockSize)
            {
                base64Transform.TransformBlock(inputBytes, inputOffset, inputBytes.Length - inputOffset, outputBytes, 0);

                inputOffset += base64Transform.InputBlockSize;
                outputDataStream.Write(outputBytes, 0, base64Transform.OutputBlockSize);
            }
            outputBytes = base64Transform.TransformFinalBlock(inputBytes, inputOffset, inputBytes.Length - inputOffset);
            outputDataStream.Write(outputBytes, 0, outputBytes.Length);

            outputDataStream.Position = 0;
            byte[] outputData = new byte[outputDataStream.Length];
            outputDataStream.Read(outputData, 0, (int)outputDataStream.Length);
            outputDataStream.Close();
            string outputFileName = System.Text.Encoding.ASCII.GetString(outputData);

            return outputFileName;

        }
        #endregion
    


        public string p7Sign(byte[] plainTextByte)
        {
            string data = PKCSTool.SignatureMessage(PaymentEnvironment.signKeyFile, PaymentEnvironment.signkeyPassword, plainTextByte);
            StringBuilder sb = new StringBuilder();

            int len = 76;
            while (data.Length > len)
            {
                sb.Append(data.Substring(0, len)).Append("\r\n");
                data = data.Substring(len);
            }
            if (data.Length > 0)
                sb.Append(data);

            return sb.ToString();

        }

        public static PKCSTool getVerifier(System.IO.Stream fis4cer, object obj = null)
        {
            return tool;
        }

        public void p7Verify(string rtnSignData, byte[] rtnPlainText)
        {
            try
            {
                System.IO.Stream fis4cer = System.IO.File.OpenRead(PaymentEnvironment.verifyCerFile);
                byte[] signedData = PKCSTool.GetBytesFromSignData(rtnSignData);
                bool verResult = PKCSTool.Verify(signedData, rtnPlainText, null);
                if (verResult == false)
                {
                    throw new Exception("VERIFY FAILED ");
                }
            }
            catch (Exception ex)
            {
                throw new Exception("VERIFY FAILED " + ex.Message);
            }
        }
    }
}