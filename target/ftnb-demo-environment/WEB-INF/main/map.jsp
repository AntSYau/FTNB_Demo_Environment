<%--
  Created by IntelliJ IDEA.
  User: leitianjian
  Date: 2020/5/25
  Time: 20:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
    <title>默认点标记</title>
    <link rel="stylesheet" href="https://a.amap.com/jsapi_demos/static/demo-center/css/demo-center.css"/>
    <style>
        html, body, #container {
            height: 100%;
            width: 100%;
        }

        .amap-icon img,
        .amap-marker-content img{
            width: 25px;
            height: 34px;
        }

        .marker {
            position: absolute;
            top: -20px;
            right: -118px;
            color: #fff;
            padding: 4px 10px;
            box-shadow: 1px 1px 1px rgba(10, 10, 10, .2);
            white-space: nowrap;
            font-size: 12px;
            font-family: "";
            background-color: #25A5F7;
            border-radius: 3px;
        }

        .input-card{
            width: 18rem;
            z-index: 170;
        }

        .input-card .btn{
            margin-right: .8rem;
        }

        .input-card .btn:last-child{
            margin-right: 0;
        }
    </style>
</head>
<body>
<div id="container"></div>
<div class="input-card">
    <label style="color:grey">点标记操作</label>
    <div class="input-item">
        <input id="addMarker" type="button" class="btn" onclick="addMarker()" value="添加点标记">
        <input id="updateMarkerIcon" type="button" class="btn" onclick="updateIcon()" value="更新点标记图标">
    </div>
    <div class="input-item">
        <input id="clearMarker" type="button" class="btn" onclick="clearMarker()" value="删除点标记">
        <input id="updateMarkerContent" type="button" class="btn" onclick="updateContent()" value="更新点标记内容">
    </div>
</div>
<script type="text/javascript"
        src="https://webapi.amap.com/maps?v=1.4.15&key=722e80c674abd54411dd85466c646ae1"></script>
<script type="text/javascript">
    var marker, map = new AMap.Map("container", {
        resizeEnable: true,
        center: [116.397428, 39.90923],
        zoom: 13
    });

    // 实例化点标记
    function addMarker() {
        marker = new AMap.Marker({
            icon: "//a.amap.com/jsapi_demos/static/demo-center/icons/poi-marker-default.png",
            position: [116.406315,39.908775],
            offset: new AMap.Pixel(-13, -30)
        });
        marker.setMap(map);
    }
    function updateIcon() {

        marker.setIcon('//a.amap.com/jsapi_demos/static/demo-center/icons/poi-marker-red.png')
    }

    function updateContent() {

        if (!marker) {
            return;
        }

        // 自定义点标记内容
        var markerContent = document.createElement("div");

        // 点标记中的图标
        var markerImg = document.createElement("img");
        markerImg.className = "markerlnglat";
        markerImg.src = "//a.amap.com/jsapi_demos/static/demo-center/icons/poi-marker-red.png";
        markerContent.appendChild(markerImg);

        // 点标记中的文本
        var markerSpan = document.createElement("span");
        markerSpan.className = 'marker';
        markerSpan.innerHTML = "Hi，我被更新啦！";
        markerContent.appendChild(markerSpan);

        marker.setContent(markerContent); //更新点标记内容
        marker.setPosition([116.391467, 39.927761]); //更新点标记位置
    }

    // 清除 marker
    function clearMarker() {

        if (marker) {
            marker.setMap(null);
            marker = null;
        }
    }
</script>
</body>
</html>
