<template>
  <div class="w-100 md:w-100 xs:w-100 sm:w-100 mx-auto py-1 my-3 xs:my-0 bg-white rounded-xl">
    <div class="w-90 mx-auto py-5">
      <user-card
        v-for="user in users"
        :key="user.id"
        :user="user"
      />
    </div>
  </div>
</template>

<script>
import User from "../../models/User"
import UserCard from "../../component/cards/UserCard"

export default {
  name: 'AdminIndex',
  components: {
    UserCard
  },
  data() {
    return {
      users: [],
    }
  },
  mounted() {
    this.getUsers();
  },
  methods: {
    getUsers() {
      User.index().then(({ data }) => {
        this.users = data
        console.log(data)
      })
    },
  }
}
</script>