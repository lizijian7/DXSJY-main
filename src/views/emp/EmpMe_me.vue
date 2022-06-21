<template>
    <div class="bgc">
        <!-- 头部 -->
<mt-header title="个人在线简历" style="font-size:18px">
      <router-link to="/empindex/empme" slot="left">
        <mt-button icon="back">返回</mt-button>
      </router-link>
      <mt-button icon="more" slot="right"></mt-button>
    </mt-header>
<!-- 第一个小界面 -->
<div class="mename">
    <div class="mename_1">
        <h1>名字 </h1>
        <span>工作x年-xx岁-xx学校</span>
    </div>
    <div class="mename_2" ><img :src="empurl" alt=""></div>
</div>
<!-- 第二小页面 -->
<!-- style="border-bottom:1px solid black" -->
<div class="onetitle" >
   <van-cell title="求职意向" class="xiaobiaoti" >
  <!-- 使用 right-icon 插槽来自定义右侧图标 -->
  <template #right-icon>
    <van-icon name="plus" class="jiahao" />
    <!-- <van-icon name="search" class="search-icon" /> -->
  </template>
</van-cell>
    <van-cell title="web前端  8k-11k" is-link size="large" label="浙江杭州-互联网开发"  />
    <van-cell title="开发工程师 8k-11k" is-link size="large" label="浙江杭州-互联网" />
    
</div>
<!-- 工作经历 -->
<div class="onetitle">
   <van-cell title="工作经历" class="xiaobiaoti" >
  <template #right-icon>
    <van-icon name="plus" class="jiahao" />
  </template>
</van-cell>
    <van-cell title="浙江杭州xxx互联网公司" is-link size="large" label="地下室保安" />
    <van-cell title="浙江杭州xxx互联网公司" is-link size="large" label="公司CEO" /> 
</div>
<!-- 教育经历 -->
<div class="onetitle">
   <van-cell title="教育经历" class="xiaobiaoti" >
  <template #right-icon>
    <van-icon name="plus" class="jiahao" />
  </template>
</van-cell>
    <van-cell title="浙江师范大学" is-link size="large" label="2019.01-2020.07---保安专业"  />
    <van-cell title="浙江师范大学" is-link size="large" label="2019.01-2020.07---保安专业"  />
</div>
<!-- 获得证书 -->
<div class="onetitle">
   <van-cell title="获得证书" class="xiaobiaoti" >
  <template #right-icon>
    <van-icon name="plus" class="jiahao" />
  </template>
</van-cell>
    <van-cell title="浙江师范大学高级保安二级" is-link size="large" />
    <van-cell title="浙江师范大学特技保安一级" is-link size="large" />
</div>
<div class="bj">
 <!-- <button class="btnbj" @click="$router.push('/empbj')">编辑</button> -->
 <van-button type="primary" icon="https://img01.yzcdn.cn/vant/user-active.png" color="rgb(92, 96, 100)" size="large" class="btnbj" @click="$router.push('/empbj')">编辑个人简历</van-button>
</div>

<div style="height:60px;"></div>
    </div>
</template>

<script>
import { mapState } from 'vuex';
    export default {
        computed:{
            ...mapState(['empurl'])
        },
         methods:{
        back(){
            this.$router.go(-1);
        }
    }
    }
</script>

<style  scoped>
.bj{
    display: flex;
    justify-content: center;
   /* color: rgb(92, 96, 100); */

}
.btnbj{
    display: inline-block;
    width: 90%;

}
.mename_2>img{
    border-radius: 50%;
}
*{
    margin: 0;padding: 0;
}
/* .bgc {
 background-color: rgba(220, 237, 209, 0.719);
} */
.onetitle{
margin:0 25px 15px  15px;

}
 .mename{
        display: flex;
        justify-content:space-between;
        padding: 20px 0px;
        margin: 0 15px;
        
    }
    /* .mint-header{
        background-color: rgb(99, 117, 105);
    }
    .van-cell__title,.van-icon-plus,.van-cell--clickable{
        background-color: rgba(220, 237, 209, 0.719);
    } */
    .mename_2{
     height:70px;
     width:70px;
    }
     .mename_2 img{
        width: 100%;
        
     }
    .van-cell{
        line-height: 34px;
    }
    .xiaobiaoti{
        font-size: 18px;
        font-weight: 600;
    }
    .jiahao{
        font-size: 20px;
    }
</style>