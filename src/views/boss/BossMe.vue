<template>
  <div>
    <div class="box">
      <!-- <van-nav-bar>
        <template #left>
          <van-icon name="scan" size="18" />
        </template>
        <template #right>
          <van-icon name="point-gift-o" size="18" />
          &nbsp;&nbsp;
          <van-icon name="setting-o" size="18" />
        </template>
      </van-nav-bar> -->
      <div class="box11">
        <div class="box111">
          <router-link to="/bosscompany" style="color: white; font-size: 25px"
            >我的公司<van-icon name="arrow"
          /></router-link>
          <img class="tx" src="../../assets/tx.png" alt="" />
        </div>
        <span><van-icon name="exchange" />职场人</span>
        <span><van-icon name="replay" />刷新简历</span>
      </div>
      <div class="box12">
        <div>
          <span>{{ num }}</span>
          <p>接收</p>
        </div>
        <div>
          <span>{{ num }}</span>
          <p>收藏</p>
        </div>
        <div>
          <span>{{ num }}</span>
          <p>足迹</p>
        </div>
        <div>
          <span>{{ num }}</span>
          <p>关注</p>
        </div>
        <div>
          <span>{{ num }}</span>
          <p>互动</p>
        </div>
      </div>
    </div>
    <!-- <div class="box2">
      <div class="box21">
        <van-icon name="minus" />
        <span>招聘服务</span>
        <van-icon name="minus" />
      </div>

      <div class="box22">
        <van-row class="box221" type="flex" justify="space-around">
          <van-col
            class="van-item"
            span="8"
            @click.native="$router.push(`/recruit`)"
            ><img src="../../assets/images/1.jpg" alt="" />
            <span>岗位发布</span>
          </van-col>
          <van-col class="van-item" span="8"
            ><img src="../../assets/images/2.jpg" alt="" />
            <span>岗位管理</span>
          </van-col>
          <van-col class="van-item" span="8"
            ><img src="../../assets/images/3.jpg" alt="" />
            <span>简历搜索</span></van-col
          >
          <van-col class="van-item" span="8"
            ><img src="../../assets/images/4.jpg" alt="" />
            <span>求职者信息</span></van-col
          >
          <van-col class="van-item" span="8"
            ><img src="../../assets/images/5.jpg" alt="" />
            <span>招聘模板</span></van-col
          >
          <van-col class="van-item" span="8"
            ><img src="../../assets/images/6.jpg" alt="" />
            <span>全部</span></van-col
          >
        </van-row>
      </div>
    </div> -->
    <div class="bd">
      <div class="qz">————求职服务————</div>
      <div>
        <div @click="gofabu">
          <img src="../../assets/images/1.jpg" alt="" />
          <span>岗位发布</span>
        </div>
        <div>
          <img src="../../assets/images/2.jpg" alt="" />
          <span>岗位管理</span>
        </div>
        <div>
          <img src="../../assets/images/3.jpg" alt="" />
          <span>简历搜索</span>
        </div>
      </div>

      <div>
        <div>
          <img src="../../assets/images/4.jpg" alt="" />
          <span>招聘信息</span>
        </div>
        <div>
          <img src="../../assets/images/5.jpg" alt="" />
          <span>招聘模板</span>
        </div>
        <div>
          <img src="../../assets/images/6.jpg" alt="" />
          <span>全部详情</span>
        </div>
      </div>
    </div>
    <div class="box3">
      <div>
        <van-icon name="friends-o" />
        &nbsp;
        <span>我要招聘</span>
      </div>
      <div>
        <van-icon name="arrow" />
      </div>
    </div>
    <div class="box3">
      <div>
        <van-icon name="envelop-o" />
        &nbsp;
        <span>招聘推荐</span>
      </div>
      <div>
        <van-icon name="arrow" />
      </div>
    </div>
    <div class="box3">
      <div>
        <van-icon name="label-o" />
        &nbsp;
        <span>简历库</span>
      </div>
      <div>
        <van-icon name="arrow" />
      </div>
    </div>
    <div class="box3">
      <div>
        <van-icon name="comment-o" />
        &nbsp;
        <span>面试邀请</span>
      </div>
      <div>
        <van-icon name="arrow" />
      </div>
    </div>
    <div class="box3">
      <div>
        <van-icon name="wap-home-o" />
        &nbsp;
        <span>公司地址</span>
      </div>
      <div>
        <van-icon name="arrow" />
      </div>
    </div>
    <div class="box3">
      <div>
        <van-icon name="comment-o" />
        &nbsp;
        <span>我的订单</span>
      </div>
      <div>
        <van-icon name="arrow" />
      </div>
    </div>
    <div class="box3">
      <div>
        <van-icon name="balance-o" />
        &nbsp;
        <span>我的钱包</span>
      </div>
      <div>
        <van-icon name="arrow" />
      </div>
    </div>
    <div class="box3">
      <div>
        <van-icon name="envelop-o" />
        &nbsp;
        <span>客户服务</span>
      </div>
      <div>
        <van-icon name="arrow" />
      </div>
    </div>
    <div class="box3">
      <div>
        <van-icon name="comment-o" />
        &nbsp;
        <span>帮助与反馈</span>
      </div>
      <div>
        <van-icon name="arrow" />
      </div>
    </div>
    <div class="box3">
      <div>
        <van-icon name="contact" />
        &nbsp;
        <span>资质显示</span>
      </div>
      <div>
        <van-icon name="arrow" />
      </div>
    </div>
    <van-row
      type="flex"
      justify="space-around"
      style="text-align: center; font-size: 12px; margin-top: 10px"
    >
      <van-col span="6">举报监督电话</van-col>
      <van-col span="6">人力资源服务许可证</van-col>
      <van-col span="6">营业执照</van-col>
    </van-row>
    <div style="text-align: center; margin-top: 10px">web招聘--2022-6-9</div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      num: 0,
    };
  },
  methods: {
    gofabu() {
      this.$router.push(`/recruit`);
    },
    // toRecruit() {
    //   this.$router.push(`recruit`);
    // },
  },
};
</script>

<style lang="scss" scoped></style>

<style scoped>
* {
  padding: 0;
  margin: 0;
}

.box {
  background-color: rgb(79, 112, 227);
}
.box > .box11 > .box111 {
  position: relative;
}

.box > .box11 {
  color: white;
  margin-left: 10px;
}

.box > .box12 {
  display: flex;
  justify-content: space-around;
  align-items: center;
}

.box > .box12 > div {
  display: inline-block;
  text-align: center;
  margin-top: 20px;
  color: white;
  margin-bottom: 10px;
}

.box2 > .box21 {
  margin: 20px 50px;
  color: rgb(192, 151, 106);
}

.box2 {
  width: 100%;
}

.box21 {
  text-align: center;
}

.box221 {
  width: 100%;
  text-align: center;
  margin: 0 auto;
}
.box22 {
  border-bottom: 3px solid aliceblue;
}
.van-item {
  margin-bottom: 10px;
  text-align: center;
}
.van-item > img {
  width: 25px;
  height: 25px;
  display: inline-block;
}
.van-item > span {
  display: inline-block;
}

.box3 {
  display: flex;
  justify-content: space-between;
  padding: 5px 20px 5px 20px;
}

.tx {
  width: 50px;
  height: 50px;
}
.box > .box11 > .box111 > img {
  position: absolute;
  right: 18px;
  top: 5px;
}
.bd > div {
  text-align: center;
}
.bd img {
  width: 35px;
  display: inline-block;
}
.bd > div:nth-child(2) > div > span {
  line-height: 32px;
}
.bd > div:nth-child(2) > div {
  display: inline-block;
}

.bd > div:nth-child(2) {
  display: flex;
  justify-content: space-around;
  align-content: center;
  margin-top: 12px;
}
.bd > div:nth-child(2) > div {
  display: flex;
  align-content: center;
}

.bd > div:nth-child(3) {
  display: flex;
  justify-content: space-around;
  align-content: center;
  margin-top: 12px;
}
.bd > div:nth-child(3) > div {
  display: flex;
  align-content: center;
}
.qz {
  text-align: center;
  color: rgb(192, 151, 106);
  margin-top: 18px;
  margin-bottom: 14px;
}
</style>
