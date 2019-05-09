import * as types from './types';

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
        Object.assign(state,{ token });
    }
}
