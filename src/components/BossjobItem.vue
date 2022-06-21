<template>
  <div class="lqf-index">
    <div>
      <div class="lqf-index-span">
        <div>
          <span>{{ bossjobitem.jobname }}</span>
        </div>
        <div>
          <span>{{ bossjobitem.num }}人</span>
        </div>
        <div>
          <span>{{ bossjobitem.salary }}</span>
        </div>
      </div>
      <div class="lqf-index-ziti">
        <span>{{ bossjobitem.age }}</span>
        <span>{{ bossjobitem.work }}</span>
        <span>{{ bossjobitem.workyear }}</span>
        <span>{{ bossjobitem.education }}</span>
        <!-- 这里应该使用boss完善的资料信息 -->
      </div>
      <div>
        <!-- 这里应该使用boss完善的资料信息 -->
        <span> 严于庭有限公司 </span>
      </div>
      <div class="lqf-index-hr">
        <div>
          <img
            src="https://img0.baidu.com/it/u=2387177308,2370109332&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500"
            alt="HR头像"
          />
          <span>HR·严先生 </span>
          <!-- 这里应该使用boss完善的资料信息 -->
        </div>
        <!-- <div>
          {{ bossjobitem.welfare }}
        </div> -->
        <div>
          <span> {{ bossjobitem.myaddress }}</span>
          <van-icon
            name="cross"
            @click.native="deleteBossjob(bossjobitem.id)"
          />
        </div>
      </div>
      <hr />
    </div>
  </div>
</template>

<script>
import { Indicator } from "mint-ui";
export default {
  props: ["bossjobitem"],
  methods: {
    toAdd() {
      //   this.$router.push("/bossindex/me");
      console.log("跳转");
    },
    deleteBossjob(id) {
      return new Promise((resolve, reject) => {
        // 加载中组件
        Indicator.open("加载中...");
        this.axios.delete(`/bossjobcard?id=${id}`).then((res) => {
          console.log(res);
          this.bossjoblist = res.data.result;

          // 完成后关闭该功能
          Indicator.close();
          location.reload();
        });
      });
    },
  },
};
</script>

<style lang="scss" scoped></style>
<style scoped>
/* .jobhead {
  display: flex;
  justify-content: space-between;
} */
/* .van-icon:before {
  line-height: 63px;
  margin: 0 30px;
  font-size: 20px;
  font-weight: bold;
} */

.lqf-index {
  margin: 0 20px;
}
.lqf-index > div > div {
  margin: 10px 0;
}

.lqf-index-span {
  display: inline-block;
  display: flex;
  justify-content: space-between;
  font-size: 20px;
  font-weight: 800;
  overflow: hidden;
}
.lqf-index-span > div:last-child {
  color: red;
  font-weight: 600;
}
.lqf-index-ziti {
  font-size: 12px;
}
.lqf-index-ziti span {
  display: inline-block;
  margin-right: 10px;
  padding: 5px 10px;
  background-color: rgba(228, 229, 243, 0.8);
}

.lqf-index-hr {
  display: inline-block;
  display: flex;
  justify-content: space-between;
}
.lqf-index-hr div img {
  width: 30px;
  height: 30px;
}
.lqf-index-hr > div {
  display: flex;
  align-items: center;
}
.lqf-index-hr > div > span {
  line-height: 30px;
}
</style>
