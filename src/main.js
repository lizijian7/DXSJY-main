import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'

import MintUI from 'mint-ui'
import 'mint-ui/lib/style.css'

import Vant from 'vant';
import 'vant/lib/index.css';

import axios from "axios";
import VueAxios from "vue-axios";
// 配置momentjs
import moment from 'moment'
Vue.prototype.moment = moment 

import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';

import Chat from 'vue-beautiful-chat'

Vue.use(Chat)
Vue.use(ElementUI);
//如果基础路径都相同 可以在axios使用前配置基础路径。这样后续所有引入axios的页面里导入网址都会自动拼接上前半截不用受到输入
axios.defaults.baseURL="http://localhost:3000/"
Vue.use(VueAxios,axios)
Vue.use(Vant);
Vue.use(MintUI)

Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
