<template>
  <div>
    <van-tabs v-model="active">
      <van-tab title="消息">
        <div class="indexpipeitu">
          <van-notice-bar
            scrollable
            text="每一个优秀的HR都应该知道的一件事：管理自己是人类事务中的一场革命"
          />
        </div>
        <div class="indexpipei">
          <div class="indextu">
            <img
              src="../../../public/avatar/01e4d25db2859ba801209e1fb4c1b5.jpg"
              alt=""
            />
          </div>
          <div>
            <p style="font-weight: 900">专属高匹配简历</p>
            <span style="color: #aaa">还有多个适合的员工，快来和他聊聊吧</span>
          </div>
        </div>
      </van-tab>
      <van-tab title="通知">
        <div class="indexpipei">
          <div class="indextu">
            <img
              src="../../../public/avatar/01e4655cad50e5a801214168d1f296.jpg"
              alt=""
            />
          </div>
          <div>
            <p style="font-weight: 900">大家都在聊</p>
            <p style="color: #aaa">阅读《高效能人士的七个习惯》有感...</p>
          </div>
        </div>
        <div class="indexpipei">
          <div class="indextu">
            <img
              src="../../../public/avatar/04c7fe55406db00000017c50bb1b9c.jpg"
              alt=""
            />
          </div>
          <div>
            <p style="font-weight: 900">职Q问答</p>
            <p style="color: #aaa">向女士等你回复...</p>
          </div>
        </div>
        <div class="indexpipei">
          <div class="indextu">
            <img
              src="../../../public/avatar/00b2e259575a7da8012193a331099a.jpg"
              alt=""
            />
          </div>
          <div>
            <p style="font-weight: 900">招聘小秘书</p>
            <p style="color: #aaa">根据您的浏览记录为您推荐一份前端工程师...</p>
          </div>
        </div>
        <div class="indexpipei">
          <div class="indextu">
            <img
              src="../../../public/avatar/01be845cde87d1a801208f8b49a1e1.jpg"
              alt=""
            />
          </div>
          <div>
            <p style="font-weight: 900">求职帮</p>
            <p style="color: #aaa">
              你有一份 优先推荐 的权益待领取!使用该权...
            </p>
          </div>
        </div>
        <div class="indexpipei">
          <div class="indextu">
            <img
              src="../../../public/avatar/04e97957ecae4ba84a0d304f05b9f2.jpg"
              alt=""
            />
          </div>
          <div>
            <p style="font-weight: 900">有话职说</p>
            <p style="color: #aaa">年轻人回老家工作，是没出息吗?</p>
          </div>
        </div>
      </van-tab>
      <van-tab title="谁看了我">
        <div class="lqfzhaohu">
          <div>
            <img src="../../../src/assets/rem-zhiQ-imgs/404.jpg" alt="" />
          </div>
          <p>当前没有被查看记录，快去发布招聘公告吧!</p>
        </div>
      </van-tab>
      <van-tab title="招呼">
        <div class="lqfzhaohu">
          <div>
            <img src="../../../src/assets/rem-zhiQ-imgs/404.jpg" alt="" />
          </div>
          <p>暂无新消息</p>
          <p>好机会是"聊"出来的,快去聊聊</p>
        </div>
      </van-tab>
    </van-tabs>
  </div>
</template>

<script>
export default {
  data() {
    return {
      active: 0,
    };
  },
};
</script>

<style scoped>
* {
  margin: 0;
  padding: 0;
}
.indexpipei {
  display: flex;
  margin-top: 2vh;
}
.indexpipeiziti {
  display: inline-block;
}
img {
  width: 100%;
}
.lqfzhaohu > p {
  width: 100%;
  text-align: center;
}
.indextu > img {
  width: 10vw;
  height: 6vh;
  border-radius: 50%;
  margin: 1vw 3vw 0 3vw;
}
</style>
