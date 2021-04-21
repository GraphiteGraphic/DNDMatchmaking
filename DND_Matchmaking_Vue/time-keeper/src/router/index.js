import Vue from 'vue'
import VueRouter from 'vue-router'
import PlayerSide from '@/views/PlayerSide.vue'
import DMSide from '@/views/DMSide.vue'

Vue.use(VueRouter)

const routes = [
{
  path: "/",
  name: "Home",
  component: PlayerSide,
},
{
  path: "/DM",
  name: "DM",
  component: DMSide,
}

]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
