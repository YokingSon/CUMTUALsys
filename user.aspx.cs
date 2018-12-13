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

public partial class user : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        int indexselcet = DropDownList1.SelectedIndex+1;
        DBuser dh = new DBuser();
        //判断是否可以借伞
       // string userid = (string)Session["userid"];
        string userid = (string)Request.Cookies["userid"].Value;
        string sqlx = "select 借伞状态 from 用户表 where 学工号='" + userid + "';";
        SqlDataReader reader0 = dh.queryDb(sqlx);
        if (reader0.HasRows)
        {
            //reader0.Read();
            //Session["userstate"] = (string)reader0[0];
            //if ((string)Session["userstate"] != "F")
            //{
            //    MessageBox.Show("你有未归还雨伞!", "温馨提示", MessageBoxButtons.OKCancel, MessageBoxIcon.Information);
            //    return;
            //}
            reader0.Read();
            string state = (string)reader0[0];
            if (state != "F")
            {
                MessageBox.Show("你有未归还雨伞!", "温馨提示", MessageBoxButtons.OKCancel, MessageBoxIcon.Information);
                dh.closeDb();
                return;
            }
        }
        //////////////////
        string sql = "select top 1 * from 雨伞总表 where 可借状态= 'Y' and 所在站点=" + indexselcet + ";";
        SqlDataReader reader = dh.queryDb(sql);
        //List<allumbrella> brow = new List<allumbrella>();
        if (reader.HasRows == true)
        {
            allumbrella outp = new allumbrella();
            while (reader.Read())
            {

                outp.ID = (int)reader[0];
                outp.outnum = (int)reader[2];
                outp.backnum = (int)reader[3];
                outp.state = (string)reader[5];
                outp.stay = (int)reader[4];
            }
            string timenow;
            DateTime t1 = new DateTime();
            t1 = DateTime.Now;
            timenow = t1.Year + "-" + t1.Month + "-" + t1.Day + " " + t1.Hour + ":" + t1.Minute + ":" + t1.Second + "." + t1.Millisecond;
            string sql1 = "insert into 雨伞借出表 (用户ID,雨伞ID,借出站点,借出时间) values ('" + userid + "'," + outp.ID + "," + indexselcet + ",'" + timenow + "');";
            int res1 = dh.DBhandle(sql1);
            string sql2 = "update 用户表 set 借伞状态='T' where 学工号= " + userid + ";";
            int res2 = dh.DBhandle(sql2);
            string sql3 = "update 站点雨伞情况表 set 雨伞余量=雨伞余量-1 where 站点=" + outp.stay + ";";
            int res3 = dh.DBhandle(sql3);
            string sql4 = "update 雨伞总表 set 借出次数=借出次数+1,可借状态='N',所在站点=0 where ID=" + outp.ID + ";";
            int res4 = dh.DBhandle(sql4);
            //MessageBox.Show("所借雨伞ID为" +  res1 +timenow+",锁具已开，请取伞！", "温馨提示", MessageBoxButtons.OKCancel, MessageBoxIcon.Information);
            if (res1 > 0 && res2 > 0 && res3 > 0 && res4 > 0)
            {
               // Session["userstate"] ="T";//应注释掉
                MessageBox.Show("所借雨伞ID为" + outp.ID + ",锁具已开，请取伞！", "温馨提示", MessageBoxButtons.OKCancel, MessageBoxIcon.Information);
                dh.closeDb();
                return;
            }
        }
        else
        {
            dh.closeDb();
            MessageBox.Show("无可借雨伞!", "温馨提示", MessageBoxButtons.OKCancel, MessageBoxIcon.Information);
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        int indexselcet = DropDownList1.SelectedIndex + 1;
        DBuser dh = new DBuser();
        //判断是否可以借伞
        string userid = (string)Request.Cookies["userid"].Value;
      //  string userid = (string)Session["userid"];
        string sqlx = "select 借伞状态 from 用户表 where 学工号='" + userid + "';";
        SqlDataReader reader0 = dh.queryDb(sqlx);
        if (reader0.HasRows)
        {
            //reader0.Read();
            //Session["userstate"] = (string)reader0[0];
            //if ((string)Session["userstate"] != "T")
            //{
            //    MessageBox.Show("无借伞记录!", "温馨提示", MessageBoxButtons.OKCancel, MessageBoxIcon.Information);
            //    return;
            //}
            reader0.Read();
            string state = (string)reader0[0];
            if (state != "T")
            {
                dh.closeDb();
                MessageBox.Show("无借伞记录!", "温馨提示", MessageBoxButtons.OKCancel, MessageBoxIcon.Information);
                return;
            }
        }
        //////////////////
        string sql = "select top 1 雨伞ID from 雨伞借出表 where 用户ID="+ userid +"order by ID DESC;";
        SqlDataReader reader = dh.queryDb(sql);
        //List<allumbrella> brow = new List<allumbrella>();
        if (reader.HasRows == true)
        {
            reader.Read();
            int umid =(int)reader[0];
            string timenow;
            DateTime t1 = new DateTime();
            t1 = DateTime.Now;
            timenow = t1.Year + "-" + t1.Month + "-" + t1.Day + " " + t1.Hour + ":" + t1.Minute + ":" + t1.Second + "." + t1.Millisecond;
            string sql1 = "insert into 雨伞归还表(用户ID,雨伞ID,归还站点,归还时间) values ('" + userid + "'," + umid + "," + indexselcet + ",'" + timenow + "');";
            int res1 = dh.DBhandle(sql1);
            string sql2 = "update 用户表 set 借伞状态='F' where 学工号= " + userid + ";";
            int res2 = dh.DBhandle(sql2);
            string sql3 = "update 站点雨伞情况表 set 雨伞余量=雨伞余量+1 where 站点=" + indexselcet+ ";";
            int res3 = dh.DBhandle(sql3);
            string sql4 = "update 雨伞总表 set 归还次数=归还次数+1,可借状态='Y',所在站点="+ indexselcet + "where ID=" +umid + ";";
            int res4 = dh.DBhandle(sql4);
            //MessageBox.Show("所借雨伞ID为" +  res1 +timenow+",锁具已开，请取伞！", "温馨提示", MessageBoxButtons.OKCancel, MessageBoxIcon.Information);
            if (res1 > 0 && res2 > 0 && res3 > 0 && res4 > 0)
            {
               // Session["userstate"] = 'F';//应注释掉
                MessageBox.Show("雨伞已还，锁具已上锁！", "温馨提示", MessageBoxButtons.OKCancel, MessageBoxIcon.Information);
                dh.closeDb();
                return;
            }
        }
        //else
        //{
        //    MessageBox.Show("无可借雨伞!", "温馨提示", MessageBoxButtons.OKCancel, MessageBoxIcon.Information);
        //}
    }
 }