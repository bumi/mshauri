<template>
  <div class="w-100 mx-auto bg-white min-h-screen -mt-8">
    <div class="w-70 mx-auto pt-5">
      <h1 class="mb-5 text-grey-darkest text-4xl font-primary text-center text-weight-semibold">
        Thank you for completing the questionnaire.
      </h1>

      <h2 class="mt-0 mb-4 text-center text-weight-normal font-nunito text-grey-dark text-xl">
        Based on your answers we have the following recommendations and
        inspirations for you.
      </h2>
      <user-email-form
        v-if="user.id && !user.email"
        :iteration-id="iterationId"
      />
    </div>
    <div class="w-100 h-1 bg-primary" />
    <div
      v-if="recommendations.length"
      class="w-90 mx-auto pt-4 pb-5"
    >
      <div class="relative pt-5">
        <div class="w-90 mx-auto  h-20 bg-transparent border-grey-light shadow-sm border-solid border-1 ">
          <h3 class="text-primary text-2xl py-4 my-1 pl-5">
            Our recommendtions for your software development best practices.
          </h3>
        </div>
      </div>
      <div class="w-80 mx-auto flex relative py-5 -mt-12">
        <div class="absolute h-100 w-10 flex align-items-center justify-content-center">
          <div class="h-100 w-05 bg-grey-light" />
        </div>
      </div>
      <div class="flex flex-wrap">
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