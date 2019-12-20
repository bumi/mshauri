<template>
  <div class="xs:py-1">
    <div class="w-100 md:w-100 xs:w-100 sm:w-100 mx-auto py-5 my-3 xs:my-0 bg-white rounded-xl">
      <div class="w-90 mx-auto xs:mx-auto pb-4 flex xs:block sm:w-85">
        <div class="w-90 xs:w-100 ">
          <h5 class="my-0">
            Rwanda Tech Guide
          </h5>
          <span class="text-xs text-grey-dark">
            Complete the Rwanda Tech Guide survey and get individual recommendations for your software development best practices.
          </span>
          <button class="btn btn-primary">
            <router-link :to="{name: 'recommendations-home' }">
              View Recommendations
            </router-link>
          </button>
        </div>

        <div
          class="w-20 xs:w-100 sm:w-40 md:w-40 xs:mt-3"
          @click="newIteration"
        >
          <button class=" btn btn-primary rounded-lg py-2 text-base cursor-pointer w-100  shadow-sm cursor-pointer">
            Start survey
          </button>
        </div>
      </div>
      <div
        class="w-100 bg-grey-lighter"
        style="height:2px"
      />

      <div class="w-90 xs:w-95 text-left mx-auto">
        <h6 class="my-4 text-xl font-semibold">
          Your recommendations
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
      User.show('me').then(({
        data
      }) => {
        this.user = data
      });
    },
    getIterations() {
      Iteration.index().then(({
        data
      }) => {
        this.iterations = data
      })
    },
    newIteration() {
      Iteration.create().then(({
        data
      }) => {
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