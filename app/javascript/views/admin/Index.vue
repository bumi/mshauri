<template>
  <div>
    <user-card
      v-for="user in users"
      :key="user.id"
      :user="user"
    />
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