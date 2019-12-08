import Dashboard from "../views/Dashboard"
import Home from "../views/Home"
import Question from "../views/Question"
import RecommendationIndex from "../views/recommendations/Index"
import RecommendationShow from "../views/recommendations/Show"

export default {
  mode: "history",

  routes: [
    {
      path: '/:user_slug',
      component: Home,
      name: 'home'
    },
    {
      path: '/:user_slug/i/:iteration_id/questions/:id',
      component: Question,
      name: 'question'
    },
    {
      path: '/:user_slug/i/:iteration_id/completed',
      component: Dashboard,
      name: 'dashboard'
    },
    {
      path: '/:user_slug/i/:iteration_id/recommendations',
      component: RecommendationIndex,
      name: 'recommendations-index'
    },
    {
      path: '/:user_slug/recommendations/:id/:title',
      component: RecommendationShow,
      name: 'recommendation-show'
    }
  ]
}