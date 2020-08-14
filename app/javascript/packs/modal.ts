/* eslint no-console: 0 */

import Vue from 'vue'
// @ts-ignore
import App from '../modal.vue'

Vue.config.productionTip = false;

document.addEventListener('DOMContentLoaded', () => {
    const app = new Vue({
        render: h => h(App)
    }).$mount()
    document.body.appendChild(app.$el)

    console.log(app)
})