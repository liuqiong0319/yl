using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebHyDyf.ASPX
{
    public partial class importData : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["userid"] == null)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "show1", "alert('请登录您的账号');location.href='/ASPX/Login.aspx';", true);
                    return;
                }
                if (Session["userid"].ToString() == "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "show1", "alert('请登录您的账号');location.href='/ASPX/Login.aspx';", true);
                    return;
                }
                if (Session["Utype"].ToString() != "2")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "show1", "alert('您没有权限访问这个页面');location.href='/ASPX/Login.aspx';", true);
                    return;
                }
            }
        }

        public DataSet ExcelDataSource(string filepath, string sheetname)
        {
            string strConn;
            strConn = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + filepath + ";Extended Properties=Excel 8.0;";
            OleDbConnection conn = new OleDbConnection(strConn);
            OleDbDataAdapter oada = new OleDbDataAdapter("select * from [" + sheetname + "]", strConn);
            DataSet ds = new DataSet();
            oada.Fill(ds);
            conn.Close();
            return ds;
        }
        public ArrayList ExcelSheetName(string filepath)
        {
            ArrayList al = new ArrayList();
            string strConn = "Provider=Microsoft.Ace.OleDb.12.0;" + "data source=" + filepath + ";Extended Properties='Excel 12.0; HDR=Yes; IMEX=1'";
            OleDbConnection conn = new OleDbConnection(strConn);
            conn.Open();
            DataTable sheetNames = conn.GetOleDbSchemaTable(System.Data.OleDb.OleDbSchemaGuid.Tables, new object[] { null, null, null, "TABLE" });
            conn.Close();
            foreach (DataRow dr in sheetNames.Rows)
            {
                al.Add(dr[2]);
            }
            return al;
        }
        private bool Upload(FileUpload myFileUpload)
        {
            bool flag = false;
            //是否允许上载  
            bool fileAllow = false;
            //设定允许上载的扩展文件名类型  
            string[] allowExtensions = { ".xls",".xlsx" };
            //取得网站根目录路径  
            string path = HttpContext.Current.Request.MapPath("/testUpload/");
            if (myFileUpload.HasFile)
            {
                string fileExtension = System.IO.Path.GetExtension(myFileUpload.FileName).ToLower();
                for (int i = 0; i < allowExtensions.Length; i++)
                {
                    if (fileExtension == allowExtensions[i])
                    {
                        fileAllow = true;
                    }
                }

                if (fileAllow)
                {
                    try
                    {
                        //存储文件到文件夹 
                        myFileUpload.SaveAs(path + myFileUpload.FileName);
                        lblMes.Text = "文件导入成功";
                        flag = true;
                    }
                    catch (Exception ex)
                    {
                        lblMes.Text += ex.Message;
                        flag = false;
                    }
                }
                else
                {
                    lblMes.Text = "不允许上载：" + myFileUpload.PostedFile.FileName + "，只能上传xls的文件，请检查！";
                    flag = false;
                }
            }
            else
            {
                lblMes.Text = "请选择要导入的excel文件!";
                flag = false;
            }
            return flag;
        }
        protected void btn_save_Click(object sender, EventArgs e)
        {
            if (Session["userid"] == null)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "show1", "alert('请登录您的账号');location.href='/ASPX/Login.aspx';", true);
                return;
            }
            if (Session["userid"].ToString() == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "show1", "alert('请登录您的账号');location.href='/ASPX/Login.aspx';", true);
                return;
            }
            if (Session["Utype"].ToString() != "2")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "show1", "alert('您没有权限访问这个页面');location.href='/ASPX/Login.aspx';", true);
                return;
            }
            try
            {
                bool b = Upload(fu_excel);
                if (!b)
                {
                    return;
                }
                string name = fu_excel.FileName;
                string filepath = Server.MapPath("/testUpload/") + name;
                DataSet ds = ExcelDataSource(filepath, ExcelSheetName(filepath)[0].ToString());

                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    //,sl,ph,dj,scrq,yxq,sjrq,state
                    //," + ds.Tables[0].Rows[i]["sl"] + ",'" + ds.Tables[0].Rows[i]["ph"] + "'," + ds.Tables[0].Rows[i]["dj"] + ",'" + ds.Tables[0].Rows[i]["scrq"] + "','" + ds.Tables[0].Rows[i]["yxq"] + "',getdate(),1
                    if (ds.Tables[0].Rows[i]["ypmc"].ToString() != "")
                    {
                        DataSet ds1 = HyeyClass.DBUtility.DbHelperSQL.Query("insert into dyf_ypdm(ypmc,cdmc,gg,jx,bz,zbz,dw,pzwh,lsj,tjrq,shbs)values('" + ds.Tables[0].Rows[i]["ypmc"] + "','" + ds.Tables[0].Rows[i]["cdmc"] + "','" + ds.Tables[0].Rows[i]["gg"] + "','" + ds.Tables[0].Rows[i]["jx"] + "',1,1,'" + ds.Tables[0].Rows[i]["dw"] + "','" + ds.Tables[0].Rows[i]["pzwh"] + "',1,getdate(),1);SELECT SCOPE_IDENTITY()");
                        if (ds1.Tables.Count > 0 && ds1.Tables[0].Rows.Count > 0)
                        {
                            HyeyClass.DBUtility.DbHelperSQL.ExecuteSql("insert into dyf_kc(ypid,sl,ph,dj,scrq,yxq,sjrq,state) values(" + ds1.Tables[0].Rows[0][0] + "," + ds.Tables[0].Rows[i]["sl"] + ",'" + ds.Tables[0].Rows[i]["ph"].ToString() + "'," + ds.Tables[0].Rows[i]["dj"] + ",'" + ds.Tables[0].Rows[i]["scrq"] + "','" + ds.Tables[0].Rows[i]["yxq"] + "',getdate(),1)");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox("系统异常！稍后再试！");
                return;
            }
        }
        protected void MessageBox(string str)
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('" + str + "');</script>");
        }
    }
}