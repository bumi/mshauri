<template>
    <div class="w-100 mx-auto bg-white min-h-screen -mt-8">

        <div class="w-70 mx-auto pt-5">
            <h1 class="mb-5 text-grey-darkest text-4xl font-primary text-center text-weight-semibold">
                Congratulations, <span class="text-weight-normal">{{user.name}}</span>
                <span class="w-90"><img src="/assets/clap.svg" class="w-8 text-grey"></span>
            </h1>

            <p class="text-center p-0 m-0"><img src="/assets/new-product%201.png" class="w-20"></p>

            <h2 class="mt-0 mb-4 text-center text-weight-normal font-nunito text-grey-dark text-xl">You’ve successfully
                completed all the questions</h2>
        </div>
        <div class="w-100 h-1 bg-primary"></div>
        <div v-if="recommendations.length" class="w-90 mx-auto pt-4 pb-5">
            <h4 class="text-center mb-5">Some recommendations</h4>
            <div class="flex">
                <div :key="index" v-for="(recommendation, index) in recommendations" class="card card-default h-100 w-30 mx-2 my-3 shadow  rounded-t-lg">
                    <div class="w-90 font-primary mx-auto">
                        <h5 class="font-bold text-base">{{recommendation.title}}</h5>
                        <div class="my-3 text-left">
                            <div>
                              {{recommendation.description}}
                            </div>
                        </div>

                    </div>
                    <div class="text-right w-90  my-4 text-blue cursor-pointer">
                        <span class="text-sm">Read more</span>
                    </div>
                </div>
            </div>
        </div>

    </div>
</template>

<script>
    import User from "../models/User";
    import Recommendation from "../models/Recommendation";

    export default {
        name: "Dashboard",
        data() {
            return {
                user: {},
                recommendations: []
            }
        },
        mounted() {
            User.show((data) => {
                this.user = data
            });
            Recommendation.index(this.$route.params.iteration_id, (data) => {
                this.recommendations = data;
            });
        }
    }
</script>

<style scoped>

</style>