<template>
  <div id="container"></div>
</template>

<script>
import AMapLoader from "@amap/amap-jsapi-loader";
export default {
  data() {
    return {
      map: null,
    };
  },
  methods: {
    initMap() {
      AMapLoader.load({
        key: "0b7fff62bb4d6f79bae15c1a1483e327", // 申请好的Web端开发者Key，首次调用 load 时必填
        version: "2.0", // 指定要加载的 JSAPI 的版本，缺省时默认为 1.4.15
        plugins: ["AMap.Marker"], // 需要使用的的插件列表，如比例尺'AMap.Scale'等
      })
        .then((AMap) => {
          geoloc.getCurrentPosition(function (res) {
            let lat = res.coords.latitude; //获取纬度
            let lng = res.coords.longitude; //获取经度
            //  添加地图
            this.map = new AMap.Map("container", {
              //设置地图容器id
              viewMode: "3D", //是否为3D地图模式
              zoom: 5, //初始化地图级别
              center: [lng, lat], //初始化地图中心点位置
            });
            var marker = new AMap.Marker({
              position: [lng, lat], //位置
            });
            map.add(marker); //添加到地图
          });
        })
        .catch((e) => {
          console.log(e);
        });
    },
  },
  mounted() {
    this.initMap();
  },
};
</script>

<style scoped>
#container {
  padding: 0px;
  margin: 0px;
  width: 100%;
  height: 800px;
  border: 1px solid blue;
}
</style>