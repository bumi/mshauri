import Service from "./Service"

export default class BaseModel {

    static basePath;

    static index(options = {}) {
      return Service.get(this.url(), options);
    }

    static show(id) {
      return Service.get(this.url(id));
    }

    static create(params = {}) {
      return Service.post(this.url(), params);
    }

    static url() {
      return [this.basePath, ...arguments].join('/')
    }
}