<template>
  <div>
    <div class="top" v-if="data">
      <!-- 导航栏 -->
      <van-nav-bar>
        <template #left>
          <van-icon name="scan" size="18" />
        </template>
        <template #right>
          <van-icon name="gift-o" size="18" />
          &nbsp;&nbsp;
          <van-icon name="setting-o" size="18" />
        </template>
      </van-nav-bar>
      <!-- 在线简历以及图片 -->
      <div class="tp">
        <router-link to="/empme_me" style="color: aliceblue; font-size: 18px"
          >在线简历<van-icon name="arrow"
        /></router-link>
        <router-link to="/empxg" v-if="empurl">
          <img class="tx" :src="data.url" alt="" />
        </router-link>
        <router-link to="/empxg" v-else
          ><img class="img1" src="/1.png" alt=""
        /></router-link>
      </div>
      <!--标签 -->
      <span class="sp"><van-icon name="exchange" />职场人</span>
      <span class="sp"><van-icon name="replay" />刷新简历</span>

      <!-- 下方5个 -->
      <div class="top1">
        <div>
          <span>{{ data.toudi.split(",").length }}</span>
          <router-link to="/empsend"><p>投递</p></router-link>
        </div>
        <div>
          <span>{{ data.shoucang }}</span>
          <p>收藏</p>
        </div>
        <div>
          <span>{{ data.zuji }}</span>
          <p>足迹</p>
        </div>
        <div>
          <span>{{ data.guanzhu }}</span>
          <p>关注</p>
        </div>
        <div>
          <span>{{ data.hudong }}</span>
          <p>互动</p>
        </div>
      </div>
    </div>

    <div class="bd">
      <div class="qz">————求职服务————</div>
      <div>
        <div>
          <img src="../../assets/images/1.jpg" alt="" />
          <span>升级简历</span>
        </div>
        <div>
          <img src="../../assets/images/2.jpg" alt="" />
          <span>升级简历</span>
        </div>
        <div>
          <img src="../../assets/images/3.jpg" alt="" />
          <span>升级简历</span>
        </div>
      </div>

      <div>
        <div>
          <img src="../../assets/images/4.jpg" alt="" />
          <span>简历模板</span>
        </div>
        <div>
          <img src="../../assets/images/5.jpg" alt="" />
          <span>简历置顶</span>
        </div>
        <div>
          <img src="../../assets/images/6.jpg" alt="" />
          <span>全部详情</span>
        </div>
      </div>
    </div>

    <div class="kb"></div>

    <div class="md">
      <router-link to="/empzhaoren">
        <van-cell title="我要招人" icon="friends-o" style="font-size: 20px">
          <template #right-icon>
            <van-icon name="arrow" />
          </template>
        </van-cell>
      </router-link>
      <router-link to="/empindex/zhiq">
        <van-cell
          title="求职意向"
          icon="envelop-o"
          style="font-size: 20px"
          is-link
          value="求职中"
        >
          <template #right-icon>
            <van-icon name="arrow" />
          </template>
        </van-cell>
      </router-link>
      <router-link to="/empmianshi">
        <van-cell title="面试邀请" icon="comment-o" style="font-size: 20px">
          <template #right-icon>
            <van-icon name="arrow" />
          </template>
        </van-cell>
      </router-link>
      <van-cell
        title="附件简历"
        icon="todo-list-o"
        style="font-size: 20px"
        is-link
        value="去上传"
      >
        <template #right-icon>
          <van-icon name="arrow" />
        </template>
      </van-cell>
      <van-cell
        title="家的位置"
        icon="wap-home-o"
        style="font-size: 20px"
        is-link
        value="去设置"
      >
        <template #right-icon>
          <van-icon name="arrow" />
        </template>
      </van-cell>
      <van-cell
        title="我的职Q"
        icon="chat-o"
        style="font-size: 20px"
        is-link
        value="已发布的动态"
      >
        <template #right-icon>
          <van-icon name="arrow" />
        </template>
      </van-cell>
      <van-cell title="我的订单" icon="comment-o" style="font-size: 20px">
        <template #right-icon>
          <van-icon name="arrow" />
        </template>
      </van-cell>
      <van-cell title="我的钱包" icon="balance-o" style="font-size: 20px">
        <template #right-icon>
          <van-icon name="arrow" />
        </template>
      </van-cell>
      <van-cell title="客户服务" icon="service-o" style="font-size: 20px">
        <template #right-icon>
          <van-icon name="arrow" />
        </template>
      </van-cell>
      <van-cell title="帮助与反馈" icon="comment-o" style="font-size: 20px">
        <template #right-icon>
          <van-icon name="arrow" />
        </template>
      </van-cell>
      <router-link to="/empzizhi">
        <van-cell title="资质显示" icon="manager-o" style="font-size: 20px">
          <template #right-icon>
            <van-icon name="arrow" />
          </template>
        </van-cell>
      </router-link>
      <button class="btn1" @click="$router.push('/emplogin')">退出登录</button>
      <van-row
        type="flex"
        justify="space-around"
        style="text-align: center; font-size: 12px; margin-top: 10px"
      >
        <van-col span="6">举报监督电话</van-col>
        <van-col span="6">人力资源服务许可证</van-col>
        <van-col span="6">营业执照</van-col>
      </van-row>
      <div style="text-align: center; margin-top: 10px">web招聘--2022-6-9</div>

      <div style="height: 50px"></div>
    </div>
  </div>
</template>

<script>
import { mapState } from "vuex";
export default {
  computed: {
    ...mapState(["id", "empurl"]),
  },
  methods: {
    emp_lzh() {
      this.$dialog.alert({
        message: "此功能暂未开启,敬请期待",
      });
    },
    getdata() {
      console.log(this.id);
      this.axios.get(`/meget?id=${this.id}`).then((res) => {
        console.log(res);
        this.data = res.data.result;
      });
    },
  },
  watch: {
    empurl() {
      this.getdata();
    },
  },
  mounted() {
    this.getdata();
  },
  data() {
    return {
      data: "",
    };
  },
};
</script>

<style  scoped>
.btn1 {
  width: 100%;
  height: 42px;
  background-color: rgb(74 158 250 / 80%);
  border-radius: 20px;
  margin-top: 12px;
  margin-bottom: 6px;
  border: 0;
}
.img1 {
  width: 60%;
  border-radius: 50%;
}
.tp {
  position: relative;
}
.tp > a:nth-child(1) {
  display: inline-block;
  line-height: 30px;
}
.tp > a:nth-child(2) {
  margin-left: 200px;
  margin-top: 12px;
  position: absolute;
}
.kb {
  height: 6px;
  background-color: rgb(247, 248, 250);
}
.van-cell__value {
  font-size: 15px;
}
.md .van-icon-friends-o:before {
  font-size: 25px;
}
.md .van-icon-envelop-o:before {
  font-size: 25px;
}
.md .van-icon-comment-o:before {
  font-size: 25px;
}
.md .van-icon-todo-list-o:before {
  font-size: 25px;
}
.md .van-icon-wap-home-o:before {
  font-size: 25px;
}
.md .van-icon-chat-o:before {
  font-size: 25px;
}
.md .van-icon-service-o:before {
  font-size: 25px;
}
.md .van-icon-balance-o:before {
  font-size: 25px;
}
.md .van-icon-manager-o:before {
  font-size: 25px;
}
h3 {
  margin-bottom: 10px;
  display: inline-block;
  margin-left: 8px;
  color: aliceblue;
}
.sp {
  border: 1px solid none;
  border-radius: 12px;
  font-size: 14px;
  margin-left: 8px;

  color: aliceblue;
  background-color: rgb(98, 130, 233);
  line-height: 25px;
  height: 25px;
  display: inline-block;
}

.tx {
  width: 50px;
  height: 50px;
  border-radius: 50%;
}

.top > div {
  position: relative;
}
.top > div > img {
  position: absolute;
  right: 18px;
  top: 18px;
}
.top {
  background-color: rgb(79, 112, 227);
}
.top1 > div {
  display: inline-block;
  text-align: center;
  margin-top: 8px;
  color: aliceblue;
}
.top1 p {
  margin-top: 5px;
  margin-bottom: 5px;
}
.top1 {
  display: flex;
  justify-content: space-around;
  margin-top: 20px;
}
.qz {
  text-align: center;
  color: rgb(192, 151, 106);
  margin-top: 8px;
  margin-bottom: 14px;
}
.bd > div {
  text-align: center;
}
.bd img {
  width: 35px;
  display: inline-block;
}
.bd > div:nth-child(2) > div > span {
  line-height: 32px;
}
.bd > div:nth-child(2) > div {
  display: inline-block;
}

.bd > div:nth-child(2) {
  display: flex;
  justify-content: space-around;
  align-content: center;
  margin-top: 12px;
}
.bd > div:nth-child(2) > div {
  display: flex;
  align-content: center;
}

.bd > div:nth-child(3) {
  display: flex;
  justify-content: space-around;
  align-content: center;
  margin-top: 12px;
}
.bd > div:nth-child(3) > div {
  display: flex;
  align-content: center;
}
.bd {
  background-color: white;
}
</style>
