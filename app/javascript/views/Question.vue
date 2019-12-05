<template>
    <div class="w-90 mx-auto py-5 my-5 bg-white rounded-lg">
        <div class="w-80 mx-auto">
            <div class="w-100">
                <div class="h-3 w100 bg-grey-lighter rounded-full">
                    <div class="h-100 bg-primary rounded-full"
                         v-bind:style="{ width: completionRate+'%' }"></div>
                </div>
            </div>
            <div class="w-100 relative">
                <div class="py-4 relative z-0">
                    <h4 class="my-1 font-medium">{{question.title}}</h4>
                    <p class="my-0 text-sm opacity-80">{{question.description}}</p>
                </div>
                <div v-if="loading" class="w-100 h-100 absolute z-99 bg-white t-0 opacity-50">
                </div>
            </div>
        </div>
        <div class="w-100 border-0 border-b-1 border-solid"></div>
        <div v-if="loading" class="w-100 overflow-hidden h-2 relative">
            <div class="bg-primary-darker h-100 progress-loader w-20 rounded-full"></div>
        </div>
        <div class="w-80 mx-auto relative">
            <div class="w-100 py-4 relative z-0">
                <div class="w-100 pt-3 pb-5">
                    <div v-for="answer in question.answers">
                        <p><label
                                v-bind:class="{'radiocontainer': !question.multiple, 'checkcontainer': question.multiple}">
                            <span class="text-lg">{{answer.value}}</span>

                            <input v-if="!question.multiple" type="radio" name="answer"
                                   v-model="form.answers[0]" :value="answer.id">

                            <input v-if="question.multiple" type="checkbox" name="answer"
                                   v-model="form.answers" :value="answer.id">

                            <span v-bind:class="{'radiomark': !question.multiple, 'checkmark': question.multiple}"></span>
                        </label></p>
                    </div>
                </div>
                <div class="text-right mt-4">
                    <button :disabled="!form.answers.length" class="btn btn-primary rounded py-1" @click="saveAnswer">
                        Save
                    </button>
                </div>
            </div>
            <div v-if="loading" class="w-100 h-100 absolute z-99 bg-white t-0 opacity-50">
            </div>
        </div>
    </div>
</template>

<script>
    import Form from "../utilities/Form";
    import Question from "../models/Question";
    import QuestionCard from "../component/cards/QuestionCard";
    import Iteration from "../models/Iteration";

    export default {
        name: "Question",
        components: {QuestionCard},
        data() {
            return {
                question: {},
                form: new Form({
                    answers: [],
                    iteration_id: '',
                }),
                nextQuestion: '',
                loading: true,
                iteration: {}

            }
        }, methods: {
            getReload() {
                this.loading = true;
                this.form.answers = [];
                Iteration.show(this.$route.params.iteration_id, (data) => {
                    this.iteration = data;
                    this.loading = false;
                });
                Question.show(this.$route.params.id, (data) => {
                    this.question = data;
                    this.loading = false;
                })

            }, saveAnswer() {
                this.loading = true;
                this.form.post(apiUrl + '/iteration_answers').then(data => {
                    if (data) {
                        this.$router.push({
                            name: 'question',
                            params: {id: data, iteration_id: this.form.iteration_id}
                        });
                        this.getReload();
                    } else {
                        this.$router.push({
                            name: 'dashboard',
                            params: {iteration_id: this.form.iteration_id}
                        });
                    }
                })

            }
        }, mounted() {
            this.getReload();
            this.form.iteration_id = this.$route.params.iteration_id;
        }, computed: {
            completionRate() {
                return this.iteration.completion_rate ? this.iteration.completion_rate : 0;
            }
        }
    }
</script>

<style scoped>

</style>