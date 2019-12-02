<template>
    <div>

    </div>
</template>

<script>
    import Form from "../utilities/Form";
    import Question from "../models/Question";
    import Iteration from "../models/Iteration";

    export default {
        name: "Question",
        data() {
            return {
                questions:{},
            }
        }, methods: {
            getQuestions(){
                Question.index((data) => {
                    this.questions = data
                })
            }
        },mounted() {
            this.getQuestions();
        }
    }
</script>

<style scoped>

</style>