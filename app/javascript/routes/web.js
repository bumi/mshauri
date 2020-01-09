import Dashboard from "../views/Dashboard"
import Home from "../views/Home"
import Question from "../views/Question"
import RecommendationIndex from "../views/recommendations/Index"
import RecommendationShow from "../views/recommendations/Show"
import AdminIndex from "../views/admin/Index"
import UserShow from "../views/user/Show"
import IterationAnswersIndex from "../views/admin/iteration-answers/Index"

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
      path: '/:user_slug/recommendations/:id',
      component: RecommendationShow,
      name: 'recommendation-show'
    },
    {
      path: '/:user_slug/admin',
      component: AdminIndex,
      name: 'admin-index'
    }, {
      path: '/:user_slug/admin/user/:id',
      component: UserShow,
      name: 'admin-user-show'
    }, {
      path: '/:user_slug/admin/i/:iteration_id/answers',
      component: IterationAnswersIndex,
      name: 'admin-iteration-answers'
    }
  ]
}