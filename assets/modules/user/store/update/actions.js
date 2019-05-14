import SubmissionError from '../../../../utils/SubmissionError';
import fetch from '../../../../utils/fetch';
import * as types from './mutation_types';
import toggleLoading from '../../../../utils/toggleLoading';

export const reset = ({ commit }) => {
    commit(types.RESET)
}

export const retrieve = ({ commit }, id) => {
    toggleLoading(commit)

    return fetch(`/api/user/${id}`)
        .then(response => response.json())
        .then((data) => {
            toggleLoading(commit)
            commit(types.SET_RETRIEVED, data)
        })
        .catch((e) => {
            toggleLoading(commit)
            commit(types.SET_ERROR, e.message)
        })
}

export const update = ({ commit, state }, payload) => {
    if(!payload){
        payload = state.retrieved;
    }
    commit(types.SET_ERROR, '')
    commit(types.TOGGLE_LOADING);
    console.log(payload);
    return fetch(state.retrieved['@id'], {
        method: 'PUT',
        headers: new Headers({ 'Content-Type': 'application/ld+json' }),
        body: JSON.stringify(payload)
    })
        .then(response => response.json())
        .then((data) => {
            commit(types.TOGGLE_LOADING);
            commit(types.SET_UPDATED, data)
        })
        .catch((e) => {
            commit(types.TOGGLE_LOADING);

            if (e instanceof SubmissionError) {
                commit(types.SET_VIOLATIONS, e.errors)
                // eslint-disable-next-line
                commit(types.SET_ERROR, e.errors._error)

                return
            }

            // eslint-disable-next-line
            commit(commit(types.SET_ERROR, e))
        })
}

export const updateRetrieved = ({ commit }, updated) => {
    commit(types.UPDATE_RETRIEVED, updated)
}
