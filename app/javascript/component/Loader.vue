<template>
  <div
    :class="{'invisible': !visible}"
    class="w-100 overflow-hidden h-2 relative"
  >
    <div class="bg-primary-darker h-100 progress-loader w-20 rounded-full" />
  </div>
</template>

<script>
export default {
  name: "Loader",
  props: {
    value: {
      type: Boolean,
      default: false
    }
  },
  data() {
    return {
      visible: false,
      timeout: null,
    }
  },
  watch: {
    value: function(val) {
      this.updateVisibility(val);
    }
  },
  mounted() {
    this.updateVisibility(this.value);
  },
  methods: {
    updateVisibility(val) {
      if (val) {
        return this.timeout = setTimeout(() => {
          this.visible = true;
        }, 500);
      }
      this.visible = false;
      this.cancelTimeout();
    },
    cancelTimeout() {
      if (this.timeout) {
        clearTimeout(this.timeout);
      }

    }
  }
}
</script>