import Vue from "vue";
import VueRouter from "vue-router";
import HomeView from "../views/HomeView.vue";

Vue.use(VueRouter);

const routes = [
  {
    path: '/empsend',
    name: 'empsend',
    component: () => import('../views/emp/EmpSend.vue'),
    path: '/empbj',
    name: 'empbj',
    component: () => import('../views/emp/EmpMebj.vue'),
  },
  {
    path: "/empzqinsert/:name",
    props: true,
    name: "empzqinsert",
    component: () => import("../views/emp/Empzqinsert.vue"),
  },
  {
    path: "/empxg",
    name: "empxg",
    component: () => import("../views/emp/empxg.vue"),
  },
  {
    // 主页
    path: "/",
    name: "index",
    component: () => import("../views/Index.vue"),
  },
  {
    // 用户登陆
    path: "/emplogin",
    name: "emplogin",

    component: () => import("../views/emp/EmpLogin.vue"),
  },
  {
    // 用户注册
    path: "/empregister",
    name: "empregister",

    component: () => import("../views/emp/EmpRegister.vue"),
  },
  {
    path: "/empindexdetails/:id",
    name: "EmpIndexDetails",
    props: true,
    component: () => import("../views/emp/lqf/EmpIndexDetails.vue"),
  },
  {
    path: "/empindexsearch",
    name: "EmpIndexsearch",
    component: () => import("../views/emp/lqf/EmpIndexsearch.vue"),
  },
  {
    // 用户主页
    path: "/empindex",
    name: "empindex",
    component: () => import("../views/emp/EmpIndex.vue"),
    redirect: "/empindex/empindexcell",
    props: true,
    children: [
      {
        path: "empindexcell",
        name: "empindexcell",
        component: () => import("../views/emp/lqf/EmpIndexcell.vue"),

        children: [
          {
            path: "empindextuijia",
            name: "empindextuijian",
            component: () => import("../views/emp/lqf/EmpIndextuijian.vue"),
          },
        ],
      },
      {
        path: "/empindexfujin",
        name: "empindexfujin",
        component: () => import("../views/emp/lqf/EmpIndexfujin.vue"),
      },
      {
        path: "zhiq",
        name: "zhiq",
        component: () => import("../views/emp/EmpzhiQ.vue"),

      },
      {
        // 用户个人信息
        path: "empme",
        name: "empme",
        component: () => import("../views/emp/EmpMe.vue"),

      },
      {
        path: "/empme_me",
        name: "empme_me",
        component: () => import("../views/emp/EmpMe_me.vue"),
      },
      {
        path: "/empzhaoren",
        name: "empzhaoren",
        component: () => import("../views/emp/me-fenzhi/empzhaoren.vue"),
      },
      {
        path: "/empmianshi",
        name: "empmianshi",
        component: () => import("../views/emp/me-fenzhi/empmianshi.vue"),
      },
      {
        path: "/empzizhi",
        name: "empzizhi",
        component: () => import("../views/emp/me-fenzhi/empzizhi.vue"),
      },
      {
        path: "empindexxiaoxi",
        name: "empindexxiaoxi",
        component: () => import("../views/emp/lqf/EmpIndexxiaoxi.vue"),

      },
    ],
  },
  {
    path: "/empindexpipei",
    name: "EmpIndexpipei",
    component: () => import("../views/emp/lqf/EmpIndexpipei.vue"),
  },
  {
    // 用户职位筛选
    path: "/empjobs",
    name: "empjobs",

    component: () => import("../views/emp/EmpJobs.vue"),
  },
  {
    // 用户聊天
    path: "/empmessage",
    name: "empmessage",

    component: () => import("../views/emp/EmpMessage.vue"),
  },

  {
    // 招聘者登陆
    path: "/bosslogin",
    name: "bosslogin",
    component: () => import("../views/boss/BossLogin.vue"),
  },
  {
    // 招聘者注册
    path: "/bossregister",
    name: "bossregister",
    component: () => import("../views/boss/BoosRegister.vue"),
  },
  {
    // 招聘者主页
    path: "/bossindex",
    name: "bossindex",

    component: () => import("../views/boss/BossIndex.vue"),
    children: [
      {
        // 子路由主页
        path: "bosscarefully",
        name: "bosscarefully",
        component: () => import("../views/boss/BossCarefully.vue"),
      },
      {
        // 子路由职位
        path: "jobs",
        name: "jobs",
        component: () => import("../views/boss/BossJobs.vue"),
      },
      {
        // 子路由消息
        path: "message",
        name: "messaget",
        component: () => import("../views/boss/BossMessage.vue"),
      },
      {
        // 子路由我的
        path: "me",
        name: "me",
        component: () => import("../views/boss/BossMe.vue"),
      },
      {
        // 子路由地图组件
        path: "bossmap",
        name: "bossmap",
        component: () => import("../views/boss/BossMap.vue"),
      },
    ],
  },
  {
    // 发布职位
    path: "/recruit",
    name: "recruit",
    component: () => import("../views/boss/Recruit.vue"),
  },
  {
    // 首页文章
    path: "/bossarticle",
    name: "bossarticle",

    component: () => import("../views/boss/BossArticle.vue"),
  },
  {
    // 切换身份
    path: "/bosschange",
    name: "bosschange",

    component: () => import("../views/boss/BossChange.vue"),
  },
  {
    //公司信息
    path: "/bosscompany",
    name: "bosscompany",
    component: () => import("../views/boss/BossCompany.vue"),
  },

  // {
  //   // 职位
  //   path: "/bossjobs",
  //   name: "bossjobs",

  //   component: () => import("../views/boss/BossJobs.vue"),
  // },

  // {
  //   // hr消息
  //   path: "/bossmessage",
  //   name: "bossmessage",

  //   component: () => import("../views/boss/BossMessage.vue"),
  // },
  // {
  //   // 公司信息
  //   path: "/bossme",
  //   name: "bossme",
  //   component: () => import("../views/boss/BossMe.vue"),
  // },

  // {
  //   path: '/',
  //   name: 'home',
  //   component: HomeView
  // },
  // {
  //   path: '/about',
  //   name: 'about',
  //   // route level code-splitting
  //   // this generates a separate chunk (about.[hash].js) for this route
  //   // which is lazy-loaded when the route is visited.
  //   component: () => import(/* webpackChunkName: "about" */ '../views/AboutView.vue')
  // }
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes,
});

export default router;
