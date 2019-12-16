class AssociateRecommendationToAnswers < ActiveRecord::Migration[6.0]
  def change
    add_column :answers, :recommendation_id, :integer
    remove_column :recommendations, :answer_id
  end
end
