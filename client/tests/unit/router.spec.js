import routes from '@/modules/routes';
import VueRouter from 'vue-router';
import { getLocalVue } from './helper.js';

const localVue = getLocalVue();
localVue.use(VueRouter);
const router = new VueRouter({
  mode: 'history',
  routes
})
function getMeta(routeName){
    return router.resolve({name: routeName}).route.meta;
}

describe('router', () => {
    it('should set default values', () => {
        expect(getMeta('Dashboard').requiresAuth).toBeTruthy();
        expect(getMeta('Login').requiresAuth).toBeFalsy();
        expect(getMeta('UserList').requiresAuth).toBeTruthy();
        expect(getMeta('UserCreate').requiresAuth).toBeTruthy();
    });
});
