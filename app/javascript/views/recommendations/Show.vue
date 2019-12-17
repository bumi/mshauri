<template>
  <!-- eslint-disable vue/no-v-html -->

  <div class="bg-white w-100 mx-auto -mt-8 py-5">
    <button
      class="btn btn-primary"
      @click="updateAnswer"
    >
      Save
    </button>

    <div
      v-if="recommendation"
      class="w-90 xs:w-85 mx-auto my-3"
    >
      <h1 class="text-center font-bold text-3xl xs:text-xl font-primary my-4">
        {{ recommendation.title }}
      </h1>
      <div
        class="font-light my-4"
        v-html="recommendation.description_formatted"
      />
    </div>
  </div>
</template>

<script>
import Recommendation from "../../models/Recommendation"
import IterationAnswer from "../../models/IterationAnswer"
export default {
  name: 'RecommendationShow',
  data() {
    return {
      recommendation: {},
    }
  },
  mounted() {
    Recommendation.show(this.$route.params.id).then(({ data }) => {
      this.recommendation = data;
    });
  },
  methods: {
    updateAnswer() {
      IterationAnswer.update(this.$route.params.iteration_id).then(({ data }) => {
        // TODO: Handle Recommendation done behavior
        console.log(data);
      })
    }
  }

}
</script>