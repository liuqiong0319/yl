using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebHyDyf.ASPX
{
    public partial class index1 : WebHyDyf.SysCode.PageLog
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string sql = "select top 14* from dyf_Notice order by inserttime desc";
                DataSet ds = HyeyClass.DBUtility.DbHelperSQL.Query(sql);
                if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    rp_List.DataSource = ds.Tables[0].DefaultView;
                    rp_List.DataBind();
                }
            }
        }
    }
}