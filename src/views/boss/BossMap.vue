<template>
  <div>
    <div id="container"></div>
    <!-- views/Container.vue -->
  </div>
</template>
<script>
import AMapLoader from "@amap/amap-jsapi-loader";
window._AMapSecurityConfig = {
  securityJsCode: "0b7fff62bb4d6f79bae15c1a1483e327",
};
export default {
  data() {
    return {
      map: null,
    };
  },
  mounted() {
    AMapLoader.load({
      key: "7bfbe3ab215345f405c23b5eed760ca8", // 申请好的Web端开发者Key，首次调用 load 时必填
      version: "2.0", // 指定要加载的 JSAPI 的版本，缺省时默认为 1.4.15
      plugins: [
        "AMap.Scale",
        "AMap.ToolBar",
        "AMap.Scale",
        "AMap.HawkEye",
        "AMap.MapType",
        "AMap.Geolocation",
      ], // 需要使用的的插件列表，如比例尺'AMap.Scale'等
    })
      .then((AMap) => {
        this.map = new AMap.Map("container", {
          //设置地图容器id
          viewMode: "3D", //是否为3D地图模式
          zoom: 11, //初始化地图级别
          center: [121.473701, 31.230416], //初始化地图中心点位置
        });
        var marker = new AMap.Marker({
          position: [121.473701, 31.230416], // 指定标记的经纬度坐标位置
        });
        this.map.add(marker);

        this.map.addControl(new AMap.ToolBar({ position: "LT" }));

        // 在图面添加比例尺控件，展示地图在当前层级和纬度下的比例尺
        this.map.addControl(new AMap.Scale());

        // 在图面添加鹰眼控件，在地图右下角显示地图的缩略图
        this.map.addControl(new AMap.HawkEye({ isOpen: false }));

        // 在图面添加类别切换控件，实现默认图层与卫星图、实施交通图层之间切换的控制
        this.map.addControl(new AMap.MapType());

        // 在图面添加定位控件，用来获取和展示用户主机所在的经纬度位置
        this.map.addControl(new AMap.Geolocation({ position: "RB" }));
      })
      .catch((e) => {
        console.log(e);
      });
  },
};
</script>
<style scoped>
#container {
  width: 100vw;
  height: 80vh;
  border: 1px solid black;
  margin-bottom: 20px;
}
</style>
