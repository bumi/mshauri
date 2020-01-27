<template>
  <div class="w-100 md:w-100 xs:w-100 sm:w-100 mx-auto py-3 my-3 xs:my-0 bg-white rounded-xl">
    <loader :value="loading" />
    <div class="w-80 mx-auto">
      <div class="my-5">
        <div
          v-if="iteration.recommendations_count > 0"
          class="text-right w-100"
        >
          <button
            class="btn btn-success rounded"
            @click="viewRecommendations"
          >
            View Recommendations
          </button>
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
        <div
          v-if="iterationAnswers.length < 1 && !loading"
          class="p-5"
        >
          <div class="w-100 p-5 opacity-60">
            <div class="w-100 flex px-4 py-2">
              <div class="w-auto pr-3">
                <p class="my-0 leading-none text-4xl font-primary">
                  Q:
                </p>
              </div>
              <div class="w-90 ">
                <div class="w-100 h-4 bg-black mt-1 rounded-full" />
                <div class="w-80 h-3 bg-black mt-2 rounded-full" />
                <div class="w-30 h-3 bg-black mt-2 rounded-full" />
              </div>
            </div>
            <div class="w-100 flex px-4 py-2 text-primary-darkest py-4">
              <div class="w-auto pr-3">
                <p class="my-0 leading-none text-4xl font-primary">
                  A:
                </p>
              </div>
              <div class="w-90">
                <div class="w-100 h-4 bg-black mt-2 rounded-full" />
              </div>
            </div>
            <h3 class="text-center">No Question answered yet</h3>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import IterationAnswer from "../../../models/IterationAnswer"
import Iteration from "../../../models/Iteration"
import Loader from "../../../component/Loader"
export default {
  name: 'IterationAnswersIndex',
  components: {
    Loader
  },
  data() {
    return {
      iterationAnswers: [],
      iteration: {},
      loading: true
    }
  },
  mounted() {
    IterationAnswer.index({
      'iteration_id': this.$route.params.iteration_id
    }).then(({ data }) => {
      this.iterationAnswers = data;
      this.loading = false;
    });
    Iteration.show(this.$route.params.iteration_id).then(({ data }) => {
      this.iteration = data;
    });
  },
  methods: {
    viewRecommendations() {
      this.$router.push({
        name: 'recommendations-index',
        params: { iteration_id: this.iteration.id }
      });
    }
  }
}
</script>