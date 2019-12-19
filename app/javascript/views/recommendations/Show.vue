<template>
  <!-- eslint-disable vue/no-v-html -->
  <div class="w-100 md:w-100 xs:w-100 sm:w-100 mx-auto py-1 my-3 xs:my-0 bg-white rounded-xl">
    <div class="relative pt-5 z-10">
      <div class="w-90 mx-auto h-20 bg-transparent border-grey-light shadow-sm border-solid border-1">
        <h1 class="text-primary text-2xl  my-4 pl-5 xs:pl-0 xs:px-3 xs:text-xl xs:pt-2 md:text-xl md:pl-0 md:px-5 md:pt-2">
          <span
            class="text-grey-dark text-base cursor-pointer"
            @click="goBack"
          >
            Recommendations <i class="fas fa-chevron-right mx-3" />
          </span>
          {{ recommendation.title }}
        </h1>
      </div>
    </div>
    <div class="mx-auto pb-4">
      <div class="w-90 mx-auto flex relative py-5 -mt-12">
        <div class="absolute h-100 w-10 flex align-items-center justify-content-center">
          <div class="h-100 w-05 bg-grey-light" />
        </div>
      </div>
      <div class="flex flex-wrap pb-4">
        <div class="w-90 mx-auto flex relative py-2">
          <div class="absolute h-100 w-10 flex align-items-center justify-content-center">
            <div class="h-100 w-05 bg-grey-light" />
          </div>
          <div class="w-10 z-99 flex align-items-center justify-content-center">
            <div class="rounded-full h-16 w-rem-16 xs:h-8 xs:w-rem-8 md:h-12 md:w-rem-12 sm:h-10 sm:w-rem-10 bg-white border-solid border-1 border-grey-lighter shadow z-9999 flex align-items-center justify-content-center text-2xl">
              <div
                class="rounded-full h-4 bg-grey-darker"
                style="width: 1rem"
              />
            </div>
          </div>
          <div class="w-90 py-3">
            <div class="w-100 px-3 bg-transparent border-grey-light shadow-sm border-solid border-1 rounded-xl">
              <div
                class="m-0 p-4 xs:pl-0 xs:p-3"
                v-html="recommendation.description_formatted"
              />
            </div>
          </div>
        </div>
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
      recommendation: {}
    }
  },
  mounted() {
    Recommendation.show(this.$route.params.id).then(({
      data
    }) => {
      this.recommendation = data;
    });
  },
  methods: {
    goBack() {
      return window.history.back();
    }
  },
}
</script>