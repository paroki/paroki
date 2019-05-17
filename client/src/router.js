import Vue from 'vue';
import VueRouter from 'vue-router';
import DefaultContainer from './views/DefaultContainer';
import Login from './views/Login';
import Dashboard from './views/Dashboard';
import { TokenService } from './services';

Vue.use(VueRouter);

import user from './modules/user/routes';
import baptis from './modules/baptis/routes';

const routes = {
    mode: 'history',
    routes: [
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
            meta: {
                requiresAuth: true
            },
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
    ]
};

let router =  new VueRouter(routes);

router.beforeEach((to, from, next) =>{

    if(to.matched.some(record => record.meta.requiresAuth )){
        if(TokenService.getToken() == null){
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
