class Recommendation {
    static index(iteration_id, success, error = Function()) {
        return window.axios.get(this.url(), {
                params: {
                    iteration_id: iteration_id
                }
            })
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
        return window.apiUrl + '/recommendations'
    }

}

export default Recommendation