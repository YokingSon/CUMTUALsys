<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manager.aspx.cs" Inherits="manager" %>

<!DOCTYPE html>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="initial-scale=1, maximum-scale=1,user-scalable=no">
<title>manager</title>
 <link rel="stylesheet" href="http://js.arcgis.com/3.9/js/dojo/dijit/themes/tundra/tundra.css" />
<link rel="stylesheet" href="https://js.arcgis.com/3.21/esri/css/esri.css">
    <link rel="stylesheet" type="text/css" href="css/component.css" />
<style type="text/css">
    html, body, #main{	
            width: 100%;
            height: 100%;
            margin: 0;
        }
</style>
<script type="text/javascript">
	    dojoConfig = {
	        isDebug: true,
	        async: true
	    };
</script>		

</head>
<body class="tundra">

    <div data-dojo-type="dijit/layout/BorderContainer" data-dojo-props="design:'headline',gutters:false"  id="main">
        <div data-dojo-type="dijit/layout/ContentPane" data-dojo-props="region:'top'" 
            style="background-color: #b39b86; height: 10%;">

     <div class="pc">
   <a href="index.html"><img src="images/返回.png" /></a>
    </div>

            <h1 style="position:absolute;top:-10px; left:42%;">管理员管理系统</h1>
        </div>
        <div data-dojo-type="dijit/layout/ContentPane" data-dojo-props="region:'left', splitter:'true'"
            style="background-color: #acb386; width: 150px;">
            
            <button onclick="javascript:window.location.href='losthandle.aspx'">失物管理</button>
            <button onclick="pointbuffer()">服务点能力分析</button>
            <button onclick="javascript:window.location.href='routeresult.html'">资源配置</button>
            <p style="position:absolute;top:110px;">基本信息：</p></br>
            <div id="info" style="position:absolute;top:150px;"></div>
            <div id="LandB"style="position:absolute;top:450px;" onclick="showLandB()">单击显示坐标</div>
        </div>
        <div id="mapDiv" data-dojo-type="dijit/layout/ContentPane" data-dojo-props="region:'center'"
            style="background-color: #f5ffbf; padding: 10px;">            
        </div> 
        <div data-dojo-type="dijit/layout/ContentPane" data-dojo-props="region:'bottom', splitter:'true'"
            style="background-color: #b39b86; height: 50px;">
           <p align="right"> Copyright © 2018 CUMTUandL jclandsyq. All rights reserved. </p>
        </div>
    </div>
</body> 
<script type="text/javascript" src="https://js.arcgis.com/3.21/"></script>
<script src="http://js.arcgis.com/3.9/"></script>
<script src="https://js.arcgis.com/3.25/"></script>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/managerhandle.js"></script>
</html>