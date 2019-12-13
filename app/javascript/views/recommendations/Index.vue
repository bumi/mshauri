<template>
  <div class="w-100 mx-auto bg-white min-h-screen -mt-8">
    <div
      class="w-70 mx-auto pt-5"
    >
      <h2 class="mt-0 mb-4 text-center text-weight-normal font-nunito text-grey-dark text-xl">
        Some recommendations
      </h2>
    </div>
    <div class="w-100 h-1 bg-primary" />
    <div
      v-if="recommendations.length"
      class="w-90 mx-auto pt-4 pb-5"
    >
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
    }).then(({ data }) => {
      this.recommendations = data;
      console.log(data)
    });
  }
}
</script>