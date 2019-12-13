class AddIdentifierToRecommendations < ActiveRecord::Migration[6.0]
  def change
    add_column :recommendations, :identifier, :string
  end
end
