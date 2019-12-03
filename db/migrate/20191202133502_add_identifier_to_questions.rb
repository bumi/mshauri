class AddIdentifierToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :identifier, :string
  end
end
