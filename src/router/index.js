import { createRouter, createWebHistory } from 'vue-router'
import product from '../views/product.vue'
import team from '../views/team.vue'
import login from  '../views/login.vue'
import register from '../views/register.vue'
import profile from '../views/profile.vue'
import myfavorite from '../views/myfavorite.vue'
import myproduct from '../views/myproduct.vue'
import myproductdetail from '../views/myproductdetail.vue'
import addproduct from '../views/addproduct.vue'
import editproduct from '../views/editproduct.vue'
import member from '../views/member.vue'
import productdetail from '../views/productdetail.vue'

const routes = [
  {
    path: '/',
    name: 'index',
    component: product
  },
  {
    path: '/product',
    name: 'product',
    component: product
  },
  {
    path: '/team',
    name: 'team',
    component: team
  },
  {
    path: '/login',
    name: 'login',
    component: login
  },
  {
    path: '/register',
    name: 'register',
    component: register
  },
  {
    path: '/profile',
    name: 'profile',
    component: profile
  },
  {
    path: '/myfavorite',
    name: 'myfavorite',
    component: myfavorite
  },
  {
    path: '/myproduct',
    name: 'myproduct',
    component: myproduct
  },
  {
    path: '/myproductdetail/:id',
    name: 'myproductdetail',
    props: true ,
    component: myproductdetail
  },
  {
    path: '/addproduct',
    name: 'addproduct',
    component: addproduct
  },
  {
    path: '/editproduct/:id',
    name: 'editproduct',
    props: true ,
    component: editproduct
  },
  {
    path: '/member',
    name: 'member',
    component: member
  },
  {
    path: '/productdetail/:id',
    name: 'productdetail',
    props: true , 
    component: productdetail
  },
  
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
