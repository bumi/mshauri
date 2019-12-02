class AddEntryColToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :entry, :boolean, default: false
  end
end
