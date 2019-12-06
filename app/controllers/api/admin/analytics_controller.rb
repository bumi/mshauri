# frozen_string_literal: true

module Api
  module Admin
    class AnalyticsController < ActionController::API
      def index
        render json: Question.first.to_json(include: {

                                              answers: {
                                                methods: :user_count,
                                              },

                                            })
      end
    end
  end
end
