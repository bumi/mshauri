<template>
    <div>
        {{question.title}} <br>
        <div v-for="answer in question.answers">
            <input type="radio" name="answer" v-model="form.answer_id" :value="answer.id">
            <label>{{answer.value}}</label>
        </div>
        <button @click="saveAnswer">Save</button>

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
                    answer_id: '',
                    iteration_id: '',
                }),
                nextQuestion:''

            }
        }, methods: {
            getQuestions() {
                Question.show(this.$route.params.id, (data) => {
                    this.question = data
                })

            }, saveAnswer() {
                this.form.post(apiUrl + '/answers').then(data => {
                    this.$router.push({name: 'question',
                        params: {id: data , iteration_id: this.form.iteration_id }});
                    console.log(data)
                })

            }
        }, mounted() {
            this.getQuestions();
            this.form.iteration_id = this.$route.params.iteration_id;
        }
    }
</script>

<style scoped>

</style>