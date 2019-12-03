import Dashboard from "../views/Dashboard"
import Home from "../views/Home"
import Question from "../views/Question"


export default {
    mode: "history",

    routes: [
        {
            path: '/:user_slug',
            component: Home,
            name: 'home'
        }, {
             path: '/:user_slug/i/:iteration_id/questions/:id',
             component: Question,
             name: 'question'
        },{
            path: '/:user_slug/dashboard',
            component: Dashboard,
            name: 'dashboard'
        }

    ]
}
