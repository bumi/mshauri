export default class Service {
  static get(url, params = {}) {
    return this.request('get', url, {}, params);
  }

  static post(url, params = {}) {
    return this.request('post', url, params);
  }

  static request(type, url, data = {}, params = {}) {
    return window.axios(
      {
        method: type,
        url: String(url),
        data: data,
        params: params,
        baseURL: window.apiUrl
      }
    )
  }
}
