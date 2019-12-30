<template>
  <div
    v-if="keys.length > 0"
    class="w-100 p-3 my-4 text-left border-1 border-solid border-red rounded-lg"
    style="background-color: #e3342f38; "
  >
    <h5 class="m-0 font-bold">
      Errors:
    </h5>
    <ul class="mb-0 mt-2">
      <li
        v-for="(key, i) in keys"
        :key="i"
      >
        {{ key }}
        <span
          v-for="(error,k) in errors[key]"
          :key="k"
        >{{ error }}</span>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  name: 'Errors',
  props: {
    errors: {
      type: Object,
      default: () => {
      }
    }
  },
  computed: {
    keys() {
      if (this.errors) {
        return Object.keys (this.errors);
      }
      return [];
    }
  }
}
</script>