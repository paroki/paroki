import * as types from './types';
import { ENTRYPOINT } from "../../config/entrypoint";
import fetch from '../../utils/fetch';
import axios from 'axios';

export const toggleLoading = ({ commit }) => {
    commit(types.SIAP_TOGGLE_LOADING);
};

export const login = ({commit},payload) => {
    commit(types.SIAP_TOGGLE_LOADING);
    commit(types.SIAP_LOGIN_START)
    commit(types.SIAP_LOGIN_ERROR,'');

    let options = {
        headers: new Headers({
            'Content-Type': 'application/json',
            'Accept': 'application/json',
        }),
        method: 'POST',
        body: JSON.stringify(payload)
    };

    let url = ENTRYPOINT+'/login_check';

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
