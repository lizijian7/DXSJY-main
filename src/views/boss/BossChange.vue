<template>
  <div>
    <div class="imgs">
      <img src="/img/index/qiuzhi.jpg" alt="" />
    </div>
    <!-- 绑定切换按钮 -->
    <van-button round type="info" size="large" to="/emplogin"
      >切换为应聘身份</van-button
    >
    <van-button round type="info" size="large" color="red" @click="back"
      >返回</van-button
    >
  </div>
</template>

<script>
export default {
  methods: {
    back() {
      this.$router.go(-1);
    },
  },
};
</script>

<style scoped>
.imgs {
  width: 100%;
  height: 100vw;
}
img {
  width: 100%;
  height: 100%;
}
.van-button {
  margin: 30px 0;
  font-size: 23px;
}
</style>
