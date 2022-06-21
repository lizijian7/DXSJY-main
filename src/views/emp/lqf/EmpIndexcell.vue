<template>
  <div>
    <!-- 顶部 -->
    <div class="empindex">
      <div>
        <!-- 搜索 -->
        <van-row>
          <van-col span="1"></van-col>
          <van-col span="22">
            <input type="text" placeholder="高薪职位" @focus="gosearch" />
          </van-col>
          <van-col span="1"></van-col>
        </van-row>
      </div>
      <!-- 分区 -->
      <template>
        <el-tabs v-model="activeName" @tab-click="handleClick" class="tuijian">
          <el-tab-pane label="推荐" name="first">
            <emp-indextuijian />
          </el-tab-pane>
          <el-tab-pane label="Helpdesk" name="second">
            <div class="lqf-cell-fu">
              <div>
                <img src="../../../assets/rem-zhiQ-imgs/404.jpg" alt="" />
              </div>
              <p class="lqf-cell-fu-2">暂无满足该求职意向的职位</p>
              <div class="lqf-cell-fu-3">
                你可以尝试
                <router-link to="/empindex">修改求职意向</router-link>
                或
                <router-link to="/empindex">搜索职位</router-link>
              </div>
            </div>
          </el-tab-pane>
        </el-tabs>
      </template>
    </div>
  </div>
</template>
    <!-- 主体内容分区 -->


<script>
import EmpIndextuijian from "./EmpIndextuijian.vue";
export default {
  components: { EmpIndextuijian },
  data() {
    return {
      value: "",
      activeName: "first",
    };
  },
  methods: {
    handleClick(tab, event) {
      console.log(tab, event);
    },
    gosearch() {
      this.$router.push("/empIndexsearch");
    },
  },
};
</script>
<style scoped>
* {
  margin: 0;
  padding: 0;
}
.lqf-cell-fu img {
  width: 100%;
}
.lqf-cell-fu {
  display: inline-block;
  width: 100%;
  text-align: center;
  background-color: white;
}
input {
  margin-top: 3vw;
  border-radius: 5vw;
  font-size: 12px;
  width: 88%;
  padding: 3vw 5vw;
  border: 1px solid gray;
  height: 1em;
}
</style>
<style>
.el-tabs__item.is-active {
  font-size: 15px;
  font-weight: bold;
}
</style>