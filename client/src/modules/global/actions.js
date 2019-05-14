import * as types from './types';
import axios from 'axios';
import { ENTRYPOINT } from "../../utils/fetch";

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
    commit(types.SIAP_LOGIN_START)
    commit(types.SIAP_LOGIN_ERROR,'');

    /*let options = {
        headers: new Headers({
            'Content-Type': 'application/json',
            'Accept': 'application/json',
        }),
        method: 'POST',
        body: JSON.stringify(payload)
    };*/

    let url = `https://siap.itstoni.com/api/login_check`;
    console.log(url);
    return axios.post(url,{
        ...payload
    }).then(response => {

        localStorage.setItem('token', response.data.token);
        commit(types.SIAP_LOGIN_END);
        commit(types.SIAP_UPDATE_TOKEN, response.data.token);
        commit(types.SIAP_TOGGLE_LOADING);

    }).catch(error => {

        commit(types.SIAP_LOGIN_END);
        commit(types.SIAP_LOGIN_ERROR, error.response.data.message);
        commit(types.SIAP_TOGGLE_LOADING);
    });
};

export const logout = ({commit}) => {
    commit(types.SIAP_TOGGLE_LOADING);
    localStorage.removeItem('token');
    commit(types.SIAP_LOGOUT);
    commit(types.SIAP_UPDATE_TOKEN, null)

    commit(types.SIAP_TOGGLE_LOADING);
};
