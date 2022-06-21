import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    id: sessionStorage.getItem("id"),
    empurl:sessionStorage.getItem('url'),
    name: sessionStorage.getItem("name"),
    boss_name: sessionStorage.getItem("boss_name"),
    zhiwei:sessionStorage.getItem('zhiwei'),
    zqlength:sessionStorage.getItem('zqlength'),
  },
  getters: {},
  mutations: {
    updateBossLoginState(state, boss_name) {
      state.boss_name = boss_name;
      sessionStorage.setItem("boss_name", boss_name);
    },
    updateid(state, id) {
      state.id = id;
      sessionStorage.setItem("id", id);
    },
    updatename(state, name) {
      state.name = name;
      sessionStorage.setItem("name", name);
    },
    updateurl(state,url){
      state.empurl=url
      sessionStorage.setItem('url',url)
    },
    updatezhiwei(state,zhiwei){
      state.zhiwei=zhiwei
      sessionStorage.setItem('zhiwei',zhiwei)
    },
    updatezqlength(state,zqlength){
      state.zqlength=zqlength
      sessionStorage.setItem('zqlength',zqlength)
    },

  },
  actions: {},
  modules: {},
});
