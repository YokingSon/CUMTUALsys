<%@ WebHandler Language="C#" Class="sourceset" %>

using System;
using System.Web;
using CUMTUAL.App_Code;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using Newtonsoft.Json;

public class sourceset : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        DBuser dh = new DBuser();
        string sqloutum = "select count(*) from 雨伞借出表 group by 借出站点";
        string sqlnow = "select * from 站点雨伞情况表 order by 站点 ASC";
        string sqloutumall = "select count(借出站点) from 雨伞借出表";
        SqlDataReader reader = dh.queryDb(sqloutum);
        SqlDataReader reader1 = dh.queryDb(sqloutumall);
        SqlDataReader reader2 = dh.queryDb(sqlnow);
        int outumall;
        List<int> outum = new List<int>();
        List<int> transfer = new List<int>();
        if (reader.HasRows==true && reader1.HasRows==true && reader2.HasRows)
        {
            reader1.Read();
            outumall=(int)reader1[0];
            int sum=0;
            while (reader.Read() && reader2.Read())
            {
                int outum1=(int)reader[0];
                float outum2 = outum1*640 / outumall;
                int outum3 = (int)outum2;
                int now = outum3-(int)reader2[1];
                transfer.Add(now);
                outum.Add(outum3);
                sum = sum + outum3;
            }
            outum[31] = outum[31] - sum + 640;
            transfer[31]=transfer[31] - sum + 640;
            dh.closeDb();
            string res = JsonConvert.SerializeObject(transfer);
           // string res1 = JsonConvert.SerializeObject(transfer);
            //JOSN格式实例化
            context.Response.Write(res);
            //context.Response.Write(res1);
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