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
        v-if="iteration.completion_rate < 100"
        class="btn bg-primary py-1 text-xs mx-auto text-white w-100 rounded-sm"
        @click="openIteration(iteration)"
      >
        Continue
      </button>

      <button
        v-if="iteration.completion_rate == 100"
        class="btn bg-red py-1 text-xs mx-auto text-white w-100 rounded-sm"
        @click="viewRecommendations(iteration)"
      >
        View Recommendations
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
    }
  },
  methods: {
    openIteration(iteration) {
      this.$router.push({
        name: 'question',
        params: {
          id: iteration.starting_question_id,
          iteration_id: iteration.id
        }
      });
    },
    viewRecommendations(iteration) {
      this.$router.push({
        name: 'recommendations-index',
        params: { iteration_id: iteration.id }
      });
    }
  },computed: {
      startedOn(){
          let date = new Date(this.iteration.created_at);
          return date.getDate()+'-'+(date.getMonth()+ 1)+'-'+date.getFullYear();
      }
  },
}
</script>