import Service from "./Service"

class BaseRequest {

    static basePath;

    static index() {
      return Service.get(this.url());
    }

    static show(id) {
      return Service.get(this.url(id));
    }

    static create(params = {}) {
      return Service.post(this.url(), params);
    }

    static url() {
      return [this.basePath,...arguments].join('/')
    }
}

export default BaseRequest