<template>
  <div class="w-100 mx-auto bg-white min-h-screen -mt-8">
    <div class="relative pt-5">
      <div class="w-80 mx-auto  h-20 bg-transparent border-grey-light shadow-sm border-solid border-1 ">
        <h1 class="text-primary text-2xl py-4 my-2 pl-5">
          Recommendations
        </h1>
      </div>
    </div>
    <div
      v-if="recommendations.length"
      class="mx-auto pb-5"
    >
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
import Recommendation from "../../models/Recommendation"
import RecommendationCard from "../../component/cards/RecommendationCard"
export default {
  name: 'RecommendationIndex',
  components: {
    RecommendationCard
  },
  data() {
    return {
      recommendations: [],
    }
  },

  mounted() {
    Recommendation.index({
      'iteration_id': this.$route.params.iteration_id
    }).then(({
      data
    }) => {
      this.recommendations = data;
      console.log(data)
    });
  }
}
</script>