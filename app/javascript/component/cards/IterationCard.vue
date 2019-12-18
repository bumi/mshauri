<template>
  <div class="w-100 mx-auto border-1 p-4 border-solid border-grey-lighter shadow-sm">
    <div class="flex h-1 bg-grey-lighter rounded-full overflow-hidden">
      <div
        class="h-100 bg-primary rounded-full"
        :style="{ width: iteration.completion_rate+'%' }"
      />
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
        v-if="!admin"
        class="btn py-1 text-xs mx-auto w-100 rounded"
        :class="[isComplete ? 'bg-primary text-white' : 'bg-grey-light text-black']"
        @click="handleClick"
      >
        {{ buttonLabel }}
      </button>
    </div>
  </div>
</template>

<script>
export default {
  name: 'IterationCard',
  props: {
    iteration: {
      type: Object,
      default: () => {}
    },
    admin: {
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
      return this.isComplete ? 'View Recommendations' : 'Continue';
    }
  },
  methods: {
    handleClick: function() {
      let options;

      if (this.isComplete) {
        options = {
          name: 'recommendations-index',
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