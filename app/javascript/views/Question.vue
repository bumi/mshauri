<template>
    <div class="w-90 mx-auto py-5 my-5 bg-white rounded-lg">
        <div class="w-80 mx-auto">
            <div class="w-100">
                <div class="h-3 w100 bg-grey-lighter rounded-full">
                    <div class="w-20 h-100 bg-primary rounded-full"></div>
                </div>
            </div>
            <div class="py-4">
                <h4 class="my-1 font-medium">{{question.title}}</h4>
                <p class="my-0 text-sm opacity-80">{{question.description}}</p>
            </div>
        </div>
        <div class="w-100 border-0 border-b-1 border-solid"></div>
        <div class="w-80 mx-auto">
            <div class="w-100 py-4">
                <div class="w-100 pt-3 pb-5">
                    <div v-for="answer in question.answers">
                        <p><label class="radiocontainer">
                            <span class="text-lg">{{answer.value}}</span>
                            <input type="radio" name="answer" v-model="form.answer_id" :value="answer.id">
                            <span class="radiomark"></span>
                        </label></p>
                    </div>
                </div>
                <div class="text-right mt-4">
                    <button class="btn btn-primary rounded py-1" @click="saveAnswer">Save</button>
                </div>
            </div>
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
                    answer_id: '',
                    iteration_id: '',
                }),
                nextQuestion: ''

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