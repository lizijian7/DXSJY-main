<template>
  <div>
    <div class="jobhead">
      <h3>快来招募你的同事吧</h3>
      <!-- 跳转到职位add界面 -->
      <van-icon name="plus" @click.native="$router.push(`/recruit`)" />
    </div>

    <bossjob-item
      v-for="item in bossjoblist"
      :key="item.id"
      :bossjobitem="item"
    ></bossjob-item>
  </div>
</template>

<script>
import BossjobItem from "@/components/BossjobItem";
import { Indicator } from "mint-ui";

export default {
  components: { "bossjob-item": BossjobItem },
  data() {
    return {
      bossjoblist: [], // 用于存储当前
    };
  },

  methods: {
    //获取数据
    loadBossjob() {
      return new Promise((resolve, reject) => {
        // 加载中组件
        Indicator.open("加载中...");
        this.axios.get("bossjobcard").then((res) => {
          console.log(res);
          this.bossjoblist = res.data.result;
          // 完成后关闭该功能
          Indicator.close();
        });
      });
    },
  },
  mounted() {
    // 加载UI类别下的首页文章数据
    this.loadBossjob();
  },
  watch: {
    // 监听顶部导航选中项的变化,  selected用于表示顶部导航选中项的ID
    // selected(newValue, oldValue) {
    loadCats() {
      this.axios.get("/category").then((res) => {
        console.log("加载类别列表:", res);
        this.catList = res.data.results; //将类别列表数组存入data.catList
      });
    },
    //   window.scrollTo(0, 0); // 回到页面顶部
    //   this.page = 1; // 将当前页码置为1
    //   // console.log(newValue);  newValue即是当前选中项类别的ID
    //   this.loadArticles(newValue, 1).then((res) => {
    //     console.log("点击顶部导航", res);
    //     this.articleList = res.data.results; // 为articleList重新赋值为新数组
    //   });
    // },
  },
};
</script>

<style lang="scss" scoped></style>
<style scoped>
.jobhead {
  display: flex;
  justify-content: space-between;
  margin: 0 20px;
}
.van-icon:before {
  line-height: 63px;
  /* margin: 0 px; */
  font-size: 20px;
  font-weight: bold;
}
</style>
