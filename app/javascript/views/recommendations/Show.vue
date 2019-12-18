<template>
  <!-- eslint-disable vue/no-v-html -->

  <div class="w-100 mx-auto py-5">
    <div class="w-100 mx-auto py-5 bg-white">
      <div
        v-if="recommendation"
        class="w-90 xs:w-85 mx-auto my-3 "
      >
        <div class="p-3 bg-grey-lighter w-auto inline-block rounded-xl mb-5">
          <p class="text-xs my-0">
            <!-- TODO: update link to recommendations index -->
            <router-link
              tag="div"
              class="cursor-pointer"
              :to="{name: 'recommendation-show', params:{id: recommendation.id}}"
            >
              Recommendations <i class="fas fa-chevron-right mx-1" />
            </router-link>
            <span>{{ recommendation.title }}</span>
          </p>
        </div>

        <h1 class="text-center font-bold text-3xl xs:text-xl font-primary my-4">
          {{ recommendation.title }}
        </h1>
        <div
          class="font-light my-4"
          v-html="recommendation.description_formatted"
        />
      </div>
    </div>
  </div>
</template>

<script>
import Recommendation from "../../models/Recommendation"
export default {
  name: 'RecommendationShow',
  data() {
    return {
      recommendation: {},
    }
  },

  mounted() {
    Recommendation.show(this.$route.params.id).then(({
      data
    }) => {
      this.recommendation = data;
    });
  }
}
</script>