class User {
    static show(slug, success, error = Function()) {
        return axios.get(this.url() + '/me')
            .then(({data}) => success(data))
            .catch(
                e => error(e)
            )
    }

    static url() {
        return apiUrl + '/users'
    }

}

export default User
