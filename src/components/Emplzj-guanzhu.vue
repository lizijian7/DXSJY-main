<template>
    <div>
   <div  class="bigdiv" >
        <el-card class="box-card">
          <div slot="header" class="clearfix">
            <div class="card-img">
              <img :src="`${gz.avatar}`" alt="" />
            </div>
            <div class="card-image">
              <p>{{gz.name}}</p>
              <span >{{gz.zhiwei}}</span>
            </div>
            <!-- <el-button class="card-button1"  type="text"
              >+关注</el-button
            > -->
          </div>
          <div class="text item" style="font-size: 16px">
            {{gz.content}}
          </div>
          <button class="card-button">评论</button>
          <button class="card-button">分享</button>
        </el-card>
      </div>
    </div>
</template>

<script>

    export default {
        props: ["gz"],
    }
</script>

<style  scoped>
.el-card{
    margin-bottom:5px;
    background-color: azure;
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
.card-image p{
  margin: 0;
  padding: 0;
}
.card-image span {
  font-size: 12px;
}
.card-button1 {
  margin-left: 15rem;
  font-size: 1rem;
  height: 25px;
  padding:5px ;
  background-color: #f0f0f0;
  border-radius: 5px;
}
.card-button {
  padding: 0 3px;
  margin: 10px 6px;
  font-size: 13px;
  /* margin-left: 70%; */
}
</style>