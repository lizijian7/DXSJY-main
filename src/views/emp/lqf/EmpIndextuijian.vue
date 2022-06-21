<template>
  <div>
    <div class="tuijian">
      <van-tabs v-model="active">
        <van-tab title="全部">
          <template v-if="data">
            <div>
              <van-swipe
                class="my-swipe"
                :autoplay="1500"
                indicator-color="white"
              >
                <van-swipe-item class="swiper">
                  <img src="/indexswiper1.jpg" alt="" />
                </van-swipe-item>
                <van-swipe-item class="swiper">
                  <img src="/indexswiper2.jpg" alt="" />
                </van-swipe-item>
                <van-swipe-item class="swiper">
                  <img src="/indexswiper3.jpg" alt="" />
                </van-swipe-item>
                <van-swipe-item class="swiper">
                  <img src="/indexswiper4.jpg" alt="" />
                </van-swipe-item>
              </van-swipe>
            </div>
            <div>
              <lqfindex v-for="x in data.result" :item="x" :key="x.id" />
            </div>
          </template>
        </van-tab>
        <van-tab title="最新"> 待完善！ </van-tab>
        <van-tab title="附近" to="/empindexfujin"> </van-tab>
      </van-tabs>
    </div>
  </div>
</template>
<script>
import Lqfindex from "@/components/Lqfindex.vue";
export default {
  components: { Lqfindex },
  data() {
    return {
      active: 0,
      data: [],
    };
  },
  // watch: {
  //   id() {
  //     this.getindex();
  //   },
  // },
  mounted() {
    this.getindex();
  },
  methods: {
    getindex() {
      const url = `/index?id=` + this.id;
      this.axios.get(url).then((res) => {
        console.log(res);
        this.data = res.data;
      });
    },
  },
};
</script>

<style scoped>
.my-swipe .van-swipe-item {
  color: #fff;
  font-size: 20px;
  line-height: 150px;
  text-align: center;
  background-color: #39a9ed;
}
.swiper {
  height: 8em;
  width: 100%;
}
.swiper img {
  height: 8em;
  width: 100%;
}
</style>
