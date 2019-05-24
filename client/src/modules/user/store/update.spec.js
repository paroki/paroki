import { createLocalVue } from "@vue/test-utils";
import Vuex from 'vuex';

jest.mock('@/services/ApiService');
import { ApiService } from '@/services';
import update from './update/';
import SubmissionError from "../../../utils/SubmissionError";

const localVue = createLocalVue();
localVue.use(Vuex);

const createStore = (state) => {
    const defState = {
        error: '',
        isLoading: false,
        retrieved: null,
        updated: null,
        violations: null
    };

    state = {
        ...defState,
        ...state
    };

    return new Vuex.Store({
        modules: {
            update: {
                namespaced: true,
                ...update,
                state: state
            }
        }
    });
};

describe('user/update store', async () => {
    let state;
    let store;
    const value = {foo: 'bar'};
    const error = {
        _error: 'some error',
        message: 'some error'
    };
    const submissionError = new SubmissionError(error);

    beforeEach( () => {
        state = {
        };
        store = createStore(state);
    });

    test('reset() actions', async () => {
        await store.dispatch('update/reset');

        expect(store.getters['update/error']).toEqual('');
        expect(store.getters['update/isLoading']).toEqual(false);
        expect(store.getters['update/retrieved']).toEqual(null);
        expect(store.getters['update/updated']).toEqual(null);
        expect(store.getters['update/violations']).toEqual(null);
    });

    test('getProfile() actions', async () => {

        ApiService.get = jest.fn()
            .mockResolvedValueOnce(value)
            .mockRejectedValueOnce(error)
        ;
        await store.dispatch('update/getProfile','some-id');
        expect(ApiService.generateUrl).toBeCalledWith('/profile/some-id');
        expect(store.getters['update/isLoading']).toBe(false);
        expect(store.getters['update/retrieved']).toBe(value);
        expect(store.getters['update/error']).toBe('');

        await store.dispatch('update/getProfile','some-id');
        expect(store.getters['update/error']).toEqual(error.message);

    });

    test('profilePassword() actions', async () => {
        store = createStore({
            retrieved: { id: 'some-id'}
        });
        ApiService.generateUrl = jest.fn().mockReturnValue('some-url');
        ApiService.put = jest.fn()
            .mockResolvedValueOnce(value)
            .mockRejectedValueOnce(error)
            .mockRejectedValueOnce(submissionError)
        ;

        await store.dispatch('update/profilePassword', {});
        expect(ApiService.generateUrl).toBeCalledWith('/profile-password/some-id');
        expect(ApiService.put).toBeCalledWith('some-url', {});
        expect(store.getters['update/retrieved']).toBe(value);

        // catch error test
        await store.dispatch('update/profilePassword', {});
        expect(store.getters['update/error']).toBe(error);
        expect(store.getters['update/violations']).toEqual({});

        await store.dispatch('update/profilePassword', {});
        expect(store.getters['update/error']).toEqual(error._error);
        expect(store.getters['update/violations']).toEqual(error);
    });

    test('profile() actions', async () => {
        store = createStore({
            retrieved: { id: 'some-id'}
        });

        ApiService.generateUrl = jest.fn().mockReturnValue('some-url');
        ApiService.put = jest.fn()
            .mockResolvedValueOnce(value)
            .mockRejectedValueOnce(error)
            .mockRejectedValueOnce(submissionError)
        ;

        await store.dispatch('update/profile');
        expect(ApiService.generateUrl).toBeCalledWith('/profile/some-id');
        expect(ApiService.put).toBeCalledWith('some-url', {id: 'some-id'});
        expect(store.getters['update/updated']).toBe(value);

        // catch error test
        await store.dispatch('update/profile', {});
        expect(store.getters['update/error']).toBe(error);
        expect(store.getters['update/violations']).toEqual({});

        await store.dispatch('update/profile', {});
        expect(store.getters['update/error']).toEqual(error._error);
        expect(store.getters['update/violations']).toEqual(error);
    });

    test('retrieve() action', async () => {
        store = createStore({
            retrieved: { id: 'some-id'}
        });

        ApiService.generateUrl = jest.fn().mockReturnValue('some-url');
        ApiService.get = jest.fn()
            .mockResolvedValueOnce(value)
            .mockRejectedValueOnce(error)
            .mockRejectedValueOnce(submissionError)
        ;

        await store.dispatch('update/retrieve', 'some-id');
        expect(ApiService.generateUrl).toBeCalledWith('/user/some-id');
        expect(ApiService.get).toBeCalledWith('some-url');
        expect(store.getters['update/retrieved']).toBe(value);

        // catch error test
        await store.dispatch('update/retrieve', {});
        expect(store.getters['update/error']).toBe(error.message);
        expect(store.getters['update/violations']).toEqual(null);
    });

    test('uploadAvatar() action', async  () => {
        store = createStore({
            retrieved: { id: 'some-id'}
        });

        ApiService.generateUrl = jest.fn().mockReturnValue('some-url');
        ApiService.post = jest.fn()
            .mockResolvedValueOnce(value)
            .mockRejectedValueOnce(error)
        ;

        await store.dispatch('update/uploadAvatar','some file');
        expect(ApiService.generateUrl).toBeCalledWith('/user/some-id/upload-foto');
        expect(store.getters['update/retrieved']).toEqual({
            foto: {
                foo: 'bar'
            },
            id: 'some-id'
        });

        // catch error test
        await store.dispatch('update/uploadAvatar', {});
        expect(store.getters['update/error']).toBe(error.message);
        expect(store.getters['update/violations']).toEqual(null);
    });

    test('update() actions', async () => {
        store = createStore({
            retrieved: { id: 'some-id'}
        });

        ApiService.generateUrl = jest.fn().mockReturnValue('some-url');
        ApiService.put = jest.fn()
            .mockResolvedValueOnce(value)
            .mockRejectedValueOnce(error)
            .mockRejectedValueOnce(submissionError)
        ;

        await store.dispatch('update/update');
        expect(ApiService.generateUrl).toBeCalledWith('/user/some-id');
        expect(ApiService.put).toBeCalledWith('some-url', {id: 'some-id'});
        expect(store.getters['update/updated']).toBe(value);

        // catch error test
        await store.dispatch('update/update', {});
        expect(store.getters['update/error']).toBe(error);
        expect(store.getters['update/violations']).toEqual({});

        await store.dispatch('update/update', {});
        expect(store.getters['update/error']).toEqual(error._error);
        expect(store.getters['update/violations']).toEqual(error);
    });

    test('updateRetrieved() action', async () => {
        store = createStore({
            retrieved: {id: 'some-id'}
        });

        const updated = {
            updated: true
        };

        await store.dispatch('update/updateRetrieved',updated);
        expect(store.getters['update/retrieved']).toEqual({
            id: 'some-id',
            ...updated
        });
    });
});
