import router from '../../src/router';

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
