<template>
  <div class="w-100 mx-auto border-1 p-4 border-solid border-grey-lighter shadow-sm">
    <div class="flex h-1 bg-grey-lighter rounded-full overflow-hidden">
      <progress-bar :value="iteration.completion_rate" />
    </div>

    <div class="w-100 mx-auto">
      <h4
        class="font-light text-grey-dark m-0 pt-3"
        style="font-size: 0.55rem"
      >
        Level
      </h4>
      <h1 class="pt-1 m-0 text-2xl text-weight-normal">
        {{ iteration.completion_rate }}%
      </h1>

      <h3 class="text-xs text-weight-light">
        Started on {{ startedOn }}
      </h3>
      <button
        class="btn py-1 text-xs mx-auto w-100 rounded"
        :class="[isComplete || isAdmin ? 'bg-primary text-white' : 'bg-grey-light text-black']"
        @click="handleClick"
      >
        {{ buttonLabel }}
      </button>
    </div>
  </div>
</template>

<script>

import ProgressBar from "../ProgressBar";

export default {
  name: 'IterationCard',
  components: { ProgressBar },
  props: {
    iteration: {
      type: Object,
      default: () => {}
    },
    isAdmin: {
      type: Boolean,
      default: false
    }
  },
  computed: {
    startedOn() {
      let date = new Date(this.iteration.created_at);
      return date.getDate() + '-' + (date.getMonth() + 1) + '-' + date.getFullYear();
    },
    isComplete() {
      return this.iteration.completion_rate === 100
    },
    buttonLabel: function() {
      if (this.isAdmin) {
        return "View Answers";
      }
      if (this.isComplete) {
        return "Continue";
      }
      return 'View Recommendations';
    }
  },
  methods: {
    handleClick: function() {
      let options;

      if (this.isComplete & !this.isAdmin) {
        options = {
          name: 'recommendations-index',
          params: { iteration_id: this.iteration.id }
        };
      } else if (this.isAdmin) {
        options = {
          name: 'admin-iteration-answers',
          params: { iteration_id: this.iteration.id }
        };
      } else {
        options = {
          name: 'question',
          params: {
            id: this.iteration.starting_question_id,
            iteration_id: this.iteration.id
          }
        };
      }
      this.$router.push(options);
    }
  },
}
</script>