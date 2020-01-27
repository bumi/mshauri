import Dashboard from "../views/Dashboard"
import Home from "../views/Home"
import Question from "../views/Question"
import RecommendationIndex from "../views/recommendations/Index"
import RecommendationShow from "../views/recommendations/Show"
import Error404 from "../views/errors/404"

export default {
  mode: "history",
  scrollBehavior(to, from, savedPosition) {
    if (savedPosition) {
      return savedPosition
    } else {
      return { x: 0,
        y: 0 }
    }
  },
  routes: [
    {
      path: '/recommendations',
      component: RecommendationIndex,
      name: 'recommendations-home'
    },
    {
      path: '/recommendations/:id',
      component: RecommendationShow,
      name: 'recommendation-show'
    },
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
      path: '/*',
      component: Error404,
      name: 'error-404'
    }
  ]
}