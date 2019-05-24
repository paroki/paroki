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
    let siapActions;

    beforeEach( () => {
        localVue.use(Vuetify);

        siapActions = {
            snackbarSuccess: jest.fn(),
            snackbarError: jest.fn()
        };
        actions = {
            getProfile: jest.fn(),
            profile: jest.fn(),
            profilePassword: jest.fn(),
            reset: jest.fn(),
            resetError: jest.fn()
        };

        state = {
            error: null,
            isLoading: false,
            retrieved: null,
            updated: null,
            violations: null
        };

        store = new Vuex.Store({
            modules: {
                siap: {
                    namespaced: true,
                    state: {},
                    getters: {},
                    actions: siapActions
                },
                user: {
                    namespaced: true,
                    modules: {
                        update: {
                            namespaced: true,
                            state,
                            getters: updateModule.getters,
                            actions
                        }
                    }
                }
            }
        })

    });

    it('should mount component on menu click', () => {
        const wrapper = shallowMount(Profile, {
            store,
            localVue
        });

        // default
        const menu = wrapper.findAll({name: 'v-list-tile'});
        expect(menu.length).toEqual(3);
        expect(wrapper.vm.active).toBe('profile-form');

        menu.at(1).vm.$emit('click');
        expect(wrapper.vm.active).toBe('avatar');

        menu.at(2).vm.$emit('click');
        expect(wrapper.vm.active).toBe('profile-password');


        menu.at(0).vm.$emit('click');
        expect(wrapper.vm.active).toBe('profile-form');
    });

    it('handleUpdateProfile should update user profile properly', () => {

        const wrapper = shallowMount(Profile, {
            store,
            localVue
        });

        actions.profile.mockResolvedValue({hello: 'world'});

        wrapper.vm.handleUpdateProfile();
        expect(actions.profile).toBeCalled();
        expect(siapActions.snackbarSuccess.mock.calls[0][1]).toBe('Profil berhasil disimpan!');
        expect(siapActions.snackbarError).not.toBeCalled();

        state.error = 'Hello WOrld';
        wrapper.vm.handleUpdateProfile();
        expect(actions.profile).toBeCalled();
        expect(siapActions.snackbarSuccess.mock.calls.length).toBe(1);
        expect(siapActions.snackbarError.mock.calls.length).toBe(1);
        expect(siapActions.snackbarError.mock.calls[0][1]).toBe('Gagal menyimpan profil');

    });

    it('handleUpdatePassword should update user password properly', () => {

        const wrapper = shallowMount(Profile, {
            store,
            localVue
        });

        actions.profilePassword.mockResolvedValue({});

        wrapper.vm.handleUpdatePassword();
        expect(actions.profilePassword).toBeCalled();
        expect(siapActions.snackbarSuccess.mock.calls[0][1]).toContain('berhasil');
        expect(siapActions.snackbarError).not.toBeCalled();

        state.error = 'Hello WOrld';
        wrapper.vm.handleUpdatePassword();
        expect(actions.profilePassword).toBeCalled();
        expect(siapActions.snackbarSuccess.mock.calls.length).toBe(1);
        expect(siapActions.snackbarError.mock.calls.length).toBe(1);
        expect(siapActions.snackbarError.mock.calls[0][1]).toContain('Gagal');

    });

    it('should reset update state when destroyed', () => {
        const wrapper = shallowMount(Profile, {
            store,
            localVue
        });

        wrapper.destroy();
        expect(actions.reset).toBeCalled();
        expect(actions.resetError).toBeCalled();
    });
});
