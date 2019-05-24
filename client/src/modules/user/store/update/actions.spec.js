import sinon from 'sinon';
import SubmissionError from '@/utils/SubmissionError';

jest.mock('@/services/ApiService');
import { ApiService } from '@/services';

import * as actions from './actions';
import * as types from './mutation_types';

describe('user/update actions', () => {
    let commit;

    beforeEach( () => {
        commit = sinon.spy();
    });

    it('reset() should reset state', () => {

        actions.reset({commit});
        expect(commit.args[0]).toEqual([types.RESET]);
    });

    it('resetError() should reset error state', () => {
        actions.resetError({commit});

        expect(commit.args).toEqual([
            [types.SET_ERROR, null],
            [types.SET_VIOLATIONS, {}]
        ]);
    });

    it('getProfile() should retrieve user profile', () => {
        ApiService.generateUrl = jest.fn().mockReturnValue('some-url');
        ApiService.get = jest.fn().mockResolvedValue({foo: 'bar'});

        actions.getProfile({commit},'some-id').then( () => {
            expect(ApiService.generateUrl).toBeCalledWith('/profile/some-id');
            expect(ApiService.get).toBeCalledWith('some-url');
            expect(commit.args).toEqual([
                [types.TOGGLE_LOADING],
                [types.SET_RETRIEVED, {foo: 'bar'}],
                [types.TOGGLE_LOADING]
            ]);
        });
    });

    it('getProfile() should handle error', () => {
        const error = {message: 'Hello World'};
        ApiService.generateUrl = jest.fn().mockReturnValue('some-url');
        ApiService.get = jest.fn().mockRejectedValueOnce(error);

        actions.getProfile({commit},'some-id').then( () => {
            expect(commit.args).toEqual([
                [types.TOGGLE_LOADING],
                [types.TOGGLE_LOADING],
                [types.SET_ERROR, error.message]
            ]);
        });
    });

    it('profilePassword() should update current user password', () => {
        const value = {foo: 'bar'};
        const state = { retrieved: {id: 'some-id'}};
        const payload = {some: 'payload'};

        ApiService.generateUrl = jest.fn().mockReturnValue('some-url');
        ApiService.put = jest.fn().mockResolvedValueOnce(value);

        return actions.profilePassword({commit, state},payload).then( () => {
            expect(ApiService.generateUrl).toBeCalledWith('/profile-password/some-id');
            expect(ApiService.put.mock.calls[0][0]).toEqual('some-url');
            expect(ApiService.put.mock.calls[0][1]).toEqual(payload);
            expect(commit.args).toEqual([
                [types.SET_ERROR, null],
                [types.SET_VIOLATIONS, {}],
                [types.TOGGLE_LOADING],
                [types.SET_RETRIEVED, value],
                [types.TOGGLE_LOADING]
            ]);
        });
    });

    it('profilePassword() should handle submission error', () => {
        const error = new SubmissionError({
            errors: {
                _error: 'Some Error'
            }
        });
        const state = { retrieved: {id: 'some-id'}};
        ApiService.put = jest.fn().mockRejectedValue(error);

        return actions.profilePassword({commit, state}).then( () => {
            expect(commit.args).toEqual([
                [types.SET_ERROR, null],
                [types.SET_VIOLATIONS, {}],
                [types.TOGGLE_LOADING],
                [types.SET_VIOLATIONS, error.errors],
                [types.SET_ERROR, error.errors._error],
                [types.TOGGLE_LOADING]
            ]);
        });
    });

    it('profilePassword() should handle error', () => {
        const error = 'Some Error';
        const state = { retrieved: {id: 'some-id'}};
        const payload = {some: 'payload'};

        ApiService.generateUrl = jest.fn().mockReturnValue('some-url');
        ApiService.put = jest.fn().mockRejectedValue(error);

        return actions.profilePassword({commit, state}).then( () => {
            expect(commit.args).toEqual([
                [types.SET_ERROR, null],
                [types.SET_VIOLATIONS, {}],
                [types.TOGGLE_LOADING],
                [types.SET_ERROR, error],
                [types.TOGGLE_LOADING]
            ]);
        });
    });

});

