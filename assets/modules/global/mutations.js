import * as types from './types';
import jwt from 'jsonwebtoken';

export default {
    [types.SIAP_TOGGLE_LOADING](state){
        Object.assign(state, {isLoading: !state.isLoading})
    },

    [types.SIAP_LOGIN_START](state){
        Object.assign(state, { loggingIn: true})
    },

    [types.SIAP_LOGIN_END](state){
        Object.assign(state, {loggingIn: false})
    },

    [types.SIAP_LOGIN_ERROR](state,error){
        Object.assign(state, { error })
    },

    [types.SIAP_UPDATE_TOKEN](state,token){
        let credentials = null;
        if(token !== null){
            credentials = jwt.decode(token);
        }
        Object.assign(state,{ token, credentials });
    },

    [types.SIAP_LOGOUT](state,token){
        localStorage.removeItem('token');
        Object.assign(state, {token: null});
    },

    [types.SIAP_SNACKBAR](state, snackbar){
        Object.assign(state, { snackbar } );
    }
}
