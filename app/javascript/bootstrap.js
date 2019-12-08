import Vue from "vue"
import VueRouter from "vue-router"

import axios from 'axios';
import lodash from 'lodash';

// TODO: Seems to be unused
window._ = lodash;

window.Vue = Vue;

Vue.use(VueRouter);

window.apiUrl = '/api';

/**
 * We'll load the axios HTTP library which allows us to easily issue requests
 * to our Laravel back-end. This library automatically handles sending the
 * CSRF token as a header based on the value of the "XSRF" token cookie.
 */

window.axios = axios;

window.axios.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';


/**
 * Next we will register the CSRF Token as a common header with Axios so that
 * all outgoing HTTP requests automatically have it attached. This is just
 * a simple convenience so we don't have to attach every token manually.
 */

let token = document.head.querySelector('meta[name="csrf-token"]');

if (token) {
    window.axios.defaults.headers.common['X-CSRF-TOKEN'] = token.content;
    window.csrftoken = token.content;
} else {
    window.csrftoken = '';
    console.error('CSRF token not found: https://laravel.com/docs/csrf#csrf-x-csrf-token');
}

let user_slug = document.head.querySelector('meta[name="user-slug"]');
window.axios.defaults.headers.common['X-USER-SLUG'] = user_slug.content;