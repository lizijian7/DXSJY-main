<template>
  <div>
    <van-nav-bar
      title="用户登录"
      left-text="返回"
      right-text="新用户"
      left-arrow
      @click-left="onClickLeft"
      @click-right="onClickRight"
    />
    <h2 style="text-align: center">登录</h2>
    <van-form @submit="onSubmit">
      <van-field
        v-model="username"
        name="用户名"
        label="用户名"
        placeholder="请输入用户名"
        :maxlength="15"
        :rules="[{ validator, required: true, message: '请正确填写用户名' }]"
      />
      <van-field
        v-model="password"
        type="password"
        name="密码"
        label="密码"
        placeholder="请输入密码"
        :rules="[{ validator, required: true, message: '请正确填写密码' }]"
      />
      <van-checkbox v-model="checked" icon-size="12px"
        >我已阅读并同意<a href="">用户协议</a>、<a href=""
          >登录政策</a
        ></van-checkbox
      >
      <div style="margin: 16px">
        <van-button round block type="info" native-type="submit"
          >提交</van-button
        >
      </div>
    </van-form>
  </div>
</template>

<script>
export default {
  data() {
    return {
      // boss_name: "",
      // boss_pwd: "",
      username: "",
      password: "",
      checked: "",
    };
  },
  methods: {
    validator(val) {
      return /^[\u4e00-\u9fa5_a-zA-Z0-9_]{4,20}$/.test(val);
    },
    onClickLeft() {
      this.$router.replace("/");
    },
    onClickRight() {
      this.$router.replace("/bossregister");
    },
    onSubmit(values) {
      console.log("submit", values);
      if (values && this.checked) {
        // let data = new URLSearchParams();
        // data.append(this.username, this.password);
        // console.log(data);
        this.axios
          .post(
            "boss_login",
            "username=" + this.username + "&password=" + this.password
          )
          .then((res) => {
            console.log(res);
            if (res.data.code == 200) {
              console.log("登录成功");
              // 登陆成功，修改vuex里的登陆状态更新state
              this.$store.commit("updateBossLoginState", this.username);
              this.$router.replace("/bossindex/bosscarefully");
            } else {
              alert("您的用户名或者密码错误");
            }
            //
          });
        // this.$router.replace("/bossindex/index");
      } else {
        alert("您还没有同意我们的用户协议哦");
      }
    },
  },
};
</script>
<style>
.van-checkbox {
  margin-left: 5vw;
}
</style>
