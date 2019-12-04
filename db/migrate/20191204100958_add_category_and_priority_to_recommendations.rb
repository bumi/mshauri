class AddCategoryAndPriorityToRecommendations < ActiveRecord::Migration[6.0]
  def change
    add_column :recommendations, :category, :string
    add_column :recommendations, :priority, :integer
  end
end
