<%@ WebHandler Language="C#" Class="buffhandle" %>

using System;
using System.Web;
using CUMTUAL.App_Code;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using Newtonsoft.Json;

public class buffhandle : IHttpHandler {

    public void ProcessRequest (HttpContext context) {

        DBuser dh = new DBuser();
        string sqloutum = "select count(*) from 雨伞借出表 group by 借出站点";
        string sqloutumall = "select count(借出站点) from 雨伞借出表";
        SqlDataReader reader = dh.queryDb(sqloutum);
        SqlDataReader reader1 = dh.queryDb(sqloutumall);
        int outumall;
        List<int> outum = new List<int>();
        if (reader.HasRows==true && reader1.HasRows==true)
        {
            reader1.Read();
            outumall=(int)reader1[0];
            while (reader.Read())
            {
                int outum1=(int)reader[0];
                float outum2 = outum1*1000 / outumall;
                int outum3 = (int)outum2;
                outum.Add(outum3);
            }
            dh.closeDb();
            string res = JsonConvert.SerializeObject(outum);
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