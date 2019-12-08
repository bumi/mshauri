class Question {
    static index(success, error = Function()) {
        return window.axios.get(this.url())
            .then(({ data }) => success(data))
            .catch(
                e => error(e)
            )
    }

    static show(id, success, error = Function()) {
        return window.axios.get(this.url() + '/' + id)
            .then(({ data }) => success(data))
            .catch(
                e => error(e)
            )
    }

    static url() {
        return window.apiUrl + '/questions'
    }

}

export default Question
