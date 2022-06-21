<template>
  <div>
    <!-- 搜索框 -->
    <van-search
      v-model="value"
      label=""
      show-action
      shape="round"
      placeholder="请输入搜索关键词"
      @search="onSearch"
    >
      <template #action>
        <div @click="onSearch">搜索</div>
      </template>
    </van-search>
    <!--轮播图-->
    <van-swipe class="my-swipe" :autoplay="3000" indicator-color="white">
      <van-swipe-item>广告位招租</van-swipe-item>
      <van-swipe-item>2</van-swipe-item>
      <van-swipe-item>3</van-swipe-item>
      <van-swipe-item>4</van-swipe-item>
    </van-swipe>
    <!-- 这里的数据后续可以用接口直接拿 -->
    <!-- 整点卡片导航栏 -->
    <mt-navbar v-model="selected">
      <!-- 卡片导航行内容  -->
      <mt-tab-item v-for="item in catList" :key="item.id" :id="item.id + ''">
        {{ item.category_name }}
      </mt-tab-item>
    </mt-navbar>
    <!-- 内容带下拉刷新 -->
    <div
      v-infinite-scroll="loadMore"
      infinite-scroll-distance="30"
      :infinite-scroll-immediate-check="true"
    >
      <article-item
        @click.native="$router.push(`/bossarticle?id=${item.id}`)"
        v-for="item in articleList"
        :key="item.id"
        :article="item"
      ></article-item>
    </div>
  </div>
</template>

<script>
import { Toast } from "vant";
import { Indicator } from "mint-ui";
import ArticleItem from "@/components/article_item.vue";

export default {
  components: {
    "article-item": ArticleItem,
  },
  data() {
    return {
      value: "", //搜索框双向绑定数据
      selected: "1", //导航栏内容双向绑定项
      catList: [], // 用于存储类别列表
      articleList: [], // 用于存储当前文章列表
      page: 1, // 用于描述当前页码
      isLoading: false, // 表示是否正在加载下一页数据
    };
  },
  activated() {
    // 跳转回当前页时执行, 重新将isLoading改为false,开启触底加载功能
    this.isLoading = false;
  },
  deactivated() {
    // 跳转到其他页面时,将isLoading改为true 不执行触底加载
    this.isLoading = true;
  },
  methods: {
    onSearch() {
      Toast(this.value);
    },
    // onCancel() {
    //   Toast("请等待功能开发");
    // },

    //获取article数据根据cid和page的传参来控制卡片数据需要使用时直接调用该函数并传参
    loadArticles(cid, page) {
      return new Promise((resolve, reject) => {
        // 加载中组件
        Indicator.open("加载中...");
        this.axios.get(`/bossarticles?cid=${cid}&page=${page}`).then((res) => {
          resolve(res);
          // 完成后关闭该功能
          Indicator.close();
        });
      });
    },
    // 当触发触底事件后, 执行loadMore方法触底加载下一页
    loadMore() {
      if (this.isLoading) {
        // 如果下一页正在加载中, 则直接返回
        return;
      }

      this.isLoading = true; //设置触底状态为正在加载
      let cid = this.selected; // this.selected即是顶部导航选中项的类别ID
      this.page++; // 下一页需要让data.page自增
      console.log(`到底了, 加载数据 cid:${cid},  page:${this.page}`);
      // 发送http请求, 加载相应页码的数据
      this.loadArticles(cid, this.page).then((res) => {
        console.log("加载下一页,", res);
        // 将返回的文章列表res.data.results 追加到当前列表末尾data.articleList
        this.articleList.push(...res.data.results);
        this.isLoading = false;
      });
    },
    // 封装自定义方法loadCats, 用于加载类别列表
    loadCats() {
      this.axios.get("/bosscategory").then((res) => {
        console.log("加载类别列表:", res);
        this.catList = res.data.results; //将类别列表数组存入data.catList
      });
    },
  },
  mounted() {
    // 加载类别列表
    this.loadCats();
    // 加载UI类别下的首页文章数据
    this.loadArticles(1, 1).then((res) => {
      console.log("UI类别下的首页文章数据", res);
      this.articleList = res.data.results; // 将文章列表存入data.articleList
    });
  },
  watch: {
    // 监听顶部导航选中项的变化,  selected用于表示顶部导航选中项的ID
    selected(newValue, oldValue) {
      window.scrollTo(0, 0); // 回到页面顶部
      this.page = 1; // 将当前页码置为1
      // console.log(newValue);  newValue即是当前选中项类别的ID
      this.loadArticles(newValue, 1).then((res) => {
        console.log("点击顶部导航", res);
        this.articleList = res.data.results; // 为articleList重新赋值为新数组
      });
    },
  },
};
</script>
<style lang="scss" scoped></style>
<style>
.my-swipe .van-swipe-item {
  color: #fff;
  font-size: 20px;
  line-height: 150px;
  text-align: center;
  background-color: #39a9ed;
}
</style>
