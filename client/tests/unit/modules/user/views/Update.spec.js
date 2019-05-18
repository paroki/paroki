import { shallowMount, createLocalVue } from "@vue/test-utils";
import { getLocalVue } from '../../../helper.js';
import Vuex from 'vuex';
import VueRouter from 'vue-router';
import Update from '@/modules/user/views/Update';
import user from  '@/modules/user/store';
import siap from '@/modules/main/store';

describe('user/views/Update Component', () => {
  let wrapper;

  beforeEach(() => {

    const localVue = getLocalVue();
    const store = new Vuex.Store({
      modules: {
        siap,
      	user
      }
    });

    const $route = {
      params: {
        id: '1234'
      }
    };
    wrapper = shallowMount(Update, {
      localVue,
      store,
      mocks: {
        $route
      }
    });

  });// beforeEach

  it('should rendered properly', () => {
    expect(true).toBeTruthy();
  });
});
