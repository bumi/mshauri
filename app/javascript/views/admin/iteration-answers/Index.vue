<template>
  <div class="w-100 md:w-100 xs:w-100 sm:w-100 mx-auto py-3 my-3 xs:my-0 bg-white rounded-xl">
    <div class="w-80 mx-auto">
      <div class="my-5">
        <div v-if="iteration.recommendations_count > 0" class="text-right w-100">
          <button @click="viewRecommendations" class="btn btn-success">View Recommendations</button>
        </div>
        <div
          v-for="iterationAnswer in iterationAnswers"
          :key="iterationAnswer.id"
          class="w-100 my-4 px-3 py-2 bg-transparent border-grey-light shadow-sm border-solid border-1 rounded-xl"
        >
          <div class="w-100 flex px-4 py-2">
            <div class="w-auto pr-3">
              <p class="my-0 text-4xl font-primary">
                Q:
              </p>
            </div>
            <div class="w-90">
              <h4>
                {{ iterationAnswer.question.title }}
              </h4>
              <p class="my-1">
                {{ iterationAnswer.question.description }}
              </p>
            </div>
          </div>
          <div class="w-100 flex px-4 py-2 text-primary-darkest">
            <div class="w-auto pr-3">
              <p class="my-0 text-4xl font-primary">
                A:
              </p>
            </div>
            <div class="w-90">
              <h4>
                {{ iterationAnswer.answer.value }}
              </h4>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import IterationAnswer from "../../../models/IterationAnswer"
import Iteration from "../../../models/Iteration"
export default {
  name: 'IterationAnswersIndex',
  data() {
    return {
      iterationAnswers: [],
      iteration: {}
    }
  },
  mounted() {
    IterationAnswer.index({
      'iteration_id': this.$route.params.iteration_id
    }).then(({ data }) => {
      this.iterationAnswers = data;
      console.log(data);
    });
    Iteration.show(this.$route.params.iteration_id).then(({ data }) => {
        this.iteration = data;
    });
  }, methods:{
      viewRecommendations(){
        this.$router.push({
          name: 'recommendations-index',
          params: { iteration_id: this.iteration.id }
        });
      }
  }
}
</script>