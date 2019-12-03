class Iteration {
    static index(success, error = Function()) {
        return axios.get(this.url())
            .then(({data}) => success(data))
            .catch(
                e => error(e)
            )
    }

    static create(success, error){
      return axios.post(this.url())
          .then(({data}) => success(data))
          .catch( e => error)
    }

    static url() {
        return apiUrl + '/iterations'
    }

}

export default Iteration
