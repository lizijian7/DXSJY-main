<template>
  <div>
    <!-- 返回 -->
    <div>
      <mt-header title="公司信息">
        <router-link to="/empindex/empindexcell" slot="left">
          <mt-button icon="back">返回</mt-button>
        </router-link>
        <mt-button slot="right"></mt-button>
      </mt-header>
    </div>
    <div class="detail">
      <!-- 职位描叙 -->
      <div class="tixing">
        <h3>职位描叙</h3>
        <span v-html="data.zwmiaoxu"></span>
      </div>

      <div>
        <span></span>
      </div>
      <br />
      <!-- 任职要求 -->
      <div>
        <h4>任职要求：</h4>
        <span class="tixing" v-html="data.yaoqiu"></span>
      </div>
      <!-- 职位福利 -->
      <div>
        <div><h4>职位福利</h4></div>
        <div><span v-html="data.fuli"></span></div>
      </div>
      <br />
      <!-- 地图 -->
      <div>
        <h4>公司地址</h4>
      </div>
      <br />
      <div id="container"></div>
      <br />
      <br />

      <br />
      <!-- 投递特权 -->
      <div>
        <div>
          <h4>&nbsp;投递特权</h4>
          <br />
          <span class="tixing"
            >使用投递特权，超越该职位???位竞争者，更可获得HR快速反馈</span
          >
        </div>
        <div>
          <img
            style="width: 100%"
            src="../../../assets/rem-zhiQ-imgs/tu1.jpg"
            alt=""
          />
        </div>
      </div>
      <br />
      <!-- 提醒 -->
      <div class="tixing">
        <div>
          <div>
            &nbsp;
            <van-icon name="warn-o" color="red" />
            智联提醒：
          </div>
          <div>
            <span
              >用人单位若存在以下违法行为，请您提高警惕，立即报警或向平台</span
            >
          </div>
          <div><span>举报：</span></div>
          <div>
            <span
              >(一)
              强迫或者要求您投资入股，购买虚拟货币(如比特币),转账,汇款等;</span
            >
          </div>
          <div>
            <span
              >(二) 要求您提供担保人，担保金或者以其他名义向您收取财物;</span
            >
          </div>
          <div>
            <span
              >(三) 以招聘名义向您牟取任何不正当利益(财产权益，人身权益)</span
            >
          </div>
          <div><span>(四) 扣押您的身份证件或者其他证件;</span></div>
          <div><span>(五) 要求您添加微信，QQ进行转账，汇款</span></div>
          <div><span>(六) 其他损害您合法权益的行为等</span></div>
        </div>
      </div>
      <br />
      <br />
      <!-- 投递 -->
      <div>
        <button class="indexbtn" @click="send">立即投递</button>
      </div>
    </div>
  </div>
</template>

<script>
import AMapLoader from "@amap/amap-jsapi-loader";
window._AMapSecurityConfig = {
  securityJsCode: "0b7fff62bb4d6f79bae15c1a1483e327",
};
export default {
  props: ["id"],
  data() {
    return {
      data: [],
      map: null,
    };
  },
  mounted() {
    this.getData();
    // 地图

    AMapLoader.load({
      key: "7bfbe3ab215345f405c23b5eed760ca8", // 申请好的Web端开发者Key，首次调用 load 时必填
      version: "2.0", // 指定要加载的 JSAPI 的版本，缺省时默认为 1.4.15
      plugins: ["AMap.Scale", "AMap.Weather"], // 需要使用的的插件列表，如比例尺'AMap.Scale'等
    })
      .then((AMap) => {
        this.map = new AMap.Map("container", {
          //设置地图容器id
          viewMode: "3D", //是否为3D地图模式
          zoom: 11, //初始化地图级别
          center: [this.data.jingdu, this.data.weidu], //初始化地图中心点位置
        });
        AMap.plugin("AMap.Weather", function () {
          let weather = new AMap.Weather();
          weather.getForecast("北京", function (status, result) {
            console.log(status, result);
          });
        });
      })
      .catch((e) => {
        // console.log(e);
      });
  },
  methods: {
    send(){
      let cid=this.id
      let uid=this.$store.state.id
      let params=`cid=${cid}&uid=${uid}`
      this.axios.put('/updatesend',params).then(res=>{
        console.log(res)
      })
    },
    onClickLeft() {
      this.$router.go(-1);
    },
    getData() {
      const url = "/indexdetail?id=" + this.id;
      // console.log("url:", url);
      this.axios.get(url).then((res) => {
        console.log(res);
        this.data = res.data.result[0];
      });
    },
  },
};
</script>

<style scoped>
* {
  margin: 0;
  padding: 0;
}
.indexbtn {
  user-select: none;
  width: 90%;
  text-align: center;
  margin-left: 5vw;
  padding: 3vw;
  border-radius: 7vw;
  border: none;
  background-color: rgb(71, 71, 232);
  color: whitesmoke;
  font-weight: 500;
}
#container {
  width: 95%;
  margin-left: 2.5vw;
  height: 20vh;
}
.tixing {
  font-size: 13px;
  margin: 0px;
}
.zwfuli {
  background-color: gray;
}
.detail {
  padding: 0 1em;
}
</style>