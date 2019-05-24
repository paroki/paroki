import SubmissionError from '../../../../utils/SubmissionError';
import ApiService from '@/services/ApiService';
import * as types from './mutation_types';

export const reset = ({ commit }) => {
    commit(types.RESET)
}

export const resetError = ( { commit }) => {
    commit(types.SET_ERROR, null );
    commit(types.SET_VIOLATIONS, {});
}

export const getProfile = ( {commit}, id ) => {
    commit(types.TOGGLE_LOADING);
    const url = ApiService.generateUrl(`/profile/${id}`);
    return ApiService.get(url)
        .then((data) => {
            commit(types.SET_RETRIEVED, data);
            commit(types.TOGGLE_LOADING);
        })
        .catch((e) => {
            commit(types.TOGGLE_LOADING);
            commit(types.SET_ERROR, e.message);
        });
}

export const profilePassword = ( { commit, state }, payload ) => {
    const id = state.retrieved.id;
    resetError({commit});
    commit(types.TOGGLE_LOADING);
    const url = ApiService.generateUrl(`/profile-password/${id}`);
    return ApiService.put(url, payload)
        .then((data) => {
            commit(types.SET_RETRIEVED, data);
            commit(types.TOGGLE_LOADING);
        })
        .catch( (e) => {
            if (e instanceof SubmissionError) {
                commit(types.SET_VIOLATIONS, e.errors);
                // eslint-disable-next-line
                commit(types.SET_ERROR, e.errors._error);
            }else{
                commit(types.SET_ERROR, e);
            }
            commit(types.TOGGLE_LOADING);
        });
}

export const profile = ( {commit, state}, payload ) => {
    if(!payload){
        payload = state.retrieved;
    }
    const id = state.retrieved.id;
    const url = ApiService.generateUrl(`/profile/${id}`);
    resetError({commit});
    commit(types.SET_ERROR, '');
    commit(types.TOGGLE_LOADING);
    return ApiService.put(url, payload)
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
};


export const retrieve = ({ commit }, id) => {
    commit(types.TOGGLE_LOADING);
    const url = ApiService.generateUrl(`/user/${id}`)
    return ApiService.get(url)
        .then((data) => {
            commit(types.TOGGLE_LOADING);
            commit(types.SET_RETRIEVED, data)
        })
        .catch((e) => {
            commit(types.TOGGLE_LOADING);
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
                'Content-Type': 'multipart/form-data'
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
    resetError({commit});
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
