/* eslint no-console: 0 */

import Vue from 'vue'
// @ts-ignore
import App from '../accordion.vue'

Vue.config.productionTip = false;

document.addEventListener('DOMContentLoaded', () => {
    const app = new Vue({
        render: h => h(App, {
                props:{
                    contents: JSON.parse(document.querySelector("#app").dataset.initialValue)
            }
        })
    }).$mount()
    document.body.appendChild(app.$el)
})