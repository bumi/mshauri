class MakeNextQuestionIdNullableInAnswers < ActiveRecord::Migration[6.0]
  def change
    change_column_null :answers, :next_question_id, true
  end
end
