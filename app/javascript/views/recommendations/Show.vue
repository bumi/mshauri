<template>
    <div class="bg-white w-100 mx-auto -mt-8 py-5">
        <div class="w-90 mx-auto my-3">
            <h1 class="text-center font-bold text-3xl font-primary my-4">{{recommendation.title}}</h1>
            <div class="font-light my-4" v-html="recommendation.description"></div>
        </div>
    </div>
</template>

<script>
    import Recommendation from "../../models/Recommendation"
    export default {
        name: 'RecommendationShow',
        data() {
            return {
                recommendation: {},
            }
        },

        mounted() {
            Recommendation.show(this.$route.params.id, (data) => {
                this.recommendation = data;
            });
        }
    }
</script>