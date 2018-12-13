using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// allumbrella 的摘要说明
/// </summary>////
namespace CUMTUAL.App_Code
{
    public class allumbrella
    {
        public int ID { get; set; }//雨伞ID
        public int outnum { get; set; }//借出次数
        public int backnum { get; set; }//归还次数
        public string state { get; set; }//可借状态
        public int stay { get; set; }//所在站点
    }
}