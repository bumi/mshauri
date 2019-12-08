<template>
  <div
    id="app"
    class="bg-grey-lighter min-h-screen"
  >
    <navbar />
    <div class="w-80 mx-auto py-4">
      <router-view />
    </div>
  </div>
</template>
<script>
import Navbar from "./component/Navbar";
export default {
  components: { Navbar }
}
</script>