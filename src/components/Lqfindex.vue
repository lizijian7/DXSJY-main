<template>
  <div>
    <div class="lqf-index">
      <div class="lqf-index-span">
        <div>
          <router-link :to="`/empindexdetails/` + item.id">
            <span>{{ item.title }}</span></router-link
          >
        </div>
        <div class="indexsprice">
          <router-link :to="`/empindexdetails/` + item.id">
            <span>{{ item.sprice }}</span></router-link
          >
        </div>
      </div>
      <div class="lqf-index-ziti">
        <router-link :to="`/empindexdetails/` + item.id">
          <span v-for="d in g" :key="d">{{ d }}</span></router-link
        >
      </div>
      <div>
        <router-link :to="`/empindexdetails/` + item.id">
          <span>{{ item.gongsi }}</span></router-link
        >
      </div>

      <div class="lqf-index-hr">
        <div>
          <img :src="`/avatar/` + item.avatar" alt="" class="indextupian" />

          <router-link :to="`/empindexdetails/` + item.id">
            <span>{{ item.zhiwei }}·</span
            ><span>{{ item.renwu }}</span></router-link
          >
        </div>
        <div>
          <router-link :to="`/empindexdetails/` + item.id">
            <span>
              {{ item.dizhi }}&nbsp;
              <i class="el-icon-location-information"></i>
            </span>
          </router-link>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: ["item"],
  data() {
    return {};
  },
  computed: {
    g() {
      return this.item.biaoqian.split("/");
    },
  },
};
</script>

<style lang="scss" scoped></style>
<style scoped>
a {
  color: black;
}
.lqf-index {
  margin: 0.5em 0.5em;
  padding: 0.5em;
  background-color: whitesmoke;
}
.lqf-index div {
  padding: 0.2em 0;
}
.lqf-index-span {
  display: inline-block;
  display: flex;
  justify-content: space-between;
}
.lqf-index-span > div:first-child {
  font-size: 5vw;
  font-weight: 530;
}
.lqf-index-ziti {
  font-size: 12px;
}
.lqf-index-ziti span {
  display: inline-block;
  margin: 0 2px;
  padding: 3px 5px;
  background-color: rgb(230, 236, 240);
}
.lqf-index-hr {
  display: inline-block;
  display: flex;
  justify-content: space-between;
}
.indextupian {
  width: 1.5em;
  height: 1.5em;
  border-radius: 50%;
  margin-right: 0.6em;
  margin-bottom: -0.4em;
}
.indexsprice {
  margin-top: 0.25em;
}
</style>
