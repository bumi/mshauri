# frozen_string_literal: true

module Api
  module Admin
    class AnalyticsController < ActionController::API
      def index
        @questions = Question.all
      end
    end
  end
end
