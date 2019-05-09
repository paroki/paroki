import Vue from 'vue';
import VueRouter from 'vue-router';
import BootstrapVue from 'bootstrap-vue';
import moment from 'moment';

Vue.use(VueRouter);
Vue.use(BootstrapVue);

Vue.prototype.moment = moment;

import routes from './router';
const router = new VueRouter({
    mode: 'history',
    routes: [
        ...routes
    ]
});

import stores from './store';
import App from './App';

new Vue({
  el: '#app',
  stores,
  router,
  render: h => h(App)
});
