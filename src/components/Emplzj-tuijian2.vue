<template>
  <div>
       <el-card class="box-card">
          <div slot="header" class="clearfix">
           <div style="display:flex">
             <div class="card-img">
              <img src="../assets/zhiQ01.png" alt="" />
            </div>
            <div class="card-image">        
              <p>摆烂工程师</p>
              <span>北京，资深工程师</span>
            </div>
           </div>
              <button class="card-button1" >+关注</button>
            

          </div>
          <div class="text item" style="font-size: 18px">
            现在这个躺平的社会加班真的没有前途，还不如摆烂打原神
          </div>
          
              <img style="width: 80vw;" src="../assets/zhiQ02.png" alt="" />
              <!-- ../../assets/zhiQ02.png -->
           
          <button class="card-button">评论</button>
          <button class="card-button">分享</button>
        </el-card>
  </div>
</template>

<script>
export default {
  methods:{
    dianji(){

    }
  }
};
</script>

<style  scoped>
*{
  margin: 0;padding: 0;
}
.clearfix {
  display: flex;
  justify-content: space-between;
}
.card-img img {
  width: 40px;
  height: 40px;
 
}
p{
  width: 30vw;
  font-size: 18px;
  font-weight: 600;
}
.card-button1 {
  background-color: #b3d2f1;
  border-radius: 5px;
  width: 55px;
  height: 30px;
}
.card-button {
  padding: 0 5px;
  margin:10px 15px;
  font-size: 13px;
  /* margin-left: 70%; */
}
/* .card-image {
  margin-left: 1rem;
}
.card-image span {
  font-size: 15px;
  font-weight: 400;
}

 */
</style>