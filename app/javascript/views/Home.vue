<template>
    <div>
        <div class="text-center">
            <h2>Hi {{user.name}}</h2>
            <h3>Start learning</h3>

        </div>
        <div class="flex flex-wrap justify-content-center">
            <div @click="newIteration" class="mt-3 b-2 w-25 border-2 border-solid mr-3 h-100 text-center p-5 bg-primary text-white cursor-pointer">
                <div class="w-100 h-32 mx-auto flex flex-wrap align-items-center justify-content-center">
                    <p class="text-center text-6xl w-100 m-0"><i class="fas fa-plus-circle"></i></p>
                    <p class="text-center m-0"> New iteration</p>
                </div>
            </div>
            <div @click="openIteration(iteration.id)" class="mt-3 b-2 w-25 border-2 border-solid mr-3 h-100 text-center p-5 cursor-pointer"
                 v-for="iteration  in iterations">
                <div class="w-rem-32 h-32 mx-auto rounded-full border-2 border-solid flex align-items-center justify-content-center">
                    <p class="text-center text-3xl">{{iteration.completion_rate}} %</p>
                </div>
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
                    this.openIteration(data.starting_question_id);
                    console.log(data)
                })
            },openIteration(id){
                this.$router.push({name: 'question', params: {id: id}});
            }
        }, mounted() {
            this.getUser();
            this.getIteration();

        }
    }
</script>

<style scoped>

</style>