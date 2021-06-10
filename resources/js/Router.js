import Vue  from 'vue';
import VueRouter from 'vue-router';
import Login from './components/Login';
import Home from './components/Home';
import Profile from './components/Profile';
import Friend from './components/Friend';
import Photos from './components/Photos';
import Posts from './components/Posts';
import NotFound from './components/404'
import User from './components/User';
import UserPost from './components/UserPost';
import UserPhoto from './components/UserPhoto';

Vue.use(VueRouter);
const routes=[
    {
        path:'/Login',
        component:Login,
        beforeEnter: (to, from, next) => {
           
            axios.get('api/verfify').then((resp)=>{
                
                next('/Home');

                    
           }).catch((err)=>{
            next();

           })
          }
    },
    
    {
        path:'/Home',
        component:Home,
        name:'Home',
    
        beforeEnter: (to, from, next) => {
           axios.get('api/verfify').then((resp)=>{
                next();
                    
           }).catch((err)=>{
            next('/Login');
            // next();

           })
          }
    },
    {
        path:'/user/:id/:token',
        component:User,
        name:'User',
        children:[
            {
                path:'',
                component:UserPost,
                name:'UserPost'
            },
            {
                path:'/user-Photos/:id/:token',
                component:UserPhoto
            }
        ],
        beforeEnter: (to, from, next) => {
           axios.get('api/verfify').then((resp)=>{
                next();
                    
           }).catch((err)=>{
            next('/Login');
            // next();

           })
          }
    },
    // User
    {
        path:'/profile',
        component:Profile,
        name:Profile,
       
        children:[
            {
                path:'/Friends',
                component:Friend,
                name:Friend,
            },
            {
                path:'/Photos',
                component:Photos,
                name:Photos,
            },
            {
                path:'',
                component:Posts,
                name:Posts,
            },
            
        ],
        beforeEnter: (to, from, next) => {
          
            axios.get('api/verfify').then((resp)=>{
                 next();
        //         // console.log(resp.status);
                     
            })
            .catch((err)=>{
                  console.log(err);
                
                            next("/Login");
                            // router.push("/Login")
                

           
            })
           }
    },
    {
        path:'/',
        beforeEnter: (to, from, next) => {
            axios.get('api/verfify').then((success)=>{
                next('/Home');
            }).catch((err)=>{
                next('/Login');
            })
           
          }
    },
    {
        path:'*',
        component:NotFound
    }
]
const router=new VueRouter ({routes });
router.beforeEach((to, from, next) => {
const token=localStorage.getItem('login_token') || null;
window.axios.defaults.headers['authorization'] = 'Bearer ' +token;


next();


})
export default router

