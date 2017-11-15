using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebHyDyf.ASPX.Drug
{
    public partial class Contract : WebHyDyf.SysCode.PageLog
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
            }
        }


        public void BindGridView()
        {
            string sql = "select * from dyf_orderde where orderid=" + Request.QueryString["orderid"] + " and userid=" + Session["Userid"].ToString() + "";
            DataSet ds = HyeyClass.DBUtility.DbHelperSQL.Query(sql);
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                rp_list.DataSource = ds.Tables[0].DefaultView;
                rp_list.DataBind();
            }
            string sql1 = "select * from dyf_order where id=" + Request.QueryString["orderid"] + " and userid=" + Session["Userid"].ToString() + "";
            DataSet ds1 = HyeyClass.DBUtility.DbHelperSQL.Query(sql1);
            if (ds1 != null && ds1.Tables.Count > 0 && ds1.Tables[0].Rows.Count > 0)
            {
                lblJE.Text = ds1.Tables[0].Rows[0]["je"].ToString();
            }
            string sql2 = "select * from dyf_user where id=" + Session["Userid"].ToString() + "";
            DataSet ds2 = HyeyClass.DBUtility.DbHelperSQL.Query(sql2);
            if (ds2 != null && ds2.Tables.Count > 0 && ds2.Tables[0].Rows.Count > 0)
            {
                LabXF.Text = ds2.Tables[0].Rows[0]["Uname"].ToString();
                LabQDSJ.Text = DateTime.Now.ToString("yyyy-MM-dd");
                LabXQJS.Text = DateTime.Now.AddYears(1).ToString("yyyy-MM-dd");
                LabDWMC.Text = ds2.Tables[0].Rows[0]["Uname"].ToString();
                LabXFDLR.Text = ds2.Tables[0].Rows[0]["Uname"].ToString();
            }
        }
        protected void BtnQR_Click(object sender, EventArgs e)
        {
            Response.Redirect("/ASPX/Shop/Submit.aspx?orderid=" + Request.QueryString["orderid"] + "");
        }
    }
}