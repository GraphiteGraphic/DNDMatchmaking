import Vue from 'vue'
import VueRouter from 'vue-router'
import PlayerSide from '@/views/PlayerSide.vue'
import DMSide from '@/views/DMSide.vue'
import store from '@/store/index.js'

Vue.use(VueRouter)

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: "/",
      name: "Home",
      component: PlayerSide,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: "/DM",
      name: "DM",
      component: DMSide,
      meta: {
        requiresAuth: true
      }
    }
  ]
})

router.beforeEach((to, from, next) => {
  // Determine if the route requires Authentication
  const requiresAuth = to.matched.some(x => x.meta.requiresAuth);
  // If it does and they are not logged in, send the user to "/login"
  if (requiresAuth && store.state.token === '') {
    window.location.href = "https://discord.com/oauth2/authorize?client_id=835298512962846750&redirect_uri=htttp%3A%2F%2Flocalhost%3A8080&response_type=token&scope=identify";
  } else {
    // Else let them go to their next destination
    next();
  }
});

export default router
