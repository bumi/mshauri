class Answer {
    static create(success, error) {
        return window.axios.post(this.url())
            .then(({ data }) => success(data))
            .catch(e => error(e))
    }

    static url() {
        return window.apiUrl + '/iteration_answers'
    }
}

export default Answer