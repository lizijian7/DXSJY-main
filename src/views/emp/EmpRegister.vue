<template>
  <!-- 注册页面 -->
  <div class="bgc">
    <!-- 头部标题栏 -->
    <!--  @blur.native.capture="checkName"  失去焦点时候执行checkName函数    native是给其添加原生属性  capture 捕获阶段执行 -->
    <mt-header title="注册">
      <mt-button @click="goIndex" icon="back" slot="left"></mt-button>
      <router-link to="/emplogin" slot="right">登录</router-link>
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

    <mt-field
      v-model="phone"
      type="text"
      lable="手机号"
      placeholder="请输入手机号"
      :state="rePhone"
      @blur.native.capture="checkPhone"
    ></mt-field>

    <!-- 地区选择  这个可以放在简历界面？-->
    <van-field
      readonly
      clickable
      name="area"
      :value="value"
      label="地区选择"
      placeholder="点击选择省市区"
      @click="showArea = true"
    />
    <van-popup v-model="showArea" position="bottom">
      <van-area
        :area-list="areaList"
        @confirm="onConfirm"
        @cancel="showArea = false"
      />
    </van-popup>

    <mt-field
      v-model="pwd"
      type="password"
      lable="密码"
      placeholder="请输入密码"
      :state="pwdState"
      @blur.native.capture="checkPwd"
    ></mt-field>
    <mt-field
      v-model="repwd"
      type="password"
      lable="确认密码"
      placeholder="请确认密码"
      :state="repwdState"
      @blur.native.capture="checkrePwd"
    ></mt-field>
    <!-- 按钮 -->
    <mt-button type="primary" size="large" @click="regist">快速注册</mt-button>
  </div>
</template>

<script>
import { areaList } from "@vant/area-data";
export default {
  data() {
    return {
      name: "",
      pwd: "",
      repwd: "",
      nameState: "",
      pwdState: "",
      repwdState: "",
      phone: "",
      rePhone: "",
      value: "",
      showArea: false,
      areaList, // 数据与上方的 Area 组件文档引入联动
    };
  },
  methods: {
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
    // 验证手机号
    checkPhone() {
      console.log(this.phone);
      let reg = /^1[3|4|5|7|8][0-9]{9}$/;
      if (reg.test(this.phone)) {
        this.rePhone = "success";
        return true;
      } else {
        this.rePhone = "error";
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
    checkrePwd() {
      console.log(this.repwd);
      let reg = /^\d{6}$/;
      if (reg.test(this.repwd) && this.pwd == this.repwd) {
        this.repwdState = "success";
        return true;
      } else {
        this.repwdState = "error";
        return false;
      }
    },
    // 地区选择
    onConfirm(values) {
      this.value = values
        .filter((item) => !!item)
        .map((item) => item.name)
        .join("/");
      this.showArea = false;
    },
    regist() {
      if (
        this.checkName() &
        this.checkPwd() &
        this.checkrePwd() &
        this.checkPhone()
      ) {
        // 点击都验证通过后执行注册业务
        console.log(this.name, this.pwd, this.repwd);
      }
    },
    goIndex() {
      // 点击跳转选择企业或者个人 主页面
      //点击跳转至上次浏览页面
      this.$router.go(-1);

      //指定跳转地址
      //  this.$router.replace('/')
    },
    regist() {
      const parmas = `empname=${this.name}&emppwd=${this.pwd}&phone=${this.phone}`;
      this.axios.post("/register", parmas).then((res) => {
        console.log(res);
        if (res.data.code == 200) {
          this.$router.push("/emplogin");
        }
      });
    },
  },
};
</script>

<style  scoped>
.bgc {
  height: 100vh;
  background-image: url(../../assets/rejist.jpeg);
  background-repeat: no-repeat;
  background-position: center;
  background-size: cover;
}
.kong {
  height: 18%;
}
.van-cell {
  font-size: 17px !important;
}
.mint-field-core{
  background-color: rgb(167, 44, 44);
}
.mint-button--primary{
background-color: #7d2d7182;
}

/* .mint-button {
  background-color: aqua;
} */
</style>