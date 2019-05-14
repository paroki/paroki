import Vue from 'vue';
import router from './router';
import store from './store';
import App from './App';
import './plugins';

import ApiService from './services/api';

ApiService.init(process.env.VUE_APP_API_ENTRYPOINT);

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
