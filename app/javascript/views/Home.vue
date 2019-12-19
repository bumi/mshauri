<template>
  <div class="w-100 md:w-100 xs:w-100 sm:w-100 mx-auto py-1 my-3 xs:my-0 bg-white rounded-xl">
    <div class="w-90 ml-auto xs:mx-auto py-5">
      <div
        class="mt-3 w-25 mr-3 xs:w-100 sm:w-40 md:w-40 border-1 border-solid border-grey-lighter shadow-sm cursor-pointer"
        @click="newIteration"
      >
        <div class="px-3 py-2 text-center">
          <img
            src="/plus.svg"
            class="w-35 pt-5 mx-auto text-center "
          >

          <h2 class="pt-3 text-xs text-grey-dark ">
            Start survey and get recommendations
          </h2>
        </div>
      </div>
    </div>
    <div
      class="w-100 bg-grey-lighter"
      style="height:2px"
    />

    <div class="w-90 xs:w-95 text-left ml-auto">
      <h6 class="my-4 text-xl font-semibold">
        Recent answers
      </h6>
    </div>
    <div class="flex flex-wrap xs:block xs:w-90 xs:mx-auto justify-content-center md:w-90 md:mx-auto pt-4 pb-5">
      <div
        v-for="iteration in iterations"
        :key="iteration.id"
        class="my-3 w-25 xs:w-100 md:w-40 sm:w-40 mr-3 mx-3 xs:mx-0 xs:mr-0"
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