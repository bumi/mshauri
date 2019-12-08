class User {
    static show(success, error = Function()) {
        return window.axios.get(this.url() + '/me')
            .then(({ data }) => success(data))
            .catch(
                e => error(e)
            )
    }

    static url() {
        return window.apiUrl + '/users'
    }

}

export default User
