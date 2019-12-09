import BaseModel from "./BaseModel";
import Service from "./Service";

export default class Recommendation extends BaseModel {
     static basePath = "recommendations";

     static index(id) {
       return Service.get(this.url(), {
         'iteration_id': id
       });
     }
}
