import Vue from 'vue';
import VueRouter from 'vue-router';
import { TokenService } from './services';

Vue.use(VueRouter);
const router =  new VueRouter({
    mode: 'history',
    routes
});

router.beforeEach((to, from, next) =>{
    if(to.matched.some(record => record.meta.requiresAuth )){
        if(TokenService.getToken() == null || TokenService.hasExpired()){
            next ({
                path: '/login',
                params: { nextUrl: to.fullPath }
            });
        }else{
            next();
        }
    }else{
        next();
    }
});

export default router;
