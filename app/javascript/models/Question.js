class Question {
    static index(success, error = Function()) {
        return axios.get(this.url())
            .then(({data}) => success(data))
            .catch(
                e => error(e)
            )
    }

    static url() {
        return apiUrl + '/questions'
    }

}

export default Question
