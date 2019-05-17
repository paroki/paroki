import Vue from 'vue';
import VueRouter from 'vue-router';
import DefaultContainer from './views/DefaultContainer';
import Login from './views/Login';
import Dashboard from './views/Dashboard';
import { TokenService } from './services';
import normalizeArray from './utils/normalizeArray';

Vue.use(VueRouter);

import user from './modules/user/routes';
import baptis from './modules/baptis/routes';

let routes = [
    {
        path: '/login',
        name: 'Login',
        component: Login,
        meta: {
            requiresAuth: false
        }
    },
    {
        path: '/',
        name: 'Dashboard',
        redirect: '/dashboard',
        component: DefaultContainer,
        children: [
            {
                name: 'Home',
                path: '/dashboard',
                component: Dashboard,
                meta: {
                    requiresAuth: true
                }
            },
            ...user,
            ...baptis
        ]
    },
    {
        path: '/logout',
        name: 'Logout',
        component: Login,
        meta: {
            requiresAuth: false
        }
    }
];

normalizeArray(routes,{
    defaults: {
        meta: {
            requiresAuth: true
        }
    }
});

let router =  new VueRouter({
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
