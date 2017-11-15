using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebHyDyf.ASPX
{
    public partial class HYZX : WebHyDyf.SysCode.PageLog
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string sql = "select * from dyf_user where id=" + Session["UserID"].ToString() + "";
                DataSet ds = HyeyClass.DBUtility.DbHelperSQL.Query(sql);
                if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    lblUsername.Text = ds.Tables[0].Rows[0]["userName"].ToString();
                    lblUname.Text = ds.Tables[0].Rows[0]["Uname"].ToString();
                    lblPhone.Text = ds.Tables[0].Rows[0]["uPhone"].ToString();
                    lblInserttime.Text = ds.Tables[0].Rows[0]["inserttime"].ToString();
                }
            }
        }
    }
}