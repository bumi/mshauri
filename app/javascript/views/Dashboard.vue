<template>
  <div class="w-100 mx-auto bg-white min-h-screen -mt-8">
    <div class="w-70 mx-auto pt-5">
      <h1 class="mb-5 text-grey-darkest text-4xl font-primary text-center text-weight-semibold">
        Congratulations, <span class="text-weight-normal">{{ user.name }}</span>
        <span class="w-90"><img
          src="/assets/clap.svg"
          class="w-8 text-grey"
        ></span>
      </h1>

      <p class="text-center p-0 m-0">
        <img
          src="/assets/new-product%201.png"
          class="w-20"
        >
      </p>

      <h2 class="mt-0 mb-4 text-center text-weight-normal font-nunito text-grey-dark text-xl">
        You’ve successfully
        completed all the questions
      </h2>
    </div>
    <div class="w-100 h-1 bg-primary" />
    <div
      v-if="recommendations.length"
      class="w-90 mx-auto pt-4 pb-5"
    >
      <h4 class="text-center mb-5">
        Some recommendations
      </h4>
      <div class="flex flex-wrap">
        <recommendation-card
          v-for="(recommendation, index) in recommendations"
          :key="index"
          :recommendation="recommendation"
        />
      </div>
    </div>
  </div>
</template>

<script>
import User from "../models/User";
import Recommendation from "../models/Recommendation";
import RecommendationCard from "../component/cards/RecommendationCard";

export default {
  name: "Dashboard",
  components: { RecommendationCard },
  data() {
    return {
      user: {},
      recommendations: []
    }
  },
  mounted() {
    User.show('me').then(({ data }) => {
      this.user = data
    });
    Recommendation.index({
      'iteration_id': this.$route.params.iteration_id
    }).then(({ data }) => {
      this.recommendations = data;
    });
  }
}
</script>

<style scoped>

</style>