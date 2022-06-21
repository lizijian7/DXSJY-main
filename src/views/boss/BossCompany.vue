<template>
  <div>
    <mt-header title="填写公司信息">
      <mt-button icon="back" slot="left" @click="goback"> </mt-button>
    </mt-header>
    <van-cell-group>
      <van-field v-model="name" label="公司名称" placeholder="请输入公司名称" />
      <van-field
        v-model="introduct"
        label="公司介绍"
        placeholder="请介绍该公司"
      />
      <van-field
        readonly
        clickable
        name="area"
        :value="value"
        label="地区选择"
        placeholder="点击选择省市区"
        @click="position = true"
      />
      <van-popup v-model="position" position="bottom">
        <van-area
          :area-list="areaList"
          @confirm="onConfirm"
          @cancel="position = false"
        />
      </van-popup>
      <van-field
        v-model="time"
        label="成立时间"
        placeholder="请输入公司成立时间"
      />
      <van-field
        v-model="money"
        label="注册资本"
        placeholder="请输入公司注册资本"
      />
    </van-cell-group>
    <mt-button type="primary" size="large" @click="bosscompanyjieshao"
      >提交</mt-button
    >
  </div>
</template>

<script>
import { areaList } from "@vant/area-data";
export default {
  data() {
    return {
      name: "",
      introduct: "",
      position: false,
      time: "",
      money: "",

      value: "",
      areaList,
    };
  },
  methods: {
    bosscompanyjieshao() {
      //     let param = `companyname=${this.name}&companyintroduct=${this.introduct}&position=${this.position}&time=${this.time}&money=${this.money}`;
      //     this.axios.post("/bossjobcard", param).then((res) => {
      //       console.log(res);
      //       if (res.data.code == 200) {
      //         console.log("提交成功");
      //         this.$router.push(`/bossindex/jobs`);
      //       } else {
      //         alert("提交失败");
      //       }
      //     });
      //   },
    },
    goback() {
      this.$router.go(-1);
    },
    onConfirm(values) {
      this.value = values
        .filter((item) => !!item)
        .map((item) => item.name)
        .join("/");
      this.position = false;
    },
  },
};
</script>

<style lang="scss" scoped>
</style>