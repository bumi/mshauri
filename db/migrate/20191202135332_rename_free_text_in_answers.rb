class RenameFreeTextInAnswers < ActiveRecord::Migration[6.0]
  def change
    rename_column :answers, :freetext, :input
    change_column_default :answers, :input, false
  end
end
