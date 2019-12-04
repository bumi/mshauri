class Answer {
    static create(success, error) {
        return axios.post(this.url())
            .then(({data}) => success(data))
            .catch(e => error)
    }

    static url() {
        return apiUrl + '/iteration_answers'
    }
}

export default Answer