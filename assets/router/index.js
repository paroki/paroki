import DefaultContainer from '../components/DefaultContainer';
import Login from '../components/Login';

export default [
    {
        path: '/',
        redirect: '/dashboard',
        component: DefaultContainer,
    },
    {
        path: '/login',
        name: 'Login',
        component: Login
    }
];
