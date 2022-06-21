<template>
  <div 
  v-infinite-scroll="loadMore"
      infinite-scroll-distance="30"
      infinite-scroll-immediate-check="true"
  >
    <!-- 搜索框 -->
    <van-row type="flex" justify="space-between">
      <van-col span="3" class="emp-tubiao">
        <van-icon name="https://b.yzcdn.cn/vant/icon-demo-1126.png" />
      </van-col>
      <van-col span="17">
        <van-search
          v-model="value"
          shape="round"
          input-align="center"
          placeholder="请输入搜索关键词"
        />
      </van-col>
      <van-col span="2" class="emp-tubiao">
        <van-icon name="calendar-o" />
      </van-col>
      <van-col span="2" class="emp-tubiao">
        <van-icon name="envelop-o" />
      </van-col>
    </van-row>
    <!-- 分类 -->
    <van-tabs v-model="active">
      <van-tab title="关注">
        <!-- 轮播图 -->
        <van-swipe class="my-swipe" :autoplay="2000" indicator-color="white">
            <van-swipe-item style="height:42vw ;"><img style="width:100vw;height:100% ; " src="../../assets/rem-zhiQ-imgs/a0df2d3e-8e21-11ea-82de-482ae31b2081.jpg" alt=""></van-swipe-item>
            <van-swipe-item style="height:42vw ;"><img style="width:100vw;height:100% ; " src="../../assets/rem-zhiQ-imgs/a0dfd068-8e21-11ea-bfad-482ae31b2081.jpg" alt=""></van-swipe-item>
            <van-swipe-item style="height:42vw ;"><img style="width:100vw;height:100% ; " src="../../assets/rem-zhiQ-imgs/a0de5ae4-8e21-11ea-ac17-482ae31b2081.jpg" alt=""></van-swipe-item>
            <van-swipe-item style="height:42vw ;"><img style="width:100vw;height:100% ; " src="../../assets/rem-zhiQ-imgs/rem-lbt04.png" alt=""></van-swipe-item>
          </van-swipe>
          <!-- 关注组件 -->
          <emplzj-guanzhu v-for="guanzhu in guanzhuList" :key="guanzhu.id" :gz="guanzhu"/>
      </van-tab>

      <van-tab title="推荐">
        <!-- 推荐的图片后续在使用数据库中的 -->
        <div>
          <van-swipe class="my-swipe" :autoplay="2000" indicator-color="white">
            <van-swipe-item style="height:42vw ;"><img style="width:100vw;height:100% ; " src="../../assets/rem-zhiQ-imgs/a0e07c66-8e21-11ea-a067-482ae31b2081.jpg" alt=""></van-swipe-item>
            <van-swipe-item style="height:42vw ;"><img style="width:100vw;height:100% ; " src="../../assets/rem-zhiQ-imgs/a0e1965a-8e21-11ea-968a-482ae31b2081.jpg" alt=""></van-swipe-item>
            <van-swipe-item style="height:42vw ;"><img style="width:100vw;height:100% ; " src="../../assets/rem-zhiQ-imgs/a0e23e52-8e21-11ea-986a-482ae31b2081.jpg" alt=""></van-swipe-item>
            <van-swipe-item style="height:42vw ;"><img style="width:100vw;height:100% ; " src="../../assets/rem-zhiQ-imgs/a0e30332-8e21-11ea-b64a-482ae31b2081.jpg" alt=""></van-swipe-item>
          </van-swipe>
        </div>

        <!-- 热议榜组件 -->
       <emplzj-tuijian-1/>
        <!-- 朋友圈组件 -->
        <emplzj-tuijian-2/>
       
       
      </van-tab>

      <van-tab title="学习">
        <!-- 推荐的图片后续在使用数据库中的 -->
        <div>
         <van-swipe class="my-swipe" :autoplay="2000" indicator-color="white">
            <van-swipe-item style="height:42vw ;"><img style="width:100vw;height:100% ; " src="../../assets/rem-zhiQ-imgs/a0e601fe-8e21-11ea-a5ef-482ae31b2081.jpg" alt=""></van-swipe-item>
            <van-swipe-item style="height:42vw ;"><img style="width:100vw;height:100% ; " src="../../assets/rem-zhiQ-imgs/a0e6dda4-8e21-11ea-922f-482ae31b2081.jpg" alt=""></van-swipe-item>
            <van-swipe-item style="height:42vw ;"><img style="width:100vw;height:100% ; " src="../../assets/rem-zhiQ-imgs/rem-lbt03.png" alt=""></van-swipe-item>
            <van-swipe-item style="height:42vw ;"><img style="width:100vw;height:100% ; " src="../../assets/rem-zhiQ-imgs/rem-lbt04.png" alt=""></van-swipe-item>
          </van-swipe>
        </div>
        <!-- 卡片 -->
       <!-- 学习组件 -->
       <emplzj-xuexi v-for="xuexi in data" :key="xuexi.id" :xz="xuexi"/>
         
      </van-tab>

      <van-tab title="问职场">
        <!-- 推荐的图片后续在使用数据库中的 -->
        <div>
          <van-swipe class="my-swipe" :autoplay="2000" indicator-color="white">
            <van-swipe-item style="height:42vw ;"><img style="width:100vw;height:100% ; " src="../../assets/rem-zhiQ-imgs/a0e92b54-8e21-11ea-a2e4-482ae31b2081.jpg" alt=""></van-swipe-item>
            <van-swipe-item style="height:42vw ;"><img style="width:100vw;height:100% ; " src="../../assets/rem-zhiQ-imgs/rem-lbt02.png" alt=""></van-swipe-item>
            <van-swipe-item style="height:42vw ;"><img style="width:100vw;height:100% ; " src="../../assets/rem-zhiQ-imgs/rem-lbt03.png" alt=""></van-swipe-item>
            <van-swipe-item style="height:42vw ;"><img style="width:100vw;height:100% ; " src="../../assets/rem-zhiQ-imgs/rem-lbt04.png" alt=""></van-swipe-item>
          </van-swipe>
        </div>
        <!-- card -->
        <!-- <div  
              v-infinite-scroll='loadMore' 
              infinite-scroll-distance='30'
              infinite-scroll-immediate-check='true' >
        <el-card class="box-card" v-for="(n,i) in data" :key="i">
          <div slot="header" class="clearfix">
            <div class="card-img">
              <img :src="`/avatar/${n.avatar}`" alt="" />
            </div>
            <div class="card-image">
              <p>{{n.name}}</p>
              <span>{{n.zhiwei}}</span>
            </div>
            <el-button class="card-button1" style="float: right; padding: 3px 4px; font-size:15px" type="text"
              >+关注</el-button
            >
          </div>
          <div class="text item" style="font-size: 14px">
            {{n.content}}
          </div>
          <button class="card-button">评论</button>
          <button class="card-button">分享</button>
        </el-card>
      </div> -->
          <!-- 问职场组件 -->
             <router-link :to="`/empzqinsert/${this.name}`"> <el-button type="primary" icon="el-icon-edit" circle class="fabiao"></el-button></router-link>
            <emplzj-wenzhichan v-for="wenzhichan in data" :key="wenzhichan.id" :wzc="wenzhichan"   />
      </van-tab>
    </van-tabs>

    <div style="height:50px"></div>
  </div>

</template>

<script>
import { mapState } from 'vuex';
import {Indicator} from 'mint-ui'
import EmplzjGuanzhu from '@/components/Emplzj-guanzhu.vue';
import EmplzjWenzhichan from '@/components/Emplzj-wenzhichan.vue';
import EmplzjXuexi from '@/components/Emplzj-xuexi.vue';
import EmplzjTuijian1 from '@/components/Emplzj-tuijian1.vue';
import EmplzjTuijian2 from '@/components/Emplzj-tuijian2.vue';
export default {
  components: { "emplzj-guanzhu":EmplzjGuanzhu, "emplzj-wenzhichan":EmplzjWenzhichan, EmplzjXuexi, EmplzjTuijian1, EmplzjTuijian2 },
  data() {
    return {
      active: 0,
      value: "",
      currentDate: new Date(),
      data:[],
      guanzhuList:[],
      xuexi:[],
      page:1,
      isLoading:false,
    };
  },
  methods:{
    loadArticles(page){
      return new Promise((resolve,reject)=>{
         Indicator.open()  //开启等待框
        this.axios.get(`/zqget?page=${page}`).then(res=>{
          resolve(res)
          Indicator.close();//关闭等待框
        })
      })
    },
    getdata(n=1){
      this.axios.get(`/zqget?page=${n}`).then(res=>{
        console.log("1212",res)
        this.data=res.data.result
      })
    },
    getguanzhu(){
      this.axios.get(`/zqget`).then(res=>{
        console.log("关注",res)
        this.guanzhuList=res.data.result
      })
    },
    loadMore(){
         if(this.isLoading){
          // 如果下一页正在加载中，则直接返回
            return
          }
        this.isLoading=true
        this.page++
        console.log(`到底了,加载数据,page:${this.page}`)
        // 发送http请求，加载相应页码的数据
        this.loadArticles(this.page).then((res)=>{
          console.log('加载下一页',res)
        // 将返回的文章列表re.data.resuls追加到列表末尾data.artcleList
        this.data.push(...res.data.result)//使用...展开运算符，因为括号里是数组不展开无法访问到其中
        // 也可以用concat方法，concat意思是拼接,两者都可以使用
        // this.articleList=this.articleList.concat(res.data.results)
        this.isLoading=false  
        })
      },
  },
  computed:{
    ...mapState(['name','zqlength']),
    a(){
      return this.zqlength
    }
  },
  mounted(){
    this.getdata(),
    this.getguanzhu()
  },
  watch:{
    a(){
      this.getdata()
      this.getguanzhu()
    }
  }
};
</script>

<style scoped >
.fabiao{
  font-size: 20px;
  border-radius: 50px;
 position: fixed;
  top: 50%;
  right: 0;

}
* {
  margin: 0;
  padding: 0;
}
.text {
  font-size: 10px;
}

.item {
  margin-bottom: 18px;
}


/* .van-search {
  background-color: rgb(228, 229, 243);
} */
.emp-tubiao {
  display: flex;
  align-items: center;
  justify-content: center;
}
.my-swipe .van-swipe-item {
  color: #fff;
  font-size: 20px;
  line-height: 150px;
  text-align: center;
  background-color: #39a9ed;
}

.time {
  font-size: 13px;
  color: #999;
}

.bottom {
  margin-top: 13px;
  line-height: 12px;
}

.button {
  padding: 0;
  float: right;
}

.image {
  width: 100%;
  display: block;
}

.clearfix:before,
.clearfix:after {
  display: table;
  content: "";
}

.clearfix:after {
  clear: both;
}
.clearfix {
  display: flex;
}
.card-img img {
  width: 40px;
  height: 40px;
}
.card-image {
  margin-left: 1rem;
}
.card-image span {
  font-size: 12px;
}
.card-button1 {
  margin-left: 5rem;
  font-size: 1rem;
  height: 25px;
  padding: 2px 5px;
  background-color: #f0f0f0;
  border-radius: 5px;
}
.card-button {
  padding: 0 3px;
  margin: 0 6px;
  font-size: 13px;
  /* margin-left: 70%; */
}
</style>


