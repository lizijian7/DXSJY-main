<template>
  <div class="bossregister">
    <img :src="imgSrc" width="100vw" height="100vh" alt="" />

    <mt-header title="注册" class="reghead">
      <mt-button @click="clickLeft" icon="back" slot="left"></mt-button>
      <router-link to="/bossregister" slot="right">登录</router-link>
    </mt-header>
    <!-- <van-image
      width="100vw"
      height="60vw"
      src="https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic.616pic.com%2Fbg_w1180%2F00%2F26%2F55%2FAgzVWooL1R.jpg&refer=http%3A%2F%2Fpic.616pic.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1657428270&t=1fc740ca738df0ff06ab8b4267436961"
    /> -->
    <mt-field
      v-model="boss_name"
      type="text"
      laber="用户名"
      placeholder="请输入用户名"
      :state="boss_nameState"
      @blur.native.capture="checkName"
    ></mt-field>
    <mt-field
      v-model="boss_phone"
      type="text"
      laber="手机号"
      placeholder="请输入手机号"
      :state="boss_phoneState"
      :attr="{ maxlength: 11 }"
      @blur.native.capture="checkPhone"
    ></mt-field>
    <mt-field
      v-model="boss_uname"
      type="text"
      laber="公司名称"
      placeholder="请输入公司名称"
      :state="boss_unameState"
      @blur.native.capture="checkUname"
    ></mt-field>
    <!-- <mt-field
      v-model="boss_img"
      type="text"
      laber="营业执照"
      placeholder="请上传营业执照"
      :state="boss_imgState"
      @blur.native.capture="checkImg"
    ></mt-field> -->
    <!-- <van-uploader v-model="fileList" @click.native.capture="checkImg">
      <van-button icon="plus">请上传贵公司营业执照</van-button>
    </van-uploader> -->
    <mt-field
      v-model="boss_pwd"
      type="password"
      laber="密码"
      placeholder="请输入密码"
      :state="boss_pwdState"
      @blur.native.capture="checkPwd"
    ></mt-field>
    <mt-field
      v-model="boss_repwd"
      type="password"
      laber="确认密码"
      placeholder="请再次确认密码"
      :state="boss_repwdState"
      @blur.native.capture="checkRepwd"
    ></mt-field>
    <mt-button type="primary" size="large" @click="bossRegister"
      >注册</mt-button
    >
  </div>
</template>

<script>
export default {
  data() {
    return {
      imgSrc: require("../../../public/img/index/bossreg.webp"),
      boss_name: "",
      boss_nameState: "",
      boss_pwd: "",
      boss_pwdState: "",
      boss_phone: "",
      boss_phoneState: "",
      boss_repwd: "",
      boss_repwdState: "",
      boss_uname: "",
      boss_unameState: "",

      // boss_img: "",
      // fileList: [],
      // boss_imgState: "",
    };
  },
  methods: {
    clickLeft() {
      this.$router.go(-1);
    },
    reg() {
      let param = `username=${this.boss_name}&password=${this.boss_pwd}&phone=${this.boss_phone}`;
      this.axios.post("boss_register", param).then((res) => {
        console.log(res);
        if (res.data.code == 200) {
          console.log("注册成功");
          this.$router.replace("/bosslogin");
        } else {
          alert("注册失败");
        }
      });
    },
    checkName() {
      console.log("用户名:" + this.boss_name);
      let reg = /^[\u4e00-\u9fa5_a-zA-Z0-9_]{4,20}$/;
      if (reg.test(this.boss_name)) {
        let param = `username=${this.boss_name}`;
        this.axios.post("boss_regtextname", param).then((res) => {
          console.log(res);
          if (res.data.code == 200) {
            console.log("用户名可以使用");
            this.boss_nameState = "success";
          } else {
            alert("用户名重复");
          }
        });
        return true;
      } else {
        this.boss_nameState = "error";
        return false;
      }
    },
    checkPhone() {
      console.log("手机号:" + this.boss_phone);
      let reg = /^1[3-9]\d{9}$/;
      if (reg.test(this.boss_phone)) {
        this.boss_phoneState = "success";
        return true;
      } else {
        this.boss_phoneState = "error";
        return false;
      }
    },
    checkUname() {
      console.log("公司名称:" + this.boss_uname);
      let reg = /^[\u4e00-\u9fa5_a-zA-Z0-9_]{4,20}$/;
      if (reg.test(this.boss_uname)) {
        this.boss_unameState = "success";
        return true;
      } else {
        this.boss_unameState = "error";
        return false;
      }
    },
    // checkImg() {
    //   console.log("营业执照:" + this.boss_img);
    // },
    checkPwd() {
      let reg = /^\d{6}$/;
      if (reg.test(this.boss_pwd)) {
        this.boss_pwdState = "success";
        return true;
      } else {
        this.boss_pwdState = "error";
        return false;
      }
    },
    checkRepwd() {
      let reg = /^\d{6}$/;
      if (reg.test(this.boss_repwd) && this.boss_pwd == this.boss_repwd) {
        this.boss_repwdState = "success";
        return true;
      } else {
        this.boss_repwdState = "error";
        return false;
      }
    },
    bossRegister() {
      if (
        this.checkName() &&
        this.checkPhone() &&
        this.checkPwd() &&
        this.checkRepwd()
      ) {
        console.log(
          `${this.boss_name},${this.boss_phone},${this.boss_pwd},${this.boss_repwd}`
        );
        this.reg();
      }
    },
  },
};
</script>

<style lang="scss" scoped></style>
<style scoped>
.preview-cover {
  position: absolute;
  bottom: 0;
  box-sizing: border-box;
  width: 100%;
  padding: 4px;
  color: #fff;
  font-size: 12px;
  text-align: center;
  background: rgba(0, 0, 0, 0.3);
}
.van-uploader__input {
  width: 100vw !important;
}
.reghead {
  margin-top: 40vh;
}
.bossregister > img {
  left: 0;
  top: 0;
  width: 100%;
  height: 100%; /**宽高100%是为了图片铺满屏幕 */
  z-index: -1;
  position: absolute;
}
</style>
