import Home from "../views/Home"
import Question from "../views/Question";


export default {
    mode: "history",

    routes: [
        {
            path: '/:user_slug',
            component: Home,
            name: 'home'
        }, {
             path: '/questions',
             component: Question,
             name: 'question'
        }

    ]
}
