class AddIntroToRecommendations < ActiveRecord::Migration[6.0]
  def change
    add_column :recommendations, :intro, :text
  end
end
