import Home from "../views/Home"


export default {
    mode: "history",

    routes: [
        {
            path: '/:user_slug',
            component: Home,
            name: 'home'
        }
    ]
}
