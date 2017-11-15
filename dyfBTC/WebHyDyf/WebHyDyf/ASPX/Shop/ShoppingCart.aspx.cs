using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebHyDyf.ASPX.Shop
{
    public partial class ShoppingCart : WebHyDyf.SysCode.PageLog
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["userid"] != null)
                {
                    if (Session["Utype"].ToString() == "0")
                    {
                        BindGridView();
                    }
                    else
                    {
                        MessageBox("您没有权限访问这个页面！");
                        return;
                    }
                }
                else
                {
                    MessageBox("请登录您的账号！");
                }
            }
        }



        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            if (Session["userid"] != null)
            {
                if (Session["Utype"].ToString() == "0")
                {
                    LinkButton lb = (LinkButton)sender;
                    string sql = "delete from  dyf_gwc  where id=" + lb.CommandArgument + "";
                    int num = HyeyClass.DBUtility.DbHelperSQL.ExecuteSql(sql);
                    if (num > 0)
                    {
                        MessageBox("删除成功！");
                        BindGridView();
                    }
                    else
                    {
                        MessageBox("系统故障，请稍后重试！");
                        return;
                    }
                }
                else
                {
                    MessageBox("您没有权限访问这个页面！");
                    return;
                }
            }
            else
            {
                MessageBox("请登录您的账号！");
                return;
            }
        }
        public void BindGridView()
        {
            string sql = "  select *  from ((select id as gwcid,sl,ypid from dyf_gwc where userid=" + Session["userid"].ToString() + ")a left join (select  id,ypmc,cdmc,gg,bz,zbz,sl as kc,yksl,dj,ph,dw,ypid,yptp1 from  kcbs )b on a.ypid=b.id )";
            DataSet ds = HyeyClass.DBUtility.DbHelperSQL.Query(sql);
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                rp_cart.DataSource = ds.Tables[0].DefaultView;
                rp_cart.DataBind();
            }
        }

        protected void imgJS_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                if (Session["userid"] != null)
                {
                    decimal je = 0;
                    if (Session["Utype"].ToString() == "0")
                    {
                        foreach (RepeaterItem item in rp_cart.Items)
                        {
                            Label lblje = item.FindControl("lblje") as Label;
                            if (lblje.Text != "")
                            {
                                je += decimal.Parse(lblje.Text);
                            }
                            else
                            {
                                MessageBox("请选择药品数量！");
                            }
                        }
                        string sql = "insert into dyf_order (userid,username,inserttime,je) values (" + Session["userid"].ToString() + ",'" + Session["username"].ToString() + "','" + DateTime.Now + "'," + lblsumje.Text + ") select @@identity as maxid ";
                        DataSet ds1 = HyeyClass.DBUtility.DbHelperSQL.Query(sql);
                        if (ds1.Tables.Count > 0 && ds1.Tables[0].Rows.Count > 0)
                        {
                            foreach (RepeaterItem item in rp_cart.Items)
                            {
                                Label lblje = item.FindControl("lblje") as Label;
                                HiddenField hidID = item.FindControl("hiddID") as HiddenField;
                                Label lblYpmc = item.FindControl("labYpmc") as Label;
                                Label lblCdmc = item.FindControl("labCdmc") as Label;
                                Label lblGG = item.FindControl("labGG") as Label;
                                Label lblBz = item.FindControl("lblBz") as Label;
                                Label lblzBz = item.FindControl("lblZbz") as Label;
                                Label lblph = item.FindControl("labPh") as Label;
                                Label lbldj = item.FindControl("lblDj") as Label;
                                TextBox txtSL = item.FindControl("txtSL") as TextBox;
                                HiddenField hiddYksl = item.FindControl("hiddYksl") as HiddenField;
                                string sql2 = "insert into dyf_orderDe (orderid,userid,ypid,ypmc,cdmc,gg,bz,zbz,ph,dj,sl,je,inserttime) values (" + ds1.Tables[0].Rows[0][0].ToString() + "," + Session["userid"].ToString() + "," + hidID.Value.Trim() + ",'" + lblYpmc.Text.Trim() + "','" + lblCdmc.Text.Trim() + "','" + lblGG.Text.Trim() + "'," + lblBz.Text.Trim() + "," + lblzBz.Text.Trim() + ",'" + lblph.Text.Trim() + "'," + lbldj.Text.Trim() + "," + txtSL.Text.Trim() + "," + lblje.Text.Trim() + ",'" + DateTime.Now + "')";
                                HyeyClass.DBUtility.DbHelperSQL.ExecuteSql(sql2);
                                int yksl = int.Parse(hidID.Value) + int.Parse(txtSL.Text);
                                string sql3 = "update kcbs  set yksl=" + yksl + " where id=" + hidID.Value + "";
                                HyeyClass.DBUtility.DbHelperSQL.ExecuteSql(sql3);

                            }
                            Response.Redirect("/ASPX/Drug/Contract.aspx?orderid=" + ds1.Tables[0].Rows[0][0].ToString() + "");
                        }

                    }
                    else
                    {
                        MessageBox("您没有权限访问这个页面！");
                        return;
                    }
                }
                else
                {
                    MessageBox("请登录您的账号！");
                    return;
                }
            }
            catch (Exception x)
            {

                MessageBox("服务器故障，请稍后重试！");
                return;
            }


            //ClientScript.RegisterStartupScript(this.GetType(), "show1", "alert('用户名或密码不正确！');location.href='/ASPX/Login.aspx';", true);
        }
        protected void MessageBox(string str)
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('" + str + "');</script>");
        }

        protected void btnJian_Click(object sender, EventArgs e)
        {
            if (Session["userid"] != null)
            {
                if (Session["Utype"].ToString() == "0")
                {
                    Button bt = (Button)sender;
                    RepeaterItem rptItem = bt.Parent as RepeaterItem;

                    TextBox txt = rptItem.FindControl("txtSL") as TextBox;
                    Label lbl = rptItem.FindControl("lblje") as Label;
                    Label lbl1 = rptItem.FindControl("lblBz") as Label;
                    Label lbl2 = rptItem.FindControl("lblZbz") as Label;
                    Label lbl3 = rptItem.FindControl("lblDj") as Label;
                    if (int.Parse(txt.Text) > int.Parse(lbl2.Text))
                    {
                        txt.Text = (int.Parse(txt.Text) - int.Parse(lbl2.Text)).ToString();
                        lbl.Text = (decimal.Parse(lbl3.Text) * decimal.Parse(txt.Text)).ToString();
                        string dj = (decimal.Parse(lbl3.Text) * decimal.Parse(lbl2.Text)).ToString();
                        lblsumje.Text = (decimal.Parse(lblsumje.Text) - decimal.Parse(dj)).ToString();
                        txt.CssClass = "car_ipt";
                    }
                    else
                    {
                        txt.CssClass = "car_ipt1";
                    }
                }
                else
                {
                    MessageBox("您没有权限访问这个页面！");
                    return;
                }
            }
            else
            {
                MessageBox("请登录您的账号！");
                return;
            }
        }

        protected string GetKC(string sl, string zbz)
        {
            try
            {
                if (sl == "1")
                {
                    return zbz;
                }
                else
                    return sl;

            }
            catch (Exception ex)
            {
                return "";
            }
        }

        protected string GetJe(string sl, string dj, string zbz)
        {
            try
            {
                if (sl == "1")
                {
                    return (decimal.Parse(dj) * decimal.Parse(zbz)).ToString();
                }
                else
                    return (decimal.Parse(dj) * decimal.Parse(sl)).ToString();


            }
            catch (Exception ex)
            {
                return "";
            }
        }

        protected void btnJia_Click(object sender, EventArgs e)
        {
            if (Session["userid"] != null)
            {
                if (Session["Utype"].ToString() == "0")
                {
                    Button bt = (Button)sender;
                    RepeaterItem rptItem = bt.Parent as RepeaterItem;

                    TextBox txt = rptItem.FindControl("txtSL") as TextBox;
                    Label lbl = rptItem.FindControl("lblje") as Label;
                    Label lbl1 = rptItem.FindControl("lblBz") as Label;
                    Label lbl2 = rptItem.FindControl("lblZbz") as Label;
                    Label lbl3 = rptItem.FindControl("lblDj") as Label;
                    Label lbl4 = rptItem.FindControl("lblkc") as Label;
                    if (int.Parse(txt.Text) >= int.Parse(lbl4.Text))
                    {
                        txt.CssClass = "car_ipt1";
                    }
                    else
                    {
                        txt.Text = (int.Parse(txt.Text) + int.Parse(lbl2.Text)).ToString();
                        lbl.Text = (decimal.Parse(lbl3.Text) * decimal.Parse(txt.Text)).ToString();
                        string dj = (decimal.Parse(lbl3.Text) * decimal.Parse(lbl2.Text)).ToString();
                        lblsumje.Text = (decimal.Parse(lblsumje.Text) + decimal.Parse(dj)).ToString();
                        txt.CssClass = "car_ipt";
                    }
                }
                else
                {
                    MessageBox("您没有权限访问这个页面！");
                    return;
                }
            }
            else
            {
                MessageBox("请登录您的账号！");
                return;
            }
        }
        decimal ta;
        protected void rp_cart_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                Label lblje = (Label)e.Item.FindControl("lblje");
                //DataRowView drv = (DataRowView)e.Item.DataItem;
                ta = ta + Convert.ToDecimal(lblje.Text);
            }
            lblsumje.Text = ta.ToString();
        }
    }
}