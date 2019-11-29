# frozen_string_literal: true

class IterationAnswer < ApplicationRecord
  self.table_name = 'iterations_answers'
  belongs_to :answer
  belongs_to :iteration
  belongs_to :question
end
