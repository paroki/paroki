import Vue from 'vue';
import router from './router';
import store from './store';
import App from './App';
import './plugins';

/*new Vue({
    el: '#app',
    store,
    router,
    template: '<App/>',
    components: {
        App
    }
})*/

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
