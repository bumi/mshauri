class CreateIterationsAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :iterations_answers do |t|
      t.references :iteration, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true
      t.references :answer, null: false, foreign_key: true
      t.string :value, null: true
    end
  end
end
