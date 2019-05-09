import * as types from './types';
import { ENTRYPOINT } from "../../config/entrypoint";
import fetch from '../../utils/fetch';

export const toggleLoading = ({ commit }) => {
    commit(types.SIAP_TOGGLE_LOADING);
};

const login = ({commit},payload) => {
    console.log(payload);

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

    return fetch(url, options)
        .then(response => response.json())
        .then((data) => {
            console.log(data)
            localStorage.setItem('token', data.token);

            commit(types.SIAP_LOGIN_END);
            commit(types.SIAP_UPDATE_TOKEN, data.token);
            commit(types.SIAP_TOGGLE_LOADING);
        })
        .catch((e) => {
            commit(types.SIAP_LOGIN_END);
            console.log(e);
            commit(types.SIAP_LOGIN_ERROR,e.errors._error);
            commit(types.SIAP_TOGGLE_LOADING);
        });
};

export default login;
