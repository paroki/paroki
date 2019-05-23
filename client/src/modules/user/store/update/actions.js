import SubmissionError from '../../../../utils/SubmissionError';
import ApiService from '@/services/ApiService';
import * as types from './mutation_types';
import toggleLoading from '../../../../utils/toggleLoading';

export const reset = ({ commit }) => {
    commit(types.RESET)
}

export const retrieve = ({ commit }, id) => {
    toggleLoading(commit)
    const url = ApiService.generateUrl(`/user/${id}`)
    return ApiService.get(url)
        .then((data) => {
            toggleLoading(commit)
            commit(types.SET_RETRIEVED, data)
        })
        .catch((e) => {
            toggleLoading(commit)
            commit(types.SET_ERROR, e.message)
        });
}

export const uploadAvatar = ( {commit, state}, file) => {
    commit(types.TOGGLE_LOADING);

    const id = state.retrieved['id'];
    let retrieved = state.retrieved;

    const formData = new FormData();
    const url = ApiService.generateUrl(`/user/${id}/upload-foto`);
    formData.append('file',file);
    return ApiService.post(url, formData, {
            headers: {
                'Content-TYpe': 'multipart/form-data'
            }
        }).then( (data) => {
            retrieved = {
                ...retrieved,
                foto: data
            };
            commit(types.SET_RETRIEVED, retrieved);
            commit(types.TOGGLE_LOADING);
        }).catch( (e) => {
            commit(types.SET_ERROR, e.error);
            commit(types.TOGGLE_LOADING);
        });
};

export const update = ({ commit, state }, payload) => {
    if(!payload){
        payload = state.retrieved;
    }
    commit(types.SET_ERROR, '');
    commit(types.TOGGLE_LOADING);
    return ApiService.put(state.retrieved['@id'], payload)
        .then((data) => {
            commit(types.TOGGLE_LOADING);
            commit(types.SET_UPDATED, data);
        })
        .catch((e) => {
            commit(types.TOGGLE_LOADING);

            if (e instanceof SubmissionError) {
                commit(types.SET_VIOLATIONS, e.errors);
                // eslint-disable-next-line
                commit(types.SET_ERROR, e.errors._error);
            }else{
                commit(types.SET_ERROR, e);
            }
        })
}

export const updateRetrieved = ({ commit }, updated) => {
    commit(types.UPDATE_RETRIEVED, updated)
}
