require('../bootstrap');

import Vue from 'vue'
import App from '../app.vue'

import routes from "../routes/web"
import VueRouter from "vue-router";


document.addEventListener('DOMContentLoaded', () => {
    const app = new Vue({
        render: h => h(App),
        router: new VueRouter(routes)
    }).$mount();
    document.body.appendChild(app.$el);
});