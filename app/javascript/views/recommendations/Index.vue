<template>
<div>
           <span  v-for="recommendation in recommendations" :key="recommendation.id">
             <router-link :to="{name: 'recommendation-show', params:{id: recommendation.id, title: recommendation.title}}">
                {{recommendation.title}}
             </router-link>
           </span>
        
</div>
</template>

<script>
    import Recommendation from "../../models/Recommendation"
    export default {
        name: 'RecommendationIndex',
        data() {
            return {
                recommendations: [],
            }
        },
    
        mounted() {
            Recommendation.index(this.$route.params.iteration_id, (data) => {
                this.recommendations = data;
                console.log(data)
            });
        }
    }
</script>