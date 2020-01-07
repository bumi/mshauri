<template>
  <div
    class="h-100 bg-primary rounded-full transition-250ms"
    :style="{ width: progress }"
  />
</template>
<script>
export default {
  name: "ProgressBar",
  props: {
    value: {
      type: [Number, String],
      default: 0
    }
  },
  computed: {
    progress() {
      return this.value + '%';
    }
  }
}
</script>

<style scoped>

</style>