import normalizeArray from '@/utils/normalizeArray';
import user from '@/modules/user/routes';
import baptis from '@/modules/baptis/routes';

import DefaultContainer from '@/views/DefaultContainer';
import Login from '@/views/Login';
import Dashboard from '@/views/Dashboard';

const routes = [
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

export default routes;
