import Vue from 'vue';
import VueRouter from 'vue-router';
import DefaultContainer from '../plugins/siap/DefaultContainer';
import Login from '../components/Login';
import Dashboard from '../components/Dashboard';
import UnderConstruction from '../components/pages/UnderConstruction';

Vue.use(VueRouter);

import user from './user';

let router =  new VueRouter({
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
                {
                    name: 'Baptis',
                    path: '/baptis',
                    component: UnderConstruction,
                    meta: {
                        requiresAuth: true
                    }
                },
                {
                    name: 'Perkawinan',
                    path: '/perkawinan',
                    component: UnderConstruction,
                    meta: {
                        requiresAuth: true
                    }
                },
                {
                    name: 'Komuni',
                    path: '/komuni',
                    component: UnderConstruction,
                    meta: {
                        requiresAuth: true
                    }
                },
                {
                    name: 'Krisma',
                    path: '/krisma',
                    component: UnderConstruction,
                    meta: {
                        requiresAuth: true
                    }
                },
                {
                    name: 'Viaticum',
                    path: '/viaticum',
                    component: UnderConstruction,
                    meta: {
                        requiresAuth: true
                    }
                },
                {
                    name: 'Under Construction',
                    path: '/under-construction',
                    component: UnderConstruction,
                    meta: {
                        requiresAuth: true
                    }
                },

                ...user
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
});

router.beforeEach((to, from, next) =>{
    if(to.matched.some(record => record.meta.requiresAuth )){
        if(localStorage.getItem('token') == null){
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
