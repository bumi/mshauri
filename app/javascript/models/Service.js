class Service {
  static get(url, params = {}) {
    return this.request('get', url,params);
  }

  static post(url, params = {}) {
    return this.request('post', url,params);
  }

  static request(type,url, params = {}) {
    return window.axios(
      {
        method: type,
        url: String(url),
        data: params,
        baseURL: window.apiUrl
      }
    )
  }
}

export default Service