import { shallowMount, mount } from "@vue/test-utils";
import { render } from '@vue/server-test-utils';
import { getLocalVue, getRouter } from '../../../helper.js';
import Vuex from 'vuex';
import Update from '@/modules/user/views/Update';
import user from  '@/modules/user/store';
import siap from '@/modules/main/store';

jest.mock('axios', () => ({
    get: jest.fn( () => Promise.resolve({
        nama: 'Foo Bar',
        username: 'foobar',
        email: 'foo@example.org',
        id: 'some-id'
    }) )
}));

import axios from 'axios';

describe('user/views/Update Component', () => {
    let wrapper;
    let store;
    let localVue;
    let router;

    beforeEach(() => {
        localVue = getLocalVue();
        store = new Vuex.Store({
            modules: {
                siap,
                user
            }
        });
        //router = getRouter(localVue);

    });// beforeEach

    it('should rendered properly', async() => {
        let $route = {
            params: {
                id: 'some-id'
            }
        };

        wrapper = await shallowMount(Update, {
            localVue,
            store,
            //router,
            mocks: {
                $route
            }
        });

        expect(axios.get).toHaveBeenCalledTimes(1);
        expect(wrapper.html()).toContain('Foo Bar');
    });
});
