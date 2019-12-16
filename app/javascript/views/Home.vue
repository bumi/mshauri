<template>
  <div class="bg-white py-2 min-h-screen -mt-8">
    <div class="w-80 mx-auto ">
      <h1 class="text-grey-darker text-5xl font-primary xs:text-3xl text-centered">
        Hi, {{ user.name }}
        <span class="w-90"><img
          src="/assets/waving-hand.svg"
          class="w-8 text-grey"
        ></span>
      </h1>

      <h2 class="text-center text-weight-normal text-grey-dark text-2xl xs:text-lg">
        Welcome to Mshauri!
      </h2>
    </div>
    <div class="w-100 h-1 bg-primary" />
<div class="w-90 ml-auto py-5"> 
  <div
        class="mt-3 w-25 mr-3 w-20 border-1 border-solid border-grey-lighter shadow-sm cursor-pointer"
        @click="newIteration"
      >
        <div class="px-3 py-2 text-center">
          <img
            src="/assets/plus.svg"
            class="w-35 pt-5 mx-auto text-center "
          >

          <h2 class="pt-3 text-xs text-grey-dark ">
            Start Iteration
          </h2>
        </div>
      </div>
</div>
<div class="w-100 bg-grey-lighter" style="height:2px" ></div>
 
    <div class="w-90 text-left ml-auto">
      <h6 class="my-4 text-xl font-semibold">Recent iterations</h6>
    </div>
    <div class="flex flex-wrap justify-content-center ">
    
      
      <div
        v-for="iteration in iterations"
        :key="iteration.id"
        class="mt-3 w-25 mr-3 mx-3"
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