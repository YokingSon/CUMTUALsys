<%@ WebHandler Language="C#" Class="guiji" %>

using System;
using System.Web;
using CUMTUAL.App_Code;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using Newtonsoft.Json;

public class guiji : IHttpHandler {
    public void ProcessRequest (HttpContext context) {
        string umid =HttpContext.Current.Request["umid"];
        int umtradeid = Convert.ToInt32(umid);
        DBuser dh = new DBuser();
        string sql = "select 借出站点 from 雨伞借出表 where 雨伞ID='"+umtradeid+"' order by 借出时间;";
        string sql1 = "select 归还站点 from 雨伞归还表 where 雨伞ID='"+umtradeid+"' order by 归还时间;";
        SqlDataReader reader = dh.queryDb(sql);
        SqlDataReader reader1 = dh.queryDb(sql1);
        List<int> lostlist = new List<int>();
        if (reader.HasRows==true && reader1.HasRows==true)
        {    //获得查询雨伞的借出归还使用轨迹
            while (reader.Read() && reader1.Read())
            {
                int outum=(int)reader[0];
                lostlist.Add(outum);
                int inum=(int)reader1[0];
                lostlist.Add(inum);
            }
            dh.closeDb();
            string res = JsonConvert.SerializeObject(lostlist);
            //JOSN格式实例化
            context.Response.Write(res);
        }
        else
        {
            context.Response.Write("error");
        }
    }
    public bool IsReusable {
        get {
            return false;
        }
    }

}