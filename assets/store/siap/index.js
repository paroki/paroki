import * as actions from './actions';
import * as getters from './getters';
import mutations from './mutations';
import jwt from 'jsonwebtoken';

let token = localStorage.getItem('token');
let defCredentials = null;
if(token !== null){
    defCredentials = jwt.decode(token);
}
export default {
    namespaced: true,
    state: {
        isLoading: false,
        loggingIn: false,
        error: null,
        token: token,
        credentials: defCredentials
    },
    actions,
    getters,
    mutations
}
