import * as types from './types';
import ApiService from '../../services/api';
import {TokenService} from "../../services/token";

export const toggleLoading = ({ commit }) => {
    commit(types.SIAP_TOGGLE_LOADING);
};

export const snackbarSuccess  = ({commit}, message) => {
    if(!message){
        message = 'Perubahan data berhasil disimpan!';
    }

    let payload = {
        type: 'success',
        message
    };

    commit(types.SIAP_SNACKBAR, payload);
};

export const snackbarError  = ({commit}, message) => {

    if(!message){
        message = 'Gagal menyimpan perubahan data!';
    }
    let payload = {
        type: 'error',
        message
    };

    commit(types.SIAP_SNACKBAR, payload );
};

export const login = ({commit},payload) => {
    commit(types.SIAP_TOGGLE_LOADING);
    commit(types.SIAP_LOGIN_START);
    commit(types.SIAP_LOGIN_ERROR,false);

    return ApiService.post('/api/login_check',payload)
        .then(data => {
            TokenService.saveToken(data.token);
            commit(types.SIAP_LOGIN_END);
            commit(types.SIAP_TOGGLE_LOADING);
            ApiService.setHeader();
        }).catch(error => {
            commit(types.SIAP_LOGIN_END);
            commit(types.SIAP_LOGIN_ERROR, error.response.data.message);
            commit(types.SIAP_TOGGLE_LOADING);
            throw  error;
        });
};

export const loginReset = ({commit}) => {
    commit(types.SIAP_LOGIN_RESET);
};

export const logout = ({commit}) => {
    commit(types.SIAP_TOGGLE_LOADING);
    ApiService.removeHeader();
    TokenService.removeToken();
    commit(types.SIAP_TOGGLE_LOADING);
};
