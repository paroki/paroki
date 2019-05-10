import Vue from 'vue';

import router from './router';
import store from './store';
import App from './App';

new Vue({
    el: '#app',
    store,
    router,
    template: '<App/>',
    components: {
        App
    }
})
