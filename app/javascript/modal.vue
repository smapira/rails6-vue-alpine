<template>
  <div class= "container" id="app">
    <modal v-show="showModal" @close="showModal = false"></modal>
    <button type="button"
            class="btn btn-info"
            @click="showModal = true">Show modal</button>
  </div>
</template>

<script lang="ts">
import Modal from "./components/modal";

export default {
  name: "App",
  components: {
    Modal,
  },
  el: '#app',
  data() {
    return {
      showModal: false
    }
  }
};
</script>

<style scoped lang="scss">
</style>