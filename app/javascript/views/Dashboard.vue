<template>
  <div class="w-100 md:w-100 xs:w-100 sm:w-100 mx-auto py-1 my-3 xs:my-0 bg-white rounded-xl">
    <div class="w-70 mx-auto pt-5">
      <h1 class="mb-2 text-grey-darkest text-4xl font-primary text-center text-weight-semibold">
        Thank you!
      </h1>

      <h2 class="mt-0 mb-3 text-center text-weight-normal font-nunito text-grey-dark text-xl">
        We have the following recommendations for you.
      </h2>
      <user-email-form
        v-if="user.id && !user.email"
        :iteration-id="iterationId"
      />
    </div>
    <div class="w-100 pt-1 bg-primary" />
    <div
      v-if="recommendations.length"
      class="w-100 mx-auto pt-4 pb-5"
    >
      <div class="relative pt-5">
        <div class="w-90 mx-auto  h-20 bg-transparent border-grey-light shadow-sm border-solid border-1 ">
          <h3 class="text-primary text-2xl xs:text-xl xs:pl-0 xs:px-3 py-4 my-1 pl-5">
            Our recommendtions for your software development best practices.
          </h3>
        </div>
      </div>
      <div class="w-90 mx-auto flex relative py-5 -mt-12">
        <div class="absolute h-100 w-10 flex align-items-center justify-content-center">
          <div class="h-100 w-05 bg-grey-light" />
        </div>
      </div>
      <div class="flex flex-wrap pb-4">
        <recommendation-card
          v-for="recommendation in recommendations"
          :key="recommendation.id"
          :recommendation="recommendation"
        />
      </div>
    </div>
  </div>
</template>

<script>
import User from "../models/User";
import UserEmailForm from "../component/form/UserEmail";
import Recommendation from "../models/Recommendation";
import RecommendationCard from "../component/cards/RecommendationCard";

export default {
  name: "Dashboard",
  components: {
    RecommendationCard,
    UserEmailForm,
  },
  data() {
    return {
      user: {},
      recommendations: []
    }
  },
  computed: {
    iterationId() {
      return this.$route.params.iteration_id;
    }
  },
  mounted() {
    User.show('me').then(({
      data
    }) => {
      this.user = data
    });
    Recommendation.index({
      'iteration_id': this.$route.params.iteration_id
    }).then(({
      data
    }) => {
      this.recommendations = data;
    });
  }
}
</script>

<style scoped>

</style>