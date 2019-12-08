<template>
  <nav class="m-0 p-0 w-100 bg-white">
    <div class="w-80 mx-auto py-3 text-black">
      <router-link
        :to="{name: 'home'}"
        class="text-2xl my-0 font-primary cursor-pointer"
        tag="p"
      >
        Mshauri
      </router-link>
    </div>
  </nav>
</template>

<script>
export default {
  name: "Navbar"
}
</script>

<style scoped>

</style>