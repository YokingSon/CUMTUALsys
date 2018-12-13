var map;//高德地图
var geolocation;//加载浏览器定位服务
var userlocation;//用户坐标
var walking;//步行线路
var infowindow1;//显示导航窗口
var tradeum = new Array();//显示雨伞轨迹
//服务点的经纬度坐标
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
var marker = new Array(32);//标注数组
$(document).ready(function () {
    init();//初始化失物最新信息
       //设置菜单的隐藏与显示
		$(".menubar").mouseover(function(){//当鼠标移到元素上时
		    $(this).find(".menu").show();//显示当前的子菜单
		    $("#clearroute").hide();//隐藏清除路径按钮
		}).mouseout(function(){//当鼠标移出元素时
		    $(this).find(".menu").hide();//将该子菜单隐藏
		    $("#clearroute").show();//显示清除路径按钮
		});
       //失物公告滚动效果
		(function($){
             $.fn.extend({
              Scroll:function(opt,callback){
              //参数初始化
                 if(!opt) var opt={};
                 var _this=this.eq(0).find("ul:first");
                 var lineH=_this.find("li:first").height(), //获取行高
                 line=opt.line?parseInt(opt.line,10):parseInt(this.height()/lineH,10), //每次滚动的行数，默认为一屏，即父容器高度
                 speed=opt.speed?parseInt(opt.speed,10):500, //卷动速度，数值越大，速度越慢（毫秒）
                 timer=opt.timer?parseInt(opt.timer,10):3000; //滚动的时间间隔（毫秒）
                 if(line==0) line=1;
                 var upHeight=0-line*lineH;
                //滚动函数
               scrollUp=function(){
                   _this.animate({
                   marginTop:upHeight
                  },speed,function(){
                    for(i=1;i<=line;i++){
                       _this.find("li:first").appendTo(_this);
                    }
                  _this.css({marginTop:0});
              });
          }
           //鼠标事件绑定
                  _this.hover(function () {                     
                     clearInterval(timerID);
                },function(){
              timerID=setInterval("scrollUp()",timer);
                         }).mouseout();
                 } 
        })
})(jQuery);

$(document).ready(function(){
 $("#scrollDiv").Scroll({line:1,speed:500,timer:1000});//可修改line值，speed值，timer值
});
	});// JavaScript Document
//加载地图
window.onload=function(){
    map = new AMap.Map('rightcolumn',{
    zoom: 16,  //设置地图显示的缩放级别
    center: [117.14509,34.214571],//设置地图中心点坐标
    layers: [new AMap.TileLayer,new AMap.TileLayer.RoadNet()],  //设置图层,可设置成包含一个或多个图层的数组
    mapStyle: 'amap://styles/whitesmoke',  //设置地图的显示样式
    viewMode: '2D',  //设置地图模式
    lang:'zh_cn',  //设置地图语言类型
});
     walking = new AMap.Walking({
        map: map
     });
    AMap.service('AMap.Weather', function() {
        var weather = new AMap.Weather();
        //未来4天天气预报
        weather.getForecast('铜山区', function(err, data) {
            if (err) {return;}
            var str = [];
            for (var i = 0,dayWeather; i < data.forecasts.length; i++) {
                dayWeather = data.forecasts[i];
                str.push('<div class="weather">'+dayWeather.date+dayWeather.dayWeather+ dayWeather.nightTemp + '~' + dayWeather.dayTemp + '℃' +'</div>');
            }
            document.getElementById('tip').innerHTML = str.join('<br>');
        });
    });
    //显示高德地图窗口导航方式
    var content = '<div class="info-title">高德地图</div><div class="info-content">' +
          '<img src="images/amap.jpg">' +
          '高德是中国领先的数字地图内容、导航和位置服务解决方案提供商。<br/>' +
          '<a target="_blank" href = "https://mobile.amap.com/">点击下载高德地图</a></div>';
    infowindow1 = new AMap.AdvancedInfoWindow({
        content: content,
        offset: new AMap.Pixel(0, -30)
    });
    umbrella();//初始化雨伞数量
    userpoint();//获取用户位置
}
//初始化失物信息
function init() {
    $.ajax({
        type: "GET",
        url: "init.ashx",
        data: "",
        success: function (res, status, xhr) {
            //会有data返回值，status请求状态，xhr封装的是请求头
            if (res != "error") {
                var lostList = eval("(" + res + ")");
                //把返回的josn格式数据转换为对象，
                for (var i = 0; i < lostList.length; i++) {
                    $("#lostput").append("<li>" + lostList[i].type + lostList[i].attribute + lostList[i].location + lostList[i].getlocation + "</li>");    
                }
            }
        }
    })
}
//初始化雨伞信息
function umbrella()
{
    $.ajax({
        type: "GET",
        url: "uminit.ashx",//一般处理程序，获得数据库相关信息
        data: "",
        success: function (res, status, xhr) {
            //会有data返回值，status请求状态，xhr封装的是请求头
            if (res != "error") {
                var umlist = eval("(" + res + ")");
                //把返回的josn格式数据转换为对象，
                for (var i = 0; i <32; i++) {
                        marker[i] = new AMap.Marker({ //添加自定义点标记
                        map: map,
                        position: pointmark[i], //基点位置
                        offset: new AMap.Pixel(-17, -42), //相对于基点的偏移位置
                        draggable: false,  //是否可拖动
                        content: pointname[i] +":可用"+ umlist[i].umnum //自定义点标记覆盖物内容
                    });
                }
            }
        }
    })
}
//雨伞出借设置控件的显示方式
function broum() {
    $("#searchstyle").show();
    $("#Button2").hide();
    $("#Button1").show();
    $("#button3").hide();
    $("#button4").hide();
    $("#text1").hide();
    $("#text2").hide();
}
//雨伞归还设置控件的显示方式
function retum() {
    $("#searchstyle").show();
    $("#Button1").hide();
    $("#Button2").show();
    $("#button3").hide();
    $("#button4").hide();
    $("#text1").hide();
    $("#text2").hide();
}
//服务点导航设置控件的显示方式
function daohang1() {
    $("#searchstyle").show();
    $("#Button1").hide();
    $("#Button2").hide();
    $("#button3").show();
    $("#button4").hide();
    $("#text1").hide();
    $("#text2").hide();
    $("#DropDownList1").show();
}
//两点导航设置控件的显示方式
function daohang2() {
    $("#searchstyle").show();
    $("#Button1").hide();
    $("#Button2").hide();
    $("#button4").show();
    $("#button3").hide();
    $("#DropDownList1").hide();
    $("#text1").show();
    $("#text2").show();
}
//高德导航窗口设置的空间显示
function daohang3() {
    $("#searchstyle").hide();
    $("#Button1").hide();
    $("#Button2").hide();
    $("#button4").hide();
    $("#button3").hide();
    $("#DropDownList1").hide();
    $("#text1").hide();
    $("#text2").hide();
    infowindow1.clear();
    infowindow1.open(map, userlocation);//显示高德导航窗口  
}
function leadto() {
    //根据起终点坐标规划步行路线
    var ddl = document.getElementById("DropDownList1");
    var sindex= ddl.selectedIndex; 
    walking.clear();
    walking.search(userlocation, pointmark[sindex]);
}
//两个位置的导航方式
function AtoB() {
    var start = $("#text1").val();
    var end = $("#text2").val();
    walking.clear();
    walking.search([
       { keyword: start, city: '徐州' },
       { keyword: end, city: '徐州' }
      ]);
}

//获取用户位置
function userpoint()
{
map.plugin('AMap.Geolocation', function () {
    geolocation = new AMap.Geolocation({
        enableHighAccuracy: true,//是否使用高精度定位，默认:true
        timeout: 10000,          //超过10秒后停止定位，默认：无穷大
        buttonOffset: new AMap.Pixel(10, 20)//定位按钮与设置的停靠位置的偏移量，默认：Pixel(10, 20)
       // zoomToAccuracy: true     //定位成功后调整地图视野范围使定位位置及精度范围视野内可见，默认：false
    });
    map.addControl(geolocation);
    geolocation.getCurrentPosition();
    AMap.event.addListener(geolocation, 'complete', onComplete);//返回定位信息
    AMap.event.addListener(geolocation, 'error', onError);      //返回定位出错信息
});
//解析定位结果
function onComplete(data) {
    userlocation = [data.position.getLng(), data.position.getLat()];
}
//解析定位错误信息
function onError(data) {
    alert("定位失败");
}
}
var pathSimplifierIns;
function qc() {//清除查询规划结果以及轨迹
    infowindow1.clear();
    walking.clear();
    pathSimplifierIns.clearPathNavigators();
}
function trade() {
    var umtradeid = window.prompt("请输入雨伞的ID(1-640)", "384");
    ////////////////////////////////////////////////////////////
    ////////Ajax数据库处理
    $.ajax({
        type: "GET",
        url: "guiji.ashx",
        data:{ "umid": umtradeid },
        success: function (res, status, xhr) {
            //会有data返回值，status请求状态，xhr封装的是请求头
            if (res != "error") {
                var tradelist = eval("(" + res + ")");
                //把返回的josn格式数据转换为对象
                for (var i = 0; i < tradelist.length; i++) {
                    tradeum.push(pointmark[tradelist[i]]);
                }
            }
        }
    })

    //////////////////////////////////////////////////////////////////////////
    AMapUI.load(['ui/misc/PathSimplifier', 'lib/$'], function (PathSimplifier, $) {

        if (!PathSimplifier.supportCanvas) {
            alert('当前环境不支持 Canvas！');
            return;
        }

        var emptyLineStyle = {
            lineWidth: 0,
            fillStyle: null,
            strokeStyle: null,
            borderStyle: null
        };

         pathSimplifierIns = new PathSimplifier({
            zIndex: 100,
            //autoSetFitView:false,
            map: map, //所属的地图实例

            getPath: function (pathData, pathIndex) {

                return pathData.path;
            },
            getHoverTitle: function (pathData, pathIndex, pointIndex) {

                return null;
            },
            renderOptions: {
                //将点、线相关的style全部置emptyLineStyle
                pathLineStyle: emptyLineStyle,
                pathLineSelectedStyle: emptyLineStyle,
                pathLineHoverStyle: emptyLineStyle,
                keyPointStyle: emptyLineStyle,
                startPointStyle: emptyLineStyle,
                endPointStyle: emptyLineStyle,
                keyPointHoverStyle: emptyLineStyle,
                keyPointOnSelectedPathLineStyle: emptyLineStyle
            }
        });

        window.pathSimplifierIns = pathSimplifierIns;

        pathSimplifierIns.setData([{
            name: '测试',
            path: tradeum
        }]);

        //initRoutesContainer(d);

        function onload() {
            pathSimplifierIns.renderLater();
        }

        function onerror(e) {
            alert('图片加载失败！');
        }

        var navg1 = pathSimplifierIns.createPathNavigator(0, {
            loop: true,
            speed: 1000,
            pathNavigatorStyle: {
                width: 24,
                height: 24,
                //使用图片
                content: PathSimplifier.Render.Canvas.getImageContent('images/umfly.png', onload, onerror),
                strokeStyle: null,
                fillStyle: null,
                //经过路径的样式
                pathLinePassedStyle: {
                    lineWidth: 6,
                    strokeStyle: 'black',
                    dirArrowStyle: {
                        stepSpace: 15,
                        strokeStyle: 'red'
                    }
                }
            }
        });
        navg1.start();//开始绘制轨迹
    });
}