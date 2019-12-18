<template>
  <div class="bg-white py-2 pb-5 my-5 w-90 mx-auto rounded-xl">
    <div class="w-80 mx-auto xs:mx-auto py-4 flex xs:block sm:w-85">
      <div class="w-80 xs:w-100 ">
        <h5 class="my-0">
          Hey, You Can Start Or Resume Surveys
        </h5>
        <span class="text-xs text-grey-dark">Complete surveys to view recommendations</span>
      </div>

      <div
        class="w-20 xs:w-100 sm:w-40 md:w-40 xs:mt-3"
        @click="newIteration"
      >
        <button class=" btn btn-primary rounded-lg py-2 text-base cursor-pointer w-100 xs:text-2xl shadow-sm cursor-pointer">
          Start New Iteration
        </button>
      </div>
    </div>
    <div
      class="w-100 bg-grey-lighter"
      style="height:2px"
    />

    <div class="w-90 xs:w-95 text-left ml-auto">
      <h6 class="my-4 text-xl font-semibold">
        Recent iteration
      </h6>
    </div>
    <div class="flex flex-wrap xs:block xs:w-90 xs:mx-auto justify-content-center md:w-90 md:mx-auto py-4">
      <div
        v-for="iteration in iterations"
        :key="iteration.id"
        class="mt-3 w-25 xs:w-100 md:w-40 sm:w-40 mr-3 mx-3 xs:mx-0 xs:mr-0"
      >
        <iteration-card :iteration="iteration" />
      </div>
    </div>
  </div>
</template>

<script>
import User from "../models/User";
import Iteration from "../models/Iteration";
import IterationCard from "../component/cards/IterationCard";
import Form from "../utilities/Form";

export default {
  name: "Home",
  components: {
    IterationCard
  },
  data() {
    return {
      user: {},
      iterations: {},

      form: new Form({}),

    }
  },
  mounted() {
    this.getUser();
    this.getIterations();

  },
  methods: {
    getUser() {
      User.show('me').then(({ data }) => {
        this.user = data
      });
    },
    getIterations() {
      Iteration.index().then(({ data }) => {
        this.iterations = data
      })
    },
    newIteration() {
      Iteration.create().then(({ data }) => {
        this.openIteration(data);
        console.log(data)
      })
    },
    openIteration(iteration) {
      this.$router.push({
        name: 'question',
        params: {
          id: iteration.starting_question_id,
          iteration_id: iteration.id
        }
      });
    }
  },
}
</script>

<style scoped>

</style>