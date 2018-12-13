using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CUMTUAL.App_Code;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

public partial class losthandle : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    protected void lostbtn_Click(object sender, EventArgs e)
    {
        string stayid = Request.Cookies["stayid"].Value;
        string type = DropDownList1.SelectedValue;//失物类型
        string attri = attributes.Text.Trim();//失物属性
        string quyu = DropDownList2.SelectedValue;//失物区域
        string pickinfo = pickertext.Text.Trim();//拾到者信息
        if(attributes.Text=="" || pickertext.Text=="")
        {
            MessageBox.Show("请填写完整属性以及拾到者信息！", "温馨提示", MessageBoxButtons.OKCancel, MessageBoxIcon.Information);
            return;
        }
        string timenow;
        DateTime t1 = new DateTime();
        t1 = DateTime.Now;
        timenow = t1.Year + "-" + t1.Month + "-" + t1.Day + " " + t1.Hour + ":" + t1.Minute + ":" + t1.Second + "." + t1.Millisecond;//登记时间
        string sql1 = "insert into 失物登记表(类型,收入站点,失物属性,捡拾地,登记时间,拾到者登记) values ('" + type + "','" + stayid + "','" + attri + "','" + quyu + "','" + timenow + "','" + pickinfo + "');";
        DBuser dh = new DBuser();
        int res1 = dh.DBhandle(sql1);
        if (res1 > 0)
        {
            MessageBox.Show("登记成功！", "温馨提示", MessageBoxButtons.OKCancel, MessageBoxIcon.Information);
        }
        else
        {
            MessageBox.Show("登记失败！", "温馨提示", MessageBoxButtons.OKCancel, MessageBoxIcon.Information);
        }
        dh.closeDb();
    }

    protected void returnbtn_Click(object sender, EventArgs e)
    {
        int returnID = Convert.ToInt32(bianhaotext.Text);
        string timenow;
        DateTime t1 = new DateTime();
        t1 = DateTime.Now;
        timenow = t1.Year + "-" + t1.Month + "-" + t1.Day + " " + t1.Hour + ":" + t1.Minute + ":" + t1.Second + "." + t1.Millisecond;//登记时间
        string takerinfo = pickertext.Text.Trim();
        string sql1 = "insert into 失物归还表(编号,领取者登记,时间) values('"+returnID+"','"+takerinfo+"','"+timenow+"');";
        string sql2 = "update 失物登记表 set 失物状态='N' where 编号= " + returnID + ";";
        DBuser dh = new DBuser();
        int res1 = dh.DBhandle(sql1);
        int res2 = dh.DBhandle(sql2);
        if (res1 > 0 && res2>0)
        {
            MessageBox.Show("失物领取成功！", "温馨提示", MessageBoxButtons.OKCancel, MessageBoxIcon.Information);
        }
        dh.closeDb();
    }
}