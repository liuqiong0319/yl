using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebHyDyf.Notice
{
    public partial class NoticeV : WebHyDyf.SysCode.PageLog
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    string sql = "select * from dyf_Notice where id=" + Request.QueryString["id"] + "";
                    DataSet ds = HyeyClass.DBUtility.DbHelperSQL.Query(sql);
                    if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                    {
                        divTitle.InnerText = ds.Tables[0].Rows[0]["title"].ToString();
                        divCotent.InnerText = ds.Tables[0].Rows[0]["tContent"].ToString();
                    }
                }
            }
        }
    }
}