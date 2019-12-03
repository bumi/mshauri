class AddOptionsToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :multiple, :boolean
    add_column :questions, :other, :boolean
  end
end
