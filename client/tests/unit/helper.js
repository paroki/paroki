import Vue from 'vue';
import Vuex from "vuex";
import { createLocalVue } from "@vue/test-utils";
import Vuetify from 'vuetify';
import components from '@/components';

console.error = jest.fn();

export const getLocalVue = () => {

    const localVue = createLocalVue();
    localVue.use(Vuetify);
    localVue.use(Vuex);
    localVue.use(components);
    return localVue;
}
