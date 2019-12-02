class RenameIterationsAnswers < ActiveRecord::Migration[6.0]
  def change
    rename_table :iterations_answers, :iteration_answers
  end
end
