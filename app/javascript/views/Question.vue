<template>
    <div>
        {{question.title}} <br>
        <div v-for="answer in question.answers">
            <input type="radio" name="answer"  v-model="form.value">
            <label>{{answer.value}}</label>
        </div>
    </div>
</template>

<script>
    import Form from "../utilities/Form";
    import Question from "../models/Question";
    import Iteration from "../models/Iteration";
    import QuestionCard from "../component/cards/QuestionCard";
    import Answer from "../models/Answer";

    export default {
        name: "Question",
        components: {QuestionCard},
        data() {
            return {
                question: {},
                form: new Form({
                    value: '',
                }),

            }
        }, methods: {
            getQuestions() {
                Question.show(this.$route.params.id, (data) => {
                    this.question = data
                })

            }, saveAnswer() {
                    this.form.post(apiUrl + '/answers').then(response => {
                        // this.$router.push({name: 'question', params: {id: data.starting_question_id }});
                        console.log(response)
                    })

            }
        }, mounted() {
            this.getQuestions();
        }
    }
</script>

<style scoped>

</style>