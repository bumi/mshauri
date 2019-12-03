<template>
    <div>
        <div class="text-center">
            <h2>Hi {{user.name}}</h2>
            <h3>Start learning</h3>

        </div>
        <div class="flex">
            <div class="w-50 center">
                <div class="mt-5 b-2 bg-blue-light w-50 h-100 text-center r-5" v-for="iteration  in iterations">
                    {{iteration.completion_rate}}
                </div>
            </div>
            <div class="w-50">

                <button class="mt-5 b-2 bg-blue-light w-50 h-100 text-center r-5" @click="newIteration">
                    New iteration
                </button>
            </div>
        </div>
    </div>
</template>

<script>

    import User from "../models/User";
    import Iteration from "../models/Iteration";
    import Form from "../utilities/Form";

    export default {
        name: "Home",
        data() {
            return {
                user: {},
                iterations: {},

                form: new Form({}),

            }
        }, methods: {
            getUser() {
                User.show((data) => {
                    this.user = data
                });
            }, getIteration() {
                Iteration.index((data) => {
                    this.iterations = data
                })
            }, newIteration() {
                Iteration.create(data => {
                    this.$router.push({name: 'question', params: {id: data.starting_question_id }});
                    console.log(data)
                })
            }
        }, mounted() {
            this.getUser();
            this.getIteration();

        }
    }
</script>

<style scoped>

</style>