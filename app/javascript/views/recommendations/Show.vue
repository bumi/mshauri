<template>
<div>
{{recommendation.title}}
</div>    
</template>

<script>

import Recommendation from "../../models/Recommendation"
export default {
    name: 'RecommendationShow',
     data() {
            return {
                recommendation: '',
            }
        },
    
     mounted() {
            Recommendation.show(this.$route.params.id, (data) => {
                this.recommendation = data;
            });
        }
}
</script>