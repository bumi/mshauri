class AddRecommendationToIteratioANswer < ActiveRecord::Migration[6.0]
  def change
    add_column :iteration_answers, :recommendation_resolved_at, :datetime
  end
end
