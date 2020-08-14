<template>
  <div>
    <div class="modal is-active">
      <div class="modal-background"></div>
      <div class="modal-content">
        <div class="box">
          <p>{{message}}</p>
        </div>
      </div>
      <button class="modal-close" @click="$emit('close')"></button>
    </div>
  </div>
</template>

<script lang="ts">
  export default {
    name: "Modal",
    data: () => ({
      message: 'Lorem lorem lorem'
    }),
  };
</script>
