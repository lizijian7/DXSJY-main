<template class="bd">
  <div>
    <mt-header title="修改头像" style="font-size: 18px">
      <router-link to="/empindex/empme" slot="left">
        <mt-button icon="back">返回</mt-button>
      </router-link>
      <mt-button icon="more" slot="right"></mt-button>
    </mt-header>
    <!-- 头部 -->
    <el-upload
      class="upload-demo"
      drag
      action="http://localhost:4000/upload"
      name="uploadFile"
      multiple
      :on-success="handleUploadSuccess"
    >
      <i class="el-icon-upload"></i>
      <div class="el-upload__text"><em>点击上传</em></div>
      <div class="el-upload__tip" slot="tip">
        只能上传jpg/png文件，且不超过500kb
      </div>
    </el-upload>
    <!-- <div>
      <span>
        <div class="jianyi">头像建议</div>
        <strong>1.自己照片</strong><br />
       第一印象是充满自信、善于沟通交流，这类人在职场或是生活中往往更会展示自己。<br />
        <strong>2.宠物或卡通人物</strong><br />
       这类人在工作上的创新能力相对比较强，思维较为开阔。<br>
        <strong>3.表情包或搞笑图</strong><br />
       这类人一般活泼、热情，并且头像更换频率高。在职场中，这类人给别人的感觉幽默感十足。<br>
        <strong>4.风景或植物</strong><br />
        这类人通常较为成熟，在日常生活或工作中，他们更注重和谐稳定的人际关系。<br>
       <strong> 5.人物图片</strong><br />
        一般用人物照片的人，内心对头像人物的某一特质是充满向往的。一方面告知别人自己的品味；另一方面，借用他人的成功来鞭策自己进步。</span>
    </div> -->
    <div class="yaoqiu">
      1、免冠（不戴帽子）正面照片。<br />

      2、照片上正常应该看到人的两耳轮廓和相当于男士的喉结处的地方。<br />

      3、照片尺寸可以为一寸或二寸，颜色可以为黑白或彩色。<br />

      4、拍照时不得上唇膏等影响真实面貌的化妆色彩，包括头发的染色。<br />

      5、穿有领子的衣服，不能化妆化得过浓，影响真实面貌。
    </div>
  </div>
</template>

<script>
import { mapMutations, mapState } from "vuex";
export default {
  computed: {
    ...mapState(["id"]),
  },
  methods: {
    ...mapMutations(["updateurl"]),
    handleUploadSuccess(res) {
      //当文件上传成功后触发
      console.log(res);
      const a = res.urls[0];
      this.updateurl(a);
      const parmas = `url=${a}&id=${this.id}`;
      this.axios.post("/empurl", parmas).then((res) => {
        console.log(res);
        this.$router.push("/empindex/empme");
      });
    },
  },
};
</script>

<style  scoped>
.yaoqiu {
  margin-top: 2vh;
  font-size: 18px;
  line-height: 38px;
  padding: 0 0 0 15px;
}
/* .jianyi {
  text-align: center;
  padding: 0;
  margin: 1vh 0 0 0;
  font-size: 20px;
  font-weight: 700;
} */
.upload-demo {
  /* margin-top: 20vh; */
  /* height: 100vh; */
}
.el-upload__tip {
  text-align: center;
  font-size: 1rem;
  font-weight: 700;
}
</style>