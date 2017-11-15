using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Text;
using System.IO;
using System.Collections.Specialized;
using System.Xml;
using System.Net.Mime;
using System.Collections;

namespace WebHyDyf.ashx
{
    public class DoNetHelper
    {
        public class Request
        {
            public HttpContext context;

            public Dictionary<string, string> Attribute = new Dictionary<string, string>();

            public NameValueCollection NameValuePairs = new NameValueCollection(10);

            public Request(HttpContext context)
            {
                this.context = context;
            }

            public string getParameter(string paraName)
            {
                return this.context.Request.Form[paraName];
            }

            public void setAttribute(string key, string value)
            {
                this.Attribute.Add(key, value);
                this.NameValuePairs.Add(key, value);
            }

            public Forward getRequestDispatcher(string p)
            {
                return new Forward(p);
            }

            public static string GetAuthority(HttpRequest req)
            {
                string contextPath = string.Format("http://{0}/", req.Url.Authority);
                if (req.Url.Segments != null && req.Url.Segments.Length > 1)
                {
                    if (!req.Url.Segments[1].StartsWith("aspx/"))
                    {
                        contextPath += req.Url.Segments[1];
                    }
                }
                return contextPath.Remove(contextPath.Length - 1);
            }
        }

        public class Forward
        {
            public string Url;

            public Forward(string url)
            {
                this.Url = url;
            }

            public void forward(Request req, object res)
            {
                string url = string.Format("../..{0}", this.Url);
                string pageInfo = PageForward.PostPage(req.Attribute, url);
                req.context.Response.Write(pageInfo);
            }

        }

        public class logger
        {
            public static void debug(string className, string msg)
            {
                Write(msg, className, "DEBUG");
            }

            public static void info(string className, string msg)
            {
                Write(msg, className, "INFO");
            }

            public static void error(string className, Exception e)
            {
                Write(e.Message, className, "ERROR", System.Diagnostics.EventLogEntryType.Error);
            }

            private static readonly string _Format = "[{0}] [system] [{1}] [{2}] {3}";

            private static System.Diagnostics.EventLog _EventLog;

            private static void Write(string msg,
                string className,
                string level,
                System.Diagnostics.EventLogEntryType type = System.Diagnostics.EventLogEntryType.Information)
            {
                string info = string.Format(_Format, DateTime.Now.ToString("yyyyMMdd HH:mm:ss"), className, level, msg);
                System.Diagnostics.Debug.Print(info);
                _EventLog.WriteEntry(info, type);
            }

            public static void SetLog()
            {
                _EventLog = new System.Diagnostics.EventLog();
                string source = "BocPaymentSample";
                if (!System.Diagnostics.EventLog.SourceExists(source))
                {
                    System.Diagnostics.EventLog.CreateEventSource(source, source);
                }
                _EventLog.Log = source;
                _EventLog.Source = source;
            }

            public static void DisposeLog()
            {
                _EventLog.Dispose();
            }

        }

        public class HttpPost
        {
            public string Action;
            public HttpWebRequest httpClient;
            public string postData = string.Empty;
            public byte[] postDataFile = null;
            public string ContentType = string.Empty;

            public HttpPost(string action)
            {
                this.Action = action;
                httpClient = (HttpWebRequest)WebRequest.Create(action);
                httpClient.Method = "POST";
            }

            public void setEntity(HttpEntity entity)
            {
                this.ContentType = entity.ContentType;
                if (!entity.IsFileEntity)
                {
                    Func<string, string> replace = (s) =>
                    {
                        return HttpUtility.UrlEncode(s, Encoding.GetEncoding(entity.Encode));
                    };
                    entity.KeyValue.ForEach(kv =>
                    {
                        postData += string.Format(@"{0}={1}&", kv.Key, replace(kv.Value));
                    });
                    if (postData.Length > 0)
                    {
                        postData = postData.Remove(postData.Length - 1);
                    }
                    logger.debug(this.GetType().FullName, postData);
                }
                else
                {
                    postDataFile = entity.FileEntityBuffer;
                    boundary = entity.Boundary;
                    logger.debug(this.GetType().FullName, UTF8Encoding.UTF8.GetString(postDataFile));
                }
            }

            public string boundary { get; set; }
        }

        public class HttpClient
        {
            public DoHttpResponse execute(HttpPost post)
            {
                System.IO.Stream stream = post.httpClient.GetRequestStream();

                if (post.postDataFile != null)
                {
                    post.httpClient.ContentType = string.Format("multipart/form-data; boundary={0}; charset=UTF-8", post.boundary);
                    stream.Write(post.postDataFile, 0, post.postDataFile.Length);
                }
                else if (post.postData != string.Empty)
                {
                    post.httpClient.ContentType = "application/x-www-form-urlencoded; charset=UTF-8";
                    byte[] buffer = UTF8Encoding.UTF8.GetBytes(post.postData);
                    stream.Write(buffer, 0, buffer.Length);
                }
                logger.debug(this.GetType().FullName, post.httpClient.ContentType);
                HttpWebResponse response = (HttpWebResponse)post.httpClient.GetResponse();
                System.IO.Stream res = response.GetResponseStream();
                string result = string.Empty;
                byte[] buff = null;
                if (response.ContentType == "application/x-download;charset=utf-8")
                {
                    System.IO.MemoryStream ms = new MemoryStream();
                    res.CopyTo(ms, 1024);
                    buff = ms.GetBuffer();
                    ms.Close();
                }
                System.IO.StreamReader sr = new System.IO.StreamReader(res, UTF8Encoding.UTF8);
                result = sr.ReadToEnd();
                sr.Close();
                res.Close();
                List<HeaderElement> headerElements = new List<HeaderElement>();
                headerElements.Add(new HeaderElement() { Name = "Content-Disposition", Value = response.Headers["Content-Disposition"] });
                return new DoHttpResponse(result) { Header = new Header() { HeaderElements = headerElements }, InputBuffer = buff };
            }
        }

        public class DefaultHttpClient : HttpClient
        { }

        public class NameValuePair
        {
            public string Key;
            public string Value;

            public override string ToString()
            {
                return Value.ToString();
            }
        }

        public class BasicNameValuePair : NameValuePair
        {
            public BasicNameValuePair(string key, string value)
            {
                base.Key = key;
                base.Value = value;
            }
        }

        public class ArrayList<T> : List<T>
        { }

        public class HttpEntity
        {
            public List<NameValuePair> KeyValue;
            public string Encode;
            public string Result;
            public bool IsFileEntity;
            public byte[] FileEntityBuffer;
            public string ContentType = string.Empty;
            public byte[] InputBuffer;

            public HttpEntity()
            { }

            public HttpEntity(string result, byte[] buffer)
            {
                this.Result = result;
                this.InputBuffer = buffer;
            }

            public InputStream getContent()
            {
                InputStream stream = new InputStream();
                byte[] buffer = this.InputBuffer; //UTF8Encoding.UTF8.GetBytes(this.Result.Trim());
                stream.Write(buffer, 0, buffer.Length);
                return stream;
            }

            public string Boundary { get; set; }
        }

        public class UrlEncodedFormEntity : HttpEntity
        {
            public UrlEncodedFormEntity(List<NameValuePair> keyValue, string encod)
            {
                base.KeyValue = keyValue;
                base.Encode = encod;
            }
        }

        public class DoHttpResponse
        {
            private string result = string.Empty;

            public Header Header;

            public byte[] InputBuffer;

            public DoHttpResponse(string result)
            {
                this.result = result;
            }

            public HttpEntity getEntity()
            {
                return new HttpEntity(this.result, InputBuffer);
            }

            public Header getFirstHeader(string p)
            {
                return this.Header;
            }
        }

        public class EntityUtils
        {
            public static string ToString(HttpEntity entityResult)
            {
                return entityResult.Result;
            }
        }

        public class InputStream : MemoryStream
        {
        }

        public class FileInputStream : InputStream
        {
            private string VerifyCerFile;

            public FileInputStream(string verifyCerFile)
            {
                this.VerifyCerFile = verifyCerFile;
            }
        }

        //B2B

        public class Date
        {
            public DateTime NowDate
            {
                get { return DateTime.Now; }
            }
        }

        public class SimpleDateFormat
        {
            private string _format;

            public SimpleDateFormat(string format)
            {
                // TODO: Complete member initialization
                this._format = format;
            }


            public string format(Date date)
            {
                return date.NowDate.ToString(this._format);
            }
        }

        public class DocumentBuilderFactory
        {

            public static DocumentBuilderFactory newInstance()
            {
                return new DocumentBuilderFactory();
            }

            public DocumentBuilder newDocumentBuilder()
            {
                return new DocumentBuilder();
            }
        }

        public class DocumentBuilder
        {
            public Document newDocument()
            {
                XmlDocument xmlDoc = new XmlDocument();
                XmlDeclaration xmlDec = xmlDoc.CreateXmlDeclaration("1.0", "UTF-8", "no");
                xmlDoc.AppendChild(xmlDec);
                return new Document(xmlDoc);
            }
        }

        public class Document
        {
            public XmlDocument XmlDoc;

            public Document(XmlDocument xmlDoc)
            {
                // TODO: Complete member initialization
                this.XmlDoc = xmlDoc;
            }
            public Element createElement(string p)
            {
                var e = this.XmlDoc.CreateElement(p);
                return new Element(e);
            }

            public void appendChild(Element element)
            {
                this.XmlDoc.AppendChild(element.XmlEle);
            }

            public override string ToString()
            {
                return this.XmlDoc.InnerXml;
            }

            private string NodeInnerXml(XmlNodeList list)
            {
                StringBuilder sb = new StringBuilder();
                foreach (XmlNode n in list)
                {
                    if (n.ChildNodes.Count == 0)
                        sb.Append(n.OuterXml).Append(Environment.NewLine);
                    else
                    {
                        sb.Append(NodeInnerXml(n.ChildNodes));
                    }
                }
                return sb.ToString();
            }
        }

        public class Element
        {
            public XmlElement XmlEle;

            public Element(XmlElement element)
            {
                this.XmlEle = element;
            }

            public void setAttribute(string p, string p_2)
            {
                this.XmlEle.SetAttribute(p, p_2);
            }

            public void appendChild(Element e)
            {
                this.XmlEle.AppendChild(e.XmlEle);
            }

            public void setTextContent(string s)
            {
                this.XmlEle.InnerText = s;
            }
        }

        public class XmlUtil
        {
            public static string createPrettyFormat(Document document)
            {
                return document.ToString();
            }

            public static Document createDocument(string plainText)
            {
                string xmlStr = plainText;
                XmlDocument xmlDoc = new XmlDocument();
                xmlDoc.LoadXml(xmlStr);
                Document doc = new Document(xmlDoc);
                return doc;
            }

            public static string getNodeText(Document document, string p)
            {
                var list = document.XmlDoc.GetElementsByTagName(p);
                return list == null ? "" : list[0].InnerText;
            }

        }

        //file

        public class TreeMap
        {
            public Dictionary<string, string> Dictionary = new Dictionary<string, string>();

            public void put(string key, string value)
            {
                Dictionary.Add(key, value);
            }
        }

        public class Header
        {
            private LinkedList<MinimalField> fields = new LinkedList<MinimalField>();
            private Hashtable fieldMap = new Hashtable();
            public List<HeaderElement> HeaderElements;
            public List<HeaderElement> getElements()
            {
                return this.HeaderElements;
            }

            public void addField(MinimalField field)
            {
                if (field == null)
                    return;
                String key = field.getName().ToLower(new System.Globalization.CultureInfo("US"));
                object v = fieldMap[key];//.get(key);
                LinkedList<MinimalField> values = null;
                if (v == null)
                {
                    values = new LinkedList<MinimalField>();
                    fieldMap.Add(key, values);
                }
                else
                {
                    values = v as LinkedList<MinimalField>;
                }
                values.AddLast(field);
                fields.AddLast(field);
            }
        }

        public class HeaderElement
        {
            public string Name;

            public string Value;

            public NameValuePair[] getParameters()
            {
                List<NameValuePair> list = new List<NameValuePair>();
                foreach (string s in Value.Split(';'))
                {
                    NameValuePair p = new NameValuePair() { Key = s, Value = s };
                    list.Add(p);
                }
                return list.ToArray();
            }
        }

        public class File
        {
            public string FileName;

            public File(string fileName)
            {
                // TODO: Complete member initialization
                this.FileName = fileName;
            }
        }

        public class FileOutputStream
        {
            public FileStream FileStream;
        }

        public class FileUtils
        {
            public static FileOutputStream openOutputStream(File file)
            {
                FileOutputStream fos = new FileOutputStream();
                fos.FileStream = System.IO.File.OpenWrite(file.FileName);
                return fos;
            }
        }

        public class IOUtils
        {
            public static void copy(InputStream input, FileOutputStream output)
            {
                byte[] buffer = input.GetBuffer();
                output.FileStream.Write(buffer, 0, buffer.Length);
            }

            public static void closeQuietly(FileOutputStream output)
            {
                output.FileStream.Close();
            }

            public static void closeQuietly(InputStream input)
            {
                input.Close();
            }
        }

        public class MultipartEntityBuilder
        {
            private HttpMultipartMode _HttpMultipartMode;
            private Charset charset;

            private static char[] MULTIPART_CHARS = "-_1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".ToCharArray();
            //private static String DEFAULT_SUBTYPE = "form-data";
            private String subType = null;
            private String boundary = null;
            private ArrayList bodyParts;

            public byte[] Buffer;

            public static MultipartEntityBuilder create()
            {
                return new MultipartEntityBuilder();
            }

            public void setMode(HttpMultipartMode httpMultipartMode)
            {
                this._HttpMultipartMode = httpMultipartMode;
            }

            public void setCharset(Charset charset)
            {
                this.charset = charset;
            }

            public MultipartEntityBuilder addPart(string name, ContentBody body)
            {
                Args.notNull(name, "Name");
                Args.notNull(body, "Content body");
                return addPart(new FormBodyPart(name, body));
            }

            private MultipartEntityBuilder addPart(FormBodyPart bodyPart)
            {
                if (bodyPart == null)
                    return this;
                if (bodyParts == null)
                    bodyParts = new ArrayList();
                bodyParts.Add(bodyPart);
                return this;
            }

            public int Content_Length = 0;
            public string Connection = "Keep-Alive";

            private string _content = "\r\n--{0}\r\nContent-Disposition:{1};name=\"{2}\"\r\n\r\n";

            private string _contentFile = "\r\n--{0}\r\nContent-Disposition:{1};name=\"{2}\";filename=\"{3}\"\r\n"
                + "Content-Type:application/octet-stream\r\n\r\n";

            private string _contentEnd = "\r\n--{0}[\r][\n]--";

            public MemoryStream memoryStream = new MemoryStream();

            public HttpEntity build()
            {
                String st = subType == null ? "form-data" : subType;
                Charset cs = charset;
                String b = boundary == null ? generateBoundary() : boundary;
                ArrayList bps = bodyParts == null ? new ArrayList() : bodyParts;
                HttpMultipartMode m = _HttpMultipartMode == null ? HttpMultipartMode.STRICT : _HttpMultipartMode;


                byte[] buffer;

                //bodyParts
                foreach (FormBodyPart p in bodyParts)
                {
                    if (p.body.GetType() == typeof(FileBody))
                    {
                        this.boundary = b;
                        FileBody body = p.body as FileBody;
                        string header = string.Format(this._contentFile, b, st, "fileData", Path.GetFileName(body.file.FileName));
                        buffer = UTF8Encoding.UTF8.GetBytes(header);
                        memoryStream.Write(buffer, 0, buffer.Length);

                        buffer = new byte[1024];
                        FileStream fs = System.IO.File.OpenRead(body.file.FileName);
                        while (fs.Read(buffer, 0, buffer.Length) > 0)
                        {
                            memoryStream.Write(buffer, 0, buffer.Length);
                        }
                    }

                    if (p.body.GetType() == typeof(StringBody))
                    {
                        StringBody body = p.body as StringBody;
                        buffer = UTF8Encoding.UTF8.GetBytes(string.Format(this._content, b, st, p.name) + body.Text + "\r\n");
                        memoryStream.Write(buffer, 0, buffer.Length);
                    }
                }
                buffer = UTF8Encoding.UTF8.GetBytes(string.Format(this._contentEnd, b));
                memoryStream.Write(buffer, 0, buffer.Length);

                this.Buffer = memoryStream.GetBuffer();
                memoryStream.Close();
                HttpEntity entity = new HttpEntity()
                {
                    IsFileEntity = true,
                    FileEntityBuffer = this.Buffer,
                    Boundary = b
                };
                return entity;

                #region
                //static class _cls1
                //{

                //    static final int $SwitchMap$org$apache$http$entity$mime$HttpMultipartMode[];

                //    static 
                //    {
                //        $SwitchMap$org$apache$http$entity$mime$HttpMultipartMode = new int[HttpMultipartMode.values().length];
                //        try
                //        {
                //            $SwitchMap$org$apache$http$entity$mime$HttpMultipartMode[HttpMultipartMode.BROWSER_COMPATIBLE.ordinal()] = 1;
                //        }
                //        catch(NoSuchFieldError ex) { }
                //        try
                //        {
                //            $SwitchMap$org$apache$http$entity$mime$HttpMultipartMode[HttpMultipartMode.RFC6532.ordinal()] = 2;
                //        }
                //        catch(NoSuchFieldError ex) { }
                //    }
                //}


                //AbstractMultipartForm form;
                //switch(_cls1..SwitchMap.org.apache.http.entity.mime.HttpMultipartMode[m.ordinal()])
                //{
                //case 1: // '\001'
                //    form = new HttpBrowserCompatibleMultipart(st, cs, b, bps);
                //    break;

                //case 2: // '\002'
                //    form = new HttpRFC6532Multipart(st, cs, b, bps);
                //    break;

                //default:
                //    form = new HttpStrictMultipart(st, cs, b, bps);
                //    break;
                //}
                //return new MultipartFormEntity(form, generateContentType(b, cs), form.getTotalLength());
                #endregion
            }

            private string generateBoundary()
            {
                StringBuilder buffer = new StringBuilder();
                Random rand = new Random();
                int count = rand.Next(11) + 30;
                for (int i = 0; i < count; i++)
                    buffer.Append(MULTIPART_CHARS[rand.Next(MULTIPART_CHARS.Length)]);

                return buffer.ToString();
            }
        }

        public class CharsetUtils
        {
            public static Charset get(string encode)
            {
                return new Charset(encode);
            }
        }

        public class ContentBody
        {
            public ContentType contentType;

            public byte[] content { get; set; }

            public void SetContentType(ContentType contentType)
            {
                this.contentType = contentType;
            }

            public string getFilename()
            {
                return (this as FileBody).file.FileName;
            }

            public char[] getMimeType()
            {
                if (this.contentType != null)
                    return this.contentType.MediaType.ToCharArray();
                else
                    return null;
            }

            public string getCharset()
            {
                if (this.contentType != null)
                    return this.contentType.CharSet;
                else
                    return null;
            }

            public string getTransferEncoding()
            {
                return this.getCharset();
            }
        }

        public class FileBody : ContentBody
        {
            public File file;

            public FileBody(File file)
            {
                // TODO: Complete member initialization
                this.file = file;
            }
        }

        public class StringBody : ContentBody
        {
            public string Text;
            public string EncodeType;


            public StringBody(string text, Charset charset)
            {
                this.Text = text;
                this.EncodeType = charset.Name;
            }

        }

        public class Charset
        {
            public string Name;

            public Charset(string name)
            {
                this.Name = name;
            }

            public static Charset forName(string encode)
            {
                return new Charset(encode);
            }
        }

        public class FormBodyPart
        {
            public String name;
            public Header header = new Header();
            public ContentBody body;

            public FormBodyPart(string name, ContentBody body)
            {
                this.name = name;
                this.body = body;
            }

            private void generateTransferEncoding(ContentBody body)
            {
                addField("Content-Transfer-Encoding", body.getTransferEncoding());
            }

            private void generateContentType(ContentBody body)
            {
                StringBuilder buffer = new StringBuilder();
                buffer.Append(body.getMimeType());
                if (body.getCharset() != null)
                {
                    buffer.Append("; charset=");
                    buffer.Append(body.getCharset());
                }
                addField("Content-Type", buffer.ToString());
            }

            private void generateContentDisp(ContentBody body)
            {
                StringBuilder buffer = new StringBuilder();
                buffer.Append("form-data; name=\"");
                buffer.Append(getName());
                buffer.Append("\"");
                if (body.getFilename() != null)
                {
                    buffer.Append("; filename=\"");
                    buffer.Append(body.getFilename());
                    buffer.Append("\"");
                }
                addField("Content-Disposition", buffer.ToString());
            }

            private void addField(String name, String value)
            {
                Args.notNull(name, "Field name");
                header.addField(new MinimalField(name, value));
            }

            public String getName()
            {
                return this.name;
            }

        }

        public class Args
        {
            public static void notNull(object obj, string name)
            {
                if (obj == null)
                    throw new Exception((new StringBuilder()).Append(name).Append(" may not be null").ToString());
            }
        }

        public class MinimalField
        {
            private string name;
            private string value;

            public MinimalField(string name, string value)
            {
                // TODO: Complete member initialization
                this.name = name;
                this.value = value;
            }

            public String getName()
            {
                return name;
            }

            public String getBody()
            {
                return value;
            }

            public String toString()
            {
                StringBuilder buffer = new StringBuilder();
                buffer.Append(name);
                buffer.Append(": ");
                buffer.Append(value);
                return buffer.ToString();
            }

        }
    }
}