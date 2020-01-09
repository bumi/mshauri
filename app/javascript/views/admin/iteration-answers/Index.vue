<template>
  <div class="w-100 md:w-100 xs:w-100 sm:w-100 mx-auto py-3 my-3 xs:my-0 bg-white rounded-xl">
    <div class="w-80 mx-auto">
      <div class="my-5">
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
export default {
  name: 'IterationAnswersIndex',
  data() {
    return {
      iterationAnswers: [],
    }
  },
  mounted() {
    IterationAnswer.index({
      'iteration_id': this.$route.params.iteration_id
    }).then(({ data }) => {
      this.iterationAnswers = data;
      console.log(data);
    })
  }
}
</script>