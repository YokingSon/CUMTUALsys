var changeum = new Array();
var map;
var pointmark = new Array(
    [117.144602, 34.215582], [117.151511, 34.217511], [117.147986, 34.218927], [117.146844, 34.217463], [117.14878, 34.214255], [117.14252, 34.21363], [117.142493, 34.212721], [117.143967, 34.211903],
    [117.144862, 34.21184], [117.143419, 34.219936], [117.1438, 34.217488], [117.143537, 34.216835], [117.143028, 34.217155], [117.142819, 34.216104], [117.142255, 34.216254], [117.140694, 34.214604],
    [117.140313, 34.214861], [117.140254, 34.21413], [117.1399, 34.214413], [117.138972, 34.214666], [117.13843, 34.214045], [117.138001, 34.213429], [117.139755, 34.21275], [117.13916, 34.212754],
    [117.13975, 34.212009], [117.139149, 34.212031], [117.139278, 34.211215], [117.139637, 34.210421], [117.139648, 34.209582], [117.140684, 34.209937], [117.140694, 34.209241], [117.139852, 34.208296]);
//服务点的标注名称
var pointname = new Array("图书馆", "矿业学院", "建筑学院", "计算机学院", "信控学院", "博1楼", "博3楼", "博4楼",
    "博5楼", "体育馆", "桃苑1号楼", "桃苑2号楼", "桃苑3号楼", "桃苑4号楼", "桃苑5号楼", "松苑1号楼",
    "松苑2号楼", "松苑3号楼", "松苑4号楼", "杏苑1号楼", "杏苑2号楼", "杏苑3号楼", "竹苑1号楼", "竹苑2号楼",
    "竹苑3号楼", "竹苑4号楼", "梅苑1号楼", "梅苑2号楼", "梅苑3号楼", "研究生1号公寓", "研究生2号公寓", "研究生3号公寓"
    );
$(document).ready(function () {
    getdata();
    map = new AMap.Map('container', {
        zoom: 16,  //设置地图显示的缩放级别
        center: [117.14509, 34.214571],//设置地图中心点坐标
        layers: [new AMap.TileLayer, new AMap.TileLayer.RoadNet()],  //设置图层,可设置成包含一个或多个图层的数组
        mapStyle: 'amap://styles/whitesmoke',  //设置地图的显示样式
        viewMode: '2D',  //设置地图模式
        lang: 'zh_cn',  //设置地图语言类
        resizeEnable: true
    });
})
function funput() {
    $("#tips").empty();
    map.clearMap();
    var route;
    //绘制初始路径
    var path = [];
    path.push([117.144602, 34.215582]);
    var mesg = "从图书馆出发:" + '</br>';
    if (changeum[0] > 0) {
        var um =changeum[0];
        mesg = mesg + "在图书馆放置" + um + "把伞" + '</br>';
    }
    for (var i = 1; i < 32; i++) {
        if (changeum[i] >0) {
            path.push(pointmark[i]);
            mesg = mesg + "在" + pointname[i] + "放置" + changeum[i] + "把伞" + '</br>';           
        }
    }
    path.push([117.144602, 34.215582]);
    map.plugin("AMap.DragRoute", function () {
        route = new AMap.DragRoute(map, path, AMap.DrivingPolicy.LEAST_FEE); //构造拖拽导航类
        route.search(); //查询导航路径并开启拖拽导航
    });
    $("#tips").append(mesg);
}

function funget() {
    $("#tips").empty();
    map.clearMap();
    var route;
    var mesg = "从图书馆出发:" + '</br>';
     var path = [];
     path.push([117.144602, 34.215582]);
    for (var i = 1; i < 32; i++)
    {
        if(changeum[i]<0)
        {
            var ums = -changeum[i];
            mesg = mesg + "在" + pointname[i] + "取走" + ums + "把伞" + '</br>';
            path.push(pointmark[i]);
        }
    }
    if (changeum[0] < 0)
    {
        var um=-changeum[0];
        mesg = mesg + "最后在图书馆取走" + um + "把伞" + '</br>';
    }
    path.push([117.144602, 34.215582]);
    map.plugin("AMap.DragRoute", function () {
        route = new AMap.DragRoute(map, path, AMap.DrivingPolicy.LEAST_FEE); //构造拖拽导航类
        route.search(); //查询导航路径并开启拖拽导航
    });
    $("#tips").append(mesg);
}
function getdata()
{
    $.ajax({
        type: "GET",
        url: "sourceset.ashx",
        data: "",
        success: function (res, status, xhr) {
            //会有data返回值，status请求状态，xhr封装的是请求头
            if (res != "error") {
               var thisdata= eval("(" + res + ")");
                //把返回的josn格式数据转换为对象
                for (var i = 0; i < thisdata.length; i++) {
                    changeum.push(thisdata[i]);
                }
            }
        }
    })
}