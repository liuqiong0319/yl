using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebHyDyf.ASPX.HouTai
{
    public partial class HouT : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["userid"] != null)
                {
                    if (Session["userid"].ToString() != "")
                    {
                        sp_dlh.Visible = true;
                        sp_dlq.Visible = false;
                        sp_hy.InnerText = "您好，" + Session["username"].ToString();
                        BindGridView();
                    }
                }

            }
        }

        protected void btnSelect_Click(object sender, EventArgs e)
        {
            string key = txtSearch.Text;
            Response.Redirect("/ASPX/Drug/DrugList.aspx?key=" + key + "");
        }

        public void BindGridView()
        {
            string sql = "select * from dyf_minLeft where bs=" + Session["Utype"].ToString() + "";
            DataSet ds = HyeyClass.DBUtility.DbHelperSQL.Query(sql);
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                rp_Left.DataSource = ds.Tables[0].DefaultView;
                rp_Left.DataBind();
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

            if (Session["Utype"] != null)
            {
                if (Session["Utype"].ToString() == "0")
                {
                    Response.Redirect("/ASPX/HYZX.aspx");
                }
                if (Session["Utype"].ToString() == "1")
                {
                    Response.Redirect("/ASPX/HouTai/ShangC_YP.aspx");
                }
                if (Session["Utype"].ToString() == "2")
                {
                    Response.Redirect("/ASPX/HouTai/Review.aspx");
                }
            }
            else
            {
                Response.Write("<script language='javascript'>alert('请登录');location = '/ASPX/login.aspx'</script>");
                return;
            }
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("/ASPX/login.aspx");
        }

    }
}