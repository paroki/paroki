import Vuex from "vuex";
import { createLocalVue } from "@vue/test-utils";
import Vuetify from 'vuetify';
import components from '@/components';
import VueRouter from "vue-router";
import routes from '@/modules/routes';

console.error = jest.fn();

export const getLocalVue = () => {

    const localVue = createLocalVue();
    localVue.use(Vuetify);
    localVue.use(Vuex);
    localVue.use(components);
    return localVue;
}

export const getRouter = (localVue) => {
    localVue.use(VueRouter);
    return new VueRouter({
        mode: 'history',
        routes
    })
}
