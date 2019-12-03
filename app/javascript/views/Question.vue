<template>
    <div>
        {{question.title}} <br>
        <div v-for="answer in question.answers">
            <label>{{answer.value}}</label>

        </div>
    </div>
</template>

<script>
    import Form from "../utilities/Form";
    import Question from "../models/Question";
    import Iteration from "../models/Iteration";
    import QuestionCard from "../component/cards/QuestionCard";

    export default {
        name: "Question",
        components: {QuestionCard},
        data() {
            return {
                question: {},

            }
        }, methods: {
            getQuestions() {
                Question.show(this.$route.params.id, (data) => {
                    this.question = data
                })

            }
        }, mounted() {
            this.getQuestions();
        }
    }
</script>

<style scoped>

</style>