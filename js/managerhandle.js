// JavaScript Document
var map;//地图
var umlist;//雨伞使用统计
var infolist;//服务点信息字符串数组
$(document).ready(function () {
    mangerpageinit();
    var baseinfo = infolist[0] + "号服务点;" + '</br>' + "失物统计:" + infolist[1] + ';</br>' + "归还统计:" + infolist[2] + ';</br>' + "借出雨伞统计:" + infolist[3] + ';</br>' + "剩余雨伞:" + infolist[4] + ';</br>';
    $("#info").append(baseinfo);
})
//获取管理服务点的基本信息
function mangerpageinit() {
    $.ajax({
        type: "GET",
        url: "maninit.ashx",
        data: "",
        success: function (res, status, xhr) {
            if (res != "error") {
                 infolist = eval("(" + res + ")");
            }
        }
    })
    alert("登录成功，欢迎管理员！");
}
require([
  "dojo/parser",
  "esri/map",
  "esri/geometry/Point",
  "esri/symbols/SimpleMarkerSymbol",
  "esri/graphic",
  "dojo/_base/array",
  "esri/SpatialReference",
  "dijit/layout/BorderContainer",
  "dijit/layout/ContentPane",
  "dijit/layout/AccordionContainer",
  "dojo/domReady!"
], function (parser, Map, Point, SimpleMarkerSymbol, Graphic, arrayUtils, Polyline, Polygon, domStyleColor, BufferParameters, GeometryService, SimpleFillSymbol, SimpleLineSymbol, SpatialReference)
{
    parser.parse();
    map = new Map("mapDiv", {
        basemap: "osm",
        center: [117.13873, 34.21660],
        zoom: "16"
    });

    map.on("load", mapLoaded);
    function mapLoaded() {//加载并且标识服务点
        var points = [
        [117.13873, 34.21660], [117.14537, 34.21909],
        [117.14338, 34.21824], [117.14091, 34.21856],
        [117.14294, 34.21540], [117.13659, 34.21465],
        [117.13667, 34.21354], [117.13829, 34.21300],
        [117.13907, 34.21301], [117.13828, 34.22150],
        [117.13791, 34.21865], [117.13765, 34.21798],
        [117.13697, 34.21835], [117.13695, 34.21726],
        [117.13618, 34.21750], [117.13480, 34.21575],
        [117.13443, 34.21602], [117.13435, 34.21524],
        [117.13398, 34.21550], [117.13311, 34.21579],
        [117.13260, 34.21520], [117.13212, 34.21458],
        [117.13391, 34.21388], [117.13333, 34.21386],
        [117.13392, 34.21306], [117.13331, 34.21308],
        [117.13338, 34.21223], [117.13379, 34.21155],
        [117.13373, 34.21066], [117.13481, 34.21103],
        [117.13480, 34.21035], [117.13382, 34.20963]];
        //标识符号
        var iconPath = "M24.0,2.199C11.9595,2.199,2.199,11.9595,2.199,24.0c0.0,12.0405,9.7605,21.801,21.801,21.801c12.0405,0.0,21.801-9.7605,21.801-21.801C45.801,11.9595,36.0405,2.199,24.0,2.199zM31.0935,11.0625c1.401,0.0,2.532,2.2245,2.532,4.968S32.4915,21.0,31.0935,21.0c-1.398,0.0-2.532-2.2245-2.532-4.968S29.697,11.0625,31.0935,11.0625zM16.656,11.0625c1.398,0.0,2.532,2.2245,2.532,4.968S18.0555,21.0,16.656,21.0s-2.532-2.2245-2.532-4.968S15.258,11.0625,16.656,11.0625zM24.0315,39.0c-4.3095,0.0-8.3445-2.6355-11.8185-7.2165c3.5955,2.346,7.5315,3.654,11.661,3.654c4.3845,0.0,8.5515-1.47,12.3225-4.101C32.649,36.198,28.485,39.0,24.0315,39.0z";
        var initColor = "#ce641d";
        arrayUtils.forEach(points, function (point) {
            var graphic = new Graphic(new Point(point), createSymbol(iconPath, initColor));
            map.graphics.add(graphic);
        });
    }

    function createSymbol(path, color) {
        var markerSymbol = new esri.symbol.SimpleMarkerSymbol();
        markerSymbol.setPath(path);
        markerSymbol.setColor(new dojo.Color(color));
        markerSymbol.setOutline(null);
        return markerSymbol;
    }
});
//缓冲区
function pointbuffer() {
bufferhandle();
 require([
 "esri/geometry/Point",
 "esri/geometry/Polyline",
 "esri/graphic",
 "esri/Color",
 "esri/tasks/GeometryService",
 "esri/symbols/SimpleMarkerSymbol",
 "esri/symbols/SimpleLineSymbol",
 "esri/SpatialReference",
 "dojo/domReady!"], function (Point, Polyline, Graphic, Color, GeometryService, SimpleMarkerSymbol, SimpleLineSymbol, SpatialReference)
 {
     var pointsm = [
new Point(117.13873, 34.21660), new Point(117.14537, 34.21909),
new Point(117.14338, 34.21824), new Point(117.14091, 34.21856),
new Point(117.14294, 34.21540), new Point(117.13659, 34.21465),
new Point(117.13667, 34.21354), new Point(117.13829, 34.21300),
new Point(117.13907, 34.21301), new Point(117.13828, 34.22150),
new Point(117.13791, 34.21865), new Point(117.13765, 34.21798),
new Point(117.13697, 34.21835), new Point(117.13695, 34.21726),
new Point(117.13618, 34.21750), new Point(117.13480, 34.21575),
new Point(117.13443, 34.21602), new Point(117.13435, 34.21524),
new Point(117.13398, 34.21550), new Point(117.13311, 34.21579),
new Point(117.13260, 34.21520), new Point(117.13212, 34.21458),
new Point(117.13391, 34.21388), new Point(117.13333, 34.21386),
new Point(117.13392, 34.21306), new Point(117.13331, 34.21308),
new Point(117.13338, 34.21223), new Point(117.13379, 34.21155),
new Point(117.13373, 34.21066), new Point(117.13481, 34.21103),
new Point(117.13480, 34.21035), new Point(117.13382, 34.20963)];
     var geometryService = new GeometryService(" https://localhost:6443/arcgis/rest/services/Utilities/Geometry/GeometryServer");
     for (var i = 0; i < pointsm.length; i++) {
         var markerSymbol = new SimpleMarkerSymbol(SimpleMarkerSymbol.STYLE_CIRCLE, umlist[i],
         new SimpleLineSymbol(SimpleLineSymbol.STYLE_SOLID, new Color([100, 100, 100, 0.1]), 1),
         new Color([255, 0, 0]));
         map.graphics.add(new Graphic(pointsm[i], markerSymbol))
     }
 })
}
//获取点缓冲区的半径
function bufferhandle() {
    $.ajax({
        type: "GET",
        url: "buffhandle.ashx",
        data: "",
        success: function (res, status, xhr) {
            if (res != "error") {
                umlist = eval("(" + res + ")");
            }
        }
    })
}
//显示大地坐标
function showLandB(){
    require(["dojo/string", "dojo/domReady!"],
             function (string) {
                 map.on('mouse-move', showCoordinates);
                 map.on('mouse-drag', showCoordinates);

                 function showCoordinates(event) {
                     var level = map.getLevel();
                     var pres = Math.min(6, level);
                     var x = event.mapPoint.x.toFixed(pres);
                     var y = event.mapPoint.y.toFixed(pres);
                     document.getElementById('LandB').innerHTML = string.substitute('${0}, ${1}', [x, y]);
                 }

             });
}


