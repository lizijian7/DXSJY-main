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

    <van-field
      label="职位名称"
      placeholder="请输入职位名称"
      type="text"
      v-model="name"
    ></van-field>
    <hr />
    <van-field
      label="工作地区"
      placeholder="请输入工作地区"
      type="text"
      v-model="position"
    ></van-field>
    <hr />

    <van-field
      label="招聘人数"
      placeholder="填写招聘人数"
      type="text"
      v-model="num"
    ></van-field>
    <hr />
    <van-field
      label="薪资待遇"
      type="text"
      placeholder="填写薪资范围"
      v-model="salary"
    ></van-field>
    <hr />
    <!-- 标签1 -->
    <van-field
      label="年龄要求"
      placeholder="请输入年龄"
      type="text"
      v-model="age"
    ></van-field>
    <hr />

    <!-- 标签2 -->
    <van-field label="学历要求" type="text">
      <template #input>
        <van-dropdown-menu>
          <van-dropdown-item v-model="education" :options="option" />
        </van-dropdown-menu>
      </template>
    </van-field>
    <hr />
    <!-- 标签三 -->
    <van-field label="工作年限" type="text">
      <template #input>
        <van-dropdown-menu>
          <van-dropdown-item v-model="workyear" :options="option2" />
        </van-dropdown-menu>
      </template>
    </van-field>
    <hr />
    <!-- 标签4 -->
    <van-field
      v-model="introduce"
      autosize
      label="技能要求"
      type="textarea"
      maxlength="200"
      placeholder="请输入职业技能需求"
      show-word-limit
    />
    <hr />
    <van-field
      v-model="jobcontent"
      rows="4"
      autosize
      label="工作内容"
      type="textarea"
      maxlength="200"
      placeholder="请输入工作内容"
      show-word-limit
    />

    <van-field
      v-model="welfare"
      rows="4"
      autosize
      label="薪资福利"
      type="textarea"
      maxlength="200"
      placeholder="请输入薪资福利 "
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
      let param = `jobname=${this.name}&salary=${this.salary}&age=${this.age}&workyear=${this.option2[0].text}&jobcontent=${this.jobcontent}&welfare=${this.welfare}&myaddress=${this.position}&work=${this.introduce}&education=${this.option[0].text}&num=${this.num}
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
      jobcontent: "", //工作内容
      welfare: "", //薪资福利
      salary: "", //工资范围
      num: "", //招聘数量
      age: "", //年龄要求
      introduce: "", //标签四工作技能
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
