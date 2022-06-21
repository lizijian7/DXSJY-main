<template>
  <div>
    <mt-header title="发布职位信息">
      <mt-button icon="back" slot="left" @click.native="$router.go(-1)">
      </mt-button>
      <template #right>
        <van-icon
          name="wap-home-o"
          @click.native="$router.push(`/bossindex/bosscarefully`)"
      /></template>
    </mt-header>
    <!-- <mt-field

    $router.push(`/recruit`)
      label="职位类型"
      placeholder="请选择职位类型"
      type="text"
      v-model="form"
    ></mt-field> -->
    <mt-field
      label="职位名称"
      placeholder="请输入职位名称"
      type="text"
      v-model="name"
    ></mt-field>
    <mt-field
      label="工作地区"
      placeholder="请输入工作地区"
      type="text"
      v-model="position"
    ></mt-field>
    <mt-field
      label="招聘人数"
      placeholder="填写招聘人数"
      type="text"
      v-model="num"
    ></mt-field>
    <mt-field
      label="薪资待遇"
      type="text"
      placeholder="填写薪资范围"
      v-model="salary"
    ></mt-field>
    <mt-field
      label="年龄要求"
      placeholder="请输入年龄"
      type="text"
      v-model="age"
    ></mt-field>
    <mt-field
      label="公司"
      placeholder="发布公司"
      type="text"
      v-model="mycompany"
    ></mt-field>
    <mt-field
      label="HR"
      placeholder="发布者"
      type="text"
      v-model="myhr"
    ></mt-field>
    <!-- <mt-field label="性别要求" type="text" v-model="sex"
      ><template>
        <input type="radio" name="gender" value="0" />不限
        <input type="radio" name="gender" value="1" />男
        <input type="radio" name="gender" value="2" />女
      </template></mt-field
    > -->
    <mt-field label="学历要求" type="text"
      ><van-dropdown-menu>
        <van-dropdown-item v-model="education" :options="option" />
      </van-dropdown-menu>
    </mt-field>
    <mt-field label="工作年限" type="text">
      <van-dropdown-menu>
        <van-dropdown-item v-model="workyear" :options="option2" />
      </van-dropdown-menu>
    </mt-field>
    <mt-field
      v-model="introduce"
      rows="4"
      autosize
      label="岗位职责"
      type="text"
      :attr="{ maxlength: 200 }"
      placeholder="请输入岗位职责"
      show-word-limit
    />
    <mt-button type="primary" size="large" @click="bossjobfabu">发布</mt-button>
  </div>
</template>

<script>
export default {
  methods: {
    bossjobfabu() {
      // 这里的教育和年龄 公司 岗位职责等   教育  年龄  工作年限 学历要求应该作为标签放在要求里，这里我暂时使用
      let param = `jobname=${this.name}&salary=${this.salary}&age=${this.age}&workyear=${this.option2[0].text}&mycompany=${this.mycompany}&myhr=${this.myhr}&myaddress=${this.position}&work=${this.introduce}&education=${this.option[0].text}&num=${this.num}
      `;
      this.axios.post("/bossjobcard", param).then((res) => {
        console.log(res);
        if (res.data.code == 200) {
          console.log("发布成功");
          this.$router.push(`/bossindex/jobs`);
        } else {
          alert("发布失败");
        }
      });
    },
  },
  data() {
    return {
      myhr: "",
      mycompany: "",
      salary: "", //工资范围
      num: "", //招聘数量
      age: "", //年龄要求
      introduce: "", //岗位职责
      name: "", //岗位名称
      position: "", //工作地址
      // form: "",//
      education: 0, //学历
      workyear: 0, //工作年限
      option: [
        { text: "学历不限", value: 0 },
        { text: "本科以上", value: 1 },
        { text: "大专以上", value: 2 },
      ],
      option2: [
        { text: "工龄不限", value: 0 },
        { text: "1~3年", value: 1 },
        { text: "5年以内", value: 2 },
        { text: "10年以内", value: 3 },
        { text: "10年以上", value: 4 },
      ],
    };
  },
};
</script>

<style lang="scss" scoped></style>
