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
public partial class lostquery : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    //查询按钮的单击事件
    protected void lostbtn_Click(object sender, EventArgs e)
    {
        ListBox1.Visible = true;
        ListBox1.Items.Clear();//清空数据
        int indexselcet1 = DropDownList1.SelectedIndex;
        int indexselect2 = DropDownList2.SelectedIndex;
        string type = DropDownList1.SelectedValue;
        string area = DropDownList2.SelectedValue;
        string sqlsearch="";
        string searchtime = losttime.Text.Trim();
        //判断查询条件
        if (indexselcet1 == 0 && indexselect2 == 0 && searchtime == "")
            sqlsearch = "select 编号,类型,收入站点,失物属性,捡拾地 from 失物登记表 where 失物状态='Y';";
        if(indexselcet1 !=0 && indexselect2 == 0 && searchtime == "")
            sqlsearch = "select 编号,类型,收入站点,失物属性,捡拾地 from 失物登记表 where 失物状态='Y' and 类型='"+ type+"';";
        if (indexselcet1 == 0 && indexselect2 != 0 && searchtime == "")
            sqlsearch = "select 编号,类型,收入站点,失物属性,捡拾地 from 失物登记表 where 失物状态='Y' and 捡拾地='"+area+"';";
        if (indexselcet1 == 0 && indexselect2 == 0 && searchtime != "")
            sqlsearch = "select 编号,类型,收入站点,失物属性,捡拾地 from 失物登记表 where 失物状态='Y' and 登记时间>='"+ searchtime+"';";
        if (indexselcet1 == 0 && indexselect2 != 0 && searchtime != "")
            sqlsearch = "select 编号,类型,收入站点,失物属性,捡拾地 from 失物登记表 where 失物状态='Y' and 捡拾地='" + area + "' and  登记时间>='" + searchtime + "';";
        if (indexselcet1 != 0 && indexselect2 == 0 && searchtime != "")
            sqlsearch = "select 编号,类型,收入站点,失物属性,捡拾地 from 失物登记表 where 失物状态='Y' and 类型='" + type + "' and  登记时间>='" + searchtime + "';";
        if (indexselcet1 != 0 && indexselect2 != 0 && searchtime == "")
            sqlsearch = "select 编号,类型,收入站点,失物属性,捡拾地 from 失物登记表 where 失物状态='Y' and 捡拾地='" + area + "' and 类型='" + type + "';";
        if (indexselcet1 != 0 && indexselect2 != 0 && searchtime != "")
            sqlsearch = "select 编号,类型,收入站点,失物属性,捡拾地 from 失物登记表 where 失物状态='Y' and 捡拾地='" + area + "' and 类型='" + type + "' and  登记时间>='" + searchtime + "';";
        DBuser dh = new DBuser();
        DataTable losttable = dh.DTquery(sqlsearch);
        dh.closeDb();
        ListBox1.Items.Add("编号\t\t类型\t\t所在站点\t\t失物属性\t\t捡拾地");
        ListBox1.Items.Add("======================================");
        for (int i=0;i<losttable.Rows.Count;i++)
        {
            ListBox1.Items .Add (string.Format("{0}\t\t{1}\t\t{2}\t\t{3}\t\t{4}",
            losttable.Rows[i].ItemArray[0].ToString(),
            losttable.Rows[i].ItemArray[1].ToString(),
            losttable.Rows[i].ItemArray[2].ToString(),
            losttable.Rows[i].ItemArray[3].ToString(),
            losttable.Rows[i].ItemArray[4].ToString()
            ));
        }
    }
}