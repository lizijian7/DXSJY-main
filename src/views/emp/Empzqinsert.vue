<template>
    <div class="bgc">
        <mt-header title="个人吐槽" style="font-size:18px">
      <router-link to="/empindex/zhiq" slot="left">
        <mt-button icon="back">返回</mt-button>
      </router-link>
      <mt-button icon="more" slot="right"></mt-button>
    </mt-header>
    <van-cell-group>
  <van-field v-model="value"  placeholder="请输入当前想要发送的内容" />
</van-cell-group>
<button class=" custom-btn btn-3" @click="zqinsert">确认提交</button>
    </div>
</template>

<script>
import { mapMutations, mapState } from 'vuex'
    export default {
        data() {
            return {
                value:'',
                data:[]
            }
        },
        props:['name'],
        computed:{
       ...mapState(['empurl'])
        },
       methods:{
        ...mapMutations(['updatezqlength']),
          getdata(){
             this.axios.get(`/empzqinsertget?name=${this.name}`).then(res=>{
                console.log(res)
                this.data=res.data.result
             })
          },
          zqinsert(){
            let pramas=`name=${this.name}&avatar=${this.empurl}&zhiwei=${this.data.zhiwei}&content=${this.value}`
            this.axios.post('/empzqinsert',pramas).then(res=>{
                console.log(res)
                 this.axios.get(`zqselect?name=${this.name}`).then(res=>{
          console.log('同名数据:',res)
          this.updatezqlength(res.data.result.length)
        })
                this.$router.push('/empindex/zhiq')
            })
          } 
    },
    mounted(){
        this.getdata()
    }
    }
</script>

<style  scoped>
.bgc {
  height: 100vh;
  background-image: url(../../assets/login.jpeg);
  background-repeat: no-repeat;
  background-position: center;
  background-size: cover;
}
.van-field{
    font-size: 20px;

}
.van-cell{
    border: 1px solid black;
    height: 20vh;
}

.custom-btn {
  width: 100px;
  height: 40px;
  color: #fff;
  border-radius: 5px;
  padding: 10px 25px;
  font-family: "Lato", sans-serif;
  font-weight: 500;
  background: transparent;
  cursor: pointer;
  transition: all 0.3s ease;
  position: relative;
  display: inline-block;
  box-shadow: inset 2px 2px 2px 0px rgba(255, 255, 255, 0.5),
    7px 7px 20px 0px rgba(0, 0, 0, 0.1), 4px 4px 5px 0px rgba(0, 0, 0, 0.1);
}
.btn-3 {
  background: rgb(0, 172, 238);
  background: linear-gradient(
    0deg,
    rgba(0, 172, 238, 1) 0%,
    rgba(2, 126, 251, 1) 100%
  );
  width: 100px;
  height: 40px;
  line-height: 42px;
  margin:2vw 0  0 70vw;
  padding: 0;
  border: none;
}
.btn-3 span {
  position: relative;
  display: block;
  width: 100%;
  height: 100%;
}
.btn-3:before,
.btn-3:after {
  position: absolute;
  content: "";
  right: 0;
  top: 0;
  background: rgba(2, 126, 251, 1);
  transition: all 0.3s ease;
}
.btn-3:before {
  height: 0%;
  width: 2px;
}
.btn-3:after {
  width: 0%;
  height: 2px;
}
.btn-3:hover {
  background: transparent;
  box-shadow: none;
}
.btn-3:hover:before {
  height: 100%;
}
.btn-3:hover:after {
  width: 100%;
}
.btn-3 span:hover {
  color: rgba(2, 126, 251, 1);
}
.btn-3 span:before,
.btn-3 span:after {
  position: absolute;
  content: "";
  left: 0;
  bottom: 0;
  background: rgba(2, 126, 251, 1);
  transition: all 0.3s ease;
}
.btn-3 span:before {
  width: 2px;
  height: 0%;
}
.btn-3 span:after {
  width: 0%;
  height: 2px;
}
.btn-3 span:hover:before {
  height: 100%;
}
.btn-3 span:hover:after {
  width: 100%;
}


</style>