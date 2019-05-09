import Vue from 'vue';
import Vuex from 'vuex';

Vue.use(Vuex);

import siap from './siap/';
export default new Vuex.Store({
    modules: {
	siap: siap
    }
});
