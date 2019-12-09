export default class Service {
  static get(url, params = {}) {
    return this.request('get', url, {}, params);
  }

  static post(url, data = {}) {
    return this.request('post', url, data);
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
