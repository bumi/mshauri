<template>
  <!-- eslint-disable vue/no-v-html -->

  <div class="bg-white w-100 mx-auto -mt-8 py-5">
  
  <button @click="updateAnswer" class="btn btn-primary">Save</button>

    <div
      v-if="recommendation"
      class="w-90 mx-auto my-3"
    >
      <h1 class="text-center font-bold text-3xl font-primary my-4">
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
  },methods:{
     updateAnswer(){
       IterationAnswer.update(this.$route.params.iteration_id).then(({ data }) =>{
         console.log("lewis");
       })
     }
  },
  mounted() {
    Recommendation.show(this.$route.params.id).then(({ data }) => {
      this.recommendation = data;
    });
  }
  
}
</script>