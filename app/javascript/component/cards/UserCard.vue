<template>
  <div class="w-100 mx-auto border-1 p-4 border-solid border-grey-lighter shadow-sm">
    <div class="w-80 mx-auto flex relative py-2">
      <div class="w-50">
        <router-link
          :to="{name: 'admin-user-show', params:{id: user.id}}"
        >
          <div v-if="user.name">
            <h3>Name</h3>
            {{ user.name }}
          </div>
          <div v-else>
            Anonymous
          </div>
        </router-link>
      </div>
      <div class="w-50">
        <h5>Joined on</h5>
        {{ joinedOn }}
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "UserCard",
  props: {
    user: {
      type: Object,
      default: () => {}
    }
  },
  computed: {
    joinedOn() {
      let date = new Date(this.user.created_at);
      return date.getDate() + '/' + (date.getMonth() + 1) + '/' + date.getFullYear();
    }
  }
}
</script>