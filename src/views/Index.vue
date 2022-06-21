<template>
  <div>
    <van-swipe class="my-swipe" :autoplay="3000" indicator-color="gray">
      <van-swipe-item>
        <img src="../../public/img/index/index_lb1.png" alt="" />
        <h2>与未来上司直接沟通</h2>
        <p>海量Boss已经入驻，等你开聊!</p></van-swipe-item
      >
      <van-swipe-item>
        <img src="../../public/img/index/index_lb2.png" alt="" />
        <h2>聊着天吧工作搞定</h2>
        <p>谈薪资，聊待遇，直接沟通，解答疑问。</p></van-swipe-item
      >
      <van-swipe-item>
        <img src="../../public/img/index/index_lb3.png" alt="" />
        <h2>快速入职新单位</h2>
        <p>找工作到入职，最快只要一天</p></van-swipe-item
      >
    </van-swipe>

    <van-tabbar>
      <van-tabbar-item>
        <van-button round type="primary" to="bosslogin"
          >我要招人</van-button
        ></van-tabbar-item
      >
      <van-tabbar-item>
        <van-button round type="primary" to="emplogin"
          >我要应聘</van-button
        ></van-tabbar-item
      >
    </van-tabbar>
  </div>
</template>

<script>
export default {
  data() {
    return {};
  },
};
</script>

<style lang="scss" scoped></style>
<style scoped>
.my-swipe .van-swipe-item {
  color: #000;
  font-size: 12px;
  /* line-height: 150px; */
  text-align: center;
  /* background-color: #39a9ed; */
  width: 100vw;
  height: 110vw;
  margin-top: 10vh;
}
.my-swipe .van-swipe-item > img {
  width: 100vw;
  height: 70vw;
}
.van-tabbar {
  margin-bottom: 10vh;
}
</style>
