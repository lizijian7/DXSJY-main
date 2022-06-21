<template>
    <div>
   <div>
           <el-card :body-style="{ padding: '0px' }"  >
              <img
                :src="`/articles/${xz.image}`"
                class="image"
              />
              <div style="padding: 14px">
                <span>{{xz.descrption}}</span>
                <div class="bottom clearfix">
                  <time class="time">￥0.00元</time>
                  <el-button type="text" class="button">免费购买</el-button>
                </div>
              </div>
            </el-card>
        </div>
    </div>
</template>

<script>

    export default {
        props: ["xz"],
    }
</script>

<style  scoped>
span{
  font-size: 18px;
  font-weight: 700;
}
img{
  width: 100vw;
}
.button{
  margin-left: 50px;
  font-size: 20px;
}
</style>