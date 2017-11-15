using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebHyDyf.ASPX.HouTai
{
    public partial class Rest : WebHyDyf.SysCode.PageLog
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string SqlStr1 = "Server=192.168.1.151;DataBase=master;Uid=sa;Pwd=SQLserver";
                string SqlStr2 = "Exec sp_helpdb";
                SqlConnection con = new SqlConnection(SqlStr1);
                con.Open();
                SqlCommand com = new SqlCommand(SqlStr2, con);
                SqlDataReader dr = com.ExecuteReader();
                this.DropDownList1.DataSource = dr;
                this.DropDownList1.DataTextField = "name";
                this.DropDownList1.DataBind();
                dr.Close();
                con.Close();
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string path = this.FileUpload1.PostedFile.FileName; //获得备份路径及数据库名称
            string dbname = this.DropDownList1.SelectedValue;
            string SqlStr1 = "Server=192.168.1.151;database='" + this.DropDownList1.SelectedValue + "';Uid=sa;Pwd=SQLserver";
            string SqlStr2 = "use master restore database " + dbname + " from disk='" + path + "'";
            SqlConnection con = new SqlConnection(SqlStr1);
            con.Open();
            try
            {
                SqlCommand com = new SqlCommand(SqlStr2, con);
                com.ExecuteNonQuery();
                Response.Write("<script language=javascript>alert('还原数据成功！');location='/ASPX/HouTai/Rest.aspx'</script>");
            }
            catch (Exception error)
            {
                Response.Write(error.Message);
                Response.Write("<script language=javascript>alert('还原数据失败！')</script>");
            }
            finally
            {
                con.Close();
            }
        }
    }
}