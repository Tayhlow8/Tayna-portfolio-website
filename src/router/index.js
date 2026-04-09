import { createRouter, createWebHistory } from 'vue-router'

const routes = [
  { path: '/',         component: () => import('../App.vue') },
  { path: '/historia', component: () => import('../App.vue') },
  { path: '/projetos', component: () => import('../App.vue') },
  { path: '/projetos/:slug', component: () => import('../App.vue') },
  { path: '/cv',            component: () => import('../App.vue') },
]

export default createRouter({
  history: createWebHistory(),
  scrollBehavior: () => ({ top: 0, behavior: 'instant' }),
  routes,
})
