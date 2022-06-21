<template>
  <div class="itemindex">
    <!-- 每一页除了底部一样其他都不一样需要占位符进行跳转接收 -->
    <router-view />

    <!-- 底部 -->
    <div style="margin-top: 3em">
      <van-tabbar v-model="active">
        <van-tabbar-item icon="home-o" name="empindexcell" to="/empindex/empindexcell"
          >职位</van-tabbar-item
        >
        <van-tabbar-item icon="chat-o" name="empindexxiaoxi" to="/empindex/empindexxiaoxi"
          >消息</van-tabbar-item
        >
        <van-tabbar-item icon="comment-o" name="zhiq" to="/empindex/zhiq"
          >职Q</van-tabbar-item
        >
        <!-- <van-tabbar-item icon="video-o">现场</van-tabbar-item> -->
        <van-tabbar-item icon="setting-o" name="empme" to="/empindex/empme"
          >我的</van-tabbar-item
        >
      </van-tabbar>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
    active:this.$route.path.split("/").pop(),
    };
  },
  props: ["id"],
  computed:{
  }
};
</script>
<style scoped>
.itemindex{
  background-color: rgb(241, 242, 245);
}
</style>

