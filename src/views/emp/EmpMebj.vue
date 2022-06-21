<template>
  <div>
    <!-- <van-picker
      title="选择心仪的岗位"
      show-toolbar
      :columns="columns"
      @confirm="onConfirm"
      @cancel="onCancel"
      @change="onChange"
    /> -->
    <van-field
  readonly
  clickable
  label="职位"
  :value="value"
  placeholder="选择职位"
  @click="showPicker = true"

/>
<van-popup v-model="showPicker" round position="bottom">
  <van-picker
    show-toolbar
    :columns="columns"
    @cancel="showPicker = false"
    @confirm="onConfirm"
  />
</van-popup>
    <van-cell-group>
      <van-field
        v-model="price"
        label="薪资待遇"
        placeholder="请输入期望的薪资待遇"
      />
            <van-field
        v-model="gzjl"
        label="工作经历"
        placeholder="请输入最近一次的工作的单位"
      />
        <van-field
        v-model="gw"
        label="工作岗位"
        placeholder="请输入最近一次的工作岗位"
      />
       <van-field
        v-model="student"
        label="最高学历"
        placeholder="请输入最高学历"
      />
      <van-field
        v-model="zs"
        label="证书"
        placeholder="请输入拿到过的证书名称"
      />   
       <van-field
        v-model="disirbe"
        label="个人简介"
        placeholder="请简单的进行一下自我描述"
      />     
    </van-cell-group>
  </div>
</template>

<script>
import { Toast } from 'vant';
import { Picker } from 'vant';
import { ref } from 'vue';
export default {
  data() {
    return {
      columns: [
        "WEB前端开发工程师",
        "后端开发工程师",
        "运维工程师",
        "测试",
        "UI设计",
        "项目经理",
      ],
      value:"",
      showPicker: false,
      zhiwei:'',
      price:'',
      gzjl:'',
      gw:'',
      student:'',
      zs:'',
      disirbe:'',
    };
  },
  
  methods: {
    
 onConfirm(value) {
      this.value = value;
      this.showPicker = false;
    },
    // onConfirm(value, index) {
    //   Toast(`您心仪的职位：${value}, 当前索引：${index}`);
    //     this.zhiwei=value
    // },
    // onChange(picker, value, index) {
    //   Toast(`您心仪的职位：${value}, 当前索引：${index}`);
    //     this.zhiwei=value
    // },
    // onCancel() {
    //   Toast("取消");
    // },
  },

};
</script>

<style lang="scss" scoped>
</style>