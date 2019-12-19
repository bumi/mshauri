<template>
  <div class="w-100 md:w-100 xs:w-100 sm:w-100 mx-auto py-1 my-3 xs:my-0 bg-white rounded-xl">
    <div class="relative pt-5">
      <div class="w-90 mx-auto  h-20 bg-transparent border-grey-light shadow-sm border-solid border-1 ">
        <h1 class="text-primary text-2xl  pt-4 my-2 pl-5 xs:pl-0 xs:px-3 xs:text-xl xs:pt-2 md:text-xl md:pl-0 md:px-5 md:pt-2">
          Our recommendations for your software development best practices.
        </h1>
        <p class="pl-5 pb-4 my-0 text-sm opacity-80 xs:pl-0 xs:px-3 md:pl-0 md:px-5">
          Based on your answers we have the following recommendations and inspirations for you.
        </p>
      </div>
    </div>
    <div class="mx-auto pb-5">
      <div class="w-90 mx-auto flex relative py-5 -mt-12">
        <div class="absolute h-100 w-10 flex align-items-center justify-content-center">
          <div class="h-100 w-05 bg-grey-light" />
        </div>
      </div>
      <div class="flex flex-wrap">
        <div
          v-if="!iteration.completed"
          class="w-90 mx-auto flex relative py-2"
        >
          <div class="absolute h-100 w-10 flex align-items-center justify-content-center">
            <div class="h-100 w-05 bg-grey-light" />
          </div>
          <div class="w-10 z-99 flex align-items-center justify-content-center">
            <div class="rounded-full h-16 w-rem-16 xs:h-8 xs:w-rem-8 md:h-12 md:w-rem-12 sm:h-10 sm:w-rem-10 bg-yellow border-solid border-1 border-grey-lighter shadow z-9999 flex align-items-center justify-content-center text-2xl">
              <i class="fas fa-exclamation-triangle text-white" />
            </div>
          </div>
          <div class="w-90 py-3">
            <router-link
              tag="div"
              class="cursor-pointer"
              :to="{name: 'question', params:{id: iteration.starting_question_id, iteration_id: iteration.id}}"
            >
              <div class="w-95 ml-auto bg-transparent border-yellow shadow-sm border-solid border-1 rounded-xl">
                <h4 class="text-lg pt-4 pb-2 p-0 m-0 px-4 xs:pl-0 xs:px-3 md:pl-0 md:px-4 sm:pl-0 sm:px-4 font-bold">
                  Please complete the questionnaire to get all recommendations
                </h4>
                <p class=" text-sm p-0 m-0 px-4 pb-4 xs:pl-0 xs:px-3 md:pl-0 md:px-4 sm:pl-0 sm:px-4" />
              </div>
            </router-link>
          </div>
        </div>

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
import Iteration from "../../models/Iteration"
import RecommendationCard from "../../component/cards/RecommendationCard"
export default {
  name: 'RecommendationIndex',
  components: {
    RecommendationCard
  },
  data() {
    return {
      recommendations: [],
      iteration: { completed: true } // make sure the completion notice is hidden in the beginning
    }
  },

  mounted() {
    Recommendation.index({
      'iteration_id': this.$route.params.iteration_id
    }).then(({
      data
    }) => {
      this.recommendations = data;
    });
    Iteration.show(this.$route.params.iteration_id).then(({ data }) => {
      this.iteration = data;
      console.log(data);
    });
  }
}
</script>