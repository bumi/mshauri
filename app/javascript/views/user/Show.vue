<template>
  <div class="w-100 md:w-100 xs:w-100 sm:w-100 mx-auto py-3 my-3 xs:my-0 bg-white rounded-xl">
    <div class="w-90 mx-auto">
      <div class="flex">
        <div class="w-50">
          <button
            class="btn btn-success rounded"
            @click="usersOverview"
          >
            Overview of all users
          </button>
        </div>

        <div class="w-50 xs:w-95  mx-auto">
          <h6 class="my-4 text-xl font-semibold">
            Iterations
          </h6>
        </div>
      </div>
      <div class="flex flex-wrap xs:block xs:w-90 xs:mx-auto justify-content-center md:w-90 md:mx-auto py-4">
        <div
          v-for="iteration in user.iterations"
          :key="iteration.id"
          class="mt-3 w-25 xs:w-100 md:w-40 sm:w-40 mr-3 mx-3 xs:mx-0 xs:mr-0"
        >
          <iteration-card
            :iteration="iteration"
            :is-admin="true"
          />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import User from "../../models/User"
import IterationCard from "../../component/cards/IterationCard";
export default {
  name: "UserShow",
  components: {
    IterationCard
  },
  data() {
    return {
      user: {},
    }
  },
  mounted() {
    User.show(this.$route.params.id).then(({
      data
    }) => {
      this.user = data;
    });
  },
  methods: {
    usersOverview() {
      this.$router.push({
        name: 'admin-index',
      });
    }
  }
}
</script>