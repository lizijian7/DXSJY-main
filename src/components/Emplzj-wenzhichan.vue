<template>
  <div>   
    
    <div
      class="bigdiv"
    >
 
      <el-card class="box-card">
        <div slot="header" class="clearfix">
          <div style="display:flex">
            <div class="card-img">
            <img :src="`${wzc.avatar}`" alt="" />
          </div>
          <div class="card-image">
            <p>{{ wzc.name }}</p>
            <span>{{ wzc.zhiwei }}</span>
          </div>
          </div>
          
          <el-button class="card-button1" type="text">+关注</el-button>
        </div>
        <div class="text item" style="font-size: 14px">
          {{ wzc.content }}
        </div>
        <button class="card-button">评论</button>
        <button class="card-button">分享</button>
        <button class="card-button" v-if="wzc.name==name" @click="delete1">删除</button>
      </el-card>
      
    </div>
  </div>
</template>

<script>
import { mapMutations, mapState } from 'vuex';
export default {
  props: ["wzc"],
  computed:{
    ...mapState(['name'])
  },
  methods:{
    ...mapMutations(['updatezqlength']),
    delete1(){
      this.axios.post('/empdelete',`id=${this.wzc.id}`).then(res=>{
        console.log(res)
      this.axios.get(`zqselect?name=${this.name}`).then(res=>{
          console.log('同名数据:',res)
          this.updatezqlength(res.data.result.length)
        })
      })
    }
  },
};
</script>

<style  scoped>
.btn{
  font-size: 13px;
  margin-left: 187px;
}
p{
  margin: 0;padding: 0;
}
.el-card {
  margin-bottom: 5px;
  background-color: azure;
}

.clearfix {
display: flex;
justify-content: space-between;
}

.card-img img {
  width: 40px;
  height: 40px;
}
.card-image {
  margin-left:10px;
}
.card-image span {
  font-size: 12px;
}
.card-button1 {
  background-color: #b3d2f1;
  border-radius: 5px;
  width: 55px;
  /* padding: 5px 0; */
  /* height: 20px; */
  /* line-height: 20px; */
}
.card-button {
  padding: 0px 3px;
  margin: 12px 0 0px  12px;
  font-size: 13px;
  /* margin-left: 70%; */
}
</style>