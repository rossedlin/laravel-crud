import 'bootstrap';
import 'bootstrap/dist/css/bootstrap.min.css';
import {createApp} from 'vue';
import App from './App.vue';
import axios from 'axios';

window.axios = axios;
window.axios.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';

createApp(App).mount("#app")
