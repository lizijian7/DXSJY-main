<template>
  <div>
    <mt-header title="我的面试邀请" style="font-size:18px">
      <router-link to="/empindex/empme" slot="left">
        <mt-button icon="back">返回</mt-button>
      </router-link>
      <mt-button icon="more" slot="right"></mt-button>
    </mt-header>
    <van-tabs v-model="activeName">
  <van-tab class="titlee" title="全部" name="a"> <img src="./mianshi.jpg" alt=""></van-tab>
  <van-tab class="titlee" title="待处理" name="b"> <img src="./mianshi.jpg" alt=""></van-tab>
  <van-tab class="titlee" title="已接受" name="c"> <img src="./mianshi.jpg" alt=""></van-tab>
  <van-tab class="titlee" title="已拒绝" name="d"> <img src="./mianshi.jpg" alt=""></van-tab>
</van-tabs>
   
  </div>
</template>

<script>
export default {
    data() {
    return {
      activeName: 'a',
    };
  },
};
</script>

<style scoped>
img{
    width: 100%;
}
.van-tab__text{
    font-size: 18px;
}
.titlee{
    font-size: 18px;
}
</style>