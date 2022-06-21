<template>
  <!-- 登录页面 -->
  <div class="bgc">
    <!-- 头部标题栏 -->
    <!--  @blur.native.capture="checkName"  失去焦点时候执行checkName函数    native是给其添加原生属性  capture 捕获阶段执行 -->

    <mt-header title="登录">
      <mt-button @click="goIndex" icon="back" slot="left">返回</mt-button>

      <!-- 用户头像 -->
      <!-- 点击跳转至注册页面 -->
      <router-link to="/empregister" slot="right">新用户注册</router-link>
    </mt-header>
    <div class="kong"></div>
    <!-- 表单 -->
    <mt-field
      type="text"
      lable="用户名"
      placeholder="请输入用户名"
      v-model="name"
      :state="nameState"
      @blur.native.capture="checkName"
    ></mt-field>
    <br />
    <mt-field
      v-model="pwd"
      type="password"
      lable="密码"
      placeholder="请输入六位数密码"
      :state="pwdState"
      @blur.native.capture="checkPwd"
    ></mt-field>
    <van-checkbox v-model="checked"   
      ><span>我已阅读同意招聘服务协议与隐私政策</span></van-checkbox
    >
    <!-- 按钮 -->
    <van-button
      round
      type="primary"
      size="large"
      color="linear-gradient(to right, #48D1CC, #4169e1)"
      @click.native.capture="getdata"
      :disabled='!checked'
      >安全登录</van-button
    >

    <div v-if="data"></div>
  </div>
</template>

<script>
import { mapMutations } from "vuex";
export default {
  data() {
    return {
      name: "",
      pwd: "",
      nameState: "",
      pwdState: "",
      checked: false,
      data: "",
    };
  },
  methods: {
    ...mapMutations(["updateid", "updatename",'updateurl']),
    checkName() {
      //用户名输入框焦点失去后执行
      console.log(this.name);
      let reg = /^\w{3,15}$/;
      if (reg.test(this.name)) {
        console.log("合法");
        this.nameState = "success";
        return true;
      } else {
        console.log("格式不正确");
        this.nameState = "error";
        return false;
      }
    },
    // 验证密码
    checkPwd() {
      console.log(this.pwd);
      let reg = /^\d{6}$/;
      if (reg.test(this.pwd)) {
        this.pwdState = "success";
        return true;
      } else {
        this.pwdState = "error";
        return false;
      }
    },
    goIndex() {
      // 点击跳转选择企业或者个人 主页面
      //点击跳转至上次浏览页面
      this.$router.go(-1);

      //指定跳转地址
      //  this.$router.replace('/')
    },
    // 点击后完成进入产品主页面
    login() {
      if (this.checkName() & this.checkPwd()) {
        // 点击都验证通过后执行注册业务
        console.log(this.name, this.pwd);
      }
    },
    setup() {
      const checked = ref(true);
      return { checked };
    },
    getdata() {
      const pramas = `empname=${this.name}&emppwd=${this.pwd}`;
      this.axios.post("/login", pramas).then((res) => {
        console.log(res);
        if (res.data.code == 200) {
          console.log(this.name);
          this.axios.get(`/getdata?empname=${this.name}`).then((res) => {
            console.log("用户数据", res);
            this.data = res.data.results;
            this.updateid(this.data.id);
            this.updatename(this.data.empname);
            this.updateurl(this.data.url)
            this.$router.push("/empindex");
          });
        }else{
          alert('用户不存在')
          this.name=''
          this.pwd=''
          this.checked=false
        }
      });
    },
  },
};
</script>
<style scoped>
.bgc {
  height: 100vh;
  background-image: url(../../assets/login.jpeg);
  background-repeat: no-repeat;
  background-position: center;
  background-size: cover;
}
.kong {
  height: 15%;
}
.van-checkbox span {
  color: #cac7c7;
}

.mint-cell-wrapper input {
  /* background-color: #e31c1c00; */
  background-color: aqua;
}
.mint-header {
  margin-bottom: 40px;
}
.mint-header-title {
  font-size: large;
}
.van-checkbox {
  margin: 8px 0px;
}
.van-button {
  margin-top: 2%;
}
</style>
<style lang="scss" scoped>
</style>