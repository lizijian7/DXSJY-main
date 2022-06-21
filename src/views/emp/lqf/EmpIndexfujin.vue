<template>
  <div>
    <mt-header>
      <router-link to="/empindex/empindexcell" slot="left">
        <mt-button icon="back">返回</mt-button>
      </router-link>
      <mt-button icon="more" slot="right"></mt-button>
    </mt-header>
    <div class="gong">此功能暂未开放！</div>
  </div>
</template>

<script>
export default {};
</script>

<style scoped>
.gong {
  width: 100%;
  display: inline-block;
  text-align: center;
  background-color: antiquewhite;
  font-size: 2em;
}
</style>