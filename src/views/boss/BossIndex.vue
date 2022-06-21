<template>
  <div>
    <van-nav-bar
      left-text="返回"
      :title="`欢迎用户${this.$store.state.boss_name}`"
      left-arrow
      @click-left="onClickLeft"
      @click-right="onClickRight"
    >
      <template #right>
        <van-icon name="ellipsis" size="18" />
      </template>
    </van-nav-bar>

    <router-view />
    <van-tabbar v-model="active">
      <van-tabbar-item name="bosscarefully" icon="home-o">精选</van-tabbar-item>
      <van-tabbar-item name="jobs" icon="search">职位</van-tabbar-item>
      <van-tabbar-item name="message" icon="chat-o"> 沟通</van-tabbar-item>
      <van-tabbar-item name="me" icon="friends-o">我的</van-tabbar-item>
    </van-tabbar>
  </div>
</template>

<script>
import { Toast } from "vant";
export default {
  watch: {
    $route() {
      console.log("路由变化", this.$route.path.split("/").pop());
      this.active = this.$route.path.split("/").pop();
    },
    active(newValue, oldValue) {
      // console.log("to",newValue);
      // console.log("from",oldValue);
      // console.log(this.$route.path.split('/').pop());

      // this.$router.push(`/home/${newValue}`)
      if (this.gocheck == true) {
        return (this.gocheck = false);
      }
      this.$router.push(`/bossindex/${newValue}`);
      // if (newValue == "index") {
      //   this.$router.push("/bossindex/index");
      // } else if (newValue == "jobs") {
      //   this.$router.push("/bossindex/jobs");
      // } else if (newValue == "message") {
      //   this.$router.push("/bossindex/message");
      // } else if (newValue == "me") {
      //   this.$router.push("/bossindex/me");
      // }
    },
  },

  methods: {
    onClickLeft() {
      this.gocheck = true; //这是我的返回键和底部导航栏的跳转出了bug,做的状态判断
      // 点击跳转选择企业或者个人 主页面
      //点击跳转至上次浏览页面
      this.$router.go(-1);

      //指定跳转地址
      //  this.$router.replace('/')
      // 点击后完成进入产品主页面
    },
    onClickRight() {
      Toast("前方的区域还未解锁，请稍后再来");
    },
  },
  data() {
    return {
      active: this.$route.path.split("/").pop(),
      gocheck: false,
    };
  },
};
</script>

<style lang="scss" scoped></style>
<style>
.van-tabbar {
  padding-bottom: 10px;
}
</style>
