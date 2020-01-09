<template>
  <div>
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


    <div />
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
    User.show(this.$route.params.id).then(({ data }) => {
      this.user = data;
    });
  }
}
</script>