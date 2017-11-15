using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebHyDyf.ASPX.HouTai
{
    public partial class Back : WebHyDyf.SysCode.PageLog
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
            string SqlStr1 = "Server=192.168.1.151;database='" + this.DropDownList1.SelectedValue + "';Uid=sa;Pwd=SQLserver";
            string SqlStr2 = "backup database " + this.DropDownList1.SelectedValue + " to disk='" + this.TextBox1.Text.Trim() + ".bak'";
            SqlConnection con = new SqlConnection(SqlStr1);
            con.Open();
            try
            {
                if (File.Exists(this.TextBox1.Text.Trim()))
                {
                    Response.Write("<script language=javascript>alert('此文件已存在，请从新输入！');location='/ASPX/HouTai/Back.aspx'</script>");
                    return;
                }
                SqlCommand com = new SqlCommand(SqlStr2, con);
                com.ExecuteNonQuery();
                Response.Write("<script language=javascript>alert('备份数据成功！');location='/ASPX/HouTai/Back.aspx'</script>");
            }
            catch (Exception error)
            {
                Response.Write(error.Message);
                Response.Write("<script language=javascript>alert('备份数据失败！')</script>");
            }
            finally
            {
                con.Close();
            }
        }
    }
}