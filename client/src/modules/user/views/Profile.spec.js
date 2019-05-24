import { shallowMount, createLocalVue } from '@vue/test-utils';
import Vuex from 'vuex';
import updateModule from '../store/update';
import Profile from './Profile';
import Vuetify from 'vuetify';
import plugins from '@/components';

jest.mock('@/services/TokenService');

import { TokenService } from '@/services';
TokenService.getCredentials = jest.fn();
TokenService.getCredentials.mockReturnValue({id: 'some-id'});

const localVue = createLocalVue();
localVue.use(Vuex);
localVue.use(plugins);

describe('Profile', () => {
    let state;
    let store;
    let actions;

    beforeEach( () => {
        localVue.use(Vuetify);
        actions = {
            getProfile: jest.fn(),
            updateProfile: jest.fn(),
            profilePassword: jest.fn(),
            snackbarSuccess: jest.fn(),
            updateReset: jest.fn(),
            resetError: jest.fn()
        };
        const module = {
            namespaced: true,
            update: {
                ...updateModule
            }
        };
        store = new Vuex.Store({
            modules: {
                user: {
                    namespaced: true,
                    modules: {
                        update: {
                            namespaced: true,
                            state: updateModule.state,
                            getters: updateModule.getters,
                            actions
                        }
                    }
                }
            }
        })

    });

    it('should rendered properly', () => {
        const wrapper = shallowMount(Profile, {
            store,
            localVue
        });
        const html = wrapper.html();
        expect(actions.getProfile).toHaveBeenCalled();
        expect(html).toContain('Biodata');
        expect(html).toContain('Foto');
        expect(html).toContain('Password');
    });
});
