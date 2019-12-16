<template>
  <div class="w-90 mx-auto py-5 my-5 bg-white rounded-lg">
    <div class="w-80 mx-auto">
      <div class="w-100">
        <div class="h-3 w100 bg-grey-lighter rounded-full">
          <div
            class="h-100 bg-primary rounded-full"
            :style="{ width: completionRate+'%' }"
          />
        </div>
      </div>
      <div class="w-100 relative">
        <div class="py-4 relative z-0">
          <h4 class="my-1 font-medium">
            {{ question.title }}
          </h4>
          <div class="my-0 text-sm opacity-80" v-html="question.description_formatted">
          </div>
        </div>
        <div
          v-if="loading"
          class="w-100 h-100 absolute z-99 bg-white t-0 opacity-50"
        />
      </div>
    </div>
    <div class="w-100 border-0 border-b-1 border-solid" />
    <div
      :class="{'invisible': !loading}"
      class="w-100 overflow-hidden h-2 relative"
    >
      <div class="bg-primary-darker h-100 progress-loader w-20 rounded-full" />
    </div>
    <div class="w-80 mx-auto relative">
      <div class="w-100 py-4 relative z-0">
        <div class="w-100 pt-3 pb-5">
          <div
            v-for="(answer, index) in question.answers"
            :key="answer.id"
          >
            <answer
              :key="answer.id"
              v-model="form.answers[question.multiple ? index : 0]"
              :answer="answer"
              :is-multiple="question.multiple"
            />
          </div>
        </div>
        <div class="text-right mt-2">
          <button
            :disabled="!form.answers.length"
            class="btn btn-primary rounded py-2 text-base"
            @click="saveAnswer"
          >
            Save
          </button>
        </div>
      </div>
      <div
        v-if="loading"
        class="w-100 h-100 absolute z-99 bg-white t-0 opacity-50"
      />
    </div>
  </div>
</template>

<script>
import Form from "../utilities/Form";
import Question from "../models/Question";
import AnswerModel from "../models/Answer";
import Answer from "../component/form/Answer";
import Iteration from "../models/Iteration";

export default {
  name: "Question",
  components: { Answer },
  data() {
    return {
      question: {},
      form: new Form({
        answers: [],
        iteration_id: '',
      }),
      nextQuestion: '',
      loading: true,
      iteration: {}

    }
  },
  computed: {
    completionRate() {
      return this.iteration.completion_rate ? this.iteration.completion_rate : 0;
    }
  },
  mounted() {
    this.getReload();
    this.form.iteration_id = this.$route.params.iteration_id;
  },
  methods: {
    getReload() {
      this.loading = true;
      this.form.answers = [];
      Iteration.show(this.$route.params.iteration_id).then(({ data }) => {
        this.iteration = data;
        this.loading = false;
      });
      Question.show(this.$route.params.id).then(({ data }) => {
        if (data) {
          this.form.answers = [];
          this.question = data;
          this.loading = false;
        }
      })

    },
    saveAnswer() {
      this.loading = true;
      this.form.post(AnswerModel.url()).then(data => {
        if (data) {
          this.$router.push({
            name: 'question',
            params: {
              id: data,
              iteration_id: this.form.iteration_id
            }
          });
          this.getReload();
        } else {
          this.$router.push({
            name: 'dashboard',
            params: { iteration_id: this.form.iteration_id }
          });
        }
      })
    }
  },
}
</script>

<style scoped>

</style>